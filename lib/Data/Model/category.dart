class CategoryApiResModel {
  List<CategoryModel>? categories;

  CategoryApiResModel({this.categories});

  CategoryApiResModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoryModel(
      {this.idCategory,
      this.strCategory,
      this.strCategoryThumb,
      this.strCategoryDescription});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idCategory'] = idCategory;
    data['strCategory'] = strCategory;
    data['strCategoryThumb'] = strCategoryThumb;
    data['strCategoryDescription'] = strCategoryDescription;
    return data;
  }
}
