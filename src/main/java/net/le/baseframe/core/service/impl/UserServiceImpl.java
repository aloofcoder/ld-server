package net.le.baseframe.core.service.impl;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import net.le.baseframe.core.dao.LoanDao;
import net.le.baseframe.core.dao.UserDao;
import net.le.baseframe.core.entity.Loan;
import net.le.baseframe.core.entity.User;
import net.le.baseframe.core.service.UserService;
import net.le.baseframe.exception.AppControllerException;
import net.le.baseframe.exception.AppServiceException;
import net.le.baseframe.util.CheckParamUtils;
import net.le.baseframe.util.UserNumberUtil;
import net.le.baseframe.web.PageBean;
import net.le.baseframe.web.PageQuest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 用户信息处理服务类
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Resource
    private LoanDao loanDao;

    @Override
    public PageBean getUsers(PageQuest pageQuest) {
        int pageNum = pageQuest.getPageNum();
        int pageSize = pageQuest.getPageSize();
        if (pageNum < 0) {
            throw new AppControllerException("pageNum必须大于0！");
        }
        if (pageSize < 0) {
            throw new AppControllerException("pageSize必须大于0！");
        }
        String condition = pageQuest.getCondition();
        int startIndex = pageQuest.getStartIndex(pageNum, pageSize);
        List<Map<String, Object>> list = userDao.searchUser(condition, startIndex, pageSize);
        int count = userDao.getRowCount(condition);
        int totalPage = PageBean.getTotalPage(pageSize, count);
        PageBean pageBean = new PageBean(pageNum, pageSize, totalPage, count, list);
        return pageBean;
    }

    @Override
    public User getUser(String userNumber) {
        CheckParamUtils.isNull(userNumber, "用户编号不能为空！");
        User user = userDao.searchUserByUserNum(userNumber);
        return user;
    }

    /**
     * 同时保存用户信息姐贷款信息
     * @param user 用户信息及贷款信息
     * @return
     */
    @Transactional
    @Override
    public Integer addUser(Map<String, Object> user) {
        CheckParamUtils.isNull(user, "用户不能为空！");
        String userNum = UserNumberUtil.getNumber() + "";
        user.put("userNumber", userNum);
        int count = userDao.insertUser(user);
        if (count == -1) {
            throw new AppServiceException("保存用户信息及贷款失败！");
        }
        User resultUser = userDao.searchUserByUserNum(userNum);
        CheckParamUtils.isNull(resultUser, "保存用户信息及贷款失败！");
        user.put("userId", resultUser.getId());
        int loanCount = loanDao.insertLoan(user);
        if (loanCount == -1) {
            throw new AppServiceException("保存用户信息及贷款失败！");
        }
        return loanCount;
    }

    @Transactional
    @Override
    public Integer renovateUser(Map<String, Object> user) {
        CheckParamUtils.isNull(user, "用户不能为空！");
        int count = userDao.updateUser(user);
        if (count == -1) {
            throw new AppServiceException("修改用户信息及贷款失败！");
        }
        user.put("id", user.get("loanID"));
        int loanCount = loanDao.updateLoan(user);
        if (loanCount == -1) {
            throw new AppServiceException("修改用户信息及贷款失败！");
        }
        return loanCount;
    }

    @Transactional
    @Override
    public int removeUser(Long id) {
        CheckParamUtils.isNull(id, "用户信息Id不能为空！");
        int count = userDao.deleteUser(id);
        List<Loan> loanList = loanDao.searchLoan(id);
        if (loanList.size() > 0) {
            for (Loan loan : loanList) {
                loanDao.deleteLoan(loan.getId());
            }
        }
        return count;
    }

}
