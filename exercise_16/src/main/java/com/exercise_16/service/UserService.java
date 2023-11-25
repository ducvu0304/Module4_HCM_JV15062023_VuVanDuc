package com.exercise_16.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.exercise_16.dto.SignInForm;
import com.exercise_16.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private static List<User> users = new ArrayList<>();

    public UserService() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            users.add(new User(1L,"Vu","123456","Vũ",sf.parse("1999-6-18"),true));
            users.add(new User(2L,"Duc","123456","Duc",sf.parse("1998-12-1"),false));
            users.add(new User(3L,"Hiep","123456","Hi",sf.parse("2000-5-5"),true));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public User login(SignInForm signInForm){
        User userLogin = null;
        for (User u:users) {
            if (u.getUsername().equals(signInForm.getUsername())&& u.getPassword().equals(signInForm.getPassword())){
                userLogin = new User(u.getId(), u.getUsername(),u.getFullName(),null,u.getAvatar(),u.getBirthday(),u.isStatus());
            }
        }
        return userLogin;
    }
}