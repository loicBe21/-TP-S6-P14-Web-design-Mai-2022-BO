package com.example.backofficewbdesign.dao;

import com.example.backofficewbdesign.handlerException.AuthentificationFailed;
import com.example.backofficewbdesign.model.Admin;
import com.example.backofficewbdesign.model.Article;
import com.example.backofficewbdesign.util.Helper;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class HibernateDao {

    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public <T> T create(T entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    public <T> T findById(Class<T> clazz, Serializable id){
        Session session = sessionFactory.openSession();
        T entity = (T) session.get(clazz, id);
        session.close();
        return entity;
    }


    public <T> List<T> findAll(Class<T> tClass){
        Session session = sessionFactory.openSession();
        List<T> results = session.createCriteria(tClass).list();
        session.close();
        return results;
    }

    public void delete(Object entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(entity);
        transaction.commit();
        session.close();
    }


    public Admin isExiste(String username , String passWord) throws Exception {
        Session session = null;
        Admin admin = null;
        try{
            session = sessionFactory.openSession();
            String sql = " SELECT * FROM ADMIN WHERE username='"+username+"' AND password='"+passWord+"'";
            Query query = session.createSQLQuery(sql).addEntity(Admin.class);
            admin = (Admin) query.uniqueResult();
            if(admin == null){
                throw  new AuthentificationFailed();
            }
        } finally {
            assert session != null;
            session.close();
        }
        return admin;

    }

    public Integer getSizeResult(String sql , Class<?> clazz , Session session) throws Exception {
        //Session session = sessionFactory.openSession();
        int val =  session.createSQLQuery(sql).addEntity(clazz).list().size();
        return val;
    }

    public HashMap adminData(int elementPerPages , int numPages) throws Exception {
        Session session = sessionFactory.openSession();
        HashMap<String , Object> bigData = new HashMap<String,Object>();
        int length = getSizeResult("SELECT * from article", Article.class , session);
        int offset =(numPages-1)*elementPerPages;
        int pages = Helper.pagesCount(length,elementPerPages);
        String sql = "SELECT * FROM article ORDER BY  id DESC OFFSET "+offset+" LIMIT "+ elementPerPages;
        List<Article> data = session.createSQLQuery(sql).addEntity(Article.class).list();
        session.close();
        bigData.put("data",data);
        bigData.put("pages",pages);
        return bigData;
    }

    public HashMap retiredData(int elementPerPages ,  int numPages) throws Exception {
        Session session = sessionFactory.openSession();
        HashMap<String , Object> bigData = new HashMap<String,Object>();
        int length = getSizeResult("SELECT * from article where isretired=true order by date_ajout desc", Article.class , session);
        int offset =(numPages-1)*elementPerPages;
        int pages = Helper.pagesCount(length,elementPerPages);
        String sql = "SELECT * FROM article WHERE ISRETIRED=true ORDER BY  date_ajout DESC OFFSET "+offset+" LIMIT "+ elementPerPages;
        List<Article> data = session.createSQLQuery(sql).addEntity(Article.class).list();
        session.close();
        bigData.put("data",data);
        bigData.put("pages",pages);
        return bigData;
    }
}
