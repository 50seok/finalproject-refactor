package com.kdt.finalproject.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kdt.finalproject.service.LoginService;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class LoginController {

    @Autowired
    private LoginService ls;

    @GetMapping("login")
    public String login() {
        return "/login/login";
    }

    // 일단 주석
    // @PostMapping("login")
    // @ResponseBody
    // public Map<String, Object> login(String m_email, String m_pw, String m_class)
    // {

    // Map<String, Object> response = new HashMap<>();

    // MemVO vo = ls.login(m_email, m_pw, m_class);

    // if (vo != null) {
    // session.setAttribute("mvo", vo);
    // response.put("success", true);
    // } else {
    // response.put("success", false);
    // }

    // return response;
    // }

    @PostMapping("/reqLogin")
    @ResponseBody
    public Map<String, Object> login(MemVO vo, HttpSession session) {

        Map<String, Object> response = new HashMap<>();

        MemVO mvo = ls.login(vo);

        if (mvo != null) {
            session.setAttribute("mvo", mvo);
            response.put("success", "1");
        } else {
            response.put("success", "0");
        }

        return response;
    }

    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        session.removeAttribute("mvo");
        mv.setViewName("redirect:/main/");
        return mv;
    }

    // @RequestMapping("sign")
    // public ModelAndView sign(String m_class) {
    // ModelAndView mv = new ModelAndView();

    // if (m_class == "0" || m_class == "2")
    // mv.setViewName("redirect:/car_mt");

    // else
    // mv.setViewName("redirect:login");

    // return mv;
    // }
}
