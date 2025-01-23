class Pokemon {
  int id;
  String name;
  List<String> type;
  String img;
  String description;
  double height;
  double weight;
  List<String> abilities;
  Map<String, int> stats;
  List<String> evolutions;
  List<String> eggGroups;
  String habitat;
  int captureRate;
  int baseExperience;
  List<Move> moves;
  String candy;
  int candyCount;
  double spawnChance;
  int avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.img,
    required this.description,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.evolutions,
    required this.eggGroups,
    required this.habitat,
    required this.captureRate,
    required this.baseExperience,
    required this.moves,
    required this.candy,
    required this.candyCount,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var movesList = (json['moves'] as List)
        .map((moveJson) => Move.fromJson(moveJson))
        .toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      type: List<String>.from(json['type']),
      img: json['img'],
      description: json['description'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
      abilities: List<String>.from(json['abilities']),
      stats: Map<String, int>.from(json['stats']),
      evolutions: List<String>.from(json['evolutions']),
      eggGroups: List<String>.from(json['egg_groups']),
      habitat: json['habitat'],
      captureRate: json['capture_rate'],
      baseExperience: json['base_experience'],
      moves: movesList,
      candy: json['candy'],
      candyCount: json['candy_count'],
      spawnChance: json['spawn_chance'].toDouble(),
      avgSpawns: json['avg_spawns'],
      spawnTime: json['spawn_time'],
      multipliers: List<double>.from(json['multipliers']),
      weaknesses: List<String>.from(json['weaknesses']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'img': img,
      'description': description,
      'height': height,
      'weight': weight,
      'abilities': abilities,
      'stats': stats,
      'evolutions': evolutions,
      'egg_groups': eggGroups,
      'habitat': habitat,
      'capture_rate': captureRate,
      'base_experience': baseExperience,
      'moves': moves.map((move) => move.toJson()).toList(),
      'candy': candy,
      'candy_count': candyCount,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
    };
  }
}

class Move {
  String moveName;
  int levelLearnedAt;
  String moveType;
  int power;
  int accuracy;

  Move({
    required this.moveName,
    required this.levelLearnedAt,
    required this.moveType,
    required this.power,
    required this.accuracy,
  });


  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      moveName: json['move_name'],
      levelLearnedAt: json['level_learned_at'],
      moveType: json['move_type'],
      power: json['power'],
      accuracy: json['accuracy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'move_name': moveName,
      'level_learned_at': levelLearnedAt,
      'move_type': moveType,
      'power': power,
      'accuracy': accuracy,
    };
  }
}
