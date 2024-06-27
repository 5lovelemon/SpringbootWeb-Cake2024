package com.example.demo.model.po;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product { // 蛋糕商品
	
	@Id
	@Column("cakeid")
    private Integer cakeid; // 商品蛋糕id
	
	@Column("cakename")
    private String cakename; // 蛋糕名稱
	
	@Column("cakeprice")
    private Integer cakeprice; // 蛋糕價格
	
	@Column("quantity")
    private Integer quantity; // 訂購蛋糕數量
    
    // Getters 和 Setters
    
    public Integer getCakeid() {
        return cakeid;
    }

    public void setCakeid(Integer cakeid) {
        this.cakeid = cakeid;
    }

    public String getCakename() {
        return cakename;
    }

    public void setCakename(String cakename) {
        this.cakename = cakename;
    }

    public Integer getCakeprice() {
        return cakeprice;
    }

    public void setCakeprice(Integer cakeprice) {
        this.cakeprice = cakeprice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}