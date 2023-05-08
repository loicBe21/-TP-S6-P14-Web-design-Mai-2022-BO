package com.example.backofficewbdesign.controller;


import com.example.backofficewbdesign.handlerException.AuthentificationFailed;
import com.example.backofficewbdesign.handlerException.SessionLostException;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ControllerException {

    private static final Logger logger = LoggerFactory.logger(ControllerException.class);

    @ExceptionHandler(AuthentificationFailed.class)
    public ModelAndView handlerAuthentificationException(HttpServletRequest request , Exception ex){
        logger.info(ex.getMessage()+" url="+request.getRequestURL());
        ModelAndView modelAndView = new ModelAndView("backOffice/login");
        modelAndView.addObject("error",ex.getMessage());
        return modelAndView;
    }

    @ExceptionHandler(SessionLostException.class)
    public ModelAndView handlerSessionException(Exception ex){
        logger.info(ex.getMessage());
        ModelAndView modelAndView = new ModelAndView("backOffice/login");
        modelAndView.addObject("error",ex.getMessage());
        return modelAndView;
    }

}
