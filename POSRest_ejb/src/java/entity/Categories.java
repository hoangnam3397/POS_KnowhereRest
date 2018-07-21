/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "Categories", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Categories.findAll", query = "SELECT c FROM Categories c"),
    @NamedQuery(name = "Categories.findByCatId", query = "SELECT c FROM Categories c WHERE c.catId = :catId"),
    @NamedQuery(name = "Categories.findByCatName", query = "SELECT c FROM Categories c WHERE c.catName = :catName"),
    @NamedQuery(name = "Categories.findByCreateday", query = "SELECT c FROM Categories c WHERE c.createday = :createday"),
    @NamedQuery(name = "Categories.findByDeleted", query = "SELECT c FROM Categories c WHERE c.deleted = :deleted")})
public class Categories implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "cat_id", nullable = false, length = 10)
    private String catId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "cat_name", nullable = false, length = 50)
    private String catName;
    @Column(name = "createday")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createday;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;
    @OneToMany(mappedBy = "catId")
    private Collection<Products> productsCollection;

    public Categories() {
    }

    public Categories(String catId, String catName, Date createday, int deleted) {
        this.catId = catId;
        this.catName = catName;
        this.createday = createday;
        this.deleted = deleted;
    }

    public Categories(String catId) {
        this.catId = catId;
    }

    public Categories(String catId, String catName, int deleted) {
        this.catId = catId;
        this.catName = catName;
        this.deleted = deleted;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public Date getCreateday() {
        return createday;
    }

    public void setCreateday(Date createday) {
        this.createday = createday;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @XmlTransient
    public Collection<Products> getProductsCollection() {
        return productsCollection;
    }

    public void setProductsCollection(Collection<Products> productsCollection) {
        this.productsCollection = productsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (catId != null ? catId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Categories)) {
            return false;
        }
        Categories other = (Categories) object;
        if ((this.catId == null && other.catId != null) || (this.catId != null && !this.catId.equals(other.catId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Categories[ catId=" + catId + " ]";
    }
    
}
