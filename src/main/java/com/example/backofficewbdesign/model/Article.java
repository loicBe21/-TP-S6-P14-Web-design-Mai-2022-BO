package com.example.backofficewbdesign.model;

import javax.persistence.*;
import java.sql.Date;


@Entity
public class Article {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "date_ajout")
    private Date dateAjout;
    private String titre;
    private String descri;
    @Column(name = "pathpoto")
    private String photo;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name ="idcategorie")
    private Categorie categorie;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idadmin")
    private Admin admin;
    private boolean isretired;

    public boolean isIsretired() {
        return isretired;
    }

    public void setIsretired(boolean isretired) {
        this.isretired = isretired;
    }

    @Transient
    private Integer idC;


    public String getUrl(){

        String url = this.getTitre().replace(" ","_");
        url = url+"_"+this.getDateAjout()+"_"+this.getCategorie().getNomCategorie();
        return url;
    }



    public Integer getIdC() {
        return idC;
    }

    public void setIdC(Integer idC) {
        this.idC = idC;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }



    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", dateAjout=" + dateAjout +
                ", titre='" + titre + '\'' +
                ", descri='" + descri + '\'' +
                ", photo='" + photo + '\'' +
                ", categorie=" + categorie +
                ", admin=" + admin +
                ", idC=" + idC +
                '}';
    }
}
