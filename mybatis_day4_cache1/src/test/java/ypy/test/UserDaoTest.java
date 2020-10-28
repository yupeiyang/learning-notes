package ypy.test;

import com.sun.xml.internal.ws.addressing.WsaActionUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import ypy.dao.IUserDao;
import ypy.domain.User;
import java.io.InputStream;
import java.util.List;

public class UserDaoTest {
    private InputStream in = null;
    private SqlSession session = null;
    private IUserDao userDao = null;
    SqlSessionFactory factory = null;

    @Before
    public void init() throws Exception{
        //读取配置文件
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建SqlSessionFactory工厂
        factory = new SqlSessionFactoryBuilder().build(in);
        //使用工厂生产SqlSession对象
        session = factory.openSession();

        //使用SqlSession创建Dao接口的代理对象
        userDao = session.getMapper(IUserDao.class);
    }

    @After
    public void destory() throws Exception{
        session.close();
        in.close();
    }

    @Test
    public void testfindAll(){
        //使用代理对象执行方法
        List<User> users = userDao.findAll();
        for(User user:users){
            System.out.println(user);
        }
    }

    @Test
    public void testFirstLevelCache(){
        User user1 = userDao.findById(41);
        System.out.println(user1);

        //session.close();
        //清空缓存
        session.clearCache();
        //再次获取SqlSession对象
        session = factory.openSession();
        userDao = session.getMapper(IUserDao.class);

        User user2 = userDao.findById(41);
        System.out.println(user2);
        System.out.println("---------------");
        System.out.println(user1 == user2);
    }
}
