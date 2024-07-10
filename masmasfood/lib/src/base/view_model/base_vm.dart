import 'package:flutter/material.dart';
import 'package:masmas/constants/constant.dart';
import 'package:masmas/resources/resources.dart';
import 'package:masmas/src/base/model/base_model.dart';

class BaseVM extends ChangeNotifier {
  ProductModel model = ProductModel();
  RestaurantModel restaurantModel = RestaurantModel();
  MenuModel menumodel = MenuModel();
  int get cartItemCount => cartItemsList.length;
  MessageModel mesageModel = MessageModel();
  ThemeMode themeMode = ThemeMode.light;

  List<ProductModel> cartItemsList = [];
  List<int> selectedItemList = [];
  List<MessageModel> messageList = [
    MessageModel(isSentByMe: false, message: 'Just to order'),
    MessageModel(
        isSentByMe: true, message: 'Okay, for what level of spiciness?'),
    MessageModel(isSentByMe: false, message: 'Okay, wait a minute 👍'),
    MessageModel(isSentByMe: true, message: "Okay, I'm waiting 👍"),
  ];
  List<ChatUserModel> userModelList = [
    ChatUserModel(
        image: R.images.profileOne,
        lastMessage: 'Your Order Just Arrived!',
        name: 'Louis Kelly',
        time: '20:00',
        callImage: R.images.call,
        online: 'Online'),
    ChatUserModel(
        image: R.images.profileTwo,
        lastMessage: 'Your Order Just Arrived!',
        name: 'Paul Koch',
        time: '20:00',
        callImage: R.images.call,
        online: 'Online'),
    ChatUserModel(
        image: R.images.profileThree,
        lastMessage: 'Your Order Just Arrived!',
        name: 'Carla Klein',
        time: '20:00',
        callImage: R.images.call,
        online: 'Online'),
  ];
  List<ProductModel> productList = [
    ProductModel(
        inCart: 1,
        productId: '1',
        productName: 'Spacy fresh crab',
        productDescription: 'Waroenk kita',
        productImage: R.images.pasta,
        productPrice: 35),
    ProductModel(
        inCart: 1,
        productId: '2',
        productName: 'Spacy fresh crab',
        productDescription: 'Waroenk kita',
        productImage: R.images.noodles,
        productPrice: 35),
    ProductModel(
        inCart: 1,
        productId: '3',
        productName: 'Spacy fresh crab',
        productDescription: 'Waroenk kita',
        productImage: R.images.rolls,
        productPrice: 35),
    ProductModel(
      inCart: 1,
      productId: '4',
      productName: 'Spacy fresh crab',
      productDescription: 'Waroenk kita',
      productImage: R.images.icecream,
      productPrice: 35,
    ),
    ProductModel(
        inCart: 1,
        productId: '5',
        productName: 'Spacy fresh crab',
        productDescription: 'Waroenk kita',
        productImage: R.images.icecream,
        productPrice: 35)
  ];
  List<RestaurantModel> restaurant = [
    RestaurantModel(
        restaurantName: "Vegan Resto",
        restaurantImage: R.images.vegan,
        restaurantTime: "12 Mins"),
    RestaurantModel(
        restaurantName: "Healthy Food",
        restaurantImage: R.images.wheat,
        restaurantTime: "8 Mins"),
    RestaurantModel(
        restaurantName: "Good Food",
        restaurantImage: R.images.plate,
        restaurantTime: "12 Mins"),
    RestaurantModel(
        restaurantName: "Smart Resto",
        restaurantImage: R.images.plater,
        restaurantTime: "8 Mins"),
    RestaurantModel(
        restaurantName: "Vegan Resto",
        restaurantImage: R.images.chef,
        restaurantTime: "12 Mins"),
    RestaurantModel(
        restaurantName: "Healthy Food",
        restaurantImage: R.images.lady,
        restaurantTime: "8 Mins"),
  ];
  List<MenuModel> menuList = [
    MenuModel(
      menuName: "Green Noddle",
      menuImage: R.images.noodles,
      menuPrice: "\$ 15",
      menuSubtitle: "Noodle Home",
    ),
    MenuModel(
        menuName: "Fruit Salad",
        menuImage: R.images.fruit,
        menuPrice: "\$ 5",
        menuSubtitle: "Wijie Resto"),
    MenuModel(
        menuName: "Herbal Pancake",
        menuImage: R.images.menu,
        menuPrice: "\$ 7",
        menuSubtitle: "Warung Herbal")
  ];
  void addCart(ProductModel product) {
    cartItemsList.add(product);
    update();
  }

  void removeCart(ProductModel product) {
    cartItemsList.remove(product);
    update();
  }

  void addMessage(String message, bool isSentByMe) {
    messageList.add(MessageModel(message: message, isSentByMe: isSentByMe));
    update();
  }

  double updateSubTotal() {
    double subTotal = 0;

    for (var item in cartItemsList) {
      if (item.productPrice != null) {
        if (item.inCart > 0) {
          subTotal += (item.productPrice! * item.inCart);
        }
      }
    }
    update();
    return subTotal;
  }

  double updateTotal() {
    double total = 0;

    for (var item in cartItemsList) {
      if (item.productPrice != null) {
        if (item.inCart > 0) {
          total += (item.productPrice! * item.inCart);
        }
      }
    }
    total += 10;
    total -= 20;

    if (total <= 0) {
      total = 0;
    }
    update();
    return total;
  }

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    Constant.themeMode = themeMode.toString();
    update();
  }

  void update() {
    notifyListeners();
  }
}
