/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.math.BigDecimal;
import java.math.BigInteger;
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
public class OrderDetailsFacade extends AbstractFacade<OrderDetails> implements OrderDetailsFacadeLocal {
    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderDetailsFacade() {
        super(OrderDetails.class);
    }

    @Override
    public List<OrderDetails> findByOrderId(String orderid) {
        Query q=em.createQuery("SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.orderId = :orderId");
        q.setParameter("orderId", orderid);
        List<OrderDetails> list=q.getResultList();
        return list;
    }
    @Override
    public List<OrderDetails> findByProduct(String proid,String orderid) {
        Query q=em.createQuery("SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.proId = :proId and o.orderDetailsPK.orderId = :orderId");
        q.setParameter("proId", proid);
        q.setParameter("orderId", orderid);
        List<OrderDetails> list=q.getResultList();
        return list;
    }
    

    @Override
    public BigDecimal sumPrice(String orderId) {
        Query q=em.createQuery("SELECT o, SUM(o.price) FROM OrderDetails o WHERE o.orderDetailsPK.orderId = :orderId");
        q.setParameter("orderId", orderId);
        BigDecimal price=new BigDecimal((BigInteger) q);
        return price;
    }

    @Override
    public List<TopProductValue> getTop5Product() {
        Query q=em.createQuery("SELECT t FROM TopProductValue t");
        return q.getResultList();
    }
    
    
    
    
}
