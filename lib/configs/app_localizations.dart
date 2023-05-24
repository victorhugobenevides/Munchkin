import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Munchkin Level Power Tracker',
      'addPlayerButtonTooltip': 'Add Player',
      'summaryButtonTooltip': 'Summary',
      'addPlayerDialogTitle': 'Add Player',
      'playerNameLabel': 'Player Name',
      'playerNameValidationError': 'Please enter a player name',
      'maleLabel': 'Male',
      'femaleLabel': 'Female',
      'selectedGenderLabel': 'Selected Gender',
      'cancelButtonLabel': 'Cancel',
      'addButtonLabel': 'Add',
      'summaryDialogTitle': 'Summary',
      'totalLabel': 'Total',
      'closeButtonLabel': 'Close',
      'changeGenderDialogTitle': 'Change Gender',
      'levelLabel': 'Level',
      'powerLabel': 'Power',
      'battleSimulatorDialogTitle': 'Battle Simulator',
      'selectPlayer1Label': 'Select Player 1',
      'selectPlayer2Label': 'Select Player 2',
      'simulateButtonLabel': 'Simulate',
    },
  };

  String getString(String key) {
    return _localizedValues[locale.languageCode]![key] ?? '';
  }
}
