import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/screens/menu_screen.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
  });

  group('App smoke tests', () {
    testWidgets('App displays MenuScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.text('Movie Menu'), findsOneWidget);
    });

    testWidgets('Displays movie cards with names and prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.text('Deadpool vs wolverine'), findsOneWidget);
      expect(find.text('Ali G, who iz i'), findsOneWidget);
      expect(find.text('£5.00'), findsNWidgets(2));
      expect(find.text('15'), findsOneWidget);
      expect(find.text('18'), findsOneWidget);
      expect(find.text('add to basket'), findsNWidgets(2));
    });
  });
}