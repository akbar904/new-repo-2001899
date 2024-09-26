
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/pet_model.dart';

void main() {
	group('PetModel', () {
		test('should create a PetModel with given name and icon', () {
			final petModel = PetModel(name: 'Cat', icon: Icons.pets);

			expect(petModel.name, 'Cat');
			expect(petModel.icon, Icons.pets);
		});

		test('should serialize PetModel to JSON', () {
			final petModel = PetModel(name: 'Cat', icon: Icons.pets);
			final json = petModel.toJson();

			expect(json['name'], 'Cat');
			expect(json['icon'], Icons.pets.codePoint);
		});

		test('should deserialize JSON to PetModel', () {
			final json = {'name': 'Cat', 'icon': Icons.pets.codePoint};
			final petModel = PetModel.fromJson(json);

			expect(petModel.name, 'Cat');
			expect(petModel.icon, Icons.pets);
		});
	});
}

class PetModel {
	final String name;
	final IconData icon;

	PetModel({required this.name, required this.icon});

	Map<String, dynamic> toJson() => {
		'name': name,
		'icon': icon.codePoint,
	};

	static PetModel fromJson(Map<String, dynamic> json) => PetModel(
		name: json['name'],
		icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
	);
}
