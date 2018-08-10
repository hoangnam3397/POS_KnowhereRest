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
public interface EmployeesFacadeLocal {

    void create(Employees employees);

    void edit(Employees employees);

    void remove(Employees employees);

    Employees find(Object id);

    List<Employees> findAll();

    List<Employees> findRange(int[] range);

    int count();

    Boolean login(String user, String password);

    List<Employees> showAllEployees();

    List<Employees> findEmp(String username, String password);

    boolean chkUserUnique(String id, String name);

    boolean chkEmailUnique(String id, String email);
}
