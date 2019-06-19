class IconMiniGridCard {
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

  IconMiniGridCard(
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

  IconMiniGridCard.fromJson(Map<String, dynamic> json) {
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
  int id;
  String hash;
  String title;
  String logo;
  String description;
  int commentnum;
  int follownum;
  int dateline;
  int lastupdate;
  String url;
  String entityType;
  int entityId;

  Entities(
      {this.id,
      this.hash,
      this.title,
      this.logo,
      this.description,
      this.commentnum,
      this.follownum,
      this.dateline,
      this.lastupdate,
      this.url,
      this.entityType,
      this.entityId});

  Entities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hash = json['hash'];
    title = json['title'];
    logo = json['logo'];
    description = json['description'];
    commentnum = json['commentnum'];
    follownum = json['follownum'];
    dateline = json['dateline'];
    lastupdate = json['lastupdate'];
    url = json['url'];
    entityType = json['entityType'];
    entityId = json['entityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hash'] = this.hash;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['commentnum'] = this.commentnum;
    data['follownum'] = this.follownum;
    data['dateline'] = this.dateline;
    data['lastupdate'] = this.lastupdate;
    data['url'] = this.url;
    data['entityType'] = this.entityType;
    data['entityId'] = this.entityId;
    return data;
  }
}
