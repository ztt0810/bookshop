import app.ztt.dao.AdminDao;
import app.ztt.dao.UserDao;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

public class LoginTest {

    private final Logger logger = LoggerFactory.getLogger(LoginTest.class);

    @Autowired
    private UserDao userDao;

    @Test
    public void test(){
        logger.debug("aaa");

    }

    @Test
    public void testMybatis(){

    }
}
