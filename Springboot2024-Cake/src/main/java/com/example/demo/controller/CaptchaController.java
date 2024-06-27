package com.example.demo.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

@Controller
public class CaptchaController {

    @Autowired
    private DefaultKaptcha captchaProducer;

    @GetMapping("/captcha")
    public void getCaptcha(HttpSession session, HttpServletResponse response) throws IOException {
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        // 生成验证码文本并存储在会话中
        String capText = captchaProducer.createText();
        session.setAttribute("captcha", capText);

        // 创建验证码图像并写入响应中
        BufferedImage bi = captchaProducer.createImage(capText);
        ImageIO.write(bi, "jpg", response.getOutputStream());
    }
}