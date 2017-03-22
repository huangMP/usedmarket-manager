package com.maker.dao;

import com.maker.entity.Attachment;

import java.util.List;

/**
 * Created by huangMP on 2016/10/22.
 * decription : 附件表 Dao
 */
public interface AttachmentDao {
    /**
     * 插入一条信息
     *
     * @param attachment
     * @return 插入成功的数量
     */
    public int insert(Attachment attachment);

    /**
     * 查找通过attachmentId
     *
     * @param attachmentId
     * @return
     */
    public Attachment findByAttachmentId(String attachmentId);

    /**
     * 查找通过attachmentId
     * @param contentId
     * @return
     */
    public List<Attachment> findByContentId(String contentId);

    /**
     * 修改一条信息
     *
     * @param attachment
     * @return 成功修改的信息条数
     */
    public int update(Attachment attachment);

    /**
     * 删除一条信息
     *
     * @param attachmentId
     * @return 成功删除的信息条数
     */
    public int delete(String attachmentId);

    /**
     * 删除一条信息
     *
     * @param contentId
     * @return 成功删除的信息条数
     */
    public int deleteByContentId(String contentId);

}
