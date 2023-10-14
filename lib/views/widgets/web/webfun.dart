// import 'dart:html';
// import 'dart:ui_web';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// web(String viewType) {
//   return HtmlElementView(viewType: viewType);
// }

// webFun(asset) {
//   if (kIsWeb) {
//     platformViewRegistry.registerViewFactory(
//       asset,
//       (int _) {
//         final element = ImageElement()..src = asset;
//         element.style.width = '60px';
//         element.style.height = '60px';
//         return element;
//       },
//     );
//   }
// }

// webFunImage(asset) {
//   if (kIsWeb) {
//     platformViewRegistry.registerViewFactory(
//       asset,
//       (int _) {
//         final element = ImageElement()..src = asset;
//         element.style.width = '100%';
//         element.style.height = '100%';
//         element.style.borderRadius = "20px";
//         return element;
//       },
//     );
//   }
// }

// // webFun(asset) {}
// // web(String viewType) {}
// // webFunImage(asset) {}
