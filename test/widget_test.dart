import 'package:flutter_test/flutter_test.dart';
import 'package:globaltechnologie_app/main.dart';
import 'package:globaltechnologie_app/screens/accueil.dart';

void main() {
  testWidgets('Accueil screen loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const GlobalTechnologieApp());
    await tester.pumpAndSettle(); // attend que l’UI soit stable

    // Vérifie que le texte "GlobalTechnologie" est bien affiché
    expect(find.text('GlobalTechnologie'), findsOneWidget);

    // Vérifie que le widget d’accueil est bien présent
    expect(find.byType(AccueilGlobalTechnologie), findsOneWidget);
  });
}
