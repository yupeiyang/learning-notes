package com.peiyang.test;

import com.peiyang.dao.IUserDao;
import com.peiyang.domain.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;
import java.util.List;

public class UserTest {
    private InputStream in;
    private SqlSession session;
    private IUserDao userDao;

    @Before
    public void init() throws Exception {
        //1.读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //2.创建SqlSessionFactory工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        //3.使用工厂生产SqlSession对象
        session = factory.openSession();
        //4.使用SqlSession创建Dao接口的代理对象
        userDao = session.getMapper(IUserDao.class);
    }

    @After
    public void destory() throws Exception {
        //提交事务
        session.commit();
        //6.释放资源
        session.close();
        in.close();
    }

    @Test
    public void findAll() throws Exception {
        //5.使用代理对象的执行方法
        List<User> users = userDao.findAll();
        for (User user : users) {
            System.out.print(user);
        }
    }

    @Test
    public void findAllAccounts() throws Exception {
        //5.使用代理对象的执行方法
        List<User> users = userDao.findAllAccounts();
        for (User user : users) {
            System.out.print(user);
            System.out.print("\n"+user.getAccounts());
            System.out.println("\n--------------------------------");
        }
    }
}
