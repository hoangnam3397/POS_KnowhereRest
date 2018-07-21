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
public class TablesFacade extends AbstractFacade<Tables> implements TablesFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TablesFacade() {
        super(Tables.class);
    }

    @Override
    public List<Tables> showAllTables() {
        Query q = getEntityManager().createQuery("SELECT t FROM Tables t WHERE t.deleted = :del");
        int del=0;
        q.setParameter("del", del);
        return q.getResultList();
    }
    

    @Override
    public boolean deleteTableOfZone(String zone_id) {
        
        try {
            int del=1;
            Query q = em.createQuery("UPDATE Tables Set deleted = :del Where zoneId.zoneId = :zone");
            q.setParameter("del", del);
            q.setParameter("zone", zone_id);         
            if(q.executeUpdate()> 0){
                return true;
            }else{
                return false;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Tables> searchTableOfZone(String id) {
        Query q = getEntityManager().createQuery("SELECT t FROM Tables t WHERE t.zoneId.zoneId =:zoId");
        q.setParameter("zoId", id);
        return q.getResultList();
    }
    
}
