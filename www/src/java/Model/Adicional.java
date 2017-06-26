/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author spectrus, ingrid, carla
 */
public class Adicional {
    private ArrayList<Actor> actors;
    private ArrayList<Director> directors;
    private ArrayList<Lang> langs;
    private ArrayList<Genero> generos;
    

    public ArrayList<Actor> getActors() {
        return actors;
    }
    public ArrayList<Genero> getGeneros() {
            return generos;
        }
    public ArrayList<Director> getDirectors() {
        return directors;
    }

    public ArrayList<Lang> getLangs() {
        return langs;
    }
    
    public Adicional(){
        this.actors = new ArrayList<>();
        this.directors = new ArrayList<>();
        this.langs = new ArrayList<>();
        this.generos = new ArrayList<>();
    }
    
    public void addActor(Actor a){
        this.actors.add(a);
    }
    public void addDirector(Director d){
        this.directors.add(d);
    }
    
    public void addLangs(Lang l){
        this.langs.add(l);
    }
    public void addGenres(Genero genero){
        this.generos.add(genero);
    }
}
