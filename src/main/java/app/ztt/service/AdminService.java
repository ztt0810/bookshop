package app.ztt.service;

import app.ztt.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {

//    @Autowired
//    private AdminDao adminDao;

    public boolean checkAdminService(String adminName, String password){
        return true;
    }
}
