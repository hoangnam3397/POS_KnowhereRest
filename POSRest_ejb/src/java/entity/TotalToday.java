/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "TotalToday", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TotalToday.findAll", query = "SELECT t FROM TotalToday t"),
    @NamedQuery(name = "TotalToday.findByOrderId", query = "SELECT t FROM TotalToday t WHERE t.orderId = :orderId"),
    @NamedQuery(name = "TotalToday.findByPaymethod", query = "SELECT t FROM TotalToday t WHERE t.paymethod = :paymethod"),
    @NamedQuery(name = "TotalToday.findByOrdertime", query = "SELECT t FROM TotalToday t WHERE t.ordertime = :ordertime"),
    @NamedQuery(name = "TotalToday.findByDeleted", query = "SELECT t FROM TotalToday t WHERE t.deleted = :deleted"),
    @NamedQuery(name = "TotalToday.findBySubtotal", query = "SELECT t FROM TotalToday t WHERE t.subtotal = :subtotal"),
    @NamedQuery(name = "TotalToday.findByOrderTax", query = "SELECT t FROM TotalToday t WHERE t.orderTax = :orderTax"),
    @NamedQuery(name = "TotalToday.findByDiscount", query = "SELECT t FROM TotalToday t WHERE t.discount = :discount"),
    @NamedQuery(name = "TotalToday.findByTotal", query = "SELECT t FROM TotalToday t WHERE t.total = :total")})
public class TotalToday implements Serializable {
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

    public TotalToday() {
    }

    public TotalToday(String orderId) {
        this.orderId = orderId;
    }

    public TotalToday(String orderId, String paymethod, int deleted, BigDecimal subtotal, double orderTax, double discount, BigDecimal total) {
        this.orderId = orderId;
        this.paymethod = paymethod;
        this.deleted = deleted;
        this.subtotal = subtotal;
        this.orderTax = orderTax;
        this.discount = discount;
        this.total = total;
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
        if (!(object instanceof TotalToday)) {
            return false;
        }
        TotalToday other = (TotalToday) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.TotalToday[ orderId=" + orderId + " ]";
    }
    
}
