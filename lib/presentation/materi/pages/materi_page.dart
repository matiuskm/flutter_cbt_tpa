// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cbt_tpa_app/core/components/custom_scaffold.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/presentation/materi/blocs/materi/materi_bloc.dart';
import 'package:cbt_tpa_app/presentation/materi/widgets/materi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriPage extends StatefulWidget {
  final bool showBackButton;
  const MateriPage({
    Key? key,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  @override
  void initState() {
    context.read<MateriBloc>().add(const MateriEvent.getAllMateri());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: widget.showBackButton,
      appBarTitle: Text('Materi TPA', style: poppinsFont20whiteSemiBold),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
        children: [
          BlocBuilder<MateriBloc, MateriState>(builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text('no data / error', style: poppinsFont18),
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              loaded: (data) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16.0,
                ),
                itemBuilder: (context, index) => MateriCard(
                  data: data.data[index],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
