package net.le.baseframe.core.service;

import net.le.baseframe.core.entity.Loan;
import net.le.baseframe.web.PageBean;
import net.le.baseframe.web.PageQuest;

import java.util.List;
import java.util.Map;

public interface LoanService {
    PageBean getLoans(PageQuest pageQuest);
    List<Loan> getLoan(Long userId);
    int addLoan(Map<String, Object> loan);
    int renovateLoan(Map<String, Object> loan);
    int removeLoan(Long id);
}
