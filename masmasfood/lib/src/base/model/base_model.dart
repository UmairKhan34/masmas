class ProductModel {
  String? productId;
  String? productName;
  String? productDescription;
  int? productPrice;
  String? productImage;
  int inCart;

  ProductModel(
      {this.productId,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.inCart = 0,
      this.productImage});
}

class RestaurantModel {
  String? restaurantImage;
  String? restaurantName;
  String? restaurantTime;
  RestaurantModel(
      {this.restaurantImage, this.restaurantName, this.restaurantTime});
}

class MenuModel {
  String? menuImage;
  String? menuName;
  String? menuPrice;
  String? menuSubtitle;
  MenuModel({this.menuImage, this.menuName, this.menuPrice, this.menuSubtitle});
}

class MessageModel {
  String? message;
  bool? isSentByMe;

  MessageModel({
    this.message,
    this.isSentByMe,
  });
}

class ChatUserModel {
  String? image;
  String? name;
  String? lastMessage;
  String? time;
  String? callImage;
  String? online;

  ChatUserModel(
      {this.image,
      this.lastMessage,
      this.time,
      this.name,
      this.callImage,
      this.online});
}
