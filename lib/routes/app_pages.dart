import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

import '../app/modules/Subscription/bindings/subscription_binding.dart';
import '../app/modules/Subscription/views/subscription_view.dart';
import '../app/modules/add_Address/bindings/add_address_binding.dart';
import '../app/modules/add_Address/views/add_address_view.dart';
import '../app/modules/auth_modules/change_email/bindings/change_email_binding.dart';
import '../app/modules/auth_modules/change_email/views/change_email_view.dart';
import '../app/modules/auth_modules/choose_lang/bindings/choose_lang_binding.dart';
import '../app/modules/auth_modules/choose_lang/views/choose_lang_view.dart';
import '../app/modules/auth_modules/login/bindings/login_binding.dart';
import '../app/modules/auth_modules/login/views/login_view.dart';
import '../app/modules/auth_modules/on_boarding/bindings/on_boarding_binding.dart';
import '../app/modules/auth_modules/on_boarding/views/on_boarding_view.dart';
import '../app/modules/auth_modules/otp_verification/bindings/otp_verification_binding.dart';
import '../app/modules/auth_modules/otp_verification/views/otp_verification_view.dart';
import '../app/modules/auth_modules/register/bindings/register_binding.dart';
import '../app/modules/auth_modules/register/views/register_view.dart';
import '../app/modules/cart/bindings/cart_binding.dart';
import '../app/modules/cart/views/cart_view.dart';
import '../app/modules/custom_package/bindings/custom_package_binding.dart';
import '../app/modules/custom_package/views/custom_package_view.dart';
import '../app/modules/days_time/bindings/days_time_binding.dart';
import '../app/modules/days_time/views/days_time_view.dart';
import '../app/modules/delivery_addresses/bindings/delivery_addresses_binding.dart';
import '../app/modules/delivery_addresses/views/delivery_addresses_view.dart';
import '../app/modules/delivery_time/bindings/delivery_time_binding.dart';
import '../app/modules/delivery_time/views/delivery_time_view.dart';
import '../app/modules/home_page/bindings/home_page_binding.dart';
import '../app/modules/home_page/views/home_page_view.dart';
import '../app/modules/home_screen/bindings/home_screen_binding.dart';
import '../app/modules/home_screen/views/home_screen_view.dart';
import '../app/modules/location_acesss/bindings/location_acesss_binding.dart';
import '../app/modules/location_acesss/views/location_acesss_view.dart';
import '../app/modules/meals/bindings/meals_binding.dart';
import '../app/modules/meals/views/meals_view.dart';
import '../app/modules/notification/bindings/notification_binding.dart';
import '../app/modules/notification/views/notification_view.dart';
import '../app/modules/package_details/bindings/package_details_binding.dart';
import '../app/modules/package_details/views/package_details_view.dart';
import '../app/modules/package_meals/bindings/package_meals_binding.dart';
import '../app/modules/package_meals/views/package_meals_view.dart';
import '../app/modules/packages/bindings/packages_binding.dart';
import '../app/modules/packages/views/packages_view.dart';
import '../app/modules/payment_methods/bindings/payment_methods_binding.dart';
import '../app/modules/payment_methods/views/payment_methods_view.dart';
import '../app/modules/profile/bindings/profile_binding.dart';
import '../app/modules/profile/views/profile_view.dart';
import '../app/modules/search/bindings/search_binding.dart';
import '../app/modules/search/views/search_view.dart';
import '../app/modules/splash/bindings/splash_binding.dart';
import '../app/modules/splash/views/splash_view.dart';
import '../app/modules/subscription_details/bindings/subscription_details_binding.dart';
import '../app/modules/subscription_details/views/subscription_details_view.dart';
import '../app/modules/subscription_status/bindings/subscription_status_binding.dart';
import '../app/modules/subscription_status/views/subscription_status_view.dart';
import '../app/modules/success_order/bindings/success_order_binding.dart';
import '../app/modules/success_order/views/success_order_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static String? token = Get.find<SharedPrefService>().getToken() ?? '';

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => token == null ? const SplashView() :  HomePageView(),
      binding: token == null ? SplashBinding() : HomePageBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () =>  HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANG,
      page: () => const ChooseLangView(),
      binding: ChooseLangBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_EMAIL,
      page: () => ChangeEmailView(),
      binding: ChangeEmailBinding(),
    ),
    GetPage(
      name: _Paths.MEALS,
      page: () => const MealsView(),
      binding: MealsBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGES,
      page: () => const PackagesView(),
      binding: PackagesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGE_DETAILS,
      page: () => PackageDetailsView(),
      binding: PackageDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_ADDRESSES,
      page: () => const DeliveryAddressesView(),
      binding: DeliveryAddressesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => const AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.DAYS_TIME,
      page: () => const DaysTimeView(),
      binding: DaysTimeBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGE_MEALS,
      page: () => PackageMealsView(),
      binding: PackageMealsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHODS,
      page: () => const PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_ORDER,
      page: () => const SuccessOrderView(),
      binding: SuccessOrderBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_DETAILS,
      page: () => const SubscriptionDetailsView(),
      binding: SubscriptionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_STATUS,
      page: () => const SubscriptionStatusView(),
      binding: SubscriptionStatusBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY_TIME,
      page: () => DeliveryTimeView(),
      binding: DeliveryTimeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_PACKAGE,
      page: () => CustomPackageView(),
      binding: CustomPackageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_ACESSS,
      page: () => const LocationAcesssView(),
      binding: LocationAcesssBinding(),
    ),
  ];
}
