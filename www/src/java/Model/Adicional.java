/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author spectrus
 */
public class Adicional {
    private ArrayList<Actor> actors;
    private ArrayList<Director> directors;
    private ArrayList<Lang> langs;
    
    public Adicional(){
        actors = new ArrayList<>();
        directors = new ArrayList<>();
        langs = new ArrayList<>();
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
    
}
