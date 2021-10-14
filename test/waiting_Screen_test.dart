import 'package:flutter_test/flutter_test.dart';
import 'package:trancentum_web_app/global_widgets/waiting_screen.dart';

void main() {
  testWidgets('MyWidget has a text', (WidgetTester tester) async {
    await tester.pumpWidget(const WaitingScreen(
      text: "Loading....",
    ));
    final textFinder = find.text('Loading....');
    expect(textFinder, findsOneWidget);

  });
}
