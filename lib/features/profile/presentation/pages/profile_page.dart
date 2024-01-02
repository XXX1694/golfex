import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:goflex/features/profile/presentation/widgets/app_settings.dart';
import 'package:goflex/features/profile/presentation/widgets/exit_button.dart';
import 'package:goflex/features/profile/presentation/widgets/profile_menu.dart';
import 'package:goflex/features/profile/presentation/widgets/profile_top.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    bloc.add(GetProfile());
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    refreshController.loadComplete();
  }

  late ProfileBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    bloc.add(GetProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/notification');
                },
                child: SvgPicture.asset(
                  'assets/icons/ring_black.svg',
                  height: 24,
                  width: 24,
                ),
              ),
            )
          ],
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'go',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'flex',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: state is GettingProfile
            ? Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator(
                        color: mainColor,
                        strokeWidth: 3,
                      )
                    : CupertinoActivityIndicator(
                        color: mainColor,
                      ),
              )
            : state is GotProfile
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SmartRefresher(
                        header: CustomHeader(
                          builder: (context, mode) => Platform.isAndroid
                              ? CircularProgressIndicator(
                                  color: mainColor,
                                  strokeWidth: 3,
                                )
                              : CupertinoActivityIndicator(
                                  color: mainColor,
                                ),
                        ),
                        enablePullDown: true,
                        enablePullUp: false,
                        controller: refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            ProfileTop(
                              name: state.profile.name,
                            ),
                            const SizedBox(height: 24),
                            // const RecentOrders(),
                            // const SizedBox(height: 24),
                            const ProfileMenu(),
                            const SizedBox(height: 24),
                            const AppSettings(),
                            const SizedBox(height: 24),
                            const ExitButton(),
                            const Spacer(),
                            const Text(
                              'goflex 1.0.0',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text('Error'),
                  ),
      ),
    );
  }
}
