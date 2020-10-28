package com.peiyang.dao;

import com.peiyang.domain.Account;

import java.util.List;

public interface IAccountDao {
    List<Account> findAll();
}
