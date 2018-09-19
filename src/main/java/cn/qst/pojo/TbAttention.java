package cn.qst.pojo;


import java.util.List;

public class TbAttention {

    private String uid;
    private String bid;

    private TbUser user;

    public TbUser getUser() {
        return user;
    }

    public void setUser(TbUser user) {
        this.user = user;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }


    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    @Override
    public String toString() {
        return "TbAttention{" +
                "uid='" + uid + '\'' +
                ", bid='" + bid + '\'' +
                '}';
    }
}
