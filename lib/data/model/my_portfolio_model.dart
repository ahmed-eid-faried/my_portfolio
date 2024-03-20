import 'package:my_portfolio/data/model/home_details.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/data/model/services.dart';
import 'package:my_portfolio/data/model/social_media.dart';

// class MyPortfolioModel {
//   String? status;
//   List<SocialMedia>? socialMedia;
//   List<Project>? projectsList;
//   List<HomeDetails>? homeDetials;
//   List<Service>? services;
//   MyPortfolioModel(
//       {this.status,
//       this.socialMedia,
//       this.projectsList,
//       this.homeDetials,
//       this.services});
//   MyPortfolioModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['social_media'] != null) {
//       socialMedia = <SocialMedia>[];
//       json['social_media'].forEach((v) {
//         socialMedia!.add(SocialMedia.fromJson(v));
//       });
//     }
//     if (json['projects_list'] != null) {
//       projectsList = <Project>[];
//       json['projects_list'].forEach((v) {
//         projectsList!.add(Project.fromJson(v));
//       });
//     }
//     if (json['home_detials'] != null) {
//       homeDetials = <HomeDetails>[];
//       json['home_detials'].forEach((v) {
//         homeDetials!.add(HomeDetails.fromJson(v));
//       });
//     }
//     if (json['services'] != null) {
//       services = <Service>[];
//       json['services'].forEach((v) {
//         services!.add(Service.fromJson(v));
//       });
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (socialMedia != null) {
//       data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
//     }
//     if (projectsList != null) {
//       data['projects_list'] = projectsList!.map((v) => v.toJson()).toList();
//     }
//     if (homeDetials != null) {
//       data['home_detials'] = homeDetials!.map((v) => v.toJson()).toList();
//     }
//     if (services != null) {
//       data['services'] = services!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Data {
  List<SocialMedia>? socialMedia;
  List<Project>? projectsList;
  List<HomeDetails>? homeDetials;
  List<Service>? services;

  Data({this.socialMedia, this.projectsList, this.homeDetials, this.services});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
    if (json['projects_list'] != null) {
      projectsList = <Project>[];
      json['projects_list'].forEach((v) {
        projectsList!.add(Project.fromJson(v));
      });
    }
    if (json['home_detials'] != null) {
      homeDetials = <HomeDetails>[];
      json['home_detials'].forEach((v) {
        homeDetials!.add(HomeDetails.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
