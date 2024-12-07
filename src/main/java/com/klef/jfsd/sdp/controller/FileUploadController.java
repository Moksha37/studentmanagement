package com.klef.jfsd.sdp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.klef.jfsd.sdp.repository.FileRepository;

@Controller
public class FileUploadController {
    private final FileRepository fileRepository;

    @Autowired
    public FileUploadController(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }
}
