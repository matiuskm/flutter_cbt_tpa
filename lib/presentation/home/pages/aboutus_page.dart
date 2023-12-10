import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/components/custom_scaffold.dart';
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
    return CustomScaffold(
      appBarTitle: Text('About Us', style: poppinsFont20whiteSemiBold),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: Text('Something went wrong'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (data) {
              return ListView(
                children: [
                  data.data.imageUrl.isEmpty
                      ? Image.asset(Assets.images.aboutusHeader.path,
                          width: context.deviceWidth,
                          height: 470.0,
                          fit: BoxFit.cover)
                      : CachedNetworkImage(
                          imageUrl: data.data.imageUrl,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          width: context.deviceWidth,
                          height: 470.0,
                          fit: BoxFit.cover,
                        ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          data.data.content.isEmpty
                              ? 'no content'
                              : data.data.content,
                          style: poppinsFont18,
                          textAlign: TextAlign.justify,
                        ),
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
                ],
              );
            },
          );
        },
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
