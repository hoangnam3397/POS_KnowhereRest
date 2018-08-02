/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "Customers", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customers.findAll", query = "SELECT c FROM Customers c"),
    @NamedQuery(name = "Customers.findByCusId", query = "SELECT c FROM Customers c WHERE c.cusId = :cusId"),
    @NamedQuery(name = "Customers.findByCusName", query = "SELECT c FROM Customers c WHERE c.cusName = :cusName"),
    @NamedQuery(name = "Customers.findByPhone", query = "SELECT c FROM Customers c WHERE c.phone = :phone"),
    @NamedQuery(name = "Customers.findByEmail", query = "SELECT c FROM Customers c WHERE c.email = :email"),
    @NamedQuery(name = "Customers.findByDiscount", query = "SELECT c FROM Customers c WHERE c.discount = :discount")})
public class Customers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "cus_id", nullable = false, length = 10)
    private String cusId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cus_name", nullable = false, length = 50)
    private String cusName;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 20)
    @Column(name = "phone", length = 20)
    private String phone;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "email", length = 50)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discount", nullable = false)
    private double discount;
    @OneToMany(mappedBy = "cusId")
    private Collection<Orders> ordersCollection;

    public Customers() {
    }

    public Customers(String cusId) {
        this.cusId = cusId;
    }

    public Customers(String cusId, String cusName, String phone, String email, double discount) {
        this.cusId = cusId;
        this.cusName = cusName;
        this.phone = phone;
        this.email = email;
        this.discount = discount;
      
    }
    

    public Customers(String cusId, String cusName, double discount) {
        this.cusId = cusId;
        this.cusName = cusName;
        this.discount = discount;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cusId != null ? cusId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.cusId == null && other.cusId != null) || (this.cusId != null && !this.cusId.equals(other.cusId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Customers[ cusId=" + cusId + " ]";
    }
    
}
