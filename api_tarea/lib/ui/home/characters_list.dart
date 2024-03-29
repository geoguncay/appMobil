import 'package:animations/animations.dart';
import 'package:api_tarea/models/characte.dart';
import 'package:flutter/material.dart';
import '../details/details_screen.dart';
import '/ui/home/character_item.dart';


class CharactersList extends StatelessWidget {
  const CharactersList({Key? key, required this.characters}) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (ctx, index) {
        final Character character = characters[index];
        return OpenContainer(
          tappable: false,
          closedElevation: 0,
          transitionDuration: const Duration(milliseconds: 500),
          transitionType: ContainerTransitionType.fade,
          openBuilder: (ctx, _) => DetailsScreen(character: character),
          closedBuilder: (ctx, openContainer) {
            return InkWell(
              onTap: () => openContainer(),
              child: Center (
                child: CharacterItem(character: character),
              ),
            );
          },
        );
      },
    );
  }
}
