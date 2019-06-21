class Feed {
  Map<String,dynamic> source;
  int id;
  int type;
  int fid;
  String forwardid;
  String sourceId;
  int uid;
  String username;
  int dyhId;
  String dyhName;
  int tid;
  String ttitle;
  String tpic;
  String turl;
  String tinfo;
  String messageTitle;
  String messageTitleMd5;
  String messageKeywords;
  String messageCover;
  String message;
  String pic;
  int messageLength;
  int issummary;
  int istag;
  int isHtmlArticle;
  String tags;
  String label;
  String userTags;
  int mediaType;
  String mediaPic;
  String mediaUrl;
  var extraType;
  String extraKey;
  String extraTitle;
  String extraUrl;
  String extraPic;
  String extraInfo;
  int extraStatus;
  String location;
  int fromid;
  String fromname;
  int likenum;
  int burynum;
  int commentnum;
  int replynum;
  int forwardnum;
  int reportnum;
  int relatednum;
  int favnum;
  int shareNum;
  int commentBlockNum;
  int questionAnswerNum;
  int questionFollowNum;
  int hitnum;
  int viewnum;
  int feedScore;
  int rankScore;
  int voteScore;
  int atCount;
  int urlCount;
  int tagCount;
  int recommend;
  int isAnonymous;
  int isHidden;
  int isHeadline;
  int disallowReply;
  int status;
  int messageStatus;
  int blockStatus;
  int dateline;
  int lastupdate;
  String deviceTitle;
  String deviceName;
  String deviceRom;
  String deviceBuild;
  String recentReplyIds;
  String recentHotReplyIds;
  String recentLikeList;
  String relatedDyhIds;
  String postSignature;
  String messageSignature;
  String fetchType;
  int entityId;
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
  List<ReplyRows> replyRows;
  int replyRowsCount;
  int replyRowsMore;
  UserInfo userInfo;
  List<RelationRows> relationRows;
  String pickType;
  int iTid;
  String extraData;

  Feed(
      {this.id,
      this.type,
      this.fid,
      this.forwardid,
      this.sourceId,
      this.uid,
      this.username,
      this.dyhId,
      this.dyhName,
      this.tid,
      this.ttitle,
      this.tpic,
      this.turl,
      this.tinfo,
      this.messageTitle,
      this.messageTitleMd5,
      this.messageKeywords,
      this.messageCover,
      this.message,
      this.pic,
      this.messageLength,
      this.issummary,
      this.istag,
      this.isHtmlArticle,
      this.tags,
      this.label,
      this.userTags,
      this.mediaType,
      this.mediaPic,
      this.mediaUrl,
      this.extraType,
      this.extraKey,
      this.extraTitle,
      this.extraUrl,
      this.extraPic,
      this.extraInfo,
      this.extraStatus,
      this.location,
      this.fromid,
      this.fromname,
      this.likenum,
      this.burynum,
      this.commentnum,
      this.replynum,
      this.forwardnum,
      this.reportnum,
      this.relatednum,
      this.favnum,
      this.shareNum,
      this.commentBlockNum,
      this.questionAnswerNum,
      this.questionFollowNum,
      this.hitnum,
      this.viewnum,
      this.feedScore,
      this.rankScore,
      this.voteScore,
      this.atCount,
      this.urlCount,
      this.tagCount,
      this.recommend,
      this.isAnonymous,
      this.isHidden,
      this.isHeadline,
      this.disallowReply,
      this.status,
      this.messageStatus,
      this.blockStatus,
      this.dateline,
      this.lastupdate,
      this.deviceTitle,
      this.deviceName,
      this.deviceRom,
      this.deviceBuild,
      this.recentReplyIds,
      this.recentHotReplyIds,
      this.recentLikeList,
      this.relatedDyhIds,
      this.postSignature,
      this.messageSignature,
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
      this.replyRows,
      this.replyRowsCount,
      this.replyRowsMore,
      this.userInfo,
      this.relationRows,
      this.pickType,
      this.iTid,
      this.extraData});

  Feed.fromJson(Map<String, dynamic> json) {
    source = json;
    id = json['id'];
    type = json['type'];
    fid = json['fid'];
    forwardid = json['forwardid'];
    sourceId = json['source_id'];
    uid = json['uid'];
    username = json['username'];
    dyhId = json['dyh_id'];
    dyhName = json['dyh_name'];
    tid = json['tid'];
    ttitle = json['ttitle'];
    tpic = json['tpic'];
    turl = json['turl'];
    tinfo = json['tinfo'];
    messageTitle = json['message_title'];
    messageTitleMd5 = json['message_title_md5'];
    messageKeywords = json['message_keywords'];
    messageCover = json['message_cover'];
    message = json['message'];
    pic = json['pic'];
    messageLength = json['message_length'];
    issummary = json['issummary'];
    istag = json['istag'];
    isHtmlArticle = json['is_html_article'];
    tags = json['tags'];
    label = json['label'];
    userTags = json['user_tags'];
    mediaType = json['media_type'];
    mediaPic = json['media_pic'];
    mediaUrl = json['media_url'];
    extraType = json['extra_type'];
    extraKey = json['extra_key'];
    extraTitle = json['extra_title'];
    extraUrl = json['extra_url'];
    extraPic = json['extra_pic'];
    extraInfo = json['extra_info'];
    extraStatus = json['extra_status'];
    location = json['location'];
    fromid = json['fromid'];
    fromname = json['fromname'];
    likenum = json['likenum'];
    burynum = json['burynum'];
    commentnum = json['commentnum'];
    replynum = json['replynum'];
    forwardnum = json['forwardnum'];
    reportnum = json['reportnum'];
    relatednum = json['relatednum'];
    favnum = json['favnum'];
    shareNum = json['share_num'];
    commentBlockNum = json['comment_block_num'];
    questionAnswerNum = json['question_answer_num'];
    questionFollowNum = json['question_follow_num'];
    hitnum = json['hitnum'];
    viewnum = json['viewnum'];
    feedScore = json['feed_score'];
    rankScore = json['rank_score'];
    voteScore = json['vote_score'];
    atCount = json['at_count'];
    urlCount = json['url_count'];
    tagCount = json['tag_count'];
    recommend = json['recommend'];
    isAnonymous = json['is_anonymous'];
    isHidden = json['is_hidden'];
    isHeadline = json['is_headline'];
    disallowReply = json['disallow_reply'];
    status = json['status'];
    messageStatus = json['message_status'];
    blockStatus = json['block_status'];
    dateline = json['dateline'];
    lastupdate = json['lastupdate'];
    deviceTitle = json['device_title'];
    deviceName = json['device_name'];
    deviceRom = json['device_rom'];
    deviceBuild = json['device_build'];
    recentReplyIds = json['recent_reply_ids'];
    recentHotReplyIds = json['recent_hot_reply_ids'];
    recentLikeList = json['recent_like_list'];
    relatedDyhIds = json['related_dyh_ids'];
    postSignature = json['post_signature'];
    messageSignature = json['message_signature'];
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
    if (json['replyRows'] != null) {
      replyRows = new List<ReplyRows>();
      json['replyRows'].forEach((v) {
        replyRows.add(new ReplyRows.fromJson(v));
      });
    }
    replyRowsCount = json['replyRowsCount'];
    replyRowsMore = json['replyRowsMore'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    if (json['relationRows'] != null) {
      relationRows = new List<RelationRows>();
      json['relationRows'].forEach((v) {
        relationRows.add(new RelationRows.fromJson(v));
      });
    }
    pickType = json['pickType'];
    iTid = json['_tid'];
    extraData = json['extraData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['fid'] = this.fid;
    data['forwardid'] = this.forwardid;
    data['source_id'] = this.sourceId;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['dyh_id'] = this.dyhId;
    data['dyh_name'] = this.dyhName;
    data['tid'] = this.tid;
    data['ttitle'] = this.ttitle;
    data['tpic'] = this.tpic;
    data['turl'] = this.turl;
    data['tinfo'] = this.tinfo;
    data['message_title'] = this.messageTitle;
    data['message_title_md5'] = this.messageTitleMd5;
    data['message_keywords'] = this.messageKeywords;
    data['message_cover'] = this.messageCover;
    data['message'] = this.message;
    data['pic'] = this.pic;
    data['message_length'] = this.messageLength;
    data['issummary'] = this.issummary;
    data['istag'] = this.istag;
    data['is_html_article'] = this.isHtmlArticle;
    data['tags'] = this.tags;
    data['label'] = this.label;
    data['user_tags'] = this.userTags;
    data['media_type'] = this.mediaType;
    data['media_pic'] = this.mediaPic;
    data['media_url'] = this.mediaUrl;
    data['extra_type'] = this.extraType;
    data['extra_key'] = this.extraKey;
    data['extra_title'] = this.extraTitle;
    data['extra_url'] = this.extraUrl;
    data['extra_pic'] = this.extraPic;
    data['extra_info'] = this.extraInfo;
    data['extra_status'] = this.extraStatus;
    data['location'] = this.location;
    data['fromid'] = this.fromid;
    data['fromname'] = this.fromname;
    data['likenum'] = this.likenum;
    data['burynum'] = this.burynum;
    data['commentnum'] = this.commentnum;
    data['replynum'] = this.replynum;
    data['forwardnum'] = this.forwardnum;
    data['reportnum'] = this.reportnum;
    data['relatednum'] = this.relatednum;
    data['favnum'] = this.favnum;
    data['share_num'] = this.shareNum;
    data['comment_block_num'] = this.commentBlockNum;
    data['question_answer_num'] = this.questionAnswerNum;
    data['question_follow_num'] = this.questionFollowNum;
    data['hitnum'] = this.hitnum;
    data['viewnum'] = this.viewnum;
    data['feed_score'] = this.feedScore;
    data['rank_score'] = this.rankScore;
    data['vote_score'] = this.voteScore;
    data['at_count'] = this.atCount;
    data['url_count'] = this.urlCount;
    data['tag_count'] = this.tagCount;
    data['recommend'] = this.recommend;
    data['is_anonymous'] = this.isAnonymous;
    data['is_hidden'] = this.isHidden;
    data['is_headline'] = this.isHeadline;
    data['disallow_reply'] = this.disallowReply;
    data['status'] = this.status;
    data['message_status'] = this.messageStatus;
    data['block_status'] = this.blockStatus;
    data['dateline'] = this.dateline;
    data['lastupdate'] = this.lastupdate;
    data['device_title'] = this.deviceTitle;
    data['device_name'] = this.deviceName;
    data['device_rom'] = this.deviceRom;
    data['device_build'] = this.deviceBuild;
    data['recent_reply_ids'] = this.recentReplyIds;
    data['recent_hot_reply_ids'] = this.recentHotReplyIds;
    data['recent_like_list'] = this.recentLikeList;
    data['related_dyh_ids'] = this.relatedDyhIds;
    data['post_signature'] = this.postSignature;
    data['message_signature'] = this.messageSignature;
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
    if (this.replyRows != null) {
      data['replyRows'] = this.replyRows.map((v) => v.toJson()).toList();
    }
    data['replyRowsCount'] = this.replyRowsCount;
    data['replyRowsMore'] = this.replyRowsMore;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    if (this.relationRows != null) {
      data['relationRows'] = this.relationRows.map((v) => v.toJson()).toList();
    }
    data['pickType'] = this.pickType;
    data['_tid'] = this.iTid;
    data['extraData'] = this.extraData;
    return data;
  }
}

class ReplyRows {
  int id;
  int ftype;
  int fid;
  int rid;
  int rrid;
  int uid;
  String username;
  int ruid;
  String rusername;
  String pic;
  String message;
  int replynum;
  int likenum;
  int burynum;
  int reportnum;
  int rankScore;
  int dateline;
  int lastupdate;
  int isFolded;
  int status;
  int messageStatus;
  int blockStatus;
  String recentReplyIds;
  int feedUid;
  String fetchType;
  int entityId;
  String avatarFetchType;
  String userAvatar;
  String entityTemplate;
  String entityType;
  String infoHtml;
  int isFeedAuthor;
  String extraFlag;

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
      this.isFeedAuthor,
      this.extraFlag});

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
    extraFlag = json['extraFlag'];
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
    data['extraFlag'] = this.extraFlag;
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

class RelationRows {
  int id;
  String logo;
  String title;
  String url;
  String entityType;

  RelationRows({this.id, this.logo, this.title, this.url, this.entityType});

  RelationRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    title = json['title'];
    url = json['url'];
    entityType = json['entityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['title'] = this.title;
    data['url'] = this.url;
    data['entityType'] = this.entityType;
    return data;
  }
}
