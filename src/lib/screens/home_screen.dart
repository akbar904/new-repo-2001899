
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app_name/cubits/pet_cubit.dart';
import 'package:your_app_name/widgets/pet_text_widget.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Pet App'),
			),
			body: BlocProvider(
				create: (context) => PetCubit(),
				child: Center(
					child: PetTextWidget(),
				),
			),
		);
	}
}
