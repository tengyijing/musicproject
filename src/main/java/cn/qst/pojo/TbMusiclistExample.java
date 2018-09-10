package cn.qst.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TbMusiclistExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbMusiclistExample() {
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

        public Criteria andMlidIsNull() {
            addCriterion("mlid is null");
            return (Criteria) this;
        }

        public Criteria andMlidIsNotNull() {
            addCriterion("mlid is not null");
            return (Criteria) this;
        }

        public Criteria andMlidEqualTo(Integer value) {
            addCriterion("mlid =", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidNotEqualTo(Integer value) {
            addCriterion("mlid <>", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidGreaterThan(Integer value) {
            addCriterion("mlid >", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidGreaterThanOrEqualTo(Integer value) {
            addCriterion("mlid >=", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidLessThan(Integer value) {
            addCriterion("mlid <", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidLessThanOrEqualTo(Integer value) {
            addCriterion("mlid <=", value, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidIn(List<Integer> values) {
            addCriterion("mlid in", values, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidNotIn(List<Integer> values) {
            addCriterion("mlid not in", values, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidBetween(Integer value1, Integer value2) {
            addCriterion("mlid between", value1, value2, "mlid");
            return (Criteria) this;
        }

        public Criteria andMlidNotBetween(Integer value1, Integer value2) {
            addCriterion("mlid not between", value1, value2, "mlid");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNull() {
            addCriterion("createdate is null");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNotNull() {
            addCriterion("createdate is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedateEqualTo(Date value) {
            addCriterionForJDBCDate("createdate =", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotEqualTo(Date value) {
            addCriterionForJDBCDate("createdate <>", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThan(Date value) {
            addCriterionForJDBCDate("createdate >", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("createdate >=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThan(Date value) {
            addCriterionForJDBCDate("createdate <", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("createdate <=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateIn(List<Date> values) {
            addCriterionForJDBCDate("createdate in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotIn(List<Date> values) {
            addCriterionForJDBCDate("createdate not in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("createdate between", value1, value2, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("createdate not between", value1, value2, "createdate");
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

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andMusicsumIsNull() {
            addCriterion("musicsum is null");
            return (Criteria) this;
        }

        public Criteria andMusicsumIsNotNull() {
            addCriterion("musicsum is not null");
            return (Criteria) this;
        }

        public Criteria andMusicsumEqualTo(Integer value) {
            addCriterion("musicsum =", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumNotEqualTo(Integer value) {
            addCriterion("musicsum <>", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumGreaterThan(Integer value) {
            addCriterion("musicsum >", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumGreaterThanOrEqualTo(Integer value) {
            addCriterion("musicsum >=", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumLessThan(Integer value) {
            addCriterion("musicsum <", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumLessThanOrEqualTo(Integer value) {
            addCriterion("musicsum <=", value, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumIn(List<Integer> values) {
            addCriterion("musicsum in", values, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumNotIn(List<Integer> values) {
            addCriterion("musicsum not in", values, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumBetween(Integer value1, Integer value2) {
            addCriterion("musicsum between", value1, value2, "musicsum");
            return (Criteria) this;
        }

        public Criteria andMusicsumNotBetween(Integer value1, Integer value2) {
            addCriterion("musicsum not between", value1, value2, "musicsum");
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

        public Criteria andImageEqualTo(Integer value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(Integer value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(Integer value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(Integer value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(Integer value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(Integer value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<Integer> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<Integer> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(Integer value1, Integer value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(Integer value1, Integer value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("uid is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uid is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(String value) {
            addCriterion("uid =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(String value) {
            addCriterion("uid <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(String value) {
            addCriterion("uid >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(String value) {
            addCriterion("uid >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(String value) {
            addCriterion("uid <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(String value) {
            addCriterion("uid <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLike(String value) {
            addCriterion("uid like", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotLike(String value) {
            addCriterion("uid not like", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<String> values) {
            addCriterion("uid in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<String> values) {
            addCriterion("uid not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(String value1, String value2) {
            addCriterion("uid between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(String value1, String value2) {
            addCriterion("uid not between", value1, value2, "uid");
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