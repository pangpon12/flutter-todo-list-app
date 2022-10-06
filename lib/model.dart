import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Userdata {
  Userdata(
      {required this.name,
      required this.createdDate,
      required this.age,
      required this.phonenumber,
      required this.height,
      required this.weight,
      required this.bodymass,
      required this.pressure,
      required this.blood,
      required this.disease,
      required this.medicine});
  @HiveField(0)
  late String name;
  @HiveField(1)
  late DateTime createdDate;
  @HiveField(2)
  late int age;
  @HiveField(3)
  late int phonenumber;
  @HiveField(4)
  late int height;
  @HiveField(5)
  late int weight;
  @HiveField(6)
  late int bodymass;
  @HiveField(7)
  late int pressure;
  @HiveField(8)
  late int blood;
  @HiveField(9)
  late int disease;
  @HiveField(10)
  late int medicine;
}
