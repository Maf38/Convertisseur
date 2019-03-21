/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.naming.*;
/**
 *
 * @author gai
 */
/*
* beanRelai.java
Maj oct 2014
*/


public class beanRelais {

    private Object leProxy; // référence privée de l’interface remote de l’ejb

    public Object getProxy() {
        return leProxy;
    }
// le constructeur reçoit en paramètre le nom JNDI de l’interface

    public beanRelais(String chemin) throws Exception {
        init(chemin);
    }
// la method init initialise le proxy
// chemin est le nom jndi du proxy

    private void init(String chemin) throws Exception {
// Comme dans le client lourd, on commence par récupérer le context
// de l’annuaire local ou distant : pas de paramètre pour un annuaire
// local, une HashTable avec le nom du serveur pour un annuaire distant
        Context ctx = new InitialContext();
        leProxy = ctx.lookup(chemin);
    }
}
