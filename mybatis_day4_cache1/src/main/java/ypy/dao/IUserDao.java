package ypy.dao;

import ypy.domain.User;

import java.util.List;

public interface IUserDao {

    List<User> findAll();

    User findById(int id);
}
