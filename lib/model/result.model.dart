class ResultModel {
  Map<String, dynamic> root;

  ResultModel({this.root});

  ResultModel.fromJson(Map<String, dynamic> json) {
    root = json['root'] != null ? json['root'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.root != null) {
      data['root'] = this.root;
    }
    return data;
  }
}
