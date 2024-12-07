package com.klef.jfsd.sdp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentController {

    @GetMapping("/payment")
    public ModelAndView payment(@RequestParam("amount") String amount) {
        // Simulate payment process, implement real API call here for real integration
        ModelAndView mv = new ModelAndView();
        mv.setViewName("payment");
        mv.addObject("amount", amount);
        mv.addObject("message", "Please proceed with the payment.");

        // Redirect to PayPal payment page (This is just a placeholder URL)
        mv.addObject("paymentUrl", "https://www.paypal.com");

        return mv;
    }
}
