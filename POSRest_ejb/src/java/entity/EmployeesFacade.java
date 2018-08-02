/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Nam_Nguyen
 */
@Stateless
public class EmployeesFacade extends AbstractFacade<Employees> implements EmployeesFacadeLocal {

    @PersistenceContext(unitName = "POSRest_ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmployeesFacade() {
        super(Employees.class);
    }

    @Override
    public Boolean login(String user, String password) {
        Query q = em.createQuery("SELECT e FROM Employees e WHERE e.username = :username and e.password = :password and e.deleted = :del");
        q.setParameter("username", user);
        q.setParameter("password", password);
        int del = 0;
        q.setParameter("del", del);
        if (q.getResultList().size() != 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Employees> showAllEployees() {
        Query q = getEntityManager().createQuery("SELECT e FROM Employees e WHERE e.deleted = :del");
        int del = 0;
        q.setParameter("del", del);
        return q.getResultList();
    }

}
