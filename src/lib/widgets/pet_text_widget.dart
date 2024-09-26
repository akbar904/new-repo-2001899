
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_pet_app/cubits/pet_cubit.dart';

class PetTextWidget extends StatelessWidget {
	const PetTextWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<PetCubit, String>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<PetCubit>().togglePet(),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state),
							const SizedBox(width: 8),
							Icon(state == 'Cat' ? Icons.access_time : Icons.person),
						],
					),
				);
			},
		);
	}
}
