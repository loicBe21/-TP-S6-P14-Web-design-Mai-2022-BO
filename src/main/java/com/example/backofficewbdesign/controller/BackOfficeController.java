package com.example.backofficewbdesign.controller;


import com.example.backofficewbdesign.dao.HibernateDao;
import com.example.backofficewbdesign.handlerException.SessionLostException;
import com.example.backofficewbdesign.model.Admin;
import com.example.backofficewbdesign.model.Article;
import com.example.backofficewbdesign.model.Categorie;
import com.example.backofficewbdesign.util.ImageEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;


@org.springframework.stereotype.Controller
public class BackOfficeController {

    @Autowired
    private HibernateDao hibernateDao ;


    @GetMapping("/")
    public String login() throws Exception {
        return "backOffice/login";
    }

    public void sessionExpired(HttpSession session) throws SessionLostException {
        if(session.getAttribute("user")==null){
            throw new SessionLostException();
        }
    }

    @GetMapping("/newArticle")
    public ModelAndView ajoutArticle(HttpSession session)throws Exception {
        this.sessionExpired(session);
        ModelAndView modelAndView = new ModelAndView("backOffice/ajArticle");
        List<Categorie> categories = hibernateDao.findAll(Categorie.class);
        modelAndView.addObject("categories" , categories);
       return modelAndView;
    }


    @PostMapping("/createArticle")
    public String saveArticle(@RequestParam("pathPhoto") CommonsMultipartFile file, @RequestParam(name = "idC") Integer idCategorie , @ModelAttribute Article article , HttpSession session) throws Exception {
        this.sessionExpired(session);
        Admin admin =(Admin) session.getAttribute("user");
        article.setAdmin(admin);
        Categorie categorie = hibernateDao.findById(Categorie.class,idCategorie);
        article.setCategorie(categorie);
        String picsName = ImageEncoder.encodeImage(file);
        article.setPhoto(picsName);
        article.setDateAjout(Date.valueOf(LocalDate.now()));
       // System.out.println(categorie.toString());
        hibernateDao.create(article);
        //System.out.println(article.getDescri()+" "+article.getTitre());
        return "redirect:/newArticle?succes=1";
    }




    @GetMapping("/singOut")
    public String deconnexion(HttpSession session) throws Exception {
        this.sessionExpired(session);
        session.removeAttribute("user");
        return "redirect:/";
    }


    @PostMapping("/login")
    public String submitLogin(@RequestParam(name = "username") String userName , @RequestParam(name = "password") String passWord , HttpSession session) throws Exception {
        Admin admin = hibernateDao.isExiste(userName,passWord);
        session.setAttribute("user",admin);
        return "redirect:/newArticle";
    }



    public ModelAndView showListe(HashMap data) {
        ModelAndView modelAndView = new ModelAndView("backOffice/liste");
        modelAndView.addObject("data", data);
        return modelAndView;
    }

    @GetMapping("/allArticles")
    public ModelAndView allListe(HttpSession session ,@RequestParam(name = "num" , defaultValue = "1") Integer num) throws Exception {
        this.sessionExpired(session);
        HashMap hashMap = hibernateDao.adminData(8,num);
        return showListe(hashMap);
    }

    @GetMapping("/retiredArticle")
    public ModelAndView retiredListe(HttpSession session , @RequestParam(name = "num" , defaultValue = "1") Integer num) throws Exception {
        this.sessionExpired(session);
        HashMap hashMap = hibernateDao.retiredData(8,num);
        return showListe(hashMap);
    }

    @GetMapping("/delete/{id}")
    public String deleteAction(@PathVariable  Integer id )throws Exception {
        Article article = this.hibernateDao.findById(Article.class , id);
        this.hibernateDao.delete(article);
        return "redirect:/allArticles?num=1";
    }
    @GetMapping("/update/{id}")
    public ModelAndView updateAction(@PathVariable Integer id) throws Exception {
        ModelAndView modelAndView = new ModelAndView("backOffice/modifyArticle");
        Article article = hibernateDao.findById(Article.class , id);
        List<Categorie> categories = hibernateDao.findAll(Categorie.class);
        modelAndView.addObject("categories" , categories);
        modelAndView.addObject("data" , article);
        return modelAndView;
    }

    @PostMapping("/update")
    public String update(@RequestParam("pathPhoto") CommonsMultipartFile file,  @ModelAttribute Article article , @RequestParam( name = "idAdmin") Integer idAdmin,@RequestParam( name="idArticle") Integer idArticle , @RequestParam(name = "idC") Integer idCategorie ,@RequestParam(name = "photo") String pics,  HttpSession session) throws Exception {
        this.sessionExpired(session);

        Admin admin = hibernateDao.findById(Admin.class , idAdmin);
        Categorie categorie = hibernateDao.findById(Categorie.class , idCategorie);
        article.setId(idArticle);
        article.setAdmin(admin);
        article.setCategorie(categorie);
        if(!file.isEmpty()){
            String picsName = ImageEncoder.encodeImage(file);
            article.setPhoto(picsName);
        }
        else{
            System.out.println("ato"+pics.length());
            article.setPhoto(pics);
        }
        article.setDateAjout(Date.valueOf(LocalDate.now()));
        hibernateDao.create(article);
        return "redirect:/allArticles?num=1";
    }

    @GetMapping("/retire/{id}")
    public String retire(@PathVariable Integer id)throws Exception {
        Article article = hibernateDao.findById(Article.class , id);
        article.setIsretired(true);
        article = hibernateDao.create(article);
        return "redirect:/allArticles?num=1";
    }

    @GetMapping("/add/{id}")
    public String add(@PathVariable Integer id) throws Exception {
        Article article = hibernateDao.findById(Article.class , id);
        article.setIsretired(false);
        article = hibernateDao.create(article);
        return "redirect:/allArticles?num=1";
    }





}
