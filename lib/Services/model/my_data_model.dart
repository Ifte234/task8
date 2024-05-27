class MyPage {
  final int? page;
  final int? per_page;
  final int? total;
  final int? total_pages;
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

class Data {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? email;
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
