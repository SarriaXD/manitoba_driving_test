import 'package:flutter/material.dart';

import '../../../quiz/models/question.dart';
import 'quiz_history_detail_item.dart';

class QuizHistoryDetailSliverList extends StatefulWidget {
  const QuizHistoryDetailSliverList({
    super.key,
    required this.questions,
  });
  final List<Question> questions;

  @override
  State<QuizHistoryDetailSliverList> createState() =>
      _QuizHistoryDetailSliverListState();
}

class _QuizHistoryDetailSliverListState
    extends State<QuizHistoryDetailSliverList> {
  var currentExpandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final question = widget.questions[index];
          return QuizHistoryDetailItem(
            key: ValueKey(question.id),
            question: question,
            expanded: currentExpandedIndex == index,
            onExpand: (expanded) {
              setState(() {
                currentExpandedIndex = expanded ? index : -1;
              });
            },
          );
        },
        childCount: widget.questions.length,
      ),
    );
  }
}
