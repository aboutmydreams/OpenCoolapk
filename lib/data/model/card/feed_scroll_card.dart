import 'package:opencoolapk/data/model/feed/inlist_feed.dart' show ReplyRows, RelationRows;

class FeedScrollCardTypeQuestion {
  Map<String, dynamic> source;
  String entityType;
  String entityTemplate;
  String title;
  String url;
  List<Entities> entities;
  int entityId;
  int entityFixed;
  String pic;
  int lastupdate;
  String extraData;

  FeedScrollCardTypeQuestion(
      {this.entityType,
      this.entityTemplate,
      this.title,
      this.url,
      this.entities,
      this.entityId,
      this.entityFixed,
      this.pic,
      this.lastupdate,
      this.extraData});

  FeedScrollCardTypeQuestion.fromJson(Map<String, dynamic> json) {
    source = json;
    entityType = json['entityType'];
    entityTemplate = json['entityTemplate'];
    title = json['title'];
    url = json['url'];
    if (json['entities'] != null) {
      entities = new List<Entities>();
      json['entities'].forEach((v) {
        entities.add(new Entities.fromJson(v));
      });
    }
    entityId = json['entityId'];
    entityFixed = json['entityFixed'];
    pic = json['pic'];
    lastupdate = json['lastupdate'];
    extraData = json['extraData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entityType'] = this.entityType;
    data['entityTemplate'] = this.entityTemplate;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.entities != null) {
      data['entities'] = this.entities.map((v) => v.toJson()).toList();
    }
    data['entityId'] = this.entityId;
    data['entityFixed'] = this.entityFixed;
    data['pic'] = this.pic;
    data['lastupdate'] = this.lastupdate;
    data['extraData'] = this.extraData;
    return data;
  }
}

class FeedScrollCardTypeAnswer {
  Map<String, dynamic> source;
    String entityType;
  String entityTemplate;
  String title;
  String url;
  List<AnswerEntity> entities;
  int entityId;
  int entityFixed;
  String pic;
  int lastupdate;
  String extraData;

  FeedScrollCardTypeAnswer(
      {this.entityType,
      this.entityTemplate,
      this.title,
      this.url,
      this.entities,
      this.entityId,
      this.entityFixed,
      this.pic,
      this.lastupdate,
      this.extraData});

  FeedScrollCardTypeAnswer.fromJson(Map<String, dynamic> json) {
    source = json;
    entityType = json['entityType'];
    entityTemplate = json['entityTemplate'];
    title = json['title'];
    url = json['url'];
    if (json['entities'] != null) {
      entities = new List<AnswerEntity>();
      json['entities'].forEach((v) {
        entities.add(new AnswerEntity.fromJson(v));
      });
    }
    entityId = json['entityId'];
    entityFixed = json['entityFixed'];
    pic = json['pic'];
    lastupdate = json['lastupdate'];
    extraData = json['extraData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entityType'] = this.entityType;
    data['entityTemplate'] = this.entityTemplate;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.entities != null) {
      data['entities'] = this.entities.map((v) => v.toJson()).toList();
    }
    data['entityId'] = this.entityId;
    data['entityFixed'] = this.entityFixed;
    data['pic'] = this.pic;
    data['lastupdate'] = this.lastupdate;
    data['extraData'] = this.extraData;
    return data;
  }
}

class Entities {
  String deviceTitle;
  String dyhName;
  String extraInfo;
  String extraKey;
  String extraPic;
  String extraTitle;
  String extraUrl;
  String forwardid;
  String fromname;
  String istag;
  String label;
  String lastupdate;
  String likenum;
  String location;
  String mediaPic;
  String mediaType;
  String mediaUrl;
  String message;
  String messageCover;
  String messageKeywords;
  String messageLength;
  String messageStatus;
  String messageTitle;
  String pic;
  String questionAnswerNum;
  String questionFollowNum;
  String rankScore;
  String recentHotReplyIds;
  String recentReplyIds;
  String recommend;
  String relatedDyhIds;
  String relatednum;
  String replynum;
  String reportnum;
  String sourceId;
  String status;
  String tags;
  String tid;
  String tinfo;
  String tpic;
  String ttitle;
  String turl;
  String type;
  String uid;
  String userTags;
  String username;
  String favnum;
  String issummary;
  String isHtmlArticle;
  String id;
  String fromid;
  String forwardnum;
  String fid;
  String extraType;
  String extraStatus;
  String dyhId;
  String dateline;
  String commentBlockNum;
  String blockStatus;
  String indexName;
  int iQueryTotal;
  int iQueryViewTotal;
  double dQuerySearchTime;
  String fetchType;
  String entityId;
  String avatarFetchType;
  String userAvatar;
  String entityTemplate;
  String entityType;
  String url;
  String feedType;
  String feedTypeName;
  String turlTarget;
  String info;
  String title;
  String infoHtml;
  List<String> picArr;
  List<dynamic> relateddata;
  String mediaInfo;
  dynamic sourceFeed;
  String forwardSourceType;
  String shareUrl;
  UserInfo userInfo;
  List<RelationRows> relationRows;
  List<ReplyRows> replyRows;
  int replyRowsCount;
  int replyRowsMore;
  var iTid;

  Entities(
      {this.deviceTitle,
      this.dyhName,
      this.extraInfo,
      this.extraKey,
      this.extraPic,
      this.extraTitle,
      this.extraUrl,
      this.forwardid,
      this.fromname,
      this.istag,
      this.label,
      this.lastupdate,
      this.likenum,
      this.location,
      this.mediaPic,
      this.mediaType,
      this.mediaUrl,
      this.message,
      this.messageCover,
      this.messageKeywords,
      this.messageLength,
      this.messageStatus,
      this.messageTitle,
      this.pic,
      this.questionAnswerNum,
      this.questionFollowNum,
      this.rankScore,
      this.recentHotReplyIds,
      this.recentReplyIds,
      this.recommend,
      this.relatedDyhIds,
      this.relatednum,
      this.replynum,
      this.reportnum,
      this.sourceId,
      this.status,
      this.tags,
      this.tid,
      this.tinfo,
      this.tpic,
      this.ttitle,
      this.turl,
      this.type,
      this.uid,
      this.userTags,
      this.username,
      this.favnum,
      this.issummary,
      this.isHtmlArticle,
      this.id,
      this.fromid,
      this.forwardnum,
      this.fid,
      this.extraType,
      this.extraStatus,
      this.dyhId,
      this.dateline,
      this.commentBlockNum,
      this.blockStatus,
      this.indexName,
      this.iQueryTotal,
      this.iQueryViewTotal,
      this.dQuerySearchTime,
      this.fetchType,
      this.entityId,
      this.avatarFetchType,
      this.userAvatar,
      this.entityTemplate,
      this.entityType,
      this.url,
      this.feedType,
      this.feedTypeName,
      this.turlTarget,
      this.info,
      this.title,
      this.infoHtml,
      this.picArr,
      this.relateddata,
      this.mediaInfo,
      this.sourceFeed,
      this.forwardSourceType,
      this.shareUrl,
      this.userInfo,
      this.relationRows,
      this.replyRows,
      this.replyRowsCount,
      this.replyRowsMore,
      this.iTid});

  Entities.fromJson(Map<String, dynamic> json) {
    deviceTitle = json['device_title'];
    dyhName = json['dyh_name'];
    extraInfo = json['extra_info'];
    extraKey = json['extra_key'];
    extraPic = json['extra_pic'];
    extraTitle = json['extra_title'];
    extraUrl = json['extra_url'];
    forwardid = json['forwardid'];
    fromname = json['fromname'];
    istag = json['istag'];
    label = json['label'];
    lastupdate = json['lastupdate'];
    likenum = json['likenum'];
    location = json['location'];
    mediaPic = json['media_pic'];
    mediaType = json['media_type'];
    mediaUrl = json['media_url'];
    message = json['message'];
    messageCover = json['message_cover'];
    messageKeywords = json['message_keywords'];
    messageLength = json['message_length'];
    messageStatus = json['message_status'];
    messageTitle = json['message_title'];
    pic = json['pic'];
    questionAnswerNum = json['question_answer_num'];
    questionFollowNum = json['question_follow_num'];
    rankScore = json['rank_score'];
    recentHotReplyIds = json['recent_hot_reply_ids'];
    recentReplyIds = json['recent_reply_ids'];
    recommend = json['recommend'];
    relatedDyhIds = json['related_dyh_ids'];
    relatednum = json['relatednum'];
    replynum = json['replynum'];
    reportnum = json['reportnum'];
    sourceId = json['source_id'];
    status = json['status'];
    tags = json['tags'];
    tid = json['tid'];
    tinfo = json['tinfo'];
    tpic = json['tpic'];
    ttitle = json['ttitle'];
    turl = json['turl'];
    type = json['type'];
    uid = json['uid'];
    userTags = json['user_tags'];
    username = json['username'];
    favnum = json['favnum'];
    issummary = json['issummary'];
    isHtmlArticle = json['is_html_article'];
    id = json['id'];
    fromid = json['fromid'];
    forwardnum = json['forwardnum'];
    fid = json['fid'];
    extraType = json['extra_type'];
    extraStatus = json['extra_status'];
    dyhId = json['dyh_id'];
    dateline = json['dateline'];
    commentBlockNum = json['comment_block_num'];
    blockStatus = json['block_status'];
    indexName = json['index_name'];
    iQueryTotal = json['_queryTotal'];
    iQueryViewTotal = json['_queryViewTotal'];
    dQuerySearchTime = json['_querySearchTime'];
    fetchType = json['fetchType'];
    entityId = json['entityId'];
    avatarFetchType = json['avatarFetchType'];
    userAvatar = json['userAvatar'];
    entityTemplate = json['entityTemplate'];
    entityType = json['entityType'];
    url = json['url'];
    feedType = json['feedType'];
    feedTypeName = json['feedTypeName'];
    turlTarget = json['turlTarget'];
    info = json['info'];
    title = json['title'];
    infoHtml = json['infoHtml'];
    picArr = json['picArr'].cast<String>();
    if (json['relateddata'] != null) {
      relateddata = new List<dynamic>();
      json['relateddata'].forEach((v) {
        relateddata.add(v);
      });
    }
    mediaInfo = json['media_info'];
    sourceFeed = json['sourceFeed'];
    forwardSourceType = json['forwardSourceType'];
    shareUrl = json['shareUrl'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    if (json['relationRows'] != null) {
      relationRows = new List<RelationRows>();
      json['relationRows'].forEach((v) {
        relationRows.add(new RelationRows.fromJson(v));
      });
    }
    if (json['replyRows'] != null) {
      replyRows = new List<ReplyRows>();
      json['replyRows'].forEach((v) {
        replyRows.add(new ReplyRows.fromJson(v));
      });
    }
    replyRowsCount = json['replyRowsCount'];
    replyRowsMore = json['replyRowsMore'];
    iTid = json['_tid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_title'] = this.deviceTitle;
    data['dyh_name'] = this.dyhName;
    data['extra_info'] = this.extraInfo;
    data['extra_key'] = this.extraKey;
    data['extra_pic'] = this.extraPic;
    data['extra_title'] = this.extraTitle;
    data['extra_url'] = this.extraUrl;
    data['forwardid'] = this.forwardid;
    data['fromname'] = this.fromname;
    data['istag'] = this.istag;
    data['label'] = this.label;
    data['lastupdate'] = this.lastupdate;
    data['likenum'] = this.likenum;
    data['location'] = this.location;
    data['media_pic'] = this.mediaPic;
    data['media_type'] = this.mediaType;
    data['media_url'] = this.mediaUrl;
    data['message'] = this.message;
    data['message_cover'] = this.messageCover;
    data['message_keywords'] = this.messageKeywords;
    data['message_length'] = this.messageLength;
    data['message_status'] = this.messageStatus;
    data['message_title'] = this.messageTitle;
    data['pic'] = this.pic;
    data['question_answer_num'] = this.questionAnswerNum;
    data['question_follow_num'] = this.questionFollowNum;
    data['rank_score'] = this.rankScore;
    data['recent_hot_reply_ids'] = this.recentHotReplyIds;
    data['recent_reply_ids'] = this.recentReplyIds;
    data['recommend'] = this.recommend;
    data['related_dyh_ids'] = this.relatedDyhIds;
    data['relatednum'] = this.relatednum;
    data['replynum'] = this.replynum;
    data['reportnum'] = this.reportnum;
    data['source_id'] = this.sourceId;
    data['status'] = this.status;
    data['tags'] = this.tags;
    data['tid'] = this.tid;
    data['tinfo'] = this.tinfo;
    data['tpic'] = this.tpic;
    data['ttitle'] = this.ttitle;
    data['turl'] = this.turl;
    data['type'] = this.type;
    data['uid'] = this.uid;
    data['user_tags'] = this.userTags;
    data['username'] = this.username;
    data['favnum'] = this.favnum;
    data['issummary'] = this.issummary;
    data['is_html_article'] = this.isHtmlArticle;
    data['id'] = this.id;
    data['fromid'] = this.fromid;
    data['forwardnum'] = this.forwardnum;
    data['fid'] = this.fid;
    data['extra_type'] = this.extraType;
    data['extra_status'] = this.extraStatus;
    data['dyh_id'] = this.dyhId;
    data['dateline'] = this.dateline;
    data['comment_block_num'] = this.commentBlockNum;
    data['block_status'] = this.blockStatus;
    data['index_name'] = this.indexName;
    data['_queryTotal'] = this.iQueryTotal;
    data['_queryViewTotal'] = this.iQueryViewTotal;
    data['_querySearchTime'] = this.dQuerySearchTime;
    data['fetchType'] = this.fetchType;
    data['entityId'] = this.entityId;
    data['avatarFetchType'] = this.avatarFetchType;
    data['userAvatar'] = this.userAvatar;
    data['entityTemplate'] = this.entityTemplate;
    data['entityType'] = this.entityType;
    data['url'] = this.url;
    data['feedType'] = this.feedType;
    data['feedTypeName'] = this.feedTypeName;
    data['turlTarget'] = this.turlTarget;
    data['info'] = this.info;
    data['title'] = this.title;
    data['infoHtml'] = this.infoHtml;
    data['picArr'] = this.picArr;
    if (this.relateddata != null) {
      data['relateddata'] = this.relateddata.map((v) => v.toJson()).toList();
    }
    data['media_info'] = this.mediaInfo;
    data['sourceFeed'] = this.sourceFeed;
    data['forwardSourceType'] = this.forwardSourceType;
    data['shareUrl'] = this.shareUrl;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.relationRows != null) {
      data['relationRows'] = this.relationRows.map((v) => v.toJson()).toList();
    }
    if (this.replyRows != null) {
      data['replyRows'] = this.replyRows.map((v) => v.toJson()).toList();
    }
    data['replyRowsCount'] = this.replyRowsCount;
    data['replyRowsMore'] = this.replyRowsMore;
    data['_tid'] = this.iTid;
    return data;
  }
}

class UserInfo {
  int uid;
  String username;
  int admintype;
  int groupid;
  int usergroupid;
  int level;
  int status;
  int usernamestatus;
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

class AnswerEntity {
  String deviceTitle;
  String dyhName;
  String extraInfo;
  String extraKey;
  String extraPic;
  String extraTitle;
  String extraUrl;
  String forwardid;
  String fromname;
  String istag;
  String label;
  String lastupdate;
  String likenum;
  String location;
  String mediaPic;
  String mediaType;
  String mediaUrl;
  String message;
  String messageCover;
  String messageKeywords;
  String messageLength;
  String messageStatus;
  String messageTitle;
  String pic;
  String questionAnswerNum;
  String questionFollowNum;
  String rankScore;
  String recentHotReplyIds;
  String recentReplyIds;
  String recommend;
  String relatedDyhIds;
  String relatednum;
  String replynum;
  String reportnum;
  String sourceId;
  String status;
  String tags;
  String tid;
  String tinfo;
  String tpic;
  String ttitle;
  String turl;
  String type;
  String uid;
  String userTags;
  String username;
  String favnum;
  String issummary;
  String isHtmlArticle;
  String id;
  String fromid;
  String forwardnum;
  String fid;
  String extraType;
  String extraStatus;
  String dyhId;
  String dateline;
  String commentBlockNum;
  String blockStatus;
  String indexName;
  int iQueryTotal;
  int iQueryViewTotal;
  double dQuerySearchTime;
  String fetchType;
  String entityId;
  String avatarFetchType;
  String userAvatar;
  String entityTemplate;
  String entityType;
  String url;
  String feedType;
  String feedTypeName;
  String turlTarget;
  String info;
  String title;
  String infoHtml;
  List<String> picArr;
  List<dynamic> relateddata;
  String mediaInfo;
  dynamic sourceFeed;
  String forwardSourceType;
  String shareUrl;
  UUserInfo userInfo;
  List<RelationRows> relationRows;
  List<ReplyRows> replyRows;
  int replyRowsCount;
  int replyRowsMore;
  var sTid;

  AnswerEntity(
      {this.deviceTitle,
      this.dyhName,
      this.extraInfo,
      this.extraKey,
      this.extraPic,
      this.extraTitle,
      this.extraUrl,
      this.forwardid,
      this.fromname,
      this.istag,
      this.label,
      this.lastupdate,
      this.likenum,
      this.location,
      this.mediaPic,
      this.mediaType,
      this.mediaUrl,
      this.message,
      this.messageCover,
      this.messageKeywords,
      this.messageLength,
      this.messageStatus,
      this.messageTitle,
      this.pic,
      this.questionAnswerNum,
      this.questionFollowNum,
      this.rankScore,
      this.recentHotReplyIds,
      this.recentReplyIds,
      this.recommend,
      this.relatedDyhIds,
      this.relatednum,
      this.replynum,
      this.reportnum,
      this.sourceId,
      this.status,
      this.tags,
      this.tid,
      this.tinfo,
      this.tpic,
      this.ttitle,
      this.turl,
      this.type,
      this.uid,
      this.userTags,
      this.username,
      this.favnum,
      this.issummary,
      this.isHtmlArticle,
      this.id,
      this.fromid,
      this.forwardnum,
      this.fid,
      this.extraType,
      this.extraStatus,
      this.dyhId,
      this.dateline,
      this.commentBlockNum,
      this.blockStatus,
      this.indexName,
      this.iQueryTotal,
      this.iQueryViewTotal,
      this.dQuerySearchTime,
      this.fetchType,
      this.entityId,
      this.avatarFetchType,
      this.userAvatar,
      this.entityTemplate,
      this.entityType,
      this.url,
      this.feedType,
      this.feedTypeName,
      this.turlTarget,
      this.info,
      this.title,
      this.infoHtml,
      this.picArr,
      this.relateddata,
      this.mediaInfo,
      this.sourceFeed,
      this.forwardSourceType,
      this.shareUrl,
      this.userInfo,
      this.relationRows,
      this.replyRows,
      this.replyRowsCount,
      this.replyRowsMore,
      this.sTid});

  AnswerEntity.fromJson(Map<String, dynamic> json) {
    deviceTitle = json['device_title'];
    dyhName = json['dyh_name'];
    extraInfo = json['extra_info'];
    extraKey = json['extra_key'];
    extraPic = json['extra_pic'];
    extraTitle = json['extra_title'];
    extraUrl = json['extra_url'];
    forwardid = json['forwardid'];
    fromname = json['fromname'];
    istag = json['istag'];
    label = json['label'];
    lastupdate = json['lastupdate'];
    likenum = json['likenum'];
    location = json['location'];
    mediaPic = json['media_pic'];
    mediaType = json['media_type'];
    mediaUrl = json['media_url'];
    message = json['message'];
    messageCover = json['message_cover'];
    messageKeywords = json['message_keywords'];
    messageLength = json['message_length'];
    messageStatus = json['message_status'];
    messageTitle = json['message_title'];
    pic = json['pic'];
    questionAnswerNum = json['question_answer_num'];
    questionFollowNum = json['question_follow_num'];
    rankScore = json['rank_score'];
    recentHotReplyIds = json['recent_hot_reply_ids'];
    recentReplyIds = json['recent_reply_ids'];
    recommend = json['recommend'];
    relatedDyhIds = json['related_dyh_ids'];
    relatednum = json['relatednum'];
    replynum = json['replynum'];
    reportnum = json['reportnum'];
    sourceId = json['source_id'];
    status = json['status'];
    tags = json['tags'];
    tid = json['tid'];
    tinfo = json['tinfo'];
    tpic = json['tpic'];
    ttitle = json['ttitle'];
    turl = json['turl'];
    type = json['type'];
    uid = json['uid'];
    userTags = json['user_tags'];
    username = json['username'];
    favnum = json['favnum'];
    issummary = json['issummary'];
    isHtmlArticle = json['is_html_article'];
    id = json['id'];
    fromid = json['fromid'];
    forwardnum = json['forwardnum'];
    fid = json['fid'];
    extraType = json['extra_type'];
    extraStatus = json['extra_status'];
    dyhId = json['dyh_id'];
    dateline = json['dateline'];
    commentBlockNum = json['comment_block_num'];
    blockStatus = json['block_status'];
    indexName = json['index_name'];
    iQueryTotal = json['_queryTotal'];
    iQueryViewTotal = json['_queryViewTotal'];
    dQuerySearchTime = json['_querySearchTime'];
    fetchType = json['fetchType'];
    entityId = json['entityId'];
    avatarFetchType = json['avatarFetchType'];
    userAvatar = json['userAvatar'];
    entityTemplate = json['entityTemplate'];
    entityType = json['entityType'];
    url = json['url'];
    feedType = json['feedType'];
    feedTypeName = json['feedTypeName'];
    turlTarget = json['turlTarget'];
    info = json['info'];
    title = json['title'];
    infoHtml = json['infoHtml'];
    picArr = json['picArr'].cast<String>();
    if (json['relateddata'] != null) {
      relateddata = new List<dynamic>();
      json['relateddata'].forEach((v) {
        relateddata.add(v);
      });
    }
    mediaInfo = json['media_info'];
    sourceFeed = json['sourceFeed'];
    forwardSourceType = json['forwardSourceType'];
    shareUrl = json['shareUrl'];
    userInfo = json['userInfo'] != null
        ? new UUserInfo.fromJson(json['userInfo'])
        : null;
    if (json['relationRows'] != null) {
      relationRows = new List<RelationRows>();
      json['relationRows'].forEach((v) {
        relationRows.add(new RelationRows.fromJson(v));
      });
    }
    if (json['replyRows'] != null) {
      replyRows = new List<ReplyRows>();
      json['replyRows'].forEach((v) {
        replyRows.add(new ReplyRows.fromJson(v));
      });
    }
    replyRowsCount = json['replyRowsCount'];
    replyRowsMore = json['replyRowsMore'];
    sTid = json['_tid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_title'] = this.deviceTitle;
    data['dyh_name'] = this.dyhName;
    data['extra_info'] = this.extraInfo;
    data['extra_key'] = this.extraKey;
    data['extra_pic'] = this.extraPic;
    data['extra_title'] = this.extraTitle;
    data['extra_url'] = this.extraUrl;
    data['forwardid'] = this.forwardid;
    data['fromname'] = this.fromname;
    data['istag'] = this.istag;
    data['label'] = this.label;
    data['lastupdate'] = this.lastupdate;
    data['likenum'] = this.likenum;
    data['location'] = this.location;
    data['media_pic'] = this.mediaPic;
    data['media_type'] = this.mediaType;
    data['media_url'] = this.mediaUrl;
    data['message'] = this.message;
    data['message_cover'] = this.messageCover;
    data['message_keywords'] = this.messageKeywords;
    data['message_length'] = this.messageLength;
    data['message_status'] = this.messageStatus;
    data['message_title'] = this.messageTitle;
    data['pic'] = this.pic;
    data['question_answer_num'] = this.questionAnswerNum;
    data['question_follow_num'] = this.questionFollowNum;
    data['rank_score'] = this.rankScore;
    data['recent_hot_reply_ids'] = this.recentHotReplyIds;
    data['recent_reply_ids'] = this.recentReplyIds;
    data['recommend'] = this.recommend;
    data['related_dyh_ids'] = this.relatedDyhIds;
    data['relatednum'] = this.relatednum;
    data['replynum'] = this.replynum;
    data['reportnum'] = this.reportnum;
    data['source_id'] = this.sourceId;
    data['status'] = this.status;
    data['tags'] = this.tags;
    data['tid'] = this.tid;
    data['tinfo'] = this.tinfo;
    data['tpic'] = this.tpic;
    data['ttitle'] = this.ttitle;
    data['turl'] = this.turl;
    data['type'] = this.type;
    data['uid'] = this.uid;
    data['user_tags'] = this.userTags;
    data['username'] = this.username;
    data['favnum'] = this.favnum;
    data['issummary'] = this.issummary;
    data['is_html_article'] = this.isHtmlArticle;
    data['id'] = this.id;
    data['fromid'] = this.fromid;
    data['forwardnum'] = this.forwardnum;
    data['fid'] = this.fid;
    data['extra_type'] = this.extraType;
    data['extra_status'] = this.extraStatus;
    data['dyh_id'] = this.dyhId;
    data['dateline'] = this.dateline;
    data['comment_block_num'] = this.commentBlockNum;
    data['block_status'] = this.blockStatus;
    data['index_name'] = this.indexName;
    data['_queryTotal'] = this.iQueryTotal;
    data['_queryViewTotal'] = this.iQueryViewTotal;
    data['_querySearchTime'] = this.dQuerySearchTime;
    data['fetchType'] = this.fetchType;
    data['entityId'] = this.entityId;
    data['avatarFetchType'] = this.avatarFetchType;
    data['userAvatar'] = this.userAvatar;
    data['entityTemplate'] = this.entityTemplate;
    data['entityType'] = this.entityType;
    data['url'] = this.url;
    data['feedType'] = this.feedType;
    data['feedTypeName'] = this.feedTypeName;
    data['turlTarget'] = this.turlTarget;
    data['info'] = this.info;
    data['title'] = this.title;
    data['infoHtml'] = this.infoHtml;
    data['picArr'] = this.picArr;
    if (this.relateddata != null) {
      data['relateddata'] = this.relateddata.map((v) => v.toJson()).toList();
    }
    data['media_info'] = this.mediaInfo;
    data['sourceFeed'] = this.sourceFeed;
    data['forwardSourceType'] = this.forwardSourceType;
    data['shareUrl'] = this.shareUrl;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.relationRows != null) {
      data['relationRows'] = this.relationRows.map((v) => v.toJson()).toList();
    }
    if (this.replyRows != null) {
      data['replyRows'] = this.replyRows.map((v) => v.toJson()).toList();
    }
    data['replyRowsCount'] = this.replyRowsCount;
    data['replyRowsMore'] = this.replyRowsMore;
    data['_tid'] = this.sTid;
    return data;
  }
}

class UUserInfo extends UserInfo{
  int uid;
  String username;
  int admintype;
  int groupid;
  int usergroupid;
  int level;
  int status;
  int usernamestatus;
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

  UUserInfo(
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

  UUserInfo.fromJson(Map<String, dynamic> json) {
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
