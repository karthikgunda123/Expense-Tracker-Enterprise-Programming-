package com.klef.ep.services;

import java.util.List;


import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import com.klef.ep.models.Admin;
import com.klef.ep.models.User;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)	
public class AdminServiceImpl implements AdminService
{

	
	public Admin CheckAdminLogin(String username, String password) 
	{
		
		return null;
	}

	
	public String AddUser(User user) 
	{
		
		return null;
	}

	
	public List<User> ViewAllUsers() 
	{
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
     	 EntityManager em = emf.createEntityManager();
     	  
        em.getTransaction().begin();
        
        Query qry = em.createQuery("select e from User e "); // e is an alias of Employee class
        List<User> userlist = qry.getResultList();
     
        em.close();
  	    emf.close();
  	    
  	    return userlist;
	}


	@Override
	public String deleteUser(int eid)
	{
		  EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
	   	  EntityManager em = emf.createEntityManager();
	   	  
	   	  em.getTransaction().begin();
		  User e = em.find(User.class, eid); // fetching object based on ID
	   	  em.remove(e);
	   	  em.getTransaction().commit();
	   	  
	   	  em.close();
		  emf.close();
		  
		  return "Record Deleted Successfully";
	}

}
