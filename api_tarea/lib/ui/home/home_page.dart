import 'package:api_tarea/models/characte.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/api/api_service.dart';
import '/api/data_state.dart';
import 'characters_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rick and Morty'),
      ),
      body: FutureProvider<DataState<List<Character>>>(
        create: (ctx) {
          final apiService = Provider.of<ApiService>(ctx, listen: false);
          return apiService.getCharacters();
        },
        initialData: DataState(loading: true),
        child: Consumer<DataState<List<Character>>>(
          builder: (ctx, data, _) {
            if (data.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.error != null) {
              return Center(child: Text('Error: ${data.error}'));
            } else {
              return CharactersList(characters: data.data!);
            }
          },
        ),
      ),
    );
  }
}
