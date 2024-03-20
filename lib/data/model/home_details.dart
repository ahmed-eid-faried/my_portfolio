class HomeDetails {
  String? hdId;
  String? hdName;
  String? hdDesc;
  String? hdImage;
  String? hdCv;
  String? hdAboutmename;
  String? hdAboutmedesc;

  HomeDetails(
      {this.hdId,
      this.hdName,
      this.hdDesc,
      this.hdImage,
      this.hdCv,
      this.hdAboutmename,
      this.hdAboutmedesc});

  HomeDetails.fromJson(Map<String, dynamic> json) {
    hdId = json['hd_id'];
    hdName = json['hd_name'];
    hdDesc = json['hd_desc'];
    hdImage = json['hd_image'];
    hdCv = json['hd_cv'];
    hdAboutmename = json['hd_aboutmename'];
    hdAboutmedesc = json['hd_aboutmedesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hd_id'] = hdId;
    data['hd_name'] = hdName;
    data['hd_desc'] = hdDesc;
    data['hd_image'] = hdImage;
    data['hd_cv'] = hdCv;
    data['hd_aboutmename'] = hdAboutmename;
    data['hd_aboutmedesc'] = hdAboutmedesc;
    return data;
  }
}
