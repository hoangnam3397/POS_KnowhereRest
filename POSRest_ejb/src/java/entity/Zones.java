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
@Table(name = "Zones", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Zones.findAll", query = "SELECT z FROM Zones z"),
    @NamedQuery(name = "Zones.findByZoneId", query = "SELECT z FROM Zones z WHERE z.zoneId = :zoneId"),
    @NamedQuery(name = "Zones.findByZoneName", query = "SELECT z FROM Zones z WHERE z.zoneName = :zoneName")})
public class Zones implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "zone_id", nullable = false, length = 10)
    private String zoneId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "zone_name", nullable = false, length = 50)
    private String zoneName;  
    @OneToMany(mappedBy = "zoneId")
    private Collection<Tables> tablesCollection;
    @JoinColumn(name = "sto_id", referencedColumnName = "sto_id")
    @ManyToOne
    private Stores stoId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;

    public Zones() {
    }

    public Zones(String zoneId, String zoneName, Stores stoId, int deleted) {
        this.zoneId = zoneId;
        this.zoneName = zoneName;
        this.stoId = stoId;
        this.deleted = deleted;
    }

    public Zones(String zoneId) {
        this.zoneId = zoneId;
    }

    public Zones(String zoneId, String zoneName) {
        this.zoneId = zoneId;
        this.zoneName = zoneName;
    }

    public String getZoneId() {
        return zoneId;
    }

    public void setZoneId(String zoneId) {
        this.zoneId = zoneId;
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName;
    }

    @XmlTransient
    public Collection<Tables> getTablesCollection() {
        return tablesCollection;
    }

    public void setTablesCollection(Collection<Tables> tablesCollection) {
        this.tablesCollection = tablesCollection;
    }

    public Stores getStoId() {
        return stoId;
    }

    public void setStoId(Stores stoId) {
        this.stoId = stoId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (zoneId != null ? zoneId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Zones)) {
            return false;
        }
        Zones other = (Zones) object;
        if ((this.zoneId == null && other.zoneId != null) || (this.zoneId != null && !this.zoneId.equals(other.zoneId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Zones[ zoneId=" + zoneId + " ]";
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }
    
}
