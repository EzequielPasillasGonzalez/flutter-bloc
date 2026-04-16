import 'package:blocs_app/presentation/screens/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => UsernameCubit(),
        lazy:
            false, // En cuanto se define el provider, llama la construccion del mismo inmediatamente y no espera a que lo llamen
      ),
      BlocProvider(
        create: (context) => RouterSimplecubit(),
      ),
      BlocProvider(
        create: (context) => CounterCubit(),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.read<RouterSimplecubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}
