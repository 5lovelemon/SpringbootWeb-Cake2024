package com.example.demo.model.po;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Item {  //訂單項目(明細)
    
    private Integer id; //訂單項目編號id
    private Integer orderid; // 訂單id
    private Integer cakeid; // 商品蛋糕id
    private String cakename; // 蛋糕名稱
    private Integer quantity; // 訂購蛋糕數量
    private Integer subtotal; // 小計
    private LocalDateTime created_at; // 訂單時間
    
}