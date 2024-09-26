
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/screens/home_screen.dart';
import 'package:your_app_name/cubits/pet_cubit.dart';
import 'package:your_app_name/models/pet_model.dart';

class MockPetCubit extends MockCubit<PetState> implements PetCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late PetCubit petCubit;

		setUp(() {
			petCubit = MockPetCubit();
		});

		testWidgets('displays "Cat" with a clock icon initially', (WidgetTester tester) async {
			when(() => petCubit.state).thenReturn(PetState(pet: PetModel(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles to "Dog" with a person icon when tapped', (WidgetTester tester) async {
			whenListen(
				petCubit,
				Stream.fromIterable([
					PetState(pet: PetModel(name: 'Cat', icon: Icons.access_time)),
					PetState(pet: PetModel(name: 'Dog', icon: Icons.person)),
				]),
				initialState: PetState(pet: PetModel(name: 'Cat', icon: Icons.access_time)),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});

	group('HomeScreen Cubit Tests', () {
		blocTest<PetCubit, PetState>(
			'emits [PetState(pet: PetModel(name: "Dog", icon: Icons.person))] when togglePet is called',
			build: () => PetCubit(),
			act: (cubit) => cubit.togglePet(),
			expect: () => [
				PetState(pet: PetModel(name: 'Dog', icon: Icons.person)),
			],
		);

		blocTest<PetCubit, PetState>(
			'emits [PetState(pet: PetModel(name: "Cat", icon: Icons.access_time))] when togglePet is called twice',
			build: () => PetCubit(),
			act: (cubit) {
				cubit.togglePet();
				cubit.togglePet();
			},
			expect: () => [
				PetState(pet: PetModel(name: 'Dog', icon: Icons.person)),
				PetState(pet: PetModel(name: 'Cat', icon: Icons.access_time)),
			],
		);
	});
}
