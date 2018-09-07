package cn.qst.pojo;

/**
 * 一级音乐分类实体类
 * @author Administrator
 *
 */
public class TbMcategory1 {
    private Integer c1id;

    private String c1name;

    public Integer getC1id() {
        return c1id;
    }

    public void setC1id(Integer c1id) {
        this.c1id = c1id;
    }

    public String getC1name() {
        return c1name;
    }

    public void setC1name(String c1name) {
        this.c1name = c1name == null ? null : c1name.trim();
    }
}