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
 * @author Nam_Nguyen
 */
@Local
public interface ZonesFacadeLocal {

    void create(Zones zones);

    void edit(Zones zones);

    void remove(Zones zones);

    Zones find(Object id);

    List<Zones> findAll();

    List<Zones> findRange(int[] range);

    int count();
    
}
