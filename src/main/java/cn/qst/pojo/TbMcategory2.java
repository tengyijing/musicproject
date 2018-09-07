package cn.qst.pojo;

/**
 * 二级音乐分类实体类
 * @author Administrator
 *
 */
public class TbMcategory2 {
    private Integer c2id;

    private Integer parentid;

    private String c2name;

    public Integer getC2id() {
        return c2id;
    }

    public void setC2id(Integer c2id) {
        this.c2id = c2id;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getC2name() {
        return c2name;
    }

    public void setC2name(String c2name) {
        this.c2name = c2name == null ? null : c2name.trim();
    }
}