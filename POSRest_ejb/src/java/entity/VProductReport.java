/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
 * @author Duy
 */
@Entity
@Table(name = "vProductReport", catalog = "WAPOS", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VProductReport.findAll", query = "SELECT v FROM VProductReport v"),
    @NamedQuery(name = "VProductReport.findByRowid", query = "SELECT v FROM VProductReport v WHERE v.rowid = :rowid"),
    @NamedQuery(name = "VProductReport.findByOrderId", query = "SELECT v FROM VProductReport v WHERE v.orderId = :orderId"),
    @NamedQuery(name = "VProductReport.findByProId", query = "SELECT v FROM VProductReport v WHERE v.proId = :proId"),
    @NamedQuery(name = "VProductReport.findByOrdertime", query = "SELECT v FROM VProductReport v WHERE v.ordertime = :ordertime"),
    @NamedQuery(name = "VProductReport.findByPrice", query = "SELECT v FROM VProductReport v WHERE v.price = :price"),
    @NamedQuery(name = "VProductReport.findByQuantity", query = "SELECT v FROM VProductReport v WHERE v.quantity = :quantity"),
    @NamedQuery(name = "VProductReport.findByDiscountC", query = "SELECT v FROM VProductReport v WHERE v.discountC = :discountC"),
    @NamedQuery(name = "VProductReport.findByTax", query = "SELECT v FROM VProductReport v WHERE v.tax = :tax"),
    @NamedQuery(name = "VProductReport.findByDiscountP", query = "SELECT v FROM VProductReport v WHERE v.discountP = :discountP"),
    @NamedQuery(name = "VProductReport.findByProName", query = "SELECT v FROM VProductReport v WHERE v.proName = :proName"),
    @NamedQuery(name = "VProductReport.findByCusName", query = "SELECT v FROM VProductReport v WHERE v.cusName = :cusName"),
    @NamedQuery(name = "VProductReport.findByTotal", query = "SELECT v FROM VProductReport v WHERE v.total = :total")})
public class VProductReport implements Serializable {
    private static final long serialVersionUID = 1L;
    @Column(name = "rowid")
    @Id
    private BigInteger rowid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "order_id", nullable = false, length = 10)
    private String orderId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "pro_id", nullable = false, length = 10)
    private String proId;
    @Column(name = "ordertime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ordertime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "price", nullable = false, precision = 19, scale = 4)
    private BigDecimal price;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity", nullable = false)
    private int quantity;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discountC", nullable = false)
    private double discountC;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tax", nullable = false)
    private double tax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discountP", nullable = false)
    private double discountP;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "pro_name", nullable = false, length = 50)
    private String proName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cus_name", nullable = false, length = 50)
    private String cusName;
    @Column(name = "Total", precision = 53)
    private Double total;

    public VProductReport() {
    }

    public BigInteger getRowid() {
        return rowid;
    }

    public void setRowid(BigInteger rowid) {
        this.rowid = rowid;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscountC() {
        return discountC;
    }

    public void setDiscountC(double discountC) {
        this.discountC = discountC;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getDiscountP() {
        return discountP;
    }

    public void setDiscountP(double discountP) {
        this.discountP = discountP;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
}
