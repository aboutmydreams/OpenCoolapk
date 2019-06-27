class FeedReply {
  List<Data> data;

  FeedReply({this.data});

  FeedReply.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Map<String, dynamic> source;
  var id;
  var ftype;
  var fid;
  var rid;
  var rrid;
  var uid;
  String username;
  var ruid;
  String rusername;
  String pic;
  String message;
  var replynum;
  var likenum;
  var burynum;
  var reportnum;
  var rankScore;
  var dateline;
  var lastupdate;
  var isFolded;
  var status;
  var messageStatus;
  var blockStatus;
  String recentReplyIds;
  var feedUid;
  String fetchType;
  var entityId;
  String avatarFetchType;
  String userAvatar;
  String entityTemplate;
  String entityType;
  String infoHtml;
  var isFeedAuthor;
  UserAction userAction;
  UserInfo userInfo;
  List<ReplyRows> replyRows;
  var replyRowsCount;
  var replyRowsMore;

  Data(
      {this.id,
      this.ftype,
      this.fid,
      this.rid,
      this.rrid,
      this.uid,
      this.username,
      this.ruid,
      this.rusername,
      this.pic,
      this.message,
      this.replynum,
      this.likenum,
      this.burynum,
      this.reportnum,
      this.rankScore,
      this.dateline,
      this.lastupdate,
      this.isFolded,
      this.status,
      this.messageStatus,
      this.blockStatus,
      this.recentReplyIds,
      this.feedUid,
      this.fetchType,
      this.entityId,
      this.avatarFetchType,
      this.userAvatar,
      this.entityTemplate,
      this.entityType,
      this.infoHtml,
      this.isFeedAuthor,
      this.userAction,
      this.userInfo,
      this.replyRows,
      this.replyRowsCount,
      this.replyRowsMore});

  Data.fromJson(Map<String, dynamic> json) {
    source = json;
    id = json['id'];
    ftype = json['ftype'];
    fid = json['fid'];
    rid = json['rid'];
    rrid = json['rrid'];
    uid = json['uid'];
    username = json['username'];
    ruid = json['ruid'];
    rusername = json['rusername'];
    pic = json['pic'];
    message = json['message'];
    replynum = json['replynum'];
    likenum = json['likenum'];
    burynum = json['burynum'];
    reportnum = json['reportnum'];
    rankScore = json['rank_score'];
    dateline = json['dateline'];
    lastupdate = json['lastupdate'];
    isFolded = json['is_folded'];
    status = json['status'];
    messageStatus = json['message_status'];
    blockStatus = json['block_status'];
    recentReplyIds = json['recent_reply_ids'];
    feedUid = json['feedUid'];
    fetchType = json['fetchType'];
    entityId = json['entityId'];
    avatarFetchType = json['avatarFetchType'];
    userAvatar = json['userAvatar'];
    entityTemplate = json['entityTemplate'];
    entityType = json['entityType'];
    infoHtml = json['infoHtml'];
    isFeedAuthor = json['isFeedAuthor'];
    userAction = json['userAction'] != null
        ? new UserAction.fromJson(json['userAction'])
        : null;
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    if (json['replyRows'] != null) {
      replyRows = new List<ReplyRows>();
      json['replyRows'].forEach((v) {
        replyRows.add(new ReplyRows.fromJson(v));
      });
    }
    replyRowsCount = json['replyRowsCount'];
    replyRowsMore = json['replyRowsMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ftype'] = this.ftype;
    data['fid'] = this.fid;
    data['rid'] = this.rid;
    data['rrid'] = this.rrid;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['ruid'] = this.ruid;
    data['rusername'] = this.rusername;
    data['pic'] = this.pic;
    data['message'] = this.message;
    data['replynum'] = this.replynum;
    data['likenum'] = this.likenum;
    data['burynum'] = this.burynum;
    data['reportnum'] = this.reportnum;
    data['rank_score'] = this.rankScore;
    data['dateline'] = this.dateline;
    data['lastupdate'] = this.lastupdate;
    data['is_folded'] = this.isFolded;
    data['status'] = this.status;
    data['message_status'] = this.messageStatus;
    data['block_status'] = this.blockStatus;
    data['recent_reply_ids'] = this.recentReplyIds;
    data['feedUid'] = this.feedUid;
    data['fetchType'] = this.fetchType;
    data['entityId'] = this.entityId;
    data['avatarFetchType'] = this.avatarFetchType;
    data['userAvatar'] = this.userAvatar;
    data['entityTemplate'] = this.entityTemplate;
    data['entityType'] = this.entityType;
    data['infoHtml'] = this.infoHtml;
    data['isFeedAuthor'] = this.isFeedAuthor;
    if (this.userAction != null) {
      data['userAction'] = this.userAction.toJson();
    }
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.replyRows != null) {
      data['replyRows'] = this.replyRows.map((v) => v.toJson()).toList();
    }
    data['replyRowsCount'] = this.replyRowsCount;
    data['replyRowsMore'] = this.replyRowsMore;
    return data;
  }
}

class UserAction {
  var like;

  UserAction({this.like});

  UserAction.fromJson(Map<String, dynamic> json) {
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['like'] = this.like;
    return data;
  }
}

class UserInfo {
  var uid;
  String username;
  var admintype;
  var groupid;
  var usergroupid;
  var level;
  var status;
  var usernamestatus;
  var avatarstatus;
  var avatarCoverStatus;
  var regdate;
  var logintime;
  String fetchType;
  String entityType;
  var entityId;
  String displayUsername;
  String url;
  String userAvatar;
  String userSmallAvatar;
  String userBigAvatar;
  String cover;

  UserInfo(
      {this.uid,
      this.username,
      this.admintype,
      this.groupid,
      this.usergroupid,
      this.level,
      this.status,
      this.usernamestatus,
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
      this.cover});

  UserInfo.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    admintype = json['admintype'];
    groupid = json['groupid'];
    usergroupid = json['usergroupid'];
    level = json['level'];
    status = json['status'];
    usernamestatus = json['usernamestatus'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['admintype'] = this.admintype;
    data['groupid'] = this.groupid;
    data['usergroupid'] = this.usergroupid;
    data['level'] = this.level;
    data['status'] = this.status;
    data['usernamestatus'] = this.usernamestatus;
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
    return data;
  }
}

class ReplyRows {
  var id;
  var ftype;
  var fid;
  var rid;
  var rrid;
  var uid;
  String username;
  var ruid;
  String rusername;
  String pic;
  String message;
  var replynum;
  var likenum;
  var burynum;
  var reportnum;
  var rankScore;
  var dateline;
  var lastupdate;
  var isFolded;
  var status;
  var messageStatus;
  var blockStatus;
  String recentReplyIds;
  var feedUid;
  String fetchType;
  var entityId;
  String avatarFetchType;
  String userAvatar;
  String entityTemplate;
  String entityType;
  String infoHtml;
  var isFeedAuthor;

  ReplyRows(
      {this.id,
      this.ftype,
      this.fid,
      this.rid,
      this.rrid,
      this.uid,
      this.username,
      this.ruid,
      this.rusername,
      this.pic,
      this.message,
      this.replynum,
      this.likenum,
      this.burynum,
      this.reportnum,
      this.rankScore,
      this.dateline,
      this.lastupdate,
      this.isFolded,
      this.status,
      this.messageStatus,
      this.blockStatus,
      this.recentReplyIds,
      this.feedUid,
      this.fetchType,
      this.entityId,
      this.avatarFetchType,
      this.userAvatar,
      this.entityTemplate,
      this.entityType,
      this.infoHtml,
      this.isFeedAuthor});

  ReplyRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ftype = json['ftype'];
    fid = json['fid'];
    rid = json['rid'];
    rrid = json['rrid'];
    uid = json['uid'];
    username = json['username'];
    ruid = json['ruid'];
    rusername = json['rusername'];
    pic = json['pic'];
    message = json['message'];
    replynum = json['replynum'];
    likenum = json['likenum'];
    burynum = json['burynum'];
    reportnum = json['reportnum'];
    rankScore = json['rank_score'];
    dateline = json['dateline'];
    lastupdate = json['lastupdate'];
    isFolded = json['is_folded'];
    status = json['status'];
    messageStatus = json['message_status'];
    blockStatus = json['block_status'];
    recentReplyIds = json['recent_reply_ids'];
    feedUid = json['feedUid'];
    fetchType = json['fetchType'];
    entityId = json['entityId'];
    avatarFetchType = json['avatarFetchType'];
    userAvatar = json['userAvatar'];
    entityTemplate = json['entityTemplate'];
    entityType = json['entityType'];
    infoHtml = json['infoHtml'];
    isFeedAuthor = json['isFeedAuthor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ftype'] = this.ftype;
    data['fid'] = this.fid;
    data['rid'] = this.rid;
    data['rrid'] = this.rrid;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['ruid'] = this.ruid;
    data['rusername'] = this.rusername;
    data['pic'] = this.pic;
    data['message'] = this.message;
    data['replynum'] = this.replynum;
    data['likenum'] = this.likenum;
    data['burynum'] = this.burynum;
    data['reportnum'] = this.reportnum;
    data['rank_score'] = this.rankScore;
    data['dateline'] = this.dateline;
    data['lastupdate'] = this.lastupdate;
    data['is_folded'] = this.isFolded;
    data['status'] = this.status;
    data['message_status'] = this.messageStatus;
    data['block_status'] = this.blockStatus;
    data['recent_reply_ids'] = this.recentReplyIds;
    data['feedUid'] = this.feedUid;
    data['fetchType'] = this.fetchType;
    data['entityId'] = this.entityId;
    data['avatarFetchType'] = this.avatarFetchType;
    data['userAvatar'] = this.userAvatar;
    data['entityTemplate'] = this.entityTemplate;
    data['entityType'] = this.entityType;
    data['infoHtml'] = this.infoHtml;
    data['isFeedAuthor'] = this.isFeedAuthor;
    return data;
  }
}