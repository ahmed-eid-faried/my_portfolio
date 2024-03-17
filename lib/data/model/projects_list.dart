class ProjectsList {
  String? plId;
  String? plTitle;
  String? plBody;
  String? plImage;
  String? plGoogleplay;
  String? plAppstore;
  String? plGithub;
  String? plDoc;
  String? plWeb;

  ProjectsList({
    this.plId,
    this.plTitle,
    this.plBody,
    this.plImage,
    this.plGoogleplay,
    this.plAppstore,
    this.plGithub,
    this.plDoc,
    this.plWeb,
  });

  ProjectsList.fromJson(Map<String, dynamic> json) {
    plId = json['pl_id'];
    plTitle = json['pl_title'];
    plBody = json['pl_body'];
    plImage = json['pl_image'];
    plGoogleplay = json['pl_googleplay'];
    plAppstore = json['pl_appstore'];
    plGithub = json['pl_github'];
    plDoc = json['pl_doc'];
    plWeb = json['pl_web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pl_id'] = plId;
    data['pl_title'] = plTitle;
    data['pl_body'] = plBody;
    data['pl_image'] = plImage;
    data['pl_googleplay'] = plGoogleplay;
    data['pl_appstore'] = plAppstore;
    data['pl_github'] = plGithub;
    data['pl_doc'] = plDoc;
    data['pl_web'] = plWeb;
    return data;
  }
}
