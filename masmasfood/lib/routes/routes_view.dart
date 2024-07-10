import 'package:get/get.dart';
import 'package:masmas/src/auth/view/bio_data_view.dart';
import 'package:masmas/src/auth/view/confirmation_view.dart';
import 'package:masmas/src/auth/view/forgot_options_view.dart';
import 'package:masmas/src/auth/view/forgot_view.dart';
import 'package:masmas/src/auth/view/login_screen_view.dart';
import 'package:masmas/src/auth/view/new_password.dart';
import 'package:masmas/src/auth/view/payment_method_view.dart';
import 'package:masmas/src/auth/view/picture_view.dart';
import 'package:masmas/src/auth/view/profile_ready_view.dart';
import 'package:masmas/src/auth/view/user_location_view.dart';
import 'package:masmas/src/base/view/bottom_navigation.dart';
import 'package:masmas/src/base/view/cart/view/edit_payment_screen.dart';
import 'package:masmas/src/base/view/cart/view/widget/comman_cart_widget.dart';
import 'package:masmas/src/base/view/chat/view/call_screen.dart';
import 'package:masmas/src/base/view/chat/view/chat_details.dart';
import 'package:masmas/src/base/view/chat/view/chat_review.dart';
import 'package:masmas/src/base/view/home/view/filter_screen.dart';
import 'package:masmas/src/base/view/home/view/home_view.dart';
import 'package:masmas/src/base/view/home/view/notifications_screen.dart';
import 'package:masmas/src/base/view/home/view/popular_menu.dart';
import 'package:masmas/src/base/view/home/view/product_details.dart';
import 'package:masmas/src/base/view/home/view/voucher_screen.dart';
import 'package:masmas/src/landing/new_Screen.dart';
import 'package:masmas/src/landing/splash.dart';
import '../src/auth/view/sign_up_view.dart';
import '../src/base/view/cart/view/cart_view.dart';
import '../src/base/view/cart/view/location_screen.dart';
import '../src/base/view/home/view/nearest_restaurant.dart';
import '../src/base/view/home/view/popular_view.dart';
import '../src/base/view/home/view/view_more_screen.dart';
import '../utilis/google_map/location_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: SplashScreen.route, page: () => const SplashScreen()),
    GetPage(name: ViewMore.route, page: () => const ViewMore()),
    GetPage(name: HomeScreenView.route, page: () => const HomeScreenView()),
    GetPage(name: BottomNavigation.route, page: () => const BottomNavigation()),
    GetPage(name: LoginScreen.route, page: () => const LoginScreen()),
    GetPage(name: NewScreen.route, page: () => const NewScreen()),
    GetPage(name: ForgotView.route, page: () => const ForgotView()),
    GetPage(name: SignUpView.route, page: () => const SignUpView()),
    GetPage(name: BioDataView.route, page: () => const BioDataView()),
    GetPage(
        name: PaymentMethodView.route, page: () => const PaymentMethodView()),
    GetPage(name: UploadPicture.route, page: () => const UploadPicture()),
    GetPage(name: UserLocationView.route, page: () => const UserLocationView()),
    GetPage(name: AlmostReady.route, page: () => const AlmostReady()),
    GetPage(name: NewPassword.route, page: () => const NewPassword()),
    GetPage(
        name: ForgotOptionsViews.route, page: () => const ForgotOptionsViews()),
    GetPage(name: ConfirmationView.route, page: () => const ConfirmationView()),
    GetPage(name: PopularView.route, page: () => const PopularView()),
    GetPage(name: FilterScreen.route, page: () => const FilterScreen()),
    GetPage(name: ChatDetails.route, page: () => ChatDetails()),
    GetPage(name: CallScreen.route, page: () => const CallScreen()),
    GetPage(name: ChatReview.route, page: () => const ChatReview()),
    GetPage(name: VoucherScreen.route, page: () => const VoucherScreen()),
    GetPage(
        name: EditPaymentScreen.route, page: () => const EditPaymentScreen()),
    GetPage(
        name: NotificationScreen.route, page: () => const NotificationScreen()),
    GetPage(
        name: CommonCartWidget.route,
        page: () => CommonCartWidget(
              onpress: () {},
            )),
    GetPage(name: CartView.route, page: () => const CartView()),
    GetPage(name: LocationScreen.route, page: () => const LocationScreen()),
    GetPage(
        name: LocationScreenView.route, page: () => const LocationScreenView()),
    GetPage(name: ProductDetails.route, page: () => const ProductDetails()),
    GetPage(
        name: NearestRestaurant.route, page: () => const NearestRestaurant()),
    GetPage(
        name: PopularMenuDetails.route, page: () => const PopularMenuDetails()),
  ];
}
