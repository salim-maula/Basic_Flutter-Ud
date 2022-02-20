import 'package:flutter_only/db/db_animal.dart';

class Animal {
  String name;
  String image;
  int foot;
  String move;
  double weight;

  Animal({
    this.image,
    this.name,
    this.foot,
    this.move,
    this.weight,
  });

  //disini kita akan mengconvert dari map to Object
  factory Animal.fromMap(Map<String, dynamic> map) => Animal(
        image: map[DBAnimal.COLUMN_IMAGE],
        move: map[DBAnimal.COLUMN_MOVE],
        name: map[DBAnimal.COLUMN_NAME],
        weight: map[DBAnimal.COLUMN_WEIGHT],
      );

  Map<String, dynamic> toMap() => {
        DBAnimal.COLUMN_IMAGE: image,
        DBAnimal.COLUMN_MOVE: move,
        DBAnimal.COLUMN_NAME: name,
        DBAnimal.COLUMN_WEIGHT: weight,
      };
}

String _assetAnimal = 'asset/image/animal';

final listAnimal = [
  Animal(
    image: '$_assetAnimal/birds.jfif',
    move: 'Fly',
    name: 'Bird',
    weight: 2.3,
  ),
  Animal(
    image: '$_assetAnimal/cat.jfif',
    move: 'Walk',
    name: 'Cat',
    weight: 1.3,
  ),
  Animal(
    image: '$_assetAnimal/elephant.jfif',
    move: 'Walk',
    name: 'Elephant',
    weight: 100.20,
  ),
  Animal(
    image: '$_assetAnimal/monkey.jfif',
    move: 'Walk',
    name: 'Monkey',
    weight: 9.4,
  ),
  Animal(
    image: '$_assetAnimal/panda.jfif',
    move: 'Walk',
    name: 'Panda',
    weight: 90.9,
  ),
  Animal(
    image: '$_assetAnimal/tiger.jfif',
    move: 'Walk',
    name: 'Tiger',
    weight: 60.90,
  ),
];
