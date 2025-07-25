/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Đỗ Tuấn Anh
 */
public class Field {

    private int fieldId;
    private String fieldName;
    private String image;
    private String status;
    private String description;

    // Liên kết tới các bảng khác
    private Zone zone;
    private TypeOfField typeOfField;
    private List<SlotsOfField> slots; // các ca tương ứng sân này
    private BigDecimal price;


    public Field() {
    }

    public Field(int fieldId, String fieldName, String image, String status, String description) {
        this.fieldId = fieldId;
        this.fieldName = fieldName;
        this.image = image;
        this.status = status;
        this.description = description;
    }

    public Field(int fieldId, String fieldName, String image, String status, String description, Zone zone, TypeOfField typeOfField, List<SlotsOfField> slots) {
        this.fieldId = fieldId;
        this.fieldName = fieldName;
        this.image = image;
        this.status = status;
        this.description = description;
        this.zone = zone;
        this.typeOfField = typeOfField;
        this.slots = slots;
    }

    public Field(int fieldId, String fieldName, String image, String status, String description, Zone zone, TypeOfField typeOfField, List<SlotsOfField> slots, BigDecimal price) {
        this.fieldId = fieldId;
        this.fieldName = fieldName;
        this.image = image;
        this.status = status;
        this.description = description;
        this.zone = zone;
        this.typeOfField = typeOfField;
        this.slots = slots;
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getFieldId() {
        return fieldId;
    }

    public void setFieldId(int fieldId) {
        this.fieldId = fieldId;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Zone getZone() {
        return zone;
    }

    public void setZone(Zone zone) {
        this.zone = zone;
    }

    public TypeOfField getTypeOfField() {
        return typeOfField;
    }

    public void setTypeOfField(TypeOfField typeOfField) {
        this.typeOfField = typeOfField;
    }

    public List<SlotsOfField> getSlots() {
        return slots;
    }

    public void setSlots(List<SlotsOfField> slots) {
        this.slots = slots;
    }

   
    public boolean isActive() {
        return "Hoạt động".equals(this.status);
    }

    @Override
    public String toString() {
        return "Field{" + "fieldId=" + fieldId + ", fieldName=" + fieldName + ", image=" + image + ", status=" + status + ", description=" + description + ", zone=" + zone + ", typeOfField=" + typeOfField + ", slots=" + slots + ", price=" + price + '}';
    }

   
}
