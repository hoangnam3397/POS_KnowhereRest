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
@Table(name = "Stores", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Stores.findAll", query = "SELECT s FROM Stores s"),
    @NamedQuery(name = "Stores.findByStoId", query = "SELECT s FROM Stores s WHERE s.stoId = :stoId"),
    @NamedQuery(name = "Stores.findByStoName", query = "SELECT s FROM Stores s WHERE s.stoName = :stoName"),
    @NamedQuery(name = "Stores.findByAddress", query = "SELECT s FROM Stores s WHERE s.address = :address"),
    @NamedQuery(name = "Stores.findByPhonesto", query = "SELECT s FROM Stores s WHERE s.phonesto = :phonesto"),
    @NamedQuery(name = "Stores.findByDeleted", query = "SELECT s FROM Stores s WHERE s.deleted = :deleted")})
public class Stores implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "sto_id", nullable = false, length = 10)
    private String stoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "sto_name", nullable = false, length = 50)
    private String stoName;
    @Size(max = 100)
    @Column(name = "address", length = 100)
    private String address;
    @Size(max = 15)
    @Column(name = "phonesto", length = 15)
    private String phonesto;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;
    @OneToMany(mappedBy = "stoId")
    private Collection<Zones> zonesCollection;

    public Stores() {
    }

    public Stores(String stoId) {
        this.stoId = stoId;
    }

    public Stores(String stoId, String stoName, int deleted) {
        this.stoId = stoId;
        this.stoName = stoName;
        this.deleted = deleted;
    }

    public String getStoId() {
        return stoId;
    }

    public void setStoId(String stoId) {
        this.stoId = stoId;
    }

    public String getStoName() {
        return stoName;
    }

    public void setStoName(String stoName) {
        this.stoName = stoName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonesto() {
        return phonesto;
    }

    public void setPhonesto(String phonesto) {
        this.phonesto = phonesto;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @XmlTransient
    public Collection<Zones> getZonesCollection() {
        return zonesCollection;
    }

    public void setZonesCollection(Collection<Zones> zonesCollection) {
        this.zonesCollection = zonesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stoId != null ? stoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stores)) {
            return false;
        }
        Stores other = (Stores) object;
        if ((this.stoId == null && other.stoId != null) || (this.stoId != null && !this.stoId.equals(other.stoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Stores[ stoId=" + stoId + " ]";
    }
    
}
