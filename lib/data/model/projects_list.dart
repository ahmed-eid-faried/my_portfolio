class Project {
  String? plId;
  String? plTitle;
  String? plBody;
  String? plImage;
  String? plGoogleplay;
  String? plAppstore;
  String? plGithub;
  String? plDoc;
  String? plPackage;
  String? plCli;
  String? plEmbedded;
  String? plLinux;
  String? plWindows;
  String? plMacos;
  String? plWeb;

  Project(
      {this.plId,
      this.plTitle,
      this.plBody,
      this.plImage,
      this.plGoogleplay,
      this.plAppstore,
      this.plGithub,
      this.plDoc,
      this.plPackage,
      this.plCli,
      this.plEmbedded,
      this.plLinux,
      this.plWindows,
      this.plWeb,
      this.plMacos});

  Project.fromJson(Map<String, dynamic> json) {
    plId = json['pl_id'];
    plTitle = json['pl_title'];
    plBody = json['pl_body'];
    plImage = json['pl_image'];
    plGoogleplay = json['pl_googleplay'];
    plAppstore = json['pl_appstore'];
    plGithub = json['pl_github'];
    plDoc = json['pl_doc'];
    plPackage = json['pl_package'];
    plCli = json['pl_cli'];
    plEmbedded = json['pl_embedded'];
    plLinux = json['pl_linux'];
    plWindows = json['pl_windows'];
    plMacos = json['pl_macos'];
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
    data['pl_package'] = plPackage;
    data['pl_cli'] = plCli;
    data['pl_embedded'] = plEmbedded;
    data['pl_linux'] = plLinux;
    data['pl_windows'] = plWindows;
    data['pl_macos'] = plMacos;
    data['pl_web'] = plWeb;
    return data;
  }
}
