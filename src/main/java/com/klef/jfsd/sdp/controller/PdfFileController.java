package com.klef.jfsd.sdp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.sdp.model.PdfFile;
import com.klef.jfsd.sdp.service.PdfFileService;

@RestController
@CrossOrigin
public class PdfFileController {

    @Autowired
    private PdfFileService pdfFileService;

    // Upload PDF File
    @PostMapping("/api/pdf/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
                                             @RequestParam("title") String title,
                                             @RequestParam("subject") String subject,
                                             @RequestParam("description") String description,
                                             @RequestParam("dueDate") String dueDate,
                                             @RequestParam("year") int year) {
        try {
            String fileName = title + "-" + subject + "." + file.getOriginalFilename().split("\\.")[1];
            String fileType = file.getContentType();
            byte[] data = file.getBytes();
            PdfFile pdfFile = new PdfFile(fileName, fileType, data, title, subject, description, dueDate, year);
            pdfFileService.storeFile(pdfFile);

            return ResponseEntity.status(HttpStatus.OK).body("File uploaded successfully!");
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File upload failed!");
        }
    }

    // Download PDF File
    @GetMapping("/api/pdf/download/{id}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable Long id) {
        PdfFile pdfFile = pdfFileService.getFile(id);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + pdfFile.getFileName() + "\"")
                .body(pdfFile.getData());
    }

    // View PDF File Inline
    @GetMapping("/api/pdf/view/{id}")
    public ResponseEntity<byte[]> viewFile(@PathVariable Long id) {
        PdfFile pdfFile = pdfFileService.getFile(id);

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + pdfFile.getFileName() + "\"")
                .body(pdfFile.getData());
    }

    // Get All PDF Files Metadata
    @GetMapping("/api/pdf/files")
    public ResponseEntity<List<Map<String, Object>>> getAllFiles() {
        List<PdfFile> pdfFiles = pdfFileService.getAllFiles();

        if (pdfFiles.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
        }

        List<Map<String, Object>> pdfFileResponses = pdfFiles.stream().map(file -> {
            Map<String, Object> fileData = new HashMap<>();
            fileData.put("id", file.getId());
            fileData.put("fileName", file.getFileName());
            fileData.put("title", file.getTitle());
            fileData.put("subject", file.getSubject());
            fileData.put("description", file.getDescription());
            fileData.put("dueDate", file.getDueDate());
            fileData.put("year", file.getYear());
            return fileData;
        }).collect(Collectors.toList());

        return ResponseEntity.status(HttpStatus.OK).body(pdfFileResponses);
    }

    // Delete PDF File
    @DeleteMapping("/api/pdf/delete/{id}")
    public ResponseEntity<String> deleteFile(@PathVariable Long id) {
        boolean isDeleted = pdfFileService.deleteFile(id);
        if (isDeleted) {
            return ResponseEntity.status(HttpStatus.OK).body("File deleted successfully!");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("File not found!");
        }
    }

    // Handle File Upload for MVC
    @PostMapping("/uploadfile")
    public String handleFileUpload(@RequestParam("file") MultipartFile file, Model model) {
        // Handle file upload
        model.addAttribute("message", "File uploaded successfully");
        return "uploadsuccess";
    }
}
