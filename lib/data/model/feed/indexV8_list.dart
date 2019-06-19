class IndexV8List {
  List<Data> data;
  Map<String, dynamic> source;

  IndexV8List({this.data});

  IndexV8List.fromJson(Map<String, dynamic> json) {
    source = json;
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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