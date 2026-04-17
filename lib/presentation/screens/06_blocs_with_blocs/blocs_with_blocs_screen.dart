import 'package:blocs_app/presentation/screens/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final geolocationCubit = context.watch<GelocationCubit>().state;
    final historyLocationBloc = context.watch<HistoryLocationBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Ubicaciones : ${historyLocationBloc.state.howManyLocation}'),
        ),
        body: ListView.builder(
          itemCount: historyLocationBloc.state.howManyLocation,
          itemBuilder: (context, index) {
            final location = historyLocationBloc.state.location[index];
            final (lat, lng) = location;

            return ListTile(title: Text('Lat: $lat, Lng: $lng'));
          },
        ));
  }
}
