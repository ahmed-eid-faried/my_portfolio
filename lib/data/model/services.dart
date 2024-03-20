class Service {
  String? servicesId;
  String? servicesTitle;
  String? servicesBody;
  String? servicesAssets;
  String? servicesType;

  Service(
      {this.servicesId,
      this.servicesTitle,
      this.servicesBody,
      this.servicesAssets,
      this.servicesType});

  Service.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    servicesTitle = json['services_title'];
    servicesBody = json['services_body'];
    servicesAssets = json['services_assets'];
    servicesType = json['services_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['services_id'] = servicesId;
    data['services_title'] = servicesTitle;
    data['services_body'] = servicesBody;
    data['services_assets'] = servicesAssets;
    data['services_type'] = servicesType;
    return data;
  }
}
