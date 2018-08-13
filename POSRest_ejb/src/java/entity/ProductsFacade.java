/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.util.Date;
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

    @Override
    public boolean chkProUnique(String id, String name) {
        try {
            int del=0;
            Query q = em.createQuery("SELECT p FROM Products p WHERE p.proId != :id and p.proName = :name and p.deleted = :del");
            q.setParameter("del", del);
            q.setParameter("id", id);
            q.setParameter("name", name);
            if(q.getResultList().size() == 0){
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
    public List<VProductReport> vProReport(String pro_id, Date startDate, Date endDate) {
        Query q=em.createQuery("SELECT v FROM VProductReport v WHERE v.proId = :pro and v.ordertime >= :startDate and v.ordertime <= :endDate");
        q.setParameter("pro", pro_id);
        q.setParameter("startDate", startDate);
        q.setParameter("endDate", endDate);
        return q.getResultList();
    }
    
    @Override
    public List<Products> showProductToOrder() {
        Query q = getEntityManager().createQuery("SELECT p FROM Products p WHERE p.deleted = :del and p.hide = :show");
        int del=0;
        int show=0;
        q.setParameter("del", del);
        q.setParameter("show", show);
        return q.getResultList();
    }
    
    @Override
    public List<VProductReport> vOrderReport(Date startDate, Date endDate) {
        Query q=em.createQuery("SELECT v FROM VProductReport v WHERE v.ordertime >= :startDate and v.ordertime <= :endDate");
        q.setParameter("startDate", startDate);
        q.setParameter("endDate", endDate);
        return q.getResultList();
    }
}
