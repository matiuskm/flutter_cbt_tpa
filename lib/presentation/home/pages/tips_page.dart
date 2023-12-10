import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/components/custom_scaffold.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/presentation/home/blocs/content/content_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(const ContentEvent.loadTips());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Text('Tips dan Trik', style: poppinsFont20whiteSemiBold),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text('no data / error', style: poppinsFont18),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              loaded: (data) => ListView(
                    children: [
                      data.data.imageUrl.isEmpty
                          ? Image.asset(Assets.images.aboutusHeader.path,
                              width: context.deviceWidth,
                              height: 470.0,
                              fit: BoxFit.cover)
                          : Image.network(
                              data.data.imageUrl,
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
                          ],
                        ),
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
