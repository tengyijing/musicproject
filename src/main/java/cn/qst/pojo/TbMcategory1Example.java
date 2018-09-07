package cn.qst.pojo;

import java.util.ArrayList;
import java.util.List;

public class TbMcategory1Example {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TbMcategory1Example() {
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

        public Criteria andC1idIsNull() {
            addCriterion("c1id is null");
            return (Criteria) this;
        }

        public Criteria andC1idIsNotNull() {
            addCriterion("c1id is not null");
            return (Criteria) this;
        }

        public Criteria andC1idEqualTo(Integer value) {
            addCriterion("c1id =", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idNotEqualTo(Integer value) {
            addCriterion("c1id <>", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idGreaterThan(Integer value) {
            addCriterion("c1id >", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idGreaterThanOrEqualTo(Integer value) {
            addCriterion("c1id >=", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idLessThan(Integer value) {
            addCriterion("c1id <", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idLessThanOrEqualTo(Integer value) {
            addCriterion("c1id <=", value, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idIn(List<Integer> values) {
            addCriterion("c1id in", values, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idNotIn(List<Integer> values) {
            addCriterion("c1id not in", values, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idBetween(Integer value1, Integer value2) {
            addCriterion("c1id between", value1, value2, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1idNotBetween(Integer value1, Integer value2) {
            addCriterion("c1id not between", value1, value2, "c1id");
            return (Criteria) this;
        }

        public Criteria andC1nameIsNull() {
            addCriterion("c1name is null");
            return (Criteria) this;
        }

        public Criteria andC1nameIsNotNull() {
            addCriterion("c1name is not null");
            return (Criteria) this;
        }

        public Criteria andC1nameEqualTo(String value) {
            addCriterion("c1name =", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameNotEqualTo(String value) {
            addCriterion("c1name <>", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameGreaterThan(String value) {
            addCriterion("c1name >", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameGreaterThanOrEqualTo(String value) {
            addCriterion("c1name >=", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameLessThan(String value) {
            addCriterion("c1name <", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameLessThanOrEqualTo(String value) {
            addCriterion("c1name <=", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameLike(String value) {
            addCriterion("c1name like", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameNotLike(String value) {
            addCriterion("c1name not like", value, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameIn(List<String> values) {
            addCriterion("c1name in", values, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameNotIn(List<String> values) {
            addCriterion("c1name not in", values, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameBetween(String value1, String value2) {
            addCriterion("c1name between", value1, value2, "c1name");
            return (Criteria) this;
        }

        public Criteria andC1nameNotBetween(String value1, String value2) {
            addCriterion("c1name not between", value1, value2, "c1name");
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