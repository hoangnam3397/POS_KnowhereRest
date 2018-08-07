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
@Table(name = "TopProduct", catalog = "PR4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TopProduct.findAll", query = "SELECT t FROM TopProduct t"),
    @NamedQuery(name = "TopProduct.findByProId", query = "SELECT t FROM TopProduct t WHERE t.proId = :proId"),
    @NamedQuery(name = "TopProduct.findByQSum", query = "SELECT t FROM TopProduct t WHERE t.qSum = :qSum")})
public class TopProduct implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "pro_id", nullable = false, length = 10)
    @Id
    private String proId;
    @Column(name = "qSum")
    private Integer qSum;

    public TopProduct() {
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Integer getQSum() {
        return qSum;
    }

    public void setQSum(Integer qSum) {
        this.qSum = qSum;
    }
    
}
