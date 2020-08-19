class Fotos{

  //Hecho en caso de que sean muchas fotos, pero solo recibiremos una.

  List<Foto> listaFotos = new List();

  Fotos.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null) return;

    jsonList.map((fotico){

      final foto = new Foto.fromJson(fotico);
      listaFotos.add(foto);

    }).toList();

  }


}


class Foto {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String altDescription;
  Urls urls;
  Links links;
  int likes;
  Exif exif;
  int views;
  int downloads;

  Foto(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.width,
      this.height,
      this.color,
      this.altDescription,
      this.urls,
      this.links,
      this.likes,
      this.exif,
      this.views,
      this.downloads});

  Foto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    likes = json['likes'];
    exif = json['exif'] != null ? new Exif.fromJson(json['exif']) : null;
    views = json['views'];
    downloads = json['downloads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['likes'] = this.likes;
    if (this.exif != null) {
      data['exif'] = this.exif.toJson();
    }
    data['views'] = this.views;
    data['downloads'] = this.downloads;
    return data;
  }


  getFotoUrl(){

    String holder = 'https://gbaproducts.com/wp-content/uploads/2017/11/img-placeholder-dark-vertical.jpg';

    if(urls.regular == null || urls.regular == '') return holder;

    return urls.regular;

    }

}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Links {
  String self;
  String html;
  String download;
  String downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['download'] = this.download;
    data['download_location'] = this.downloadLocation;
    return data;
  }
}

class Exif {
  String make;
  String model;
  String exposureTime;
  String aperture;
  String focalLength;
  int iso;

  Exif(
      {this.make,
      this.model,
      this.exposureTime,
      this.aperture,
      this.focalLength,
      this.iso});

  Exif.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    model = json['model'];
    exposureTime = json['exposure_time'];
    aperture = json['aperture'];
    focalLength = json['focal_length'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    data['model'] = this.model;
    data['exposure_time'] = this.exposureTime;
    data['aperture'] = this.aperture;
    data['focal_length'] = this.focalLength;
    data['iso'] = this.iso;
    return data;
  }




}
