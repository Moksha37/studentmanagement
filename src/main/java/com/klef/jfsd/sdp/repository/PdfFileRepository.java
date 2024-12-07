package com.klef.jfsd.sdp.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import com.klef.jfsd.*;
import com.klef.jfsd.sdp.model.PdfFile;

public interface PdfFileRepository extends JpaRepository<PdfFile, Long> {
}
