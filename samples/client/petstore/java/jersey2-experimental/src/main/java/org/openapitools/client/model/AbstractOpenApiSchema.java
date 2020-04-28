/*
 * OpenAPI Petstore
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\
 *
 * The version of the OpenAPI document: 1.0.0
 *
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

package org.openapitools.client.model;

import java.util.Map;
import javax.ws.rs.core.GenericType;

public abstract class AbstractOpenApiSchema {

  private Object instance;

  public final String schemaType;

  public AbstractOpenApiSchema(String schemaType) {
    this.schemaType = schemaType;
  }

  public abstract Map<String, GenericType> getSchemas();

  public Object getActualInstance() {
    return instance;
  }

  public void setActualInstance(Object instance) {
    this.instance = instance;
  }

  public String getSchemaType() {
    return schemaType;
  }
}