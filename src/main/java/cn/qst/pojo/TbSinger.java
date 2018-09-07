package cn.qst.pojo;

/**
 * 歌手实体类
 * @author Administrator
 *
 */
public class TbSinger {
    private Integer sid;

    private String sname;

    private Integer imgid;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public Integer getImgid() {
        return imgid;
    }

    public void setImgid(Integer imgid) {
        this.imgid = imgid;
    }
}