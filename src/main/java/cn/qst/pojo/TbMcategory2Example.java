package cn.qst.pojo;

import java.util.ArrayList;
import java.util.List;

public class TbMcategory2Example {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbMcategory2Example() {
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

        public Criteria andC2idIsNull() {
            addCriterion("c2id is null");
            return (Criteria) this;
        }

        public Criteria andC2idIsNotNull() {
            addCriterion("c2id is not null");
            return (Criteria) this;
        }

        public Criteria andC2idEqualTo(Integer value) {
            addCriterion("c2id =", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idNotEqualTo(Integer value) {
            addCriterion("c2id <>", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idGreaterThan(Integer value) {
            addCriterion("c2id >", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idGreaterThanOrEqualTo(Integer value) {
            addCriterion("c2id >=", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idLessThan(Integer value) {
            addCriterion("c2id <", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idLessThanOrEqualTo(Integer value) {
            addCriterion("c2id <=", value, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idIn(List<Integer> values) {
            addCriterion("c2id in", values, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idNotIn(List<Integer> values) {
            addCriterion("c2id not in", values, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idBetween(Integer value1, Integer value2) {
            addCriterion("c2id between", value1, value2, "c2id");
            return (Criteria) this;
        }

        public Criteria andC2idNotBetween(Integer value1, Integer value2) {
            addCriterion("c2id not between", value1, value2, "c2id");
            return (Criteria) this;
        }

        public Criteria andParentidIsNull() {
            addCriterion("parentid is null");
            return (Criteria) this;
        }

        public Criteria andParentidIsNotNull() {
            addCriterion("parentid is not null");
            return (Criteria) this;
        }

        public Criteria andParentidEqualTo(Integer value) {
            addCriterion("parentid =", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidNotEqualTo(Integer value) {
            addCriterion("parentid <>", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidGreaterThan(Integer value) {
            addCriterion("parentid >", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidGreaterThanOrEqualTo(Integer value) {
            addCriterion("parentid >=", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidLessThan(Integer value) {
            addCriterion("parentid <", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidLessThanOrEqualTo(Integer value) {
            addCriterion("parentid <=", value, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidIn(List<Integer> values) {
            addCriterion("parentid in", values, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidNotIn(List<Integer> values) {
            addCriterion("parentid not in", values, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidBetween(Integer value1, Integer value2) {
            addCriterion("parentid between", value1, value2, "parentid");
            return (Criteria) this;
        }

        public Criteria andParentidNotBetween(Integer value1, Integer value2) {
            addCriterion("parentid not between", value1, value2, "parentid");
            return (Criteria) this;
        }

        public Criteria andC2nameIsNull() {
            addCriterion("c2name is null");
            return (Criteria) this;
        }

        public Criteria andC2nameIsNotNull() {
            addCriterion("c2name is not null");
            return (Criteria) this;
        }

        public Criteria andC2nameEqualTo(String value) {
            addCriterion("c2name =", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameNotEqualTo(String value) {
            addCriterion("c2name <>", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameGreaterThan(String value) {
            addCriterion("c2name >", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameGreaterThanOrEqualTo(String value) {
            addCriterion("c2name >=", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameLessThan(String value) {
            addCriterion("c2name <", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameLessThanOrEqualTo(String value) {
            addCriterion("c2name <=", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameLike(String value) {
            addCriterion("c2name like", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameNotLike(String value) {
            addCriterion("c2name not like", value, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameIn(List<String> values) {
            addCriterion("c2name in", values, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameNotIn(List<String> values) {
            addCriterion("c2name not in", values, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameBetween(String value1, String value2) {
            addCriterion("c2name between", value1, value2, "c2name");
            return (Criteria) this;
        }

        public Criteria andC2nameNotBetween(String value1, String value2) {
            addCriterion("c2name not between", value1, value2, "c2name");
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