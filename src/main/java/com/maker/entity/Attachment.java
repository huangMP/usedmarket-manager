package com.maker.entity;

/**
 * Created by huangMP on 2016/10/30.
 * decription : 附件表
 */
public class Attachment {
    private String attachmentId;
    private String contentId;
    private String filePath;
    private String narrowImagePath;
    private String fileType;

    public String getAttachmentId() {
        return attachmentId;
    }

    public String getContentId() {
        return contentId;
    }

    public void setContentId(String contentId) {
        this.contentId = contentId;
    }

    public void setAttachmentId(String attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getNarrowImagePath() {
        return narrowImagePath;
    }

    public void setNarrowImagePath(String narrowImagePath) {
        this.narrowImagePath = narrowImagePath;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Override
    public String toString() {
        return "Attachment{" +
                "attachmentId='" + attachmentId + '\'' +
                ", commodityId='" + contentId + '\'' +
                ", filePath='" + filePath + '\'' +
                ", narrowImagePath='" + narrowImagePath + '\'' +
                ", fileType='" + fileType + '\'' +
                '}';
    }
}
