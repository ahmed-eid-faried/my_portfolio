import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'my_app_scroll.dart';

void main() {
  testWidgets('finds a deep item in a long list', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyAppScroll(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}

// ///////////////////////////////////////