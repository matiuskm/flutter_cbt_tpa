import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/presentation/quiz/blocs/quiz_by_category/quiz_by_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/custom_scaffold.dart';
import '../models/quiz_model.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/quiz_multiple_choice.dart';
import 'quiz_finish_page.dart';
// import 'quiz_finish_page.dart';

class QuizStartPage extends StatefulWidget {
  final QuizModel data;

  const QuizStartPage({
    super.key,
    required this.data,
  });

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  void initState() {
    context.read<QuizByCategoryBloc>().add(
          QuizByCategoryEvent.getQuizByCategory(widget.data.kategori),
        );
    super.initState();
  }

  int quizNumber = 1;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        BlocBuilder<QuizByCategoryBloc, QuizByCategoryState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () {
                return const SizedBox();
              },
              loaded: (e) {
                return CountdownTimer(
                  duration: widget.data.kategori == 'Verbal'
                      ? e.ujian.test!.verbalTimer
                      : widget.data.kategori == 'Logika'
                          ? e.ujian.test!.logicTimer
                          : e.ujian.test!.numericTimer,
                  onTimerCompletion: (timeRemaining) {
                    context.pushReplacement(QuizFinishPage(
                      data: widget.data,
                      timeRemaining: timeRemaining,
                    ));
                  },
                );
              },
            );
          },
        ),
        IconButton(
            onPressed: () {
              context.pushReplacement(QuizFinishPage(
                data: widget.data,
                timeRemaining: 0,
              ));
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            )),
        const SizedBox(width: 24.0),
      ],
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const Text(
            'Pertanyaan',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BlocBuilder<QuizByCategoryBloc, QuizByCategoryState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox();
                },
                loaded: (e) {
                  return Row(
                    children: [
                      Flexible(
                        child: LinearProgressIndicator(
                          value: 1 / e.ujian.questions!.length,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        '$quizNumber/${e.ujian.questions!.length}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16.0),
          const QuizMultipleChoice(),
        ],
      ),
    );
  }
}
