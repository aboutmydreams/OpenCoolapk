class IconLinkGridCard {
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

  IconLinkGridCard(
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

  IconLinkGridCard.fromJson(Map<String, dynamic> json) {
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

class Entities {
  String entityType;
  String title;
  String url;
  String pic;

  Entities({this.entityType, this.title, this.url, this.pic});

  Entities.fromJson(Map<String, dynamic> json) {
    entityType = json['entityType'];
    title = json['title'];
    url = json['url'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entityType'] = this.entityType;
    data['title'] = this.title;
    data['url'] = this.url;
    data['pic'] = this.pic;
    return data;
  }
}

class IconLinkGridCardTypeDyh {
  String entityType;
  String entityTemplate;
  String title;
  String url;
  List<DyhEntities> entities;
  int entityId;
  int entityFixed;
  String pic;
  int lastupdate;
  String extraData;

  IconLinkGridCardTypeDyh(
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

  IconLinkGridCardTypeDyh.fromJson(Map<String, dynamic> json) {
    entityType = json['entityType'];
    entityTemplate = json['entityTemplate'];
    title = json['title'];
    url = json['url'];
    if (json['entities'] != null) {
      entities = new List<DyhEntities>();
      json['entities'].forEach((v) {
        entities.add(new DyhEntities.fromJson(v));
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

class DyhEntities {
  int id;
  String title;
  String description;
  int uid;
  String username;
  String rssType;
  String rssFormat;
  String logo;
  int follownum;
  int newsnum;
  int likenum;
  String newtitle;
  int createdate;
  int lastupdate;
  int status;
  String rssExtras;
  String rssTitleFormat;
  int isOpenContribute;
  int dyhType;
  int isOpenAdmin;
  int isOpenDiscuss;
  int isAllowDiscussNotice;
  String recentTopIds;
  String url;
  String entityType;
  int entityId;
  String entityTemplate;
  String author;
  String fromInfo;
  UserAction userAction;
  Unread unread;

  DyhEntities(
      {this.id,
      this.title,
      this.description,
      this.uid,
      this.username,
      this.rssType,
      this.rssFormat,
      this.logo,
      this.follownum,
      this.newsnum,
      this.likenum,
      this.newtitle,
      this.createdate,
      this.lastupdate,
      this.status,
      this.rssExtras,
      this.rssTitleFormat,
      this.isOpenContribute,
      this.dyhType,
      this.isOpenAdmin,
      this.isOpenDiscuss,
      this.isAllowDiscussNotice,
      this.recentTopIds,
      this.url,
      this.entityType,
      this.entityId,
      this.entityTemplate,
      this.author,
      this.fromInfo,
      this.userAction,
      this.unread});

  DyhEntities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    uid = json['uid'];
    username = json['username'];
    rssType = json['rss_type'];
    rssFormat = json['rss_format'];
    logo = json['logo'];
    follownum = json['follownum'];
    newsnum = json['newsnum'];
    likenum = json['likenum'];
    newtitle = json['newtitle'];
    createdate = json['createdate'];
    lastupdate = json['lastupdate'];
    status = json['status'];
    rssExtras = json['rss_extras'];
    rssTitleFormat = json['rss_title_format'];
    isOpenContribute = json['is_open_contribute'];
    dyhType = json['dyh_type'];
    isOpenAdmin = json['is_open_admin'];
    isOpenDiscuss = json['is_open_discuss'];
    isAllowDiscussNotice = json['is_allow_discuss_notice'];
    recentTopIds = json['recent_top_ids'];
    url = json['url'];
    entityType = json['entityType'];
    entityId = json['entityId'];
    entityTemplate = json['entityTemplate'];
    author = json['author'];
    fromInfo = json['fromInfo'];
    userAction = json['userAction'] != null
        ? new UserAction.fromJson(json['userAction'])
        : null;
    unread =
        json['unread'] != null ? new Unread.fromJson(json['unread']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['rss_type'] = this.rssType;
    data['rss_format'] = this.rssFormat;
    data['logo'] = this.logo;
    data['follownum'] = this.follownum;
    data['newsnum'] = this.newsnum;
    data['likenum'] = this.likenum;
    data['newtitle'] = this.newtitle;
    data['createdate'] = this.createdate;
    data['lastupdate'] = this.lastupdate;
    data['status'] = this.status;
    data['rss_extras'] = this.rssExtras;
    data['rss_title_format'] = this.rssTitleFormat;
    data['is_open_contribute'] = this.isOpenContribute;
    data['dyh_type'] = this.dyhType;
    data['is_open_admin'] = this.isOpenAdmin;
    data['is_open_discuss'] = this.isOpenDiscuss;
    data['is_allow_discuss_notice'] = this.isAllowDiscussNotice;
    data['recent_top_ids'] = this.recentTopIds;
    data['url'] = this.url;
    data['entityType'] = this.entityType;
    data['entityId'] = this.entityId;
    data['entityTemplate'] = this.entityTemplate;
    data['author'] = this.author;
    data['fromInfo'] = this.fromInfo;
    if (this.userAction != null) {
      data['userAction'] = this.userAction.toJson();
    }
    if (this.unread != null) {
      data['unread'] = this.unread.toJson();
    }
    return data;
  }
}

class UserAction {
  int follow;

  UserAction({this.follow});

  UserAction.fromJson(Map<String, dynamic> json) {
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['follow'] = this.follow;
    return data;
  }
}

class Unread {
  int num;
  String title;

  Unread({this.num, this.title});

  Unread.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['title'] = this.title;
    return data;
  }
}
