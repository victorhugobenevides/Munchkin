import 'package:flutter/material.dart';
import 'package:munchkin/configs/app_localizations.dart';
import 'package:munchkin/models/player.dart';
import 'package:munchkin/dialogs/create_player_dialog.dart';
import 'package:munchkin/player_widget.dart';

import 'dialogs/summary_dialog.dart';

class MunchkinHomePage extends StatefulWidget {
  const MunchkinHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MunchkinHomePageState createState() => _MunchkinHomePageState();
}

class _MunchkinHomePageState extends State<MunchkinHomePage> {
  final List<Player> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];

          return PlayerWidget(
            player: player,
            onPowerIncrement: () {
              setState(() {
                player.power++;
              });
            },
            onPowerDecrement: () {
              setState(() {
                if (player.power > 0) {
                  player.power--;
                }
              });
            },
            onLevelIncrement: () {
              setState(() {
                player.level++;
              });
            },
            onLevelDecrement: () {
              setState(() {
                if (player.level > 0) {
                  player.level--;
                }
              });
            },
            onGenderChanged: (gender) {
              setState(() {
                player.gender = gender;
              });
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _showCreatePlayerDialog,
            tooltip: AppLocalizations.of(context)!.getString('addPlayerButtonTooltip'),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _showSummaryDialog,
            tooltip: AppLocalizations.of(context)!.getString('summaryButtonTooltip'),
            child: const Icon(Icons.calculate),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showCreatePlayerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CreatePlayerDialog(
          onPlayerCreated: _addPlayer,
        );
      },
    );
  }

  void _addPlayer(Player player) {
    setState(() {
      players.add(player);
    });
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SummaryDialog(
          players: players,
          onClose: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
