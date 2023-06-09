class FilterModel {
  String name;
  int? id;

  FilterModel({this.name="", this.id});

  FilterModel fromJson(Map<String, dynamic> json) {
    name = json['name']??"";
    id = json['id'];
    return FilterModel(name: name, id: id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
