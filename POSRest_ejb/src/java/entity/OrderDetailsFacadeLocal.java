/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Nam_Nguyen
 */
@Local
public interface OrderDetailsFacadeLocal {

    void create(OrderDetails orderDetails);

    void edit(OrderDetails orderDetails);

    void remove(OrderDetails orderDetails);

    OrderDetails find(Object id);

    List<OrderDetails> findAll();

    List<OrderDetails> findRange(int[] range);

    int count();

    List<OrderDetails> findByOrderId(String orderid);

    BigDecimal sumPrice(String orderId);
    public List<OrderDetails> findByProduct(String proid,String orderid);

    List<TopProductValue> getTop5Product();
    
}
