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
}
