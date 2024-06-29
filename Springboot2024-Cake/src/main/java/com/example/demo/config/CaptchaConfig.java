package com.example.demo.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class CaptchaConfig {

    @Bean
    public DefaultKaptcha getDefaultKaptcha() {
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();
        properties.setProperty("kaptcha.border", "no"); // 設置是否顯示邊框
        properties.setProperty("kaptcha.textproducer.char.length", "4"); // 設置驗證碼字符數為4
        properties.setProperty("kaptcha.textproducer.font.color", "black"); // 顏色為黑色
        properties.setProperty("kaptcha.textproducer.char.space", "3"); // 設置字符之間的間距為 5
        properties.setProperty("kaptcha.image.width", "125"); // 驗證碼圖片的寬度為 125 像素
        properties.setProperty("kaptcha.image.height", "50");// 驗證碼圖片的高度為 50 像素
        properties.setProperty("kaptcha.textproducer.font.size", "45"); // 設置驗證碼文本的字體大小為 45
        properties.setProperty("kaptcha.textproducer.char.string", "0123456789"); // 設置驗證碼字符為數字
        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}