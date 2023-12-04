import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/presentation/home/blocs/content/content_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(const ContentEvent.loadAboutUs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us', style: poppinsFont20whiteSemiBold),
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: context.deviceWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.aboutusHeader.path,
                        height: 293.0,
                      ),
                      const SizedBox(height: 16.0),
                      BlocBuilder<ContentBloc, ContentState>(
                          builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return Text(
                            '',
                            style: poppinsFont18,
                            textAlign: TextAlign.justify,
                          );
                        }, loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }, loaded: (data) {
                          return Text(
                            data.data,
                            style: poppinsFont18,
                            textAlign: TextAlign.justify,
                          );
                        });
                      }),
                      const SizedBox(height: 24.0),
                      Text(
                        'Contributors',
                        style: poppinsFont18semiBold,
                      ),
                      const SizedBox(height: 16.0),
                      const ContributorItem(
                        name: 'Saiful Bahri',
                        role: 'Mentor & Developer',
                      ),
                      const ContributorItem(
                        name: 'LZCDR',
                        role: 'Developer',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContributorItem extends StatelessWidget {
  final String name;
  final String role;

  const ContributorItem({required this.name, required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // You can add profile pictures here if available
        child: Text(name[0], style: poppinsFont16w500),
      ),
      title: Text(name, style: poppinsFont14w500Dark),
      subtitle: Text(role, style: poppinsFont14w500Link),
    );
  }
}
