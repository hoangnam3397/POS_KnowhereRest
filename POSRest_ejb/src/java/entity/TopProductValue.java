/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nam_Nguyen
 */
@Entity
@Table(name = "TopProductValue", catalog = "WAPOS", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TopProductValue.findAll", query = "SELECT t FROM TopProductValue t"),
    @NamedQuery(name = "TopProductValue.findByProId", query = "SELECT t FROM TopProductValue t WHERE t.proId = :proId"),
    @NamedQuery(name = "TopProductValue.findByProName", query = "SELECT t FROM TopProductValue t WHERE t.proName = :proName"),
    @NamedQuery(name = "TopProductValue.findByQSum", query = "SELECT t FROM TopProductValue t WHERE t.qSum = :qSum")})
public class TopProductValue implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "pro_id", nullable = false, length = 10)
    @Id
    private String proId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "pro_name", nullable = false, length = 50)
    private String proName;
    @Column(name = "qSum")
    private Integer qSum;

    public TopProductValue() {
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

    public Integer getQSum() {
        return qSum;
    }

    public void setQSum(Integer qSum) {
        this.qSum = qSum;
    }
    
}
