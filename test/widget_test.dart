import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:park_to/main.dart';

void main() {
  testWidgets('shows the parking screen while loading', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ParkToApp());

    expect(find.text('Parcheggi'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
