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
public interface TablesFacadeLocal {

    void create(Tables tables);

    void edit(Tables tables);

    void remove(Tables tables);

    Tables find(Object id);

    List<Tables> findAll();

    List<Tables> findRange(int[] range);

    int count();

    List<Tables> showAllTables();

    boolean deleteTableOfZone(String zone_id);
    List<Tables> searchTableOfZone(String id);
    
}
