package cn.qst.comman.utils;

import org.junit.Test;

import java.sql.Time;
import java.util.Date;

import static org.junit.Assert.*;

/**
 * @author lk
 * 2018/9/13 20:08
 * @description:
 */
public class TimeUtilsTest {

    @Test
    public void getNowTime() {
        Date now = TimeUtils.getNowTime();
        Date futrue = TimeUtils.addMinuteTime(3);
        System.out.println(now);
        System.out.println(futrue);
        System.out.println(TimeUtils.compareTime(futrue, now));
    }
}