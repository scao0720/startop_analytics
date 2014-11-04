/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scao.startstop;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Sabina
 */
@Stateless
public class SessionFacade extends AbstractFacade<Session> {
    @PersistenceContext(unitName = "startstopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SessionFacade() {
        super(Session.class);
    }
    
}
