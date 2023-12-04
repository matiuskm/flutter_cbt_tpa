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
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips dan Trik', style: poppinsFont20whiteSemiBold),
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
                      const SizedBox(
                        height: 16,
                      ),
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
