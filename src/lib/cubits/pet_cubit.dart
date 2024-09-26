
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// PetState class representing the state of the pet text
class PetState {
	final String name;
	final IconData icon;

	PetState({required this.name, required this.icon});
}

// PetCubit class managing the state of the pet text
class PetCubit extends Cubit<PetState> {
	PetCubit() : super(PetState(name: 'Cat', icon: Icons.pets));

	void togglePet() {
		if (state.name == 'Cat') {
			emit(PetState(name: 'Dog', icon: Icons.person));
		} else {
			emit(PetState(name: 'Cat', icon: Icons.pets));
		}
	}
}
