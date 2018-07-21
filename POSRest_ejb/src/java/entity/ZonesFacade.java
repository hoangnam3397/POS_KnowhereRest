/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Nam_Nguyen
 */
@Stateless
public class ZonesFacade extends AbstractFacade<Zones> implements ZonesFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ZonesFacade() {
        super(Zones.class);
    }

    @Override
    public List<Zones> showAllZones() {
        Query q = getEntityManager().createQuery("SELECT z FROM Zones z WHERE z.deleted= :del");
        int del=0;
        q.setParameter("del", del);
        return q.getResultList();
    }
    
}
