package app.ztt.service;

import app.ztt.dao.UserDao;
import app.ztt.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public boolean checkUserService(String userName, String password){
        User user = userDao.findByUser(userName);
        if(user == null) {
            return false;
        }
        else{
            return (user.getPassword().trim()).equals(password);
        }
    }

    public Integer registerService(String userName, String password, String confirmPassword, String realName, Integer phone, String address, String email ){
        Date currentDate = new Date(System.currentTimeMillis());
        if(userDao.findByUser(userName) == null && password.equals(confirmPassword)) return userDao.registerDao(userName, password, realName, phone, address, email, currentDate);
        else return 0;
    }
    public Integer findUserIdByName(String username){
        return userDao.findUserIdByName(username);
    }

    public User getUserInfoByName(String userName){
        return userDao.findByUser(userName);
    }

}
