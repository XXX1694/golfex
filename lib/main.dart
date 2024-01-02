import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/about/presentation/pages/about_page.dart';
import 'package:goflex/features/cart/data/repositories/cart_repository.dart';
import 'package:goflex/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:goflex/features/change_name/data/repositories/change_name_repository.dart';
import 'package:goflex/features/change_name/presentation/bloc/change_name_bloc.dart';
import 'package:goflex/features/change_number/data/repositories/number_repository.dart';
import 'package:goflex/features/change_number/presentation/bloc/change_number_bloc.dart';
import 'package:goflex/features/change_password/data/repositories/chnage_password_reository.dart';
import 'package:goflex/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:goflex/features/choose_role/presentation/pages/choose_role.dart';
import 'package:goflex/features/help/presentation/pages/help_page.dart';
import 'package:goflex/features/left_application/data/repositories/left_application_repository.dart';
import 'package:goflex/features/left_application/presentation/bloc/left_application_bloc.dart';
import 'package:goflex/features/login/data/repository/login_repository.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/pages/login_page.dart';
import 'package:goflex/features/main_article/presentation/pages/main_article_page.dart';
import 'package:goflex/features/main_page/presentation/pages/main_pagge.dart';
import 'package:goflex/features/new_order/data/repository/add_repository.dart';
import 'package:goflex/features/new_order/presentation/bloc/new_order_bloc.dart';
import 'package:goflex/features/notification/presentation/pages/notification_page.dart';
import 'package:goflex/features/order_info/data/repositories/order_info_repository.dart';
import 'package:goflex/features/order_info/presentation/bloc/order_info_bloc.dart';
import 'package:goflex/features/orders/data/repository/order_repository.dart';
import 'package:goflex/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:goflex/features/profile/data/repository/profile_repository.dart';
import 'package:goflex/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:goflex/features/registration/data/repository/registration_repository.dart';
import 'package:goflex/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:goflex/features/registration/presentation/pages/organization_registration_page.dart';
import 'package:goflex/features/registration/presentation/pages/person_registration_page.dart';
import 'package:goflex/features/settings/presentation/pages/settings_page.dart';
import 'package:goflex/features/welcome_page/presentation/pages/welcome_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(
              repo: RegistrationRepository(),
              registrationState: const RegistrationState(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              repo: LoginRepository(),
              loginState: const LoginState(),
            ),
          ),
          BlocProvider(
            create: (context) => LeftApplicationBloc(
              repo: LeftApplicationRepository(),
              leftApplicationState: const LeftApplicationState(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              repo: CartRepository(),
              cartState: const CartState(),
            ),
          ),
          BlocProvider(
            create: (context) => OrdersBloc(
              repo: OrderRepository(),
              ordersState: const OrdersState(),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              repo: ProfileRepository(),
              profileState: const ProfileState(),
            ),
          ),
          BlocProvider(
            create: (context) => NewOrderBloc(
              repo: AddToCartRepository(),
              newOrderState: const NewOrderState(),
            ),
          ),
          BlocProvider(
            create: (context) => ChangeNameBloc(
              repo: ChangeNameRepository(),
              changeNameState: const ChangeNameState(),
            ),
          ),
          BlocProvider(
            create: (context) => ChangePasswordBloc(
              repo: ChangePasswordRepository(),
              changePasswordState: const ChangePasswordState(),
            ),
          ),
          BlocProvider(
            create: (context) => ChangeNumberBloc(
              repo: NumberRepository(),
              changeNumberState: const ChangeNumberState(),
            ),
          ),
          BlocProvider(
            create: (context) => OrderInfoBloc(
              repo: OrderInfoRepository(),
              orderInfoState: const OrderInfoState(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/welcome': (context) => const WelcomePage(),
            '/login': (context) => const LoginPage(),
            '/choose_role': (context) => const ChooseRole(),
            '/registration/person': (context) =>
                const PersonrRegistrationPage(),
            '/registration/organization': (context) =>
                const OrganizationRegistrationPage(),
            '/main': (context) => const MainPage(
                  page: 0,
                ),
            '/settings': (context) => const SettingsPage(),
            '/about': (context) => const AboutPage(),
            '/help': (context) => const HelpPage(),
            '/notification': (context) => const NotificationPage(),
            '/article': (context) => const MainArticlePage()
          },
          initialRoute: '/login',
        ),
      ),
    );
  }
}
