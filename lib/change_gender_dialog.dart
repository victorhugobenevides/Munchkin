import 'package:flutter/material.dart';
import 'package:munchkin/app_localizations.dart';
import 'package:munchkin/player.dart';

class ChangeGenderDialog extends StatelessWidget {
  const ChangeGenderDialog({
    Key? key,
    required this.player,
    required this.onGenderChanged,
  }) : super(key: key);

  final Player player;
  final Function(Gender) onGenderChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.getString('changeGenderDialogTitle')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.male),
            title: Text(AppLocalizations.of(context)!.getString('maleLabel')),
            onTap: () {
              onGenderChanged(Gender.male);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.female),
            title: Text(AppLocalizations.of(context)!.getString('femaleLabel')),
            onTap: () {
              onGenderChanged(Gender.female);
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
  }
}
