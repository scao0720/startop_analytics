/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scao.startstop;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Sabina
 */
@Stateless
public class BulletFacade extends AbstractFacade<Bullet> {
    @PersistenceContext(unitName = "startstopPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BulletFacade() {
        super(Bullet.class);
    }
public List<Bullet> findBySessionId(int id) {
    return em.createNamedQuery("Bullets.findBySessionId", Bullet.class).setParameter("sessionId", id).getResultList();
} 
}
