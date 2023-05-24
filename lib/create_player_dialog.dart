import 'package:flutter/material.dart';
import 'package:munchkin/app_localizations.dart';
import 'package:munchkin/player.dart';

class CreatePlayerDialog extends StatefulWidget {
  const CreatePlayerDialog({Key? key, required this.onPlayerCreated}) : super(key: key);

  final Function(Player) onPlayerCreated;

  @override
  _CreatePlayerDialogState createState() => _CreatePlayerDialogState();
}

class _CreatePlayerDialogState extends State<CreatePlayerDialog> {
  final formKey = GlobalKey<FormState>();
  var playerName = '';
  var playerGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.getString('addPlayerDialogTitle')),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.getString('playerNameLabel'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.getString('playerNameValidationError');
                    }
                    return null;
                  },
                  onSaved: (value) {
                    playerName = value!;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            playerGender = Gender.male;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: playerGender == Gender.male ? Colors.amber : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: playerGender == Gender.male ? Colors.white : Colors.black,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.getString('maleLabel'),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: playerGender == Gender.male ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            playerGender = Gender.female;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: playerGender == Gender.female ? Colors.amber : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: playerGender == Gender.female ? Colors.white : Colors.black,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context)!.getString('femaleLabel'),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: playerGender == Gender.female ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${AppLocalizations.of(context)!.getString('selectedGenderLabel')}: ${playerGender == Gender.male ? AppLocalizations.of(context)!.getString('maleLabel') : AppLocalizations.of(context)!.getString('femaleLabel')}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
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
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.getString('addButtonLabel'),
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              final player = Player(name: playerName, level: 1, power: 0, gender: playerGender);
              widget.onPlayerCreated(player);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
