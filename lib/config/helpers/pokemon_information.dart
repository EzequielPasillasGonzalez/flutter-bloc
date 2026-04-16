import 'package:dio/dio.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio(BaseOptions(
      headers: {
        'user-agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
    ));
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'Nombre no se encontro';
    } catch (e) {
      return 'Nombre no pudo ser obtenido';
    }
  }
}
