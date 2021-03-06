class Collection {
  int id;
  String title;
  String description;
  String publishedAt;
  String updatedAt;
  int totalPhotos;
  bool private;
  String shareKey;
  CoverPhoto coverPhoto;
  User user;
  Links links;

  Collection(
      {this.id,
      this.title,
      this.description,
      this.publishedAt,
      this.updatedAt,
      this.totalPhotos,
      this.private,
      this.shareKey,
      this.coverPhoto,
      this.user,
      this.links});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    totalPhotos = json['total_photos'];
    private = json['private'];
    shareKey = json['share_key'];
    coverPhoto = json['cover_photo'] != null
        ? new CoverPhoto.fromJson(json['cover_photo'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['published_at'] = this.publishedAt;
    data['updated_at'] = this.updatedAt;
    data['total_photos'] = this.totalPhotos;
    data['private'] = this.private;
    data['share_key'] = this.shareKey;
    if (this.coverPhoto != null) {
      data['cover_photo'] = this.coverPhoto.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }

  getImage(){

    String holder = 'https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png';

    if(coverPhoto.urls.small == null || coverPhoto.urls.small == '') return holder;

    return coverPhoto.urls.small;

  }


}

class CoverPhoto {
  String id;
  int width;
  int height;
  String color;
  int likes;
  bool likedByUser;
  String description;
  User user;
  Urls urls;
  Links links;

  CoverPhoto(
      {this.id,
      this.width,
      this.height,
      this.color,
      this.likes,
      this.likedByUser,
      this.description,
      this.user,
      this.urls,
      this.links});

  CoverPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    data['description'] = this.description;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class User {
  String id;
  String username;
  String name;
  String portfolioUrl;
  String bio;
  String location;
  int totalLikes;
  int totalPhotos;
  int totalCollections;
  ProfileImage profileImage;
  Links links;

  User(
      {this.id,
      this.username,
      this.name,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.totalLikes,
      this.totalPhotos,
      this.totalCollections,
      this.profileImage,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['total_collections'] = this.totalCollections;
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Links {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;

  Links({this.self, this.html, this.photos, this.likes, this.portfolio});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    return data;
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