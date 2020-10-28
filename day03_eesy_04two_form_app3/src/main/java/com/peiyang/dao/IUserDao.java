package com.peiyang.dao;

import com.peiyang.domain.User;

import java.util.List;

public interface IUserDao{
    List<User> findAll();
    List<User> findAllAccounts();
}
