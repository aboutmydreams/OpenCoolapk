class UserInfo {
  int uid;
  String username;
  String email;
  String mobile;
  int admintype;
  int groupid;
  int usergroupid;
  int level;
  int status;
  int usernamestatus;
  int mobilestatus;
  int emailstatus;
  int avatarstatus;
  int avatarCoverStatus;
  int regdate;
  int logintime;
  String fetchType;
  String entityType;
  int entityId;
  String displayUsername;
  String url;
  String userAvatar;
  String userSmallAvatar;
  String userBigAvatar;
  String cover;
  String groupName;
  String userGroupName;
  int isBlackList;
  int isIgnoreList;
  int isLimitList;
  int gender;
  String adminVerifyTitle;
  String oldUserName;
  String province;
  String city;
  int birthyear;
  int birthmonth;
  int birthday;
  String astro;
  String weibo;
  String blog;
  String qq;
  String msn;
  String gtalk;
  String bio;
  int bioStatus;
  int companyFoundDate;
  String companyIndustry;
  String companyWebsite;
  int isDeveloper;
  int verifyType;
  String verifyTitle;
  int verifyStatus;
  int apkDevNum;
  int feed;
  int follow;
  int fans;
  int apkFollowNum;
  int apkRatingNum;
  int apkCommentNum;
  int albumNum;
  int albumFavNum;
  int discoveryNum;
  int replyNum;
  int isFollow;

  UserInfo(
      {this.uid,
      this.username,
      this.email,
      this.mobile,
      this.admintype,
      this.groupid,
      this.usergroupid,
      this.level,
      this.status,
      this.usernamestatus,
      this.mobilestatus,
      this.emailstatus,
      this.avatarstatus,
      this.avatarCoverStatus,
      this.regdate,
      this.logintime,
      this.fetchType,
      this.entityType,
      this.entityId,
      this.displayUsername,
      this.url,
      this.userAvatar,
      this.userSmallAvatar,
      this.userBigAvatar,
      this.cover,
      this.groupName,
      this.userGroupName,
      this.isBlackList,
      this.isIgnoreList,
      this.isLimitList,
      this.gender,
      this.adminVerifyTitle,
      this.oldUserName,
      this.province,
      this.city,
      this.birthyear,
      this.birthmonth,
      this.birthday,
      this.astro,
      this.weibo,
      this.blog,
      this.qq,
      this.msn,
      this.gtalk,
      this.bio,
      this.bioStatus,
      this.companyFoundDate,
      this.companyIndustry,
      this.companyWebsite,
      this.isDeveloper,
      this.verifyType,
      this.verifyTitle,
      this.verifyStatus,
      this.apkDevNum,
      this.feed,
      this.follow,
      this.fans,
      this.apkFollowNum,
      this.apkRatingNum,
      this.apkCommentNum,
      this.albumNum,
      this.albumFavNum,
      this.discoveryNum,
      this.replyNum,
      this.isFollow});

  UserInfo.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    admintype = json['admintype'];
    groupid = json['groupid'];
    usergroupid = json['usergroupid'];
    level = json['level'];
    status = json['status'];
    usernamestatus = json['usernamestatus'];
    mobilestatus = json['mobilestatus'];
    emailstatus = json['emailstatus'];
    avatarstatus = json['avatarstatus'];
    avatarCoverStatus = json['avatar_cover_status'];
    regdate = json['regdate'];
    logintime = json['logintime'];
    fetchType = json['fetchType'];
    entityType = json['entityType'];
    entityId = json['entityId'];
    displayUsername = json['displayUsername'];
    url = json['url'];
    userAvatar = json['userAvatar'];
    userSmallAvatar = json['userSmallAvatar'];
    userBigAvatar = json['userBigAvatar'];
    cover = json['cover'];
    groupName = json['groupName'];
    userGroupName = json['userGroupName'];
    isBlackList = json['isBlackList'];
    isIgnoreList = json['isIgnoreList'];
    isLimitList = json['isLimitList'];
    gender = json['gender'];
    adminVerifyTitle = json['admin_verify_title'];
    oldUserName = json['oldUserName'];
    province = json['province'];
    city = json['city'];
    birthyear = json['birthyear'];
    birthmonth = json['birthmonth'];
    birthday = json['birthday'];
    astro = json['astro'];
    weibo = json['weibo'];
    blog = json['blog'];
    qq = json['qq'];
    msn = json['msn'];
    gtalk = json['gtalk'];
    bio = json['bio'];
    bioStatus = json['bio_status'];
    companyFoundDate = json['company_found_date'];
    companyIndustry = json['company_industry'];
    companyWebsite = json['company_website'];
    isDeveloper = json['isDeveloper'];
    verifyType = json['verify_type'];
    verifyTitle = json['verify_title'];
    verifyStatus = json['verify_status'];
    apkDevNum = json['apkDevNum'];
    feed = json['feed'];
    follow = json['follow'];
    fans = json['fans'];
    apkFollowNum = json['apkFollowNum'];
    apkRatingNum = json['apkRatingNum'];
    apkCommentNum = json['apkCommentNum'];
    albumNum = json['albumNum'];
    albumFavNum = json['albumFavNum'];
    discoveryNum = json['discoveryNum'];
    replyNum = json['replyNum'];
    isFollow = json['isFollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['admintype'] = this.admintype;
    data['groupid'] = this.groupid;
    data['usergroupid'] = this.usergroupid;
    data['level'] = this.level;
    data['status'] = this.status;
    data['usernamestatus'] = this.usernamestatus;
    data['mobilestatus'] = this.mobilestatus;
    data['emailstatus'] = this.emailstatus;
    data['avatarstatus'] = this.avatarstatus;
    data['avatar_cover_status'] = this.avatarCoverStatus;
    data['regdate'] = this.regdate;
    data['logintime'] = this.logintime;
    data['fetchType'] = this.fetchType;
    data['entityType'] = this.entityType;
    data['entityId'] = this.entityId;
    data['displayUsername'] = this.displayUsername;
    data['url'] = this.url;
    data['userAvatar'] = this.userAvatar;
    data['userSmallAvatar'] = this.userSmallAvatar;
    data['userBigAvatar'] = this.userBigAvatar;
    data['cover'] = this.cover;
    data['groupName'] = this.groupName;
    data['userGroupName'] = this.userGroupName;
    data['isBlackList'] = this.isBlackList;
    data['isIgnoreList'] = this.isIgnoreList;
    data['isLimitList'] = this.isLimitList;
    data['gender'] = this.gender;
    data['admin_verify_title'] = this.adminVerifyTitle;
    data['oldUserName'] = this.oldUserName;
    data['province'] = this.province;
    data['city'] = this.city;
    data['birthyear'] = this.birthyear;
    data['birthmonth'] = this.birthmonth;
    data['birthday'] = this.birthday;
    data['astro'] = this.astro;
    data['weibo'] = this.weibo;
    data['blog'] = this.blog;
    data['qq'] = this.qq;
    data['msn'] = this.msn;
    data['gtalk'] = this.gtalk;
    data['bio'] = this.bio;
    data['bio_status'] = this.bioStatus;
    data['company_found_date'] = this.companyFoundDate;
    data['company_industry'] = this.companyIndustry;
    data['company_website'] = this.companyWebsite;
    data['isDeveloper'] = this.isDeveloper;
    data['verify_type'] = this.verifyType;
    data['verify_title'] = this.verifyTitle;
    data['verify_status'] = this.verifyStatus;
    data['apkDevNum'] = this.apkDevNum;
    data['feed'] = this.feed;
    data['follow'] = this.follow;
    data['fans'] = this.fans;
    data['apkFollowNum'] = this.apkFollowNum;
    data['apkRatingNum'] = this.apkRatingNum;
    data['apkCommentNum'] = this.apkCommentNum;
    data['albumNum'] = this.albumNum;
    data['albumFavNum'] = this.albumFavNum;
    data['discoveryNum'] = this.discoveryNum;
    data['replyNum'] = this.replyNum;
    data['isFollow'] = this.isFollow;
    return data;
  }
}
