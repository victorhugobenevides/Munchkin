import 'package:flutter/material.dart';
import 'package:munchkin/models/player.dart';
import '../configs/app_localizations.dart';

class SummaryDialog extends StatelessWidget {
  const SummaryDialog({
    Key? key,
    required this.players,
    required this.onClose,
  }) : super(key: key);

  final List<Player> players;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.getString('summaryDialogTitle'),
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text(AppLocalizations.of(context)!.getString('playerNameLabel')),
                  ),
                  DataColumn(
                    label: Text(AppLocalizations.of(context)!.getString('totalLabel')),
                  ),
                ],
                rows: players
                    .map(
                      (player) => DataRow(
                    cells: [
                      DataCell(Text(player.name)),
                      DataCell(Text('${player.total}')),
                    ],
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onClose,
            child: Text(
              AppLocalizations.of(context)!.getString('closeButtonLabel'),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
