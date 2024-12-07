package com.klef.jfsd.sdp.service;

import com.klef.jfsd.sdp.entity.FileEntity;
import com.klef.jfsd.sdp.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public class FileService {

    @Autowired
    private FileRepository fileRepository;

    public FileEntity saveFile(MultipartFile file) throws IOException {
        FileEntity fileEntity = new FileEntity();
        fileEntity.setId(System.currentTimeMillis()); // Generate unique ID
        fileEntity.setFileName(file.getOriginalFilename());
        fileEntity.setFileData(file.getBytes());
        return fileRepository.save(fileEntity);
    }
}
