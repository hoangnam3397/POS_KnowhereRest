/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "Orders", catalog = "WAPOS", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "Orders.findByPaymethod", query = "SELECT o FROM Orders o WHERE o.paymethod = :paymethod"),
    @NamedQuery(name = "Orders.findByOrdertime", query = "SELECT o FROM Orders o WHERE o.ordertime = :ordertime"),
    @NamedQuery(name = "Orders.findByDeleted", query = "SELECT o FROM Orders o WHERE o.deleted = :deleted"),
    @NamedQuery(name = "Orders.findBySubtotal", query = "SELECT o FROM Orders o WHERE o.subtotal = :subtotal"),
    @NamedQuery(name = "Orders.findByOrderTax", query = "SELECT o FROM Orders o WHERE o.orderTax = :orderTax"),
    @NamedQuery(name = "Orders.findByDiscount", query = "SELECT o FROM Orders o WHERE o.discount = :discount"),
    @NamedQuery(name = "Orders.findByTotal", query = "SELECT o FROM Orders o WHERE o.total = :total")})
public class Orders implements Serializable {
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orders")
    private Collection<OrderDetails> orderDetailsCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "order_id", nullable = false, length = 10)
    private String orderId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "paymethod", nullable = false, length = 50)
    private String paymethod;
    @Column(name = "ordertime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ordertime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "subtotal", nullable = false, precision = 19, scale = 4)
    private BigDecimal subtotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_tax", nullable = false)
    private double orderTax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discount", nullable = false)
    private double discount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "total", nullable = false, precision = 19, scale = 4)
    private BigDecimal total;
    @JoinColumn(name = "cus_id", referencedColumnName = "cus_id")
    @ManyToOne
    private Customers cusId;
    @JoinColumn(name = "emp_id", referencedColumnName = "emp_id")
    @ManyToOne
    private Employees empId;
    @JoinColumn(name = "tab_id", referencedColumnName = "tab_id")
    @ManyToOne
    private Tables tabId;

    public Orders() {
    }

    public Orders(String orderId) {
        this.orderId = orderId;
    }

    public Orders(String orderId, String paymethod, int deleted, BigDecimal subtotal, double orderTax, double discount, BigDecimal total) {
        this.orderId = orderId;
        this.paymethod = paymethod;
        this.deleted = deleted;
        this.subtotal = subtotal;
        this.orderTax = orderTax;
        this.discount = discount;
        this.total = total;
    }

    public Orders( String orderId, String paymethod, Date ordertime, int deleted, BigDecimal subtotal, double orderTax, double discount, BigDecimal total, Customers cusId, Employees empId, Tables tabId) {
        this.orderId = orderId;
        this.paymethod = paymethod;
        this.ordertime = ordertime;
        this.deleted = deleted;
        this.subtotal = subtotal;
        this.orderTax = orderTax;
        this.discount = discount;
        this.total = total;
        this.cusId = cusId;
        this.empId = empId;
        this.tabId = tabId;
    }
    

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public double getOrderTax() {
        return orderTax;
    }

    public void setOrderTax(double orderTax) {
        this.orderTax = orderTax;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Customers getCusId() {
        return cusId;
    }

    public void setCusId(Customers cusId) {
        this.cusId = cusId;
    }

    public Employees getEmpId() {
        return empId;
    }

    public void setEmpId(Employees empId) {
        this.empId = empId;
    }

    public Tables getTabId() {
        return tabId;
    }

    public void setTabId(Tables tabId) {
        this.tabId = tabId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orders[ orderId=" + orderId + " ]";
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }
    
}
