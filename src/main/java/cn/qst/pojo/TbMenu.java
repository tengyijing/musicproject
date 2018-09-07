package cn.qst.pojo;

/**
 * 菜单实体类
 * @author Administrator
 *
 */
public class TbMenu {
    private Integer mid;

    private String mname;

    private Integer parentmid;

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

    public Integer getParentmid() {
        return parentmid;
    }

    public void setParentmid(Integer parentmid) {
        this.parentmid = parentmid;
    }
}