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
    private SqlSessionFactory factory;
    private SqlSession session;
    private IUserDao userDao;

    @Before
    public void init() throws Exception {
        //1.读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //2.创建SqlSessionFactory工厂
        factory = new SqlSessionFactoryBuilder().build(in);
        //3.使用工厂生产SqlSession对象
        session = factory.openSession();
        //4.使用SqlSession创建Dao接口的代理对象
        userDao = session.getMapper(IUserDao.class);
    }

    @After
    public void destory() throws Exception {
        //5.session提交
        session.commit();
        //6.释放资源
        session.close();
        in.close();
    }

    @Test
    public void testfindAll1() throws Exception {
        //5.使用代理对象的执行方法
        List<User> users = userDao.findAll();
        List<User> users1 = userDao.findAll();
        //Mybatis默认打开一级缓存
        System.out.println(users == users1);
        System.out.println("-----------------");
        /*for (User user : users) {
            System.out.print(user);
        }*/
    }

    @Test
    public void testfindAll2() throws Exception {
        //5.使用代理对象的执行方法
        List<User> users = userDao.findAll();
        //关闭一级缓存
        session.clearCache();
        userDao = session.getMapper(IUserDao.class);
        List<User> users1 = userDao.findAll();
        System.out.println(users == users1);
        System.out.println("-----------------");
        /*for (User user : users) {
            System.out.print(user);
        }*/
    }
}
