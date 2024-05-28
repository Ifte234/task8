import 'package:hive/hive.dart';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


part 'my_data_model.g.dart';

@HiveType(typeId: 0)
class MyPage {
  @HiveField(0)
  final int? page;
  @HiveField(1)
  final int? per_page;
  @HiveField(2)
  final int? total;
  @HiveField(3)
  final int? total_pages;
  @HiveField(4)
   List<Data> data;
  MyPage(
      { this.data = const [],
      this.page,
      this.per_page,
      this.total,
      this.total_pages});
  factory MyPage.fromJson(Map<String, dynamic> json) {
    var dataList = json["data"] as List;
    List<Data> data = dataList.map((i) => Data.fromJson(i)).toList();

    return MyPage(
        page: json["page"],
        per_page: json["per_page"],
        total: json["total"],
        total_pages: json["total_pages"],
        data: data);
  }
}
@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? first_name;
  @HiveField(2)
  final String? last_name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? avatar;
  Data({this.id, this.email, this.first_name, this.last_name, this.avatar});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        avatar: json["avator"]);
  }
}
