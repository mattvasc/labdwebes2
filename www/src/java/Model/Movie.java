/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author imsp
 */
public class Movie {

    private int movieid;
    private String mvyear;
    private Genero[] genre;
    private String title;
    private Lang[] lang;
    private Director[] director;

    public Movie(String y, String t) {
        this.mvyear = y;
        this.title = t;
    }

    public Movie(int id, String t, String y) {
        this.movieid = id;
        this.title = t;
        this.mvyear = y;
    }

    public Movie() {
    }

    public String getMvyear() {
        return mvyear;
    }

    public void setMvyear(String mvyear) {
        this.mvyear = mvyear;
    }

    public Genero[] getGenre() {
        return genre;
    }

    public void setGenre(Genero[] genre) {
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Lang[] getLang() {
        return lang;
    }

    public void setLang(Lang[] lang) {
        this.lang = lang;
    }

    public Director[] getDirector() {
        return director;
    }

    public void setDirector(Director[] director) {
        this.director = director;
    }

}
