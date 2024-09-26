
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/pet_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple Pet App',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: BlocProvider(
				create: (context) => PetCubit(),
				child: HomeScreen(),
			),
		);
	}
}
