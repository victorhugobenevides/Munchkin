import 'package:flutter/material.dart';

import '../models/player.dart';

class Monster {
  String name;
  int power;

  Monster({required this.name, this.power = 0});
}

class BattleSimulationDialog extends StatefulWidget {
  final Player player;

  const BattleSimulationDialog({Key? key, required this.player}) : super(key: key);

  @override
  _BattleSimulationDialogState createState() => _BattleSimulationDialogState();
}

class _BattleSimulationDialogState extends State<BattleSimulationDialog> {
  Monster monster = Monster(name: 'Monster', power: 0);
  String winner = '';

  void simulateBattle() {
    final playerTotalPower = widget.player.power + widget.player.level;
    final monsterPower = monster.power;
    if (playerTotalPower > monsterPower) {
      winner = widget.player.name;
    } else if (playerTotalPower < monsterPower) {
      winner = monster.name;
    } else {
      winner = 'Draw';
    }
  }

  void incrementPlayerPower() {
    setState(() {
      widget.player.power++;
      simulateBattle();
    });
  }

  void decrementPlayerPower() {
    setState(() {
      if (widget.player.power + widget.player.level > 0) {
        widget.player.power--;
        simulateBattle();
      }
    });
  }

  void incrementMonsterPower() {
    setState(() {
      monster.power++;
      simulateBattle();
    });
  }

  void decrementMonsterPower() {
    setState(() {
      if (monster.power > 0) {
        monster.power--;
        simulateBattle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerTotalPower = widget.player.power + widget.player.level;

    return AlertDialog(
      title: const Text('Battle Simulation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Player: ${widget.player.name}',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 28,
                ),
                color: Colors.red,
                onPressed: decrementPlayerPower,
              ),
              Text(
                'Power: $playerTotalPower',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 28,
                ),
                color: Colors.green,
                onPressed: incrementPlayerPower,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Monster: ${monster.name}',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 28,
                ),
                color: Colors.red,
                onPressed: decrementMonsterPower,
              ),
              Text(
                'Power: ${monster.power}',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 28,
                ),
                color: Colors.green,
                onPressed: incrementMonsterPower,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Winner: $winner',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
