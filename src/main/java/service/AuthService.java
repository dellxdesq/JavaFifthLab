package service;

import Model.User;

import java.util.HashMap;
import java.util.Objects;

public class AuthService {
    private static HashMap<String, User> Users = new HashMap<>()
    {
        {
            put("adm", new User("adm", "111", "adm@gmail.com"));
            put("adm2", new User("adm2", "111", "adm2@gmail.com"));

        }
    };
    public static  void CreateUser(User user)
    {
        Users.put(user.getLogin(), user);
    }
    public static User GetUser(String login, String password)
    {
        User user = Users.get(login);

        if( user == null || !Objects.equals(user.getPassword(), password)) return null;

        return user;
    }
}
