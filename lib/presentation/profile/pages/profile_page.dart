import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/responses/auth/login_response_model.dart';
import 'package:cbt_tpa_app/presentation/auth/blocs/logout/logout_bloc.dart';
import 'package:cbt_tpa_app/presentation/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../widgets/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: false,
      toolbarHeight: 110.0,
      appBarTitle: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Image.network(
              'https://i.pravatar.cc/200',
              width: 64.0,
              height: 64.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: context.deviceWidth - 160.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<LoginUser>(
                  future: AuthLocalDatasource().getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Text(
                        'Halo ${snapshot.data!.name}',
                        style: poppinsFont20whiteSemiBold,
                        overflow: TextOverflow.ellipsis,
                      );
                    } else {
                      return const Text("");
                    }
                  },
                ),
                Text(
                  '@codewithbahri',
                  style: poppinsFont12white,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          // IconButton(
          //   onPressed: () {
          //     context.pushAndRemoveUntil(const LoginPage(), (route) => false);
          //   },
          //   icon: Assets.icons.logout.image(width: 24.0),
          // ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          ProfileMenu(
            label: 'Edit Profile',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Help',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Privacy & Policy',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Term of Service',
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          ProfileMenu(
            label: 'Logout',
            onPressed: () {
              context.read<LogoutBloc>().add(const LogoutEvent.logout());
              AuthLocalDatasource().removeAuthData();
              context.pushReplacement(const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
