import 'package:flutter/material.dart';
import 'package:munchkin/configs/app_localizations.dart';
import 'package:munchkin/models/player.dart';
import 'package:munchkin/dialogs/change_gender_dialog.dart';
import 'package:munchkin/dialogs/battle_simulation_dialog.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    Key? key,
    required this.player,
    required this.onPowerIncrement,
    required this.onPowerDecrement,
    required this.onLevelIncrement,
    required this.onLevelDecrement,
    required this.onGenderChanged,
  }) : super(key: key);

  final Player player;
  final VoidCallback onPowerIncrement;
  final VoidCallback onPowerDecrement;
  final VoidCallback onLevelIncrement;
  final VoidCallback onLevelDecrement;
  final Function(Gender) onGenderChanged;

  @override
  Widget build(BuildContext context) {
    final total = player.level + player.power;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      player.gender == Gender.male ? Icons.male : Icons.female,
                      color: Colors.black,
                      size: 48,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      player.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return BattleSimulationDialog(
                              player: Player(name: player.name, level: player.level, power: player.power, gender: player.gender),
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.gavel,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChangeGenderDialog(
                              player: player,
                              onGenderChanged: onGenderChanged,
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.settings_suggest_sharp,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 28,
                        ),
                        color: Colors.green,
                        onPressed: onPowerIncrement,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.getString('powerLabel')}: ${player.power}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 28,
                        ),
                        color: Colors.red,
                        onPressed: onPowerDecrement,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 28,
                        ),
                        color: Colors.green,
                        onPressed: onLevelIncrement,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.getString('levelLabel')}: ${player.level}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 28,
                        ),
                        color: Colors.red,
                        onPressed: onLevelDecrement,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.bolt,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${AppLocalizations.of(context)!.getString('totalLabel')}:',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        total.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
