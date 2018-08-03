/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Duy
 */
@Embeddable
public class HideProductPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "sto_id", nullable = false, length = 10)
    private String stoId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "pro_id", nullable = false, length = 10)
    private String proId;

    public HideProductPK() {
    }

    public HideProductPK(String stoId, String proId) {
        this.stoId = stoId;
        this.proId = proId;
    }

    public String getStoId() {
        return stoId;
    }

    public void setStoId(String stoId) {
        this.stoId = stoId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stoId != null ? stoId.hashCode() : 0);
        hash += (proId != null ? proId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HideProductPK)) {
            return false;
        }
        HideProductPK other = (HideProductPK) object;
        if ((this.stoId == null && other.stoId != null) || (this.stoId != null && !this.stoId.equals(other.stoId))) {
            return false;
        }
        if ((this.proId == null && other.proId != null) || (this.proId != null && !this.proId.equals(other.proId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.HideProductPK[ stoId=" + stoId + ", proId=" + proId + " ]";
    }
    
}
