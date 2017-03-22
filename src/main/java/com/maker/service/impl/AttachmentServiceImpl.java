package com.maker.service.impl;

import com.maker.dao.AttachmentDao;
import com.maker.entity.Attachment;
import com.maker.service.AttachmentService;
import com.maker.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 用户信息 Service层实现
 */
@Service("attachmentService")
public class AttachmentServiceImpl implements AttachmentService {

    @Autowired
    AttachmentDao attachmentDao;

    /**
     * 绝对路劲
     */
    String fileAbsoluteathPath = ResourcesPath.attachmentAbsoluteathPath;
    /**
     * 相对路径
     */
    String fileRelativePath = ResourcesPath.attachmentRelativePath;

    /**
     * 插入一条信息
     *
     * @param file
     * @return attachmentId
     */
    public String insert(MultipartFile file, String contentId,String fileType,int narrowTarget) {

        Attachment attachment = new Attachment();
        attachment.setAttachmentId(UuidUtil.get32UUID());
        attachment.setFileType(fileType);
        attachment.setContentId(contentId);

        attachment = uploadPictureFile(file,attachment,narrowTarget);

        attachmentDao.insert(attachment);

        return attachment.getAttachmentId();
    }

    /**
     * 查找通过attachmentId
     *
     * @param attachmentId
     * @return Attachment
     */
    public Attachment findByAttachmentId(String attachmentId) {
        return attachmentDao.findByAttachmentId(attachmentId);
    }

    @Override
    public List<Attachment> findByContentId(String contentId) {
        return attachmentDao.findByContentId(contentId);
    }

    /**
     * 修改
     * @param attachmentId
     * @param file
     * @return 成功修改的信息条数
     */
    public int update(String attachmentId, MultipartFile file,int narrowTarget) {
        Attachment attachment = findByAttachmentId(attachmentId);
        if(null == attachment){
            return 0;
        }
        if( true == deleteAttachmentFile( attachment ) ){
            return attachmentDao.delete(attachmentId);
        }

        attachment = uploadPictureFile(file,attachment,narrowTarget);

        return attachmentDao.update(attachment);
    }

    /**
     * 删除一条信息
     *
     * @param attachmentId
     * @return 成功删除的信息条数
     */
    public int delete(String attachmentId) {
        Attachment attachment = findByAttachmentId(attachmentId);        //得到当前的原图文件名
        if(null == attachment){
            return 0;
        }
        if( true == deleteAttachmentFile( attachment ) ){
            return attachmentDao.delete(attachmentId);
        }
        return 0;

    }

    /**
     * 删除
     * @param contentId
     * @return 成功删除的信息条数
     */
    public int deleteByContentId(String contentId){
        System.out.println("service"+contentId);
        List<Attachment> attachmentList = attachmentDao.findByContentId(contentId);        //得到当前的原图文件名
        if(0 == attachmentList.size()){
            return 0;
        }
        for(int i=0;i<attachmentList.size();i++){
            deleteAttachmentFile( attachmentList.get(i) );
        }
        return attachmentDao.deleteByContentId(contentId);

    }
    /**
     * 上传并设置Attachment文件路径和压缩文件路径
     * @param file
     * @param attachment
     * @return
     */
    Attachment uploadPictureFile(MultipartFile file,Attachment attachment,int narrowTarget){
        //执行上传 返回真实文件名
        String fileName = FileUpload.fileUp(file, fileAbsoluteathPath, UuidUtil.get32UUID());
        //得到压缩图文件名
        String narrowImageFileName = "_" + fileName;
        //进行压缩
        NarrowImage.imageNarrow(fileAbsoluteathPath, narrowImageFileName, fileName, narrowTarget);
        attachment.setFilePath(fileRelativePath + fileName);
        attachment.setNarrowImagePath(fileRelativePath + narrowImageFileName);
        return attachment;
    }

    /**
     * 删除attachment相应的文件
     * @param attachment
     * @return
     */
    boolean deleteAttachmentFile(Attachment attachment){
        String originalImageFileName = attachment.getFilePath().replaceAll(fileRelativePath, "");
        //得到当前的缩略图文件名
        String narrowImageFileName = attachment.getNarrowImagePath().replaceAll(fileRelativePath, "");
        //执行删除操作
        FileUtil.delFile(fileAbsoluteathPath.replaceAll("WEB-INF/classes/../../static/attachment/", "") + fileRelativePath + originalImageFileName);
        FileUtil.delFile(fileAbsoluteathPath.replaceAll("WEB-INF/classes/../../static/attachment/", "") + fileRelativePath + narrowImageFileName);
        return true;
    }
}
