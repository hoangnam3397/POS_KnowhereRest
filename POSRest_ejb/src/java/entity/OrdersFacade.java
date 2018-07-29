/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Nam_Nguyen
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }

    @Override
    public Orders getByTableid(String tableid) {
        Query q=em.createQuery("SELECT o FROM Orders o WHERE o.deleted = :deleted and o.tabId.tabId= :tableid");
        q.setParameter("deleted", 0);
        q.setParameter("tableid", tableid);    
        return (Orders) q.getResultList().get(0);
    }
    
    
}
