
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:simple_pet_app/main.dart';

class MockPetCubit extends MockCubit<PetState> implements PetCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('displays HomeScreen on app launch', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
