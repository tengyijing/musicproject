package cn.qst.pojo;

public class TbMenuContent {
    private Integer id;

    private Integer musicid;

    private String title;

    private String image;

    private Integer playsum;

    private String sname;

    private Integer mid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMusicid() {
        return musicid;
    }

    public void setMusicid(Integer musicid) {
        this.musicid = musicid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getPlaysum() {
        return playsum;
    }

    public void setPlaysum(Integer playsum) {
        this.playsum = playsum;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

	@Override
	public String toString() {
		return "TbMenuContent [id=" + id + ", title=" + title + ", image=" + image + ", playsum=" + playsum + ", sname="
				+ sname + ", mid=" + mid + "]";
	}
    
}