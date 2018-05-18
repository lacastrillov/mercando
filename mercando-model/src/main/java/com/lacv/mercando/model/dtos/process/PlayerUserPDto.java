/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model.dtos.process;

import com.lacv.jmagrexs.annotation.HideField;
import com.lacv.jmagrexs.annotation.Order;
import com.lacv.jmagrexs.annotation.TextField;
import com.lacv.jmagrexs.annotation.TypeFormField;
import com.lacv.jmagrexs.enums.FieldType;
import com.lacv.jmagrexs.enums.HideView;

/**
 *
 * @author grupot
 */
public class PlayerUserPDto {
    
    @Order(1)
    private Integer id;
    
    private Integer uid;
    
    @TextField("Usuario")
    private String username;
    
    @TextField("Nombre Completo")
    private String fullname;
    
    @TextField("Password")
    @TypeFormField(FieldType.PASSWORD)
    @HideField({HideView.LOG})
    private String password;
    
    @TextField("Correo Electrónico")
    @TypeFormField(FieldType.EMAIL)
    private String emailAddress;
    
    @TextField("Url perfil")
    @TypeFormField(FieldType.URL)
    private String profileUrl;
    
    @TextField("Url foto")
    @TypeFormField(FieldType.URL)
    private String photoUrl;
    
    @TextField("Url foto thumb")
    @TypeFormField(FieldType.URL)
    private String thumbnalUrl;
    
    @TextField("Genero")
    @TypeFormField(value = FieldType.LIST, data = {"F", "M"})
    private String gender;
    
    @TextField("Nombre")
    private String firstName;
    
    @TextField("Apellidos")
    private String lastName;
    
    @TextField("Titulo")
    private String middleName;
    
    @TextField("Puntaje")
    private Integer highScore;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the uid
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * @param uid the uid to set
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the fullname
     */
    public String getFullname() {
        return fullname;
    }

    /**
     * @param fullname the fullname to set
     */
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the profileUrl
     */
    public String getProfileUrl() {
        return profileUrl;
    }

    /**
     * @param profileUrl the profileUrl to set
     */
    public void setProfileUrl(String profileUrl) {
        this.profileUrl = profileUrl;
    }

    /**
     * @return the photoUrl
     */
    public String getPhotoUrl() {
        return photoUrl;
    }

    /**
     * @param photoUrl the photoUrl to set
     */
    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    /**
     * @return the thumbnalUrl
     */
    public String getThumbnalUrl() {
        return thumbnalUrl;
    }

    /**
     * @param thumbnalUrl the thumbnalUrl to set
     */
    public void setThumbnalUrl(String thumbnalUrl) {
        this.thumbnalUrl = thumbnalUrl;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the middleName
     */
    public String getMiddleName() {
        return middleName;
    }

    /**
     * @param middleName the middleName to set
     */
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    /**
     * @return the highScore
     */
    public Integer getHighScore() {
        return highScore;
    }

    /**
     * @param highScore the highScore to set
     */
    public void setHighScore(Integer highScore) {
        this.highScore = highScore;
    }
    
}
