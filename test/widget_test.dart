import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/menu_screen.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    await tester.pumpAndSettle();

    expect(find.byType(MenuScreen), findsOneWidget);
    expect(find.text('Movie Menu'), findsOneWidget);
  });

  group('App smoke tests', () {
    testWidgets('Displays movie cards with names and prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('Deadpool'), findsOneWidget);
      expect(find.textContaining('Ali G'), findsOneWidget);
      expect(find.textContaining('£'), findsNWidgets(2));
      expect(find.text('15'), findsOneWidget);
      expect(find.text('18'), findsOneWidget);
      // expect(find.textContaining('basket'), findsNWidgets(2));
    });
  });
}