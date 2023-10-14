// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/main.dart';
import 'package:my_portfolio/test.dart';
// flutter test
// flutter test test/counter_test.dart
// flutter test --help
// flutter pub add dev:test
// flutter pub add http dev:mockito dev:build_runner
/////////////////////////////////////////
//counter_app/
//// lib/
////   counter.dart
//// test/
////   counter_test.dart

void main() {
  setUpAll(() {
    // This is called once before ALL tests
  });

  setUp(() {
    // This is called once before EVERY test
  });

  tearDownAll(() {
    // This is called once after ALL tests
  });

  tearDown(() {
    // This is called once after EVERY test
  });

  testWidgets(
    'Test description',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());
      expect(find.text('0'), findsNothing);
      expect(find.byKey(const ValueKey("value")), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(3));
      Widget widget = const Expanded(child: Text("data"));
      expect(find.byWidget(widget), findsWidgets);
      // ///////////////////////////////////////////
      await tester.enterText(find.byKey(const ValueKey("search")), "cv");
      await tester.pump();
      // ///////////////////////////////////////////
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      // ///////////////////////////////////////////
      expect(find.byType(NetworkImage), findsOneWidget);
      // ///////////////////////////////////////////
      // Swipe the item to dismiss it.
      await tester.drag(find.byType(Dismissible), const Offset(500, 0));
      // Build the widget until the dismiss animation ends.
      await tester.pumpAndSettle();
      // ///////////////////////////////////////////
      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
      ///////////
      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      ///////////
      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);

      //  tester.binding.addTime(Duration(seconds: 5));///xxx
    },
    variant: ColorVariant(),

    skip: true,
    timeout: const Timeout(Duration(seconds: 1)),
    // initialTimeout: Duration(seconds: 15),///xxxx
  );

  group("calclator", () {
    test('sum', () {
      expect(sum([1, 2, 3, 2.2, 4.4]), 12.6);
      expect(sum([0, 2, 4]), 6);
      expect(sum([-2, -4, 1]), -5);
    });

    test('product', () {
      expect(product([1, 2, 3]), 6);
      expect(product([0, 2]), 0);
      expect(product([-2, 4]), -8);
      expect(product([-2, -4]), 8);
    });
  });
}

enum WidgetColor {
  red,
  blue,
  green,
}

class ColorVariant extends TestVariant<WidgetColor> {
  @override
  String describeValue(WidgetColor value) {
    return value.toString();
  }

  @override
  Future<void> setUp(WidgetColor value) async {
    // Do setup here
  }

  @override
  Future<void> tearDown(WidgetColor value, covariant Object memento) async {
    // Do teardown here
  }

  @override
  // TODO: implement values
  Iterable<WidgetColor> get values => WidgetColor.values;
}
