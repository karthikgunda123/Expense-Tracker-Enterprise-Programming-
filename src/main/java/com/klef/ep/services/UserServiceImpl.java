package com.klef.ep.services;

import com.klef.ep.models.User;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class UserServiceImpl implements UserService
{	
	public User CheckUserLogin(String email, String password) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();

		Query qry = em.createQuery("  select u from User u where email=? and password=?   "); // atmost one object
																									// (0 or 1)
		qry.setParameter(1, email);
		qry.setParameter(2, password);

		User us = null;

		if (qry.getResultList().size() > 0) {
			us = (User) qry.getSingleResult();
		}

		em.close();
		emf.close();

		return us;
	}

	
	public User ViewUserProfile(int id) 
	{
		return null;
	}


	
	public String addUser(User us) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();
		em.persist(us); // insert operation
		em.getTransaction().commit();

		em.close();
		emf.close();

		return "Record Inserted Successfully";
	}

}
