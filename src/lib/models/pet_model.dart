
import 'package:flutter/material.dart';

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
