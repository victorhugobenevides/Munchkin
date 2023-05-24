import 'package:flutter/material.dart';
import 'package:munchkin/app_localizations.dart';
import 'package:munchkin/player.dart';
import 'package:munchkin/summary_dialog.dart';
import 'create_player_dialog.dart';
import 'player_viewmodel.dart';
import 'summary_item.dart';

class MunchkinHomePage extends StatefulWidget {
  const MunchkinHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MunchkinHomePageState createState() => _MunchkinHomePageState();
}

class _MunchkinHomePageState extends State<MunchkinHomePage> {
  final List<PlayerViewModel> players = [];

  void _addPlayer(Player player) {
    setState(() {
      players.add(PlayerViewModel(player: player));
    });
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
          final total = player.player.level + player.player.power;

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
                            player.player.gender == Gender.male ? Icons.male : Icons.female,
                            color: player.player.gender == Gender.male ? Colors.blue : Colors.pink,
                            size: 48,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            player.player.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(AppLocalizations.of(context)!.getString('changeGenderDialogTitle')),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.male),
                                      title: Text(AppLocalizations.of(context)!.getString('maleLabel')),
                                      onTap: () {
                                        setState(() {
                                          player.player.gender = Gender.male;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.female),
                                      title: Text(AppLocalizations.of(context)!.getString('femaleLabel')),
                                      onTap: () {
                                        setState(() {
                                          player.player.gender = Gender.female;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      AppLocalizations.of(context)!.getString('cancelButtonLabel'),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Icon(Icons.edit),
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
                              icon: const Icon(Icons.add_circle_outline),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  player.player.power++;
                                });
                              },
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.getString('powerLabel')}: ${player.player.power}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  if (player.player.power > 0) {
                                    player.player.power--;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  player.player.level++;
                                });
                              },
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.getString('levelLabel')}: ${player.player.level}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  if (player.player.level > 0) {
                                    player.player.level--;
                                  }
                                });
                              },
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
                              Icons.calculate,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${AppLocalizations.of(context)!.getString('totalLabel')}:',
                              style: const TextStyle(
                                fontSize: 12,
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
    void _showSummaryDialog() {
      showDialog(
        context: context,
        builder: (context) {
          final summaries = players.map((player) => SummaryItem(player: player.player)).toList();

          return SummaryDialog(
            summaries: summaries,
            onClose: () {
              Navigator.of(context).pop();
            },
          );
        },
      );
    }
  }
