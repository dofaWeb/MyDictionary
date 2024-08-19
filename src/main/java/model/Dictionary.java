/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author NHAT
 */
public class Dictionary {

    String Eng;
    String Vn;
    int Id;

    public Dictionary() {
    }
    
     public Dictionary(String Eng, String Vn) {
        this.Eng = Eng;
        this.Vn = Vn;
    }

    public Dictionary(String Eng, String Vn, int Id) {
        this.Eng = Eng;
        this.Vn = Vn;
        this.Id = Id;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }    

    public String getEng() {
        return Eng;
    }

    public void setEng(String Eng) {
        this.Eng = Eng;
    }

    public String getVn() {
        return Vn;
    }

    public void setVn(String Vn) {
        this.Vn = Vn;
    }

    
    
    
}
