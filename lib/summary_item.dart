import 'package:flutter/material.dart';
import 'player.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({Key? key, required this.player}) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('Player Name'),
          ),
          DataColumn(
            label: Text('Total'),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(Text(player.name)),
              DataCell(Text('${player.total}')),
            ],
          ),
        ],
      ),
    );
  }
}
