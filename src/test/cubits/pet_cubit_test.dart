
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:my_app/cubits/pet_cubit.dart';

// Mock PetCubit for testing
class MockPetCubit extends MockCubit<PetState> implements PetCubit {}

void main() {
	group('PetCubit', () {
		late PetCubit petCubit;

		setUp(() {
			petCubit = PetCubit();
		});

		tearDown(() {
			petCubit.close();
		});

		test('initial state is Cat', () {
			expect(petCubit.state, PetState(name: 'Cat', icon: Icons.pets));
		});

		blocTest<PetCubit, PetState>(
			'emits [Dog] when togglePet is called from Cat state',
			build: () => petCubit,
			act: (cubit) => cubit.togglePet(),
			expect: () => [PetState(name: 'Dog', icon: Icons.person)],
		);

		blocTest<PetCubit, PetState>(
			'emits [Cat] when togglePet is called from Dog state',
			build: () {
				petCubit.emit(PetState(name: 'Dog', icon: Icons.person));
				return petCubit;
			},
			act: (cubit) => cubit.togglePet(),
			expect: () => [PetState(name: 'Cat', icon: Icons.pets)],
		);
	});
}
