class HomeModel {
  bool? status;
  String? msg;
  HomeData? data;

  HomeModel({this.status, this.msg, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class HomeData {
  List<Slider>? slider;
  List<Categories>? categories;
  List<Products>? products;
  List<Products>? selectedProducts;
  List<Products>? newProducts;

  HomeData(
      {this.slider,
        this.categories,
        this.products,
        this.selectedProducts,
        this.newProducts});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['selected_products'] != null) {
      selectedProducts = <Products>[];
      json['selected_products'].forEach((v) {
        selectedProducts!.add(Products.fromJson(v));
      });
    }
    if (json['new_products'] != null) {
      newProducts = <Products>[];
      json['new_products'].forEach((v) {
        newProducts!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.slider != null) {
      data['slider'] = this.slider!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.selectedProducts != null) {
      data['selected_products'] =
          this.selectedProducts!.map((v) => v.toJson()).toList();
    }
    if (this.newProducts != null) {
      data['new_products'] = this.newProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  String? id;
  String? productId;
  String? image;

  Slider({this.id, this.productId, this.image});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    return data;
  }
}

class Categories {
  String? id;
  String? catName;
  String? icon;

  Categories({this.id, this.catName, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['cat_name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_name'] = this.catName;
    data['icon'] = this.icon;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? shortDesc;
  String? mainImage;
  String? listPrice;
  String? salePrice;
  String? discount;

  Products(
      {this.id,
        this.name,
        this.shortDesc,
        this.mainImage,
        this.listPrice,
        this.salePrice,
        this.discount,
});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDesc = json['short_desc'];
    mainImage = json['main_image'];
    listPrice = json['list_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_desc'] = this.shortDesc;
    data['main_image'] = this.mainImage;
    data['list_price'] = this.listPrice;
    data['sale_price'] = this.salePrice;
    data['discount'] = this.discount;
    return data;
  }
}
