package com.klef.jfsd.sdp.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.FacultyService;

import ch.qos.logback.core.model.Model;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;
    
        @GetMapping("/")
        public String home() {
            return "home"; // Points to /WEB-INF/jsp/facultyHome.jsp
        }

    // Faculty registration page
    @GetMapping("/facreg")
    public ModelAndView facReg() {
        return new ModelAndView("facreg");
    }

    // Handle faculty registration
    @PostMapping("/insertfaculty")
    public ModelAndView insertFaculty(HttpServletRequest request) {
        String name = request.getParameter("fname");
        String password = request.getParameter("fpwd");
        String email = request.getParameter("femail");
        String department = request.getParameter("fdept");
        String contactno = request.getParameter("fcontact");
        String location = request.getParameter("flocation");
        String status = "Registered";

        Faculty faculty = new Faculty();
        faculty.setName(name);
        faculty.setPassword(password);
        faculty.setEmail(email);
        faculty.setDepartment(department);
        faculty.setContactno(contactno);
        faculty.setLocation(location);
        faculty.setStatus(status);

        String msg = facultyService.FacultyRegistration(faculty);
        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);

        return mv;
    }

    // Faculty login page
    @GetMapping("faclogin")
    public ModelAndView facLogin() {
        return new ModelAndView("faclogin");
    }

    // Faculty logout page
    @GetMapping("faclogout")
    public ModelAndView facLogout() {
        return new ModelAndView("faclogin");
    }

    // Faculty home page
    @GetMapping("fachome")
    public ModelAndView facHome() {
        return new ModelAndView("fachome");
    }

    // Check faculty login credentials
    @PostMapping("checkfaclogin")
    public ModelAndView checkFacLogin(HttpServletRequest request) {
        String femail = request.getParameter("femail");
        String fpwd = request.getParameter("fpwd");

        Faculty faculty = facultyService.checkfaclogin(femail, fpwd);

        ModelAndView mv = new ModelAndView();
        if (faculty != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("faculty", faculty);
            mv.setViewName("fachome");
        } else {
            mv.setViewName("facloginfail");
            mv.addObject("message", "Login Failed");
        }

        return mv;
    }

    // Session failure page
    @GetMapping("facsessionfail")
    public ModelAndView facSessionFail() {
        return new ModelAndView("facsessionfail");
    }

    // Update faculty profile page
    @GetMapping("updatefac")
    public ModelAndView updateFac() {
        return new ModelAndView("updatefac");
    }

    // Handle updating faculty profile
    @PostMapping("updatefaculty")
    public ModelAndView updateFaculty(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("fid"));
        String name = request.getParameter("fname");
        String password = request.getParameter("fpwd");
        String department = request.getParameter("fdept");
        String contact = request.getParameter("fcontact");
        String location = request.getParameter("flocation");

        Faculty faculty = new Faculty();
        faculty.setId(id);
        faculty.setName(name);
        faculty.setPassword(password);
        faculty.setDepartment(department);
        faculty.setContactno(contact);
        faculty.setLocation(location);

        String msg = facultyService.updateFaculty(faculty);
        ModelAndView mv = new ModelAndView("updatesuccess");
        mv.addObject("message", msg);

        return mv;
    }

    // View faculty profile
    @GetMapping("facprofile")
    public ModelAndView facProfile() {
        return new ModelAndView("facprofile");
    }

    // Add student registration page
    @GetMapping("/facaddstu")
    public ModelAndView studentReg() {
        return new ModelAndView("facaddstu");
    }

    // Handle adding a student
    @PostMapping("/facinsertstu")
    public ModelAndView insertStudent(HttpServletRequest request) {
        String name = request.getParameter("fname");
        String password = request.getParameter("fpwd");
        String email = request.getParameter("femail");
        String department = request.getParameter("fdept");
        String contactno = request.getParameter("fcontact");
        String gender = request.getParameter("fgender");
        String dob = request.getParameter("fdob");

        Student student = new Student();
        student.setName(name);
        student.setPassword(password);
        student.setEmail(email);
        student.setDepartment(department);
        student.setContactno(contactno);
        student.setGender(gender);
        student.setDob(dob);
        student.setEventsRegistered("");

        String msg = facultyService.addStudent(student);
        ModelAndView mv = new ModelAndView("facaddstu");
        mv.addObject("successMessage", msg);

        return mv;
    }

    // View all students
    @GetMapping("facviewallstu")
    public ModelAndView viewAllStudents() {
        ModelAndView mv = new ModelAndView("facviewallstu");
        long studentCount = facultyService.studentCount();
        List<Student> studentList = facultyService.viewAllStudents();
        mv.addObject("scount", studentCount);
        mv.addObject("studentList", studentList);
        return mv;
    }

    // Delete student page
    @GetMapping("facdelstu")
    public ModelAndView deleteStudent() {
        ModelAndView mv = new ModelAndView("facdelstu");
        List<Student> studentList = facultyService.viewAllStudents();
        mv.addObject("studentList", studentList);
        return mv;
    }

    // Handle deleting a student
    @GetMapping("facdeletestu")
    public String deleteStudent(@RequestParam("id") int studentId) {
        facultyService.deleteStudent(studentId);
        return "redirect:/facdelstu";
    }
    @Controller
    public class AssignmentController {
        
        @GetMapping("/addassignment")
        public String showAddAssignmentForm(Model model) {
            // Populate model if needed
            return "addassignment"; // Ensure this matches the JSP name
        }

        @PostMapping("/addassignment")
        public String handleAddAssignment(@ModelAttribute Assignment assignment) {
            // Process the form data and save the assignment
            return "redirect:/home"; // Or redirect to a confirmation page
        }
    }

}
