package com.klef.jfsd.sdp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AssignmentController {
    @GetMapping("/addAssignment")
    public String showAddAssignmentPage() {
        return "addAssignment"; // Maps to /WEB-INF/jsp/addAssignment.jsp
    }
}
