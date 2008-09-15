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
package org.seasar.extension.jdbc.gen.internal.model;

import java.util.List;

import org.seasar.extension.jdbc.EntityMeta;
import org.seasar.extension.jdbc.PropertyMeta;
import org.seasar.extension.jdbc.gen.model.NamesModel;
import org.seasar.extension.jdbc.gen.model.NamesModelFactory;
import org.seasar.extension.jdbc.gen.model.ServiceModel;
import org.seasar.extension.jdbc.gen.model.ServiceModelFactory;
import org.seasar.framework.util.ClassUtil;

/**
 * {@link ServiceModelFactory}の実装クラスです。
 * 
 * @author taedium
 */
public class ServiceModelFactoryImpl implements ServiceModelFactory {

    /** パッケージ名 */
    protected String packageName;

    /** サービスクラス名のサフィックス */
    protected String serviceClassNameSuffix;

    /** 名前モデルのファクトリ */
    protected NamesModelFactory namesModelFactory;

    /** 名前クラスを使用する場合{@code true} */
    protected boolean useNamesClass;

    /** クラスモデルのサポート */
    protected ClassModelSupport classModelSupport = new ClassModelSupport();

    /**
     * インスタンスを構築します。
     * 
     * @param packageName
     *            パッケージ名
     * @param namesModelFactory
     *            名前モデルのファクトリ
     * @param serviceClassNameSuffix
     *            サービスクラス名のサフィックス
     * @param useNamesClass
     *            名前クラスを使用する場合{@code true}
     */
    public ServiceModelFactoryImpl(String packageName,
            String serviceClassNameSuffix, NamesModelFactory namesModelFactory,
            boolean useNamesClass) {
        if (serviceClassNameSuffix == null) {
            throw new NullPointerException("serviceClassNameSuffix");
        }
        if (namesModelFactory == null) {
            throw new NullPointerException("namesModelFactory");
        }
        this.packageName = packageName;
        this.serviceClassNameSuffix = serviceClassNameSuffix;
        this.namesModelFactory = namesModelFactory;
        this.useNamesClass = useNamesClass;
    }

    public ServiceModel getServiceModel(EntityMeta entityMeta) {
        ServiceModel serviceModel = new ServiceModel();
        serviceModel.setPackageName(packageName);
        serviceModel.setShortClassName(entityMeta.getName()
                + serviceClassNameSuffix);
        serviceModel.setShortEntityClassName(entityMeta.getEntityClass()
                .getSimpleName());
        for (PropertyMeta idPropertyMeta : entityMeta.getIdPropertyMetaList()) {
            serviceModel.addIdPropertyMeta(idPropertyMeta);
        }
        if (entityMeta.hasVersionPropertyMeta()) {
            serviceModel.setVersionPropertyMeta(entityMeta
                    .getVersionPropertyMeta());
        }
        doNamesModel(serviceModel, entityMeta);
        doImportName(serviceModel, entityMeta);
        return serviceModel;
    }

    /**
     * 名前モデルを処理します。
     * 
     * @param serviceModel
     *            サービスモデル
     * @param entityMeta
     *            エンティティメタデータ
     */
    protected void doNamesModel(ServiceModel serviceModel, EntityMeta entityMeta) {
        if (entityMeta.getIdPropertyMetaList().size() > 0 && useNamesClass) {
            NamesModel namesModel = namesModelFactory.getNamesModel(entityMeta);
            serviceModel.setNamesModel(namesModel);
        }
    }

    /**
     * インポート名を処理します。
     * 
     * @param serviceModel
     *            サービスモデル
     * @param entityMeta
     *            エンティティメタデータ
     */
    protected void doImportName(ServiceModel serviceModel, EntityMeta entityMeta) {
        classModelSupport.addImportName(serviceModel, entityMeta
                .getEntityClass());
        for (PropertyMeta propertyMeta : serviceModel.getIdPropertyMetaList()) {
            classModelSupport.addImportName(serviceModel, propertyMeta
                    .getPropertyClass());
        }
        PropertyMeta propertyMeta = serviceModel.getVersionPropertyMeta();
        if (propertyMeta != null) {
            classModelSupport.addImportName(serviceModel, propertyMeta
                    .getPropertyClass());
        }
        NamesModel namesModel = serviceModel.getNamesModel();
        if (namesModel != null) {
            String namesClassName = ClassUtil.concatName(namesModel
                    .getPackageName(), namesModel.getShortClassName());
            classModelSupport.addStaticImportName(serviceModel, namesClassName);
            classModelSupport.addImportName(serviceModel, List.class);
        }
    }
}
