package com.example.demo.model.po;

import java.time.LocalDateTime;
import java.util.List;

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
public class Order {  //訂單
    
    private Integer id; //訂單編號id
    private Integer userId; // 用戶id
    private Integer total; // 總金額
    private LocalDateTime created_at; // 訂單時間
    private List<Item> items; // 訂單項目列表
    
}