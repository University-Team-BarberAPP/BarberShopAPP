import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:barbershop/main.dart'; // Certifique-se de importar corretamente

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construa o aplicativo e gere um frame.
    await tester.pumpWidget(const MyApp()); // Alterado para BarbershopApp

    // Verifique se o contador começa em 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Toque no ícone '+' e gere um frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifique se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
