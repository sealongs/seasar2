/*
 * Copyright 2004-2008 the Seasar Foundation and the Others.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */
package org.seasar.extension.jdbc.types;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.TimeZone;

import junit.framework.TestCase;

/**
 * @author taedium
 * 
 */
public class CalendarTimeTypeTest extends TestCase {

    private CalendarTimeType ctType = new CalendarTimeType();

    protected void setUp() throws Exception {
        super.setUp();
        TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
    }

    protected void tearDown() throws Exception {
        TimeZone.setDefault(null);
        super.tearDown();
    }

    /**
     * 
     * @throws Exception
     */
    public void testToTime() throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, 2007);
        calendar.set(Calendar.MONTH, Calendar.NOVEMBER);
        calendar.set(Calendar.DATE, 25);
        calendar.set(Calendar.HOUR_OF_DAY, 12);
        calendar.set(Calendar.MINUTE, 34);
        calendar.set(Calendar.SECOND, 56);
        calendar.set(Calendar.MILLISECOND, 789);
        Time time = ctType.toTime(calendar);
        calendar.clear();
        calendar.setTime(time);
        assertEquals(1970, calendar.get(Calendar.YEAR));
        assertEquals(Calendar.JANUARY, calendar.get(Calendar.MONTH));
        assertEquals(1, calendar.get(Calendar.DATE));
        assertEquals(12, calendar.get(Calendar.HOUR_OF_DAY));
        assertEquals(34, calendar.get(Calendar.MINUTE));
        assertEquals(56, calendar.get(Calendar.SECOND));
        assertEquals(789, calendar.get(Calendar.MILLISECOND));
    }

    /**
     * 
     * @throws Exception
     */
    public void testToTime_fromString() throws Exception {
        Time time = ctType.toTime("2008/01/28");
        assertNotNull(time);
    }

    /**
     * 
     * @throws Exception
     */
    public void testToTime_timeZone() throws Exception {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("JST"));
        calendar.set(Calendar.YEAR, 2007);
        calendar.set(Calendar.MONTH, Calendar.NOVEMBER);
        calendar.set(Calendar.DATE, 25);
        calendar.set(Calendar.HOUR_OF_DAY, 12);
        calendar.set(Calendar.MINUTE, 34);
        calendar.set(Calendar.SECOND, 56);
        calendar.set(Calendar.MILLISECOND, 789);
        Time time = ctType.toTime(calendar);
        calendar = Calendar.getInstance();
        calendar.setTime(time);
        assertEquals(1970, calendar.get(Calendar.YEAR));
        assertEquals(Calendar.JANUARY, calendar.get(Calendar.MONTH));
        assertEquals(1, calendar.get(Calendar.DATE));
        assertEquals(3, calendar.get(Calendar.HOUR_OF_DAY));
        assertEquals(34, calendar.get(Calendar.MINUTE));
        assertEquals(56, calendar.get(Calendar.SECOND));
        assertEquals(789, calendar.get(Calendar.MILLISECOND));
    }

    /**
     * 
     * @throws Exception
     */
    public void testToText() throws Exception {
        Timestamp timestamp = Timestamp
                .valueOf("2007-11-29 13:14:15.123456789");
        Calendar value = Calendar.getInstance();
        value.setTime(timestamp);
        assertEquals("'13:14:15.123'", ctType.toText(value));
    }
}
