// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
part 'home_local_storage.g.dart';

@HiveType(typeId: 0)
class HomeLocalStorage {
  @HiveField(0)
  final String district;
  @HiveField(1)
  final String taluk;
  @HiveField(2)
  final String firka;
  @HiveField(3)
  final String fpsNo;
  @HiveField(4)
  final String lastInDate;
  @HiveField(5)
  final String? prInspector;
  @HiveField(6)
  final String? prPosiction;
  @HiveField(7)
  final String? inspectionDate;

  HomeLocalStorage({
    required this.district,
    required this.taluk,
    required this.firka,
    required this.fpsNo,
    required this.lastInDate,
    required this.inspectionDate,
    this.prInspector,
    this.prPosiction,
  });
}

const String boxname = "inspection";
