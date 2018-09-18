package cn.qst.pojo;


public class TbAttention {

    private String uid;
    private String bid;

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
