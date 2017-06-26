/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author spectrus
 */
public class Actor {
    public Actor(int ActorId, String ActorName){
        this.ActorId = ActorId;
        this.ActorName = ActorName;
    }
    public Actor (int id){
        this.ActorId = id;
    }
     public Actor (String a){
        this.ActorName = a;
    }
    public Actor(int ActorId, String ActorName, int n_lang){
        this.ActorId = ActorId;
        this.ActorName = ActorName;
        this.n_lang = n_lang;
    }
    
    public int getActorId() {
        return ActorId;
    }

    public void setActorId(int ActorId) {
        this.ActorId = ActorId;
    }

    public String getActorName() {
        return ActorName;
    }

    public void setActorName(String ActorName) {
        this.ActorName = ActorName;
    }
    private int ActorId;
    private String ActorName;

    public int getN_lang() {
        return n_lang;
    }

    public void setN_lang(int n_lang) {
        this.n_lang = n_lang;
    }
    private int n_lang;
}
