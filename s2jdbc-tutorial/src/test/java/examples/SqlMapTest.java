/*
 * Copyright 2004-2015 the Seasar Foundation and the Others.
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
package examples;

import java.util.List;

import org.seasar.extension.jdbc.JdbcManager;
import org.seasar.extension.unit.S2TestCase;
import org.seasar.framework.beans.util.BeanMap;

/**
 * @author higa
 * 
 */
public class SqlMapTest extends S2TestCase {

    private static final String LABEL_VALUE =
        "select name as label, id as value from employee";

    private JdbcManager jdbcManager;

    protected void setUp() throws Exception {
        include("app.dicon");
    }

    /**
     * 
     * @throws Exception
     */
    public void testSqlMap() throws Exception {
        List<BeanMap> results =
            jdbcManager.selectBySql(BeanMap.class, LABEL_VALUE).getResultList();
        for (BeanMap m : results) {
            System.out.println(m);
        }
    }
}