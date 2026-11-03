// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/my_app.dart';
import 'package:food_delivery_app/screens/onboarding/screen/onboarding_screen_1.dart';

void main() {
  testWidgets('App renders onboarding screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Onboardingscreen is present.
    expect(find.byType(Onboardingscreen1()), findsOneWidget);
  });
}
