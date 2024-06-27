package com.example.demo.model.dto;

import java.time.LocalDateTime;

import com.example.demo.model.po.Product;

import lombok.Data;

@Data
public class ItemDto {
	
	private Integer id; // 訂單項目編號id
    private Integer orderid; // 訂單id
    private Integer cakeid; // 蛋糕id
    private String cakename; // 商品蛋糕id
    private Integer quantity; // 訂購數量
    private Integer subtotal; // 小計
    private LocalDateTime created_at; // 訂單時間

}