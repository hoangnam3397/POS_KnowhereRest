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
public class CustomersFacade extends AbstractFacade<Customers> implements CustomersFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomersFacade() {
        super(Customers.class);
    }
     @Override
    public boolean chkEmailCusUnique(String id, String email) {
        try {
            
            Query q = em.createQuery("SELECT c FROM Customers c WHERE c.cusId != :id and c.email = :email and c.deleted = :del ");
            int del = 0;
            q.setParameter("del", del);
            q.setParameter("id", id);
            q.setParameter("email", email);
            if (q.getResultList().size() == 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
