/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Duy
 */
@Entity
@Table(name = "HideProduct", catalog = "WAPOS", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HideProduct.findAll", query = "SELECT h FROM HideProduct h"),
    @NamedQuery(name = "HideProduct.findByStoId", query = "SELECT h FROM HideProduct h WHERE h.hideProductPK.stoId = :stoId"),
    @NamedQuery(name = "HideProduct.findByProId", query = "SELECT h FROM HideProduct h WHERE h.hideProductPK.proId = :proId"),
    @NamedQuery(name = "HideProduct.findByHide", query = "SELECT h FROM HideProduct h WHERE h.hide = :hide")})
public class HideProduct implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected HideProductPK hideProductPK;
    @Column(name = "hide")
    private Integer hide;
    @JoinColumn(name = "pro_id", referencedColumnName = "pro_id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Products products;
    @JoinColumn(name = "sto_id", referencedColumnName = "sto_id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Stores stores;

    public HideProduct() {
    }

    public HideProduct(HideProductPK hideProductPK) {
        this.hideProductPK = hideProductPK;
    }

    public HideProduct(String stoId, String proId) {
        this.hideProductPK = new HideProductPK(stoId, proId);
    }

    public HideProductPK getHideProductPK() {
        return hideProductPK;
    }

    public void setHideProductPK(HideProductPK hideProductPK) {
        this.hideProductPK = hideProductPK;
    }

    public Integer getHide() {
        return hide;
    }

    public void setHide(Integer hide) {
        this.hide = hide;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Stores getStores() {
        return stores;
    }

    public void setStores(Stores stores) {
        this.stores = stores;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (hideProductPK != null ? hideProductPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HideProduct)) {
            return false;
        }
        HideProduct other = (HideProduct) object;
        if ((this.hideProductPK == null && other.hideProductPK != null) || (this.hideProductPK != null && !this.hideProductPK.equals(other.hideProductPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.HideProduct[ hideProductPK=" + hideProductPK + " ]";
    }
    
}
