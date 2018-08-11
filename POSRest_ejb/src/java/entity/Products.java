/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "Products", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    @NamedQuery(name = "Products.findByProId", query = "SELECT p FROM Products p WHERE p.proId = :proId"),
    @NamedQuery(name = "Products.findByProName", query = "SELECT p FROM Products p WHERE p.proName = :proName"),
    @NamedQuery(name = "Products.findByPrice", query = "SELECT p FROM Products p WHERE p.price = :price"),
    @NamedQuery(name = "Products.findByImagelink", query = "SELECT p FROM Products p WHERE p.imagelink = :imagelink"),
    @NamedQuery(name = "Products.findByDiscount", query = "SELECT p FROM Products p WHERE p.discount = :discount"),
    @NamedQuery(name = "Products.findByDeleted", query = "SELECT p FROM Products p WHERE p.deleted = :deleted"),
    @NamedQuery(name = "Products.findByDescription", query = "SELECT p FROM Products p WHERE p.description = :description")})
public class Products implements Serializable {
    @Column(name = "hide")
    private Integer hide;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "products")
    private Collection<HideProduct> hideProductCollection;
    @Size(max = 20)
    @Column(name = "color", length = 20)
    private String color;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "products")
    private Collection<OrderDetails> orderDetailsCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "pro_id", nullable = false, length = 10)
    private String proId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "pro_name", nullable = false, length = 50)
    private String proName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "price", nullable = false, precision = 19, scale = 4)
    private BigDecimal price;
    @Size(max = 1073741823)
    @Column(name = "imagelink", length = 1073741823)
    private String imagelink;
    @Basic(optional = false)
    @NotNull
    @Column(name = "discount", nullable = false)
    private double discount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;
    @Size(max = 200)
    @Column(name = "description", length = 200)
    private String description;
    @JoinColumn(name = "cat_id", referencedColumnName = "cat_id")
    @ManyToOne
    private Categories catId;

    public Products() {
    }

    public Products(String proId, String proName, BigDecimal price, String imagelink, double discount, int deleted, String description,String color, Categories catId) {       
        this.proId = proId;
        this.proName = proName;
        this.price = price;
        this.imagelink = imagelink;
        this.discount = discount;
        this.deleted = deleted;
        this.description = description;
        this.catId = catId;
        this.color=color;
    }

    public Products(String proId) {
        this.proId = proId;
    }

    public Products(String proId, String proName, BigDecimal price, double discount, int deleted) {
        this.proId = proId;
        this.proName = proName;
        this.price = price;
        this.discount = discount;
        this.deleted = deleted;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImagelink() {
        return imagelink;
    }

    public void setImagelink(String imagelink) {
        this.imagelink = imagelink;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Categories getCatId() {
        return catId;
    }

    public void setCatId(Categories catId) {
        this.catId = catId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (proId != null ? proId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.proId == null && other.proId != null) || (this.proId != null && !this.proId.equals(other.proId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Products[ proId=" + proId + " ]";
    }

    @XmlTransient
    public Collection<OrderDetails> getOrderDetailsCollection() {
        return orderDetailsCollection;
    }

    public void setOrderDetailsCollection(Collection<OrderDetails> orderDetailsCollection) {
        this.orderDetailsCollection = orderDetailsCollection;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @XmlTransient
    public Collection<HideProduct> getHideProductCollection() {
        return hideProductCollection;
    }

    public void setHideProductCollection(Collection<HideProduct> hideProductCollection) {
        this.hideProductCollection = hideProductCollection;
    }

    public Integer getHide() {
        return hide;
    }

    public void setHide(Integer hide) {
        this.hide = hide;
    }
    
}
