import 'package:flutter_test/flutter_test.dart';
import 'package:shadow_system/main.dart';

void main() {
  testWidgets('ShadowSystem Status and Daily Quest navigation & toggle test',
      (WidgetTester tester) async {
    // Build ShadowSystemApp and trigger a frame.
    await tester.pumpWidget(const ShadowSystemApp());
    await tester.pumpAndSettle();

    // 1. Verify Status Window elements
    expect(find.text('STATUS WINDOW'), findsOneWidget);
    expect(find.text('TUSHAR MANKAR'), findsOneWidget);
    expect(find.text('RANK E'), findsOneWidget);
    expect(find.text('CORE ATTRIBUTES'), findsOneWidget);

    // 2. Switch to Daily Quests tab via Bottom Navigation
    await tester.tap(find.text('QUESTS'));
    await tester.pumpAndSettle();

    // Verify Quest Screen elements
    expect(find.text('DAILY QUESTS'), findsOneWidget);
    expect(find.text('Physical Conditioning'), findsOneWidget);
    expect(find.text('Technical Awakening'), findsOneWidget);
    expect(find.text('Iron Boundaries'), findsOneWidget);
    expect(find.text('0 / 3 COMPLETED'), findsOneWidget);

    // 3. Toggle the first quest (Physical Conditioning)
    await tester.tap(find.text('Physical Conditioning'));
    await tester.pumpAndSettle();

    // Verify progress updated to 1 / 3 COMPLETED
    expect(find.text('1 / 3 COMPLETED'), findsOneWidget);
  });
}
