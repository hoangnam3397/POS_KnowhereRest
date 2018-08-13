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
@Table(name = "Tables", catalog = "WAPOS", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tables.findAll", query = "SELECT t FROM Tables t"),
    @NamedQuery(name = "Tables.findByTabId", query = "SELECT t FROM Tables t WHERE t.tabId = :tabId"),
    @NamedQuery(name = "Tables.findByTabName", query = "SELECT t FROM Tables t WHERE t.tabName = :tabName"),
    @NamedQuery(name = "Tables.findByDeleted", query = "SELECT t FROM Tables t WHERE t.deleted = :deleted")})
public class Tables implements Serializable {
    @OneToMany(mappedBy = "tabId")
    private Collection<TotalToday> totalTodayCollection;
    @Column(name = "status")
    private Boolean status;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "tab_id", nullable = false, length = 10)
    private String tabId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tab_name", nullable = false, length = 50)
    private String tabName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "deleted", nullable = false)
    private int deleted;
    @OneToMany(mappedBy = "tabId")
    private Collection<Orders> ordersCollection;
    @JoinColumn(name = "zone_id", referencedColumnName = "zone_id")
    @ManyToOne
    private Zones zoneId;

    public Tables() {
    }

    public Tables(String tabId) {
        this.tabId = tabId;
    }

    public Tables(String tabId, String tabName, int deleted,Boolean status, Zones zoneId) {
        this.tabId = tabId;
        this.tabName = tabName;
        this.deleted = deleted;
        this.zoneId = zoneId;
        this.status=status;
    }

    public Tables(String tabId, String tabName, int deleted) {
        this.tabId = tabId;
        this.tabName = tabName;
        this.deleted = deleted;
    }

    public String getTabId() {
        return tabId;
    }

    public void setTabId(String tabId) {
        this.tabId = tabId;
    }

    public String getTabName() {
        return tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    public Zones getZoneId() {
        return zoneId;
    }

    public void setZoneId(Zones zoneId) {
        this.zoneId = zoneId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tabId != null ? tabId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tables)) {
            return false;
        }
        Tables other = (Tables) object;
        if ((this.tabId == null && other.tabId != null) || (this.tabId != null && !this.tabId.equals(other.tabId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Tables[ tabId=" + tabId + " ]";
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<TotalToday> getTotalTodayCollection() {
        return totalTodayCollection;
    }

    public void setTotalTodayCollection(Collection<TotalToday> totalTodayCollection) {
        this.totalTodayCollection = totalTodayCollection;
    }
    
}
