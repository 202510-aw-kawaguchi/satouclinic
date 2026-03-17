package com.satoclinic.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @GetMapping("/")
    public String redirectRoot() {
        return "redirect:/todo";
    }

    @GetMapping("/todo")
    public String showTodo() {
        return "forward:/top.html";
    }
}
