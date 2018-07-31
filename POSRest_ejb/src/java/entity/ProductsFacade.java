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
public class ProductsFacade extends AbstractFacade<Products> implements ProductsFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductsFacade() {
        super(Products.class);
    }

    @Override
    public List<Products> showAllProduct() {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.deleted = :del");
        int del=0;
        q.setParameter("del", del);
        return q.getResultList();
    }
    
    @Override
    public boolean deleteProOfCate(String cate_id) {
        
        try {
            int del=1;
            Query q = em.createQuery("UPDATE Products Set deleted = :del Where catId.catId = :cate");
            q.setParameter("del", del);
            q.setParameter("cate", cate_id);         
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
}
