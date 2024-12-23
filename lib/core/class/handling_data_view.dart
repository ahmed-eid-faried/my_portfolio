import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataViewScaffold extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  final bool view;
  final bool paddingOfflineViewDataWidget;
  const HandlingDataViewScaffold({
    super.key,
    required this.statusRequest,
    required this.child,
    this.view = false,
    this.paddingOfflineViewDataWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HandlingDataView(
            statusRequest: statusRequest,
            paddingOfflineViewDataWidget: paddingOfflineViewDataWidget,
            view: view,
            child: child));
  }
}

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  final bool view;
  final bool paddingOfflineViewDataWidget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.child,
    this.view = false,
    this.paddingOfflineViewDataWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Center(child: Lottie.asset(AppAssets.loading));
      case StatusRequest.offlinefailure:
        return Center(child: Lottie.asset(AppAssets.offline));
      case StatusRequest.offlineViewData:
        return OfflineViewDataWidget(
            paddingOfflineViewDataWidget: paddingOfflineViewDataWidget,
            child: child);
      case StatusRequest.serverfailure:
        return Center(child: Lottie.asset(AppAssets.server));
      case StatusRequest.failure:
        return view == true
            ? Center(child: Lottie.asset(AppAssets.noData))
            : child;
      default:
        return child;
    }
  }
}

class OfflineViewDataWidget extends StatelessWidget {
  const OfflineViewDataWidget({
    super.key,
    required this.child,
    required this.paddingOfflineViewDataWidget,
  });

  final Widget child;
  final bool paddingOfflineViewDataWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 60),
          child: child,
        ),
        Positioned(
          top: 5,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.primaryColor,
            ),
            margin: EdgeInsets.only(
              top: paddingOfflineViewDataWidget ? 30 : 0,
              bottom: 10,
              right: paddingOfflineViewDataWidget ? 0 : 15,
              left: paddingOfflineViewDataWidget ? 0 : 15,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.network_check_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text("YOU ARE OFFLINE",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
