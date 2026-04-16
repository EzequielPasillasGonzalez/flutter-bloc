import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:blocs_app/presentation/screens/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usernameCubit = context.watch<UsernameCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
          child:
              // Con blocBuilder, solo este bloque de codigo esta pendiente del bloc
              BlocBuilder<UsernameCubit, String>(
        buildWhen: (previous, current) =>
            previous !=
            current, // solo se construye cuando el estado anterior cambio
        builder: (context, state) {
          return Text(state);
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
          // usernameCubit.setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
