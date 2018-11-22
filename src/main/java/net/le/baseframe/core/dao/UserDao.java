package net.le.baseframe.core.dao;

import com.alibaba.fastjson.JSONObject;
import net.le.baseframe.core.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {
    List<Map<String, Object>> searchUser(@Param("condition") String condition,
                          @Param("startIndex") int startIndex,
                          @Param("pageSize") int pageSize);
    int getRowCount(@Param("condition") String condition);
    User searchUserByUserNum(String userNumber);
    User searchUserById(Long id);
    int insertUser (Map<String, Object> user);
    int updateUser (Map<String, Object> user);
    int deleteUser (Long id);
}
