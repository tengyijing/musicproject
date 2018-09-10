package cn.qst.pojo;

import java.util.Date;

public class TbMusiclist {
    private Integer mlid;

    private Date createdate;

    private Integer playsum;

    private String name;

    private Integer musicsum;

    private Integer image;

    private String uid;

    public Integer getMlid() {
        return mlid;
    }

    public void setMlid(Integer mlid) {
        this.mlid = mlid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getPlaysum() {
        return playsum;
    }

    public void setPlaysum(Integer playsum) {
        this.playsum = playsum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getMusicsum() {
        return musicsum;
    }

    public void setMusicsum(Integer musicsum) {
        this.musicsum = musicsum;
    }

    public Integer getImage() {
        return image;
    }

    public void setImage(Integer image) {
        this.image = image;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }
}