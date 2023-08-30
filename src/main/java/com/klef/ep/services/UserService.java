package com.klef.ep.services;

import com.klef.ep.models.User;

public interface UserService 
{
  public User CheckUserLogin(String email,String password);
  public User ViewUserProfile(int id);
  public String addUser(User us);
}