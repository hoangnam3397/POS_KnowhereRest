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
@Table(name = "SalesByCustomer", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SalesByCustomer.findAll", query = "SELECT s FROM SalesByCustomer s"),
    @NamedQuery(name = "SalesByCustomer.findByRowid", query = "SELECT s FROM SalesByCustomer s WHERE s.rowid = :rowid"),
    @NamedQuery(name = "SalesByCustomer.findByOrderId", query = "SELECT s FROM SalesByCustomer s WHERE s.orderId = :orderId"),
    @NamedQuery(name = "SalesByCustomer.findByProId", query = "SELECT s FROM SalesByCustomer s WHERE s.proId = :proId"),
    @NamedQuery(name = "SalesByCustomer.findByQuantity", query = "SELECT s FROM SalesByCustomer s WHERE s.quantity = :quantity"),
    @NamedQuery(name = "SalesByCustomer.findByPrice", query = "SELECT s FROM SalesByCustomer s WHERE s.price = :price"),
    @NamedQuery(name = "SalesByCustomer.findByDiscountP", query = "SELECT s FROM SalesByCustomer s WHERE s.discountP = :discountP"),
    @NamedQuery(name = "SalesByCustomer.findByTax", query = "SELECT s FROM SalesByCustomer s WHERE s.tax = :tax"),
    @NamedQuery(name = "SalesByCustomer.findByDiscountC", query = "SELECT s FROM SalesByCustomer s WHERE s.discountC = :discountC"),
    @NamedQuery(name = "SalesByCustomer.findByCusId", query = "SELECT s FROM SalesByCustomer s WHERE s.cusId = :cusId"),
    @NamedQuery(name = "SalesByCustomer.findByCusName", query = "SELECT s FROM SalesByCustomer s WHERE s.cusName = :cusName"),
    @NamedQuery(name = "SalesByCustomer.findByProName", query = "SELECT s FROM SalesByCustomer s WHERE s.proName = :proName"),
    @NamedQuery(name = "SalesByCustomer.findByOrdertime", query = "SELECT s FROM SalesByCustomer s WHERE s.ordertime = :ordertime"),
    @NamedQuery(name = "SalesByCustomer.findByTotal", query = "SELECT s FROM SalesByCustomer s WHERE s.total = :total")})
public class SalesByCustomer implements Serializable {
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
    @Column(name = "discountP", nullable = false)
    private double discountP;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tax", nullable = false)
    private double tax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discountC", nullable = false)
    private double discountC;
    @Size(max = 10)
    @Column(name = "cus_id", length = 10)
    private String cusId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cus_name", nullable = false, length = 50)
    private String cusName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "pro_name", nullable = false, length = 50)
    private String proName;
    @Column(name = "ordertime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ordertime;
    @Column(name = "Total", precision = 53)
    private Double total;

    public SalesByCustomer() {
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

    public double getDiscountP() {
        return discountP;
    }

    public void setDiscountP(double discountP) {
        this.discountP = discountP;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getDiscountC() {
        return discountC;
    }

    public void setDiscountC(double discountC) {
        this.discountC = discountC;
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
}
