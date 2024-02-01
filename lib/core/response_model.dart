class ResponseModel {
  Photos? photos;
  String? stat;

  ResponseModel({this.photos, this.stat});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    photos =
        json['photos'] != null ? Photos.fromJson(json['photos']) : null;
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.toJson();
    }
    data['stat'] = stat;
    return data;
  }
}

class Photos {
  int? page;
  int? pages;
  int? perpage;
  int? total;
  List<Photo>? photo;

  Photos({this.page, this.pages, this.perpage, this.total, this.photo});

  Photos.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perpage = json['perpage'];
    total = json['total'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pages'] = pages;
    data['perpage'] = perpage;
    data['total'] = total;
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  String? id;
  String? owner;
  String? secret;
  String? server;
  int? farm;
  String? title;
  int? ispublic;
  int? isfriend;
  int? isfamily;
  String? urlO;
  int? heightO;
  int? widthO;

  Photo(
      {this.id,
      this.owner,
      this.secret,
      this.server,
      this.farm,
      this.title,
      this.ispublic,
      this.isfriend,
      this.isfamily,
      this.urlO,
      this.heightO,
      this.widthO});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    secret = json['secret'];
    server = json['server'];
    farm = json['farm'];
    title = json['title'];
    ispublic = json['ispublic'];
    isfriend = json['isfriend'];
    isfamily = json['isfamily'];
    urlO = json['url_o'];
    heightO = json['height_o'];
    widthO = json['width_o'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner'] = owner;
    data['secret'] = secret;
    data['server'] = server;
    data['farm'] = farm;
    data['title'] = title;
    data['ispublic'] = ispublic;
    data['isfriend'] = isfriend;
    data['isfamily'] = isfamily;
    data['url_o'] = urlO;
    data['height_o'] = heightO;
    data['width_o'] = widthO;
    return data;
  }
}
