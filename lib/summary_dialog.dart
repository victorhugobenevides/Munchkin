import 'package:flutter/material.dart';
import 'app_localizations.dart';
import 'summary_item.dart';

class SummaryDialog extends StatelessWidget {
  const SummaryDialog({
    Key? key,
    required this.summaries,
    required this.onClose,
  }) : super(key: key);

  final List<SummaryItem> summaries;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.getString('summaryDialogTitle')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DataTable(
              columns: [
                DataColumn(
                  label: Text(AppLocalizations.of(context)!.getString('playerNameLabel')),
                ),
                DataColumn(
                  label: Text(AppLocalizations.of(context)!.getString('totalLabel')),
                ),
              ],
              rows: summaries
                  .map(
                    (summary) => DataRow(
                  cells: [
                    DataCell(Text(summary.player.name)),
                    DataCell(Text('${summary.player.total}')),
                  ],
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onClose,
          child: Text(
            AppLocalizations.of(context)!.getString('closeButtonLabel'),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
