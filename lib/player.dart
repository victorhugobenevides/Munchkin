class Player {
  Player({required this.name, required this.level, required this.power, required this.gender});

  String name;
  int level;
  int power;
  Gender gender;
  int get total => level + power;
}

enum Gender {
  male,
  female,
}
