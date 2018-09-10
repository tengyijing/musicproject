package cn.qst.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TbMusicExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbMusicExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andMidIsNull() {
            addCriterion("mid is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("mid is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("mid =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("mid <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("mid >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mid >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("mid <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("mid <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("mid in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("mid not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("mid between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("mid not between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMnameIsNull() {
            addCriterion("mname is null");
            return (Criteria) this;
        }

        public Criteria andMnameIsNotNull() {
            addCriterion("mname is not null");
            return (Criteria) this;
        }

        public Criteria andMnameEqualTo(String value) {
            addCriterion("mname =", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotEqualTo(String value) {
            addCriterion("mname <>", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameGreaterThan(String value) {
            addCriterion("mname >", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameGreaterThanOrEqualTo(String value) {
            addCriterion("mname >=", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLessThan(String value) {
            addCriterion("mname <", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLessThanOrEqualTo(String value) {
            addCriterion("mname <=", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameLike(String value) {
            addCriterion("mname like", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotLike(String value) {
            addCriterion("mname not like", value, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameIn(List<String> values) {
            addCriterion("mname in", values, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotIn(List<String> values) {
            addCriterion("mname not in", values, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameBetween(String value1, String value2) {
            addCriterion("mname between", value1, value2, "mname");
            return (Criteria) this;
        }

        public Criteria andMnameNotBetween(String value1, String value2) {
            addCriterion("mname not between", value1, value2, "mname");
            return (Criteria) this;
        }

        public Criteria andFileurlIsNull() {
            addCriterion("fileUrl is null");
            return (Criteria) this;
        }

        public Criteria andFileurlIsNotNull() {
            addCriterion("fileUrl is not null");
            return (Criteria) this;
        }

        public Criteria andFileurlEqualTo(String value) {
            addCriterion("fileUrl =", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotEqualTo(String value) {
            addCriterion("fileUrl <>", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlGreaterThan(String value) {
            addCriterion("fileUrl >", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlGreaterThanOrEqualTo(String value) {
            addCriterion("fileUrl >=", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLessThan(String value) {
            addCriterion("fileUrl <", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLessThanOrEqualTo(String value) {
            addCriterion("fileUrl <=", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlLike(String value) {
            addCriterion("fileUrl like", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotLike(String value) {
            addCriterion("fileUrl not like", value, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlIn(List<String> values) {
            addCriterion("fileUrl in", values, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotIn(List<String> values) {
            addCriterion("fileUrl not in", values, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlBetween(String value1, String value2) {
            addCriterion("fileUrl between", value1, value2, "fileurl");
            return (Criteria) this;
        }

        public Criteria andFileurlNotBetween(String value1, String value2) {
            addCriterion("fileUrl not between", value1, value2, "fileurl");
            return (Criteria) this;
        }

        public Criteria andPlaysumIsNull() {
            addCriterion("playsum is null");
            return (Criteria) this;
        }

        public Criteria andPlaysumIsNotNull() {
            addCriterion("playsum is not null");
            return (Criteria) this;
        }

        public Criteria andPlaysumEqualTo(Integer value) {
            addCriterion("playsum =", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumNotEqualTo(Integer value) {
            addCriterion("playsum <>", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumGreaterThan(Integer value) {
            addCriterion("playsum >", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumGreaterThanOrEqualTo(Integer value) {
            addCriterion("playsum >=", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumLessThan(Integer value) {
            addCriterion("playsum <", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumLessThanOrEqualTo(Integer value) {
            addCriterion("playsum <=", value, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumIn(List<Integer> values) {
            addCriterion("playsum in", values, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumNotIn(List<Integer> values) {
            addCriterion("playsum not in", values, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumBetween(Integer value1, Integer value2) {
            addCriterion("playsum between", value1, value2, "playsum");
            return (Criteria) this;
        }

        public Criteria andPlaysumNotBetween(Integer value1, Integer value2) {
            addCriterion("playsum not between", value1, value2, "playsum");
            return (Criteria) this;
        }

        public Criteria andUploaddateIsNull() {
            addCriterion("uploaddate is null");
            return (Criteria) this;
        }

        public Criteria andUploaddateIsNotNull() {
            addCriterion("uploaddate is not null");
            return (Criteria) this;
        }

        public Criteria andUploaddateEqualTo(Date value) {
            addCriterionForJDBCDate("uploaddate =", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateNotEqualTo(Date value) {
            addCriterionForJDBCDate("uploaddate <>", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateGreaterThan(Date value) {
            addCriterionForJDBCDate("uploaddate >", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("uploaddate >=", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateLessThan(Date value) {
            addCriterionForJDBCDate("uploaddate <", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("uploaddate <=", value, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateIn(List<Date> values) {
            addCriterionForJDBCDate("uploaddate in", values, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateNotIn(List<Date> values) {
            addCriterionForJDBCDate("uploaddate not in", values, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("uploaddate between", value1, value2, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andUploaddateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("uploaddate not between", value1, value2, "uploaddate");
            return (Criteria) this;
        }

        public Criteria andSnameIsNull() {
            addCriterion("sname is null");
            return (Criteria) this;
        }

        public Criteria andSnameIsNotNull() {
            addCriterion("sname is not null");
            return (Criteria) this;
        }

        public Criteria andSnameEqualTo(String value) {
            addCriterion("sname =", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotEqualTo(String value) {
            addCriterion("sname <>", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThan(String value) {
            addCriterion("sname >", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameGreaterThanOrEqualTo(String value) {
            addCriterion("sname >=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThan(String value) {
            addCriterion("sname <", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLessThanOrEqualTo(String value) {
            addCriterion("sname <=", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameLike(String value) {
            addCriterion("sname like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotLike(String value) {
            addCriterion("sname not like", value, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameIn(List<String> values) {
            addCriterion("sname in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotIn(List<String> values) {
            addCriterion("sname not in", values, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameBetween(String value1, String value2) {
            addCriterion("sname between", value1, value2, "sname");
            return (Criteria) this;
        }

        public Criteria andSnameNotBetween(String value1, String value2) {
            addCriterion("sname not between", value1, value2, "sname");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andMvidIsNull() {
            addCriterion("MVid is null");
            return (Criteria) this;
        }

        public Criteria andMvidIsNotNull() {
            addCriterion("MVid is not null");
            return (Criteria) this;
        }

        public Criteria andMvidEqualTo(Integer value) {
            addCriterion("MVid =", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidNotEqualTo(Integer value) {
            addCriterion("MVid <>", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidGreaterThan(Integer value) {
            addCriterion("MVid >", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidGreaterThanOrEqualTo(Integer value) {
            addCriterion("MVid >=", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidLessThan(Integer value) {
            addCriterion("MVid <", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidLessThanOrEqualTo(Integer value) {
            addCriterion("MVid <=", value, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidIn(List<Integer> values) {
            addCriterion("MVid in", values, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidNotIn(List<Integer> values) {
            addCriterion("MVid not in", values, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidBetween(Integer value1, Integer value2) {
            addCriterion("MVid between", value1, value2, "mvid");
            return (Criteria) this;
        }

        public Criteria andMvidNotBetween(Integer value1, Integer value2) {
            addCriterion("MVid not between", value1, value2, "mvid");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Boolean value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Boolean value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Boolean value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Boolean value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Boolean value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Boolean value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Boolean> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Boolean> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Boolean value1, Boolean value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Boolean value1, Boolean value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andLyricsurlIsNull() {
            addCriterion("lyricsurl is null");
            return (Criteria) this;
        }

        public Criteria andLyricsurlIsNotNull() {
            addCriterion("lyricsurl is not null");
            return (Criteria) this;
        }

        public Criteria andLyricsurlEqualTo(String value) {
            addCriterion("lyricsurl =", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlNotEqualTo(String value) {
            addCriterion("lyricsurl <>", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlGreaterThan(String value) {
            addCriterion("lyricsurl >", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlGreaterThanOrEqualTo(String value) {
            addCriterion("lyricsurl >=", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlLessThan(String value) {
            addCriterion("lyricsurl <", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlLessThanOrEqualTo(String value) {
            addCriterion("lyricsurl <=", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlLike(String value) {
            addCriterion("lyricsurl like", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlNotLike(String value) {
            addCriterion("lyricsurl not like", value, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlIn(List<String> values) {
            addCriterion("lyricsurl in", values, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlNotIn(List<String> values) {
            addCriterion("lyricsurl not in", values, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlBetween(String value1, String value2) {
            addCriterion("lyricsurl between", value1, value2, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andLyricsurlNotBetween(String value1, String value2) {
            addCriterion("lyricsurl not between", value1, value2, "lyricsurl");
            return (Criteria) this;
        }

        public Criteria andIsdownloadIsNull() {
            addCriterion("isdownload is null");
            return (Criteria) this;
        }

        public Criteria andIsdownloadIsNotNull() {
            addCriterion("isdownload is not null");
            return (Criteria) this;
        }

        public Criteria andIsdownloadEqualTo(Boolean value) {
            addCriterion("isdownload =", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadNotEqualTo(Boolean value) {
            addCriterion("isdownload <>", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadGreaterThan(Boolean value) {
            addCriterion("isdownload >", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadGreaterThanOrEqualTo(Boolean value) {
            addCriterion("isdownload >=", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadLessThan(Boolean value) {
            addCriterion("isdownload <", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadLessThanOrEqualTo(Boolean value) {
            addCriterion("isdownload <=", value, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadIn(List<Boolean> values) {
            addCriterion("isdownload in", values, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadNotIn(List<Boolean> values) {
            addCriterion("isdownload not in", values, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadBetween(Boolean value1, Boolean value2) {
            addCriterion("isdownload between", value1, value2, "isdownload");
            return (Criteria) this;
        }

        public Criteria andIsdownloadNotBetween(Boolean value1, Boolean value2) {
            addCriterion("isdownload not between", value1, value2, "isdownload");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}