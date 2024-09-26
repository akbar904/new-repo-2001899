
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_pet_app/widgets/pet_text_widget.dart';

// Mock Cubit
class MockPetCubit extends MockCubit<String> implements PetCubit {}

void main() {
	group('PetTextWidget', () {
		late MockPetCubit mockPetCubit;

		setUp(() {
			mockPetCubit = MockPetCubit();
		});

		testWidgets('displays "Cat" with clock icon initially', (WidgetTester tester) async {
			when(() => mockPetCubit.state).thenReturn('Cat');

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetTextWidget(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays "Dog" with person icon when clicked', (WidgetTester tester) async {
			whenListen(
				mockPetCubit,
				Stream.fromIterable(['Cat', 'Dog']),
				initialState: 'Cat',
			);

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetTextWidget(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles text and icon when clicked', (WidgetTester tester) async {
			whenListen(
				mockPetCubit,
				Stream.fromIterable(['Cat', 'Dog', 'Cat']),
				initialState: 'Cat',
			);

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetTextWidget(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);

			await tester.tap(find.text('Dog'));
			await tester.pump();

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});
}
