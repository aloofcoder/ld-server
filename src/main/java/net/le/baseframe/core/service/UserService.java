package net.le.baseframe.core.service;

import com.alibaba.fastjson.JSONObject;
import net.le.baseframe.core.entity.User;
import net.le.baseframe.web.PageBean;
import net.le.baseframe.web.PageQuest;

import java.util.List;
import java.util.Map;

public interface UserService {

    /**
     * 获取用户信息
     * @return
     */
    PageBean getUsers(PageQuest pageQuest);

    /**
     * 通过用户编号获取用户信息
     * @param userNumber
     * @return
     */
    User getUser(String userNumber);

    /**
     * 添加用户
     * @param user 用户信息及贷款信息
     * @return
     */
    Integer addUser(Map<String, Object> user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    Integer renovateUser(Map<String, Object> user);

    /**
     * 删除用户
     */
    int removeUser(Long id);

}
