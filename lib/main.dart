import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:goflex/features/about/presentation/pages/about_page.dart';
import 'package:goflex/features/cart/data/repositories/cart_repository.dart';
import 'package:goflex/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:goflex/features/change_name/data/repositories/change_name_repository.dart';
import 'package:goflex/features/change_name/presentation/bloc/change_name_bloc.dart';
import 'package:goflex/features/change_number/data/repositories/number_repository.dart';
import 'package:goflex/features/change_number/presentation/bloc/change_number_bloc.dart';
import 'package:goflex/features/change_password/data/repositories/chnage_password_reository.dart';
import 'package:goflex/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:goflex/features/chat_page/data/repositories/chat_repository.dart';
import 'package:goflex/features/chat_page/presentation/bloc/chat_page_bloc.dart';
import 'package:goflex/features/choose_role/presentation/pages/choose_role.dart';
import 'package:goflex/features/forgot_password/data/repositories/forgot_password_repo.dart';
import 'package:goflex/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:goflex/features/get_user_id/data/repositories/get_user_id_repo.dart';
import 'package:goflex/features/get_user_id/presentation/bloc/get_user_id_bloc.dart';
import 'package:goflex/features/help/presentation/pages/help_page.dart';
import 'package:goflex/features/home_page_new/presentation/pages/home_page_new.dart';
import 'package:goflex/features/left_application/data/repositories/left_application_repository.dart';
import 'package:goflex/features/left_application/presentation/bloc/left_application_bloc.dart';
import 'package:goflex/features/login/data/repository/login_repository.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/pages/login_page_new.dart';
import 'package:goflex/features/main_article/presentation/pages/main_article_page.dart';
import 'package:goflex/features/message/data/repositories/message_repository.dart';
import 'package:goflex/features/message/presentation/bloc/message_bloc.dart';
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
import 'package:goflex/features/registration/presentation/pages/select_register.dart';
import 'package:goflex/features/settings/presentation/pages/settings_page.dart';
import 'package:goflex/features/welcome_page/presentation/pages/welcome_page.dart';
import 'package:goflex/utils/permission_utils.dart';

// For building models: flutter pub run build_runner build --delete-conflicting-outputs
// For changing app icon: flutter pub run flutter_launcher_icons:main
// For apk: flutter build apk --split-per-abi

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
    await PermissionUtils.checkLocationPermission();
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
          BlocProvider(
            create: (context) => ChatPageBloc(
              chatPageState: const ChatPageState(),
              repo: ChatRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => MessageBloc(
              messageState: const MessageState(),
              repo: MessageRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => GetUserIdBloc(
              getUserIdState: const GetUserIdState(),
              repo: GetUserIdRepo(),
            ),
          ),
          BlocProvider(
            create: (context) => ForgotPasswordBloc(
              forgotPasswordState: const ForgotPasswordState(),
              repo: ForgotPasswordRepository(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/welcome': (context) => const WelcomePage(),
            '/login': (context) => const LoginPageNew(),
            '/choose_role': (context) => const ChooseRole(),
            '/registration/person': (context) => const SelectRegister(),
            '/registration/organization': (context) =>
                const OrganizationRegistrationPage(),
            '/main': (context) => const HomePageNew(),
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
