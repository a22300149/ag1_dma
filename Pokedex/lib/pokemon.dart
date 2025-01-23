class POKEMON {
  List<Pokemon>? pokemon;

  POKEMON({this.pokemon});

  POKEMON.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  int? id;
  String? name;
  List<String>? type;
  String? img;
  String? description;
  double? height;
  double? weight;
  List<String>? abilities;
  Stats? stats;
  List<String>? evolutions;
  List<String>? eggGroups;
  String? habitat;
  double? captureRate;
  int? baseExperience;
  List<Moves>? moves;
  String? candy;
  int? candyCount;
  double? spawnChance; // Cambiado a double?
  double? avgSpawns;   // Cambiado a double?
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;

  Pokemon(
      {this.id,
        this.name,
        this.type,
        this.img,
        this.description,
        this.height,
        this.weight,
        this.abilities,
        this.stats,
        this.evolutions,
        this.eggGroups,
        this.habitat,
        this.captureRate,
        this.baseExperience,
        this.moves,
        this.candy,
        this.candyCount,
        this.spawnChance,
        this.avgSpawns,
        this.spawnTime,
        this.multipliers,
        this.weaknesses});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'].cast<String>();
    img = json['img'];
    description = json['description'];

    // Conversión segura para height y weight
    height = _convertToDouble(json['height']);
    weight = _convertToDouble(json['weight']);

    abilities = json['abilities'].cast<String>();
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    evolutions = json['evolutions'].cast<String>();
    eggGroups = json['egg_groups'].cast<String>();
    habitat = json['habitat'];

    // Conversión segura para captureRate
    captureRate = _convertToDouble(json['capture_rate']);

    baseExperience = json['base_experience'];

    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }

    candy = json['candy'];
    candyCount = json['candy_count'];

    // Conversión segura para spawnChance y avgSpawns
    spawnChance = _convertToDouble(json['spawn_chance']);
    avgSpawns = _convertToDouble(json['avg_spawns']);

    spawnTime = json['spawn_time'];

    // Conversión segura para multipliers
    if (json['multipliers'] != null) {
      multipliers = <double>[];
      json['multipliers'].forEach((v) {
        multipliers!.add(_convertToDouble(v)!);
      });
    }

    weaknesses = json['weaknesses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['img'] = this.img;
    data['description'] = this.description;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['abilities'] = this.abilities;
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    data['evolutions'] = this.evolutions;
    data['egg_groups'] = this.eggGroups;
    data['habitat'] = this.habitat;
    data['capture_rate'] = this.captureRate;
    data['base_experience'] = this.baseExperience;
    if (this.moves != null) {
      data['moves'] = this.moves!.map((v) => v.toJson()).toList();
    }
    data['candy'] = this.candy;
    data['candy_count'] = this.candyCount;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    return data;
  }

  // Función para convertir valores a double
  double? _convertToDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return null;
  }
}


class Stats {
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;

  Stats(
      {this.hp,
        this.attack,
        this.defense,
        this.specialAttack,
        this.specialDefense,
        this.speed});

  Stats.fromJson(Map<String, dynamic> json) {
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hp'] = this.hp;
    data['attack'] = this.attack;
    data['defense'] = this.defense;
    data['special_attack'] = this.specialAttack;
    data['special_defense'] = this.specialDefense;
    data['speed'] = this.speed;
    return data;
  }
}

class Moves {
  String? moveName;
  int? levelLearnedAt;
  String? moveType;
  int? power;
  int? accuracy;

  Moves(
      {this.moveName,
        this.levelLearnedAt,
        this.moveType,
        this.power,
        this.accuracy});

  Moves.fromJson(Map<String, dynamic> json) {
    moveName = json['move_name'];
    levelLearnedAt = json['level_learned_at'];
    moveType = json['move_type'];
    power = json['power'];
    accuracy = json['accuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['move_name'] = this.moveName;
    data['level_learned_at'] = this.levelLearnedAt;
    data['move_type'] = this.moveType;
    data['power'] = this.power;
    data['accuracy'] = this.accuracy;
    return data;
  }
}
