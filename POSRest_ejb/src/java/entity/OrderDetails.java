/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "Order_Details", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetails.findAll", query = "SELECT o FROM OrderDetails o"),
    @NamedQuery(name = "OrderDetails.findByOrderId", query = "SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.orderId = :orderId"),
    @NamedQuery(name = "OrderDetails.findByProId", query = "SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.proId = :proId"),
    @NamedQuery(name = "OrderDetails.findByQuantity", query = "SELECT o FROM OrderDetails o WHERE o.quantity = :quantity"),
    @NamedQuery(name = "OrderDetails.findByPrice", query = "SELECT o FROM OrderDetails o WHERE o.price = :price"),
    @NamedQuery(name = "OrderDetails.findByDiscount", query = "SELECT o FROM OrderDetails o WHERE o.discount = :discount"),
    @NamedQuery(name = "OrderDetails.findByOptionvalue", query = "SELECT o FROM OrderDetails o WHERE o.optionvalue = :optionvalue")})
public class OrderDetails implements Serializable {
    @Size(max = 150)
    @Column(name = "option", length = 150)
    private String option;
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderDetailsPK orderDetailsPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity", nullable = false)
    private int quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "price", nullable = false, precision = 19, scale = 4)
    private BigDecimal price;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discount", nullable = false)
    private double discount;
    @Size(max = 150)
    @Column(name = "optionvalue", length = 150)
    private String optionvalue;
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;
    @JoinColumn(name = "pro_id", referencedColumnName = "pro_id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Products products;
    

    public OrderDetails() {
    }
    public OrderDetails(OrderDetailsPK orderDetailsPK) {
        this.orderDetailsPK = orderDetailsPK;
    }

    public OrderDetails(OrderDetailsPK orderDetailsPK, int quantity, BigDecimal price, double discount) {
        this.orderDetailsPK = orderDetailsPK;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
    }

    public OrderDetails(OrderDetailsPK orderDetailsPK, int quantity, BigDecimal price, double discount, String optionvalue, Orders orders, Products products) {
        this.orderDetailsPK = orderDetailsPK;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.optionvalue = optionvalue;
        this.orders = orders;
        this.products = products;
    }
    

    public OrderDetails(String orderId, String proId) {
        this.orderDetailsPK = new OrderDetailsPK(orderId, proId);
    }

    public OrderDetailsPK getOrderDetailsPK() {
        return orderDetailsPK;
    }

    public void setOrderDetailsPK(OrderDetailsPK orderDetailsPK) {
        this.orderDetailsPK = orderDetailsPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getOptionvalue() {
        return optionvalue;
    }

    public void setOptionvalue(String optionvalue) {
        this.optionvalue = optionvalue;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
        
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailsPK != null ? orderDetailsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetails)) {
            return false;
        }
        OrderDetails other = (OrderDetails) object;
        if ((this.orderDetailsPK == null && other.orderDetailsPK != null) || (this.orderDetailsPK != null && !this.orderDetailsPK.equals(other.orderDetailsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.OrderDetails[ orderDetailsPK=" + orderDetailsPK + " ]";
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }
    
}
