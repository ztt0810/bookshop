package app.ztt.dao;


import app.ztt.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository
public interface UserDao {

    public List<User> getAllUserDao();

    public boolean checkUserDao(String userName, String password);

    public int registerDao(@Param("userName")       String userName,
                           @Param("password")       String password,
                           @Param("realName")       String realName,
                           @Param("phone")          Integer phone,
                           @Param("address")        String address,
                           @Param("email")          String email,
                           @Param("registerDate")   Date registerDate);

    public User findByUser(@Param("userName") String userName);

    public Integer findUserIdByName(@Param("userName") String userName);
}
