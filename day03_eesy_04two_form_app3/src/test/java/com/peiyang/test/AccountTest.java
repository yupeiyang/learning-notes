package com.peiyang.test;

import com.peiyang.dao.IAccountDao;
import com.peiyang.domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;
import java.util.List;

public class AccountTest {
    private InputStream in;
    private IAccountDao accountDao;
    private SqlSession session;

    @Before
    public void init() throws Exception{
        //读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建SqlSessionFactory工厂
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        //使用工厂生产SqlSession对象
        session = factory.openSession(true);
        //使用SqlSession创建Dao接口的代理对象
        accountDao = session.getMapper(IAccountDao.class);
    }

    @After
    public void destory() throws Exception{
        session.close();
        in.close();
    }

    @Test
    public void testfindAll(){
        //使用代理对象执行方法
        List<Account> accounts = accountDao.findAll();
        for(Account account:accounts){
            System.out.print(account);
            System.out.println(" -> "+account.getUser());
        }
    }
}
