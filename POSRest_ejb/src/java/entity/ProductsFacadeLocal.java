/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.util.Date;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Nam_Nguyen
 */
@Local
public interface ProductsFacadeLocal {

    void create(Products products);

    void edit(Products products);

    void remove(Products products);

    Products find(Object id);

    List<Products> findAll();

    List<Products> findRange(int[] range);

    int count();

    List<Products> showAllProduct();
    
    boolean deleteProOfCate(String cate_id);

    boolean chkProUnique(String id, String name);
    
    List<VProductReport> vProReport(String pro_id, Date startDate, Date endDate);
    
    List<Products> showProductToOrder();
    
    List<VProductReport> vOrderReport(Date startDate, Date endDate) ;
}
