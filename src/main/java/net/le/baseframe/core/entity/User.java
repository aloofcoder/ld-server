package net.le.baseframe.core.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter
@Getter
@ToString
@Data
public class User implements Serializable {
    private static final long serialVersionUID = -3059456620602082015L;

    private Long id;
    private String userNumber;
    private String userName;
    private Integer userGender;
    private String userMobile;
    private String userAddress;
    private Integer mobileDate;
    /**
     * 婚姻情况
     */
    private Integer userMarriage;
    /**
     * 子女数
     */
    private Integer childrenNum;
    /**
     * 供养子女数
     */
    private Integer supportNum;
    /**
     * 学历
     */
    private Integer userEducation;
    /**
     * 是否本市户籍
     */
    private Integer isNowCity;
    /**
     * 户籍所在地
     */
    private String userHouseRegister;
    /**
     * 居住类型
     */
    private String liveType;
    /**
     * 现住宅始住日期
     */
    private Long liveStartDate;
    private String userIdCard;
    private String userIdCardUrl;
    private String userImgUrl;
    private String userProfession;
    private String userCompany;
    private String userCompanyAdr;
    private String linkmanName1;
    private String linkmanMobile1;
    private String linkmanName2;
    private String linkmanMobile2;
    private String linkmanName3;
    private String linkmanMobile3;
    private Integer userStatus;
    private String userRemark;
    private String createUser;
    private String editUser;
    private Long createTime;
    private Long editTime;
    private Integer monthWages;
    private String companyProperties;
    /**
     * 是否私营企业
     */
    private Integer isPrivateCompany;
    private String userPosition;
    /**
     * 职位等级
     */
    private Integer userPositionLevel;
    /**
     * 是否公务员
     */
    private Integer isServant;
    /**
     * 部门
     */
    private String userDepartment;
    /**
     * 入职时间
     */
    private Long joinCompanyDate;
    /**
     * 公司电话
     */
    private String companyMobile;
    /**
     * 工资发放形式
     */
    private String putWagesType;
    /**
     * 公司创建时间
     */
    private Long companyCreateDate;
    /**
     * 社保单位名称
     */
    private String companySocial;
    /**
     * 社保参保时间
     */
    private Long companySocialDate;
    private String companySocialBase;
    private String userPdf;
    private Long pdfCreateDate;
    private String pdfBase;
    private String houseType;
    private Long houseBuyDate;
    private Integer houseMoney;
    /**
     * 房产建筑面积
     */
    private Integer houseAcreage;
    private String houseAddress;
    private Integer houseIsAddress;
    private Integer houseLoanYear;
    /**
     * 房产月供
     */
    private Integer houseRepaymentMoney;
    /**
     * 月供是否本人名下
     */
    private Integer hasHouseRepayment;
    private String carBuyType;
    private Long carBuyDate;
    private Integer carMoney;
    /**
     * 车辆行驶里程数
     */
    private Integer carCourse;
    private Integer carRepaymentMoney;
    private String carBrand;
    /**
     * 汽车出登日期
     */
    private Long carInputDate;
    /**
     * 汽车颜色
     */
    private String carColor;
    /**
     * 汽车型号
     */
    private String carModel;
    /**
     * 车辆保险
     */
    private String carSafe;
    /**
     * 有无事故
     */
    private Integer carHasFault;
    private String linkmanNexus1;
    private String linkmanNexus2;
    private String linkmanNexus3;
    public User() {
    }
}
