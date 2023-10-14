import 'package:my_portfolio/data/model/home_detials.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/data/model/services.dart';
import 'package:my_portfolio/data/model/social_media.dart';

class MyPortfolioModel {
  String? status;
  List<SocialMedia>? socialMedia;
  List<ProjectsList>? projectsList;
  List<HomeDetials>? homeDetials;
  List<Services>? services;

  MyPortfolioModel(
      {this.status,
      this.socialMedia,
      this.projectsList,
      this.homeDetials,
      this.services});

  MyPortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
    if (json['projects_list'] != null) {
      projectsList = <ProjectsList>[];
      json['projects_list'].forEach((v) {
        projectsList!.add(ProjectsList.fromJson(v));
      });
    }
    if (json['home_detials'] != null) {
      homeDetials = <HomeDetials>[];
      json['home_detials'].forEach((v) {
        homeDetials!.add(HomeDetials.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    if (projectsList != null) {
      data['projects_list'] = projectsList!.map((v) => v.toJson()).toList();
    }
    if (homeDetials != null) {
      data['home_detials'] = homeDetials!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
