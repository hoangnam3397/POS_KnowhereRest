/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Duy
 */
@Local
public interface HideProductFacadeLocal {

    void create(HideProduct hideProduct);

    void edit(HideProduct hideProduct);

    void remove(HideProduct hideProduct);

    HideProduct find(Object id);

    List<HideProduct> findAll();

    List<HideProduct> findRange(int[] range);

    int count();
    
}
