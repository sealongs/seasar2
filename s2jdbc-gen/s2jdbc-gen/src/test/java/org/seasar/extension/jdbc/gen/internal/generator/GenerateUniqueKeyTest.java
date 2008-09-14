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
package org.seasar.extension.jdbc.gen.internal.generator;

import java.io.File;

import org.junit.Before;
import org.junit.Test;
import org.seasar.extension.jdbc.gen.desc.TableDesc;
import org.seasar.extension.jdbc.gen.desc.UniqueKeyDesc;
import org.seasar.extension.jdbc.gen.generator.GenerationContext;
import org.seasar.extension.jdbc.gen.internal.dialect.StandardGenDialect;
import org.seasar.extension.jdbc.gen.internal.model.TableModelFactoryImpl;
import org.seasar.extension.jdbc.gen.model.SqlIdentifierCaseType;
import org.seasar.extension.jdbc.gen.model.SqlKeywordCaseType;
import org.seasar.extension.jdbc.gen.model.TableModel;
import org.seasar.framework.util.TextUtil;

import static org.junit.Assert.*;

/**
 * @author taedium
 * 
 */
public class GenerateUniqueKeyTest {

    private GeneratorImplStub generator;

    private TableModel model;

    /**
     * 
     * @throws Exception
     */
    @Before
    public void setUp() throws Exception {
        generator = new GeneratorImplStub();

        UniqueKeyDesc uniqueKeyDesc = new UniqueKeyDesc();
        uniqueKeyDesc.addColumnName("UK1-1");
        uniqueKeyDesc.addColumnName("UK1-2");

        UniqueKeyDesc uniqueKeyDesc2 = new UniqueKeyDesc();
        uniqueKeyDesc2.addColumnName("UK2-1");
        uniqueKeyDesc2.addColumnName("UK2-2");

        TableDesc tableDesc = new TableDesc();
        tableDesc.setCatalogName("AAA");
        tableDesc.setSchemaName("BBB");
        tableDesc.setName("HOGE");
        tableDesc.setCanonicalName("aaa.bbb.hoge");
        tableDesc.addUniqueKeyDesc(uniqueKeyDesc);
        tableDesc.addUniqueKeyDesc(uniqueKeyDesc2);

        TableModelFactoryImpl factory = new TableModelFactoryImpl(
                new StandardGenDialect(), SqlIdentifierCaseType.ORIGINALCASE,
                SqlKeywordCaseType.ORIGINALCASE, ';', null);
        model = factory.getTableModel(tableDesc);
    }

    /**
     * 
     * @throws Exception
     */
    @Test
    public void testCreate() throws Exception {
        GenerationContext context = new GenerationContextImpl(model, new File(
                "file"), "sql/create-uniquekey.ftl", "UTF-8", false);
        generator.generate(context);
        String path = getClass().getName().replace(".", "/") + "_Create.txt";
        assertEquals(TextUtil.readUTF8(path), generator.getResult());
    }

    /**
     * 
     * @throws Exception
     */
    @Test
    public void testDrop() throws Exception {
        GenerationContext context = new GenerationContextImpl(model, new File(
                "file"), "sql/drop-uniquekey.ftl", "UTF-8", false);
        generator.generate(context);
        String path = getClass().getName().replace(".", "/") + "_Drop.txt";
        assertEquals(TextUtil.readUTF8(path), generator.getResult());
    }
}