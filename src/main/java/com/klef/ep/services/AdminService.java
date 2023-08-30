package com.klef.ep.services;

import java.util.List;

import com.klef.ep.models.Admin;
import com.klef.ep.models.User;

public interface AdminService 
{
   public Admin CheckAdminLogin(String username,String password);
   public String AddUser(User user);
   public List<User> ViewAllUsers();
   public String deleteUser(int eid);
}