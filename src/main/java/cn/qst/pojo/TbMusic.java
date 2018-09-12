package cn.qst.pojo;

import java.util.Date;

public class TbMusic {
    private Integer mid;

    private String mname;

    private String fileurl;

    private Integer playsum;

    private Date uploaddate;

    private String sname;

    private String image;

    private Integer mvid;

    private Boolean status;

    private String lyricsurl;

    private Boolean isdownload;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl == null ? null : fileurl.trim();
    }

    public Integer getPlaysum() {
        return playsum;
    }

    public void setPlaysum(Integer playsum) {
        this.playsum = playsum;
    }

    public Date getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(Date uploaddate) {
        this.uploaddate = uploaddate;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getMvid() {
        return mvid;
    }

    public void setMvid(Integer mvid) {
        this.mvid = mvid;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getLyricsurl() {
        return lyricsurl;
    }

    public void setLyricsurl(String lyricsurl) {
        this.lyricsurl = lyricsurl == null ? null : lyricsurl.trim();
    }

    public Boolean getIsdownload() {
        return isdownload;
    }

    public void setIsdownload(Boolean isdownload) {
        this.isdownload = isdownload;
    }

	@Override
	public String toString() {
		return "TbMusic [mid=" + mid + ", mname=" + mname + ", fileurl=" + fileurl + ", playsum=" + playsum
				+ ", uploaddate=" + uploaddate + ", sname=" + sname + ", image=" + image + ", mvid=" + mvid
				+ ", status=" + status + ", lyricsurl=" + lyricsurl + ", isdownload=" + isdownload + "]";
	}
    
}