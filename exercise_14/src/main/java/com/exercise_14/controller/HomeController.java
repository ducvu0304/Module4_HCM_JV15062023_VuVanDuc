package com.exercise_14.controller;

import com.exercise_14.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller

public class HomeController {
    @Autowired// tiêm bean có tên UploadService trong iOC container
    private UploadService uploadService;

    //upload file
    @GetMapping("/")
    public String upload() {
        return "home";
    }

    @PostMapping("/upload")
    public String doUpload(@RequestParam("image") List<MultipartFile> file, Model model) {
        // xử lí upload
        List<String> images = uploadService.uploadFileToServer(file);
        model.addAttribute("images",images);
        return "result";
    }

}