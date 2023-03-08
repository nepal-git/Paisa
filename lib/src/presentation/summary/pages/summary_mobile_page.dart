import 'package:flutter/material.dart';

import '../../../core/enum/filter_budget.dart';
import '../../widgets/filter_widget/filter_budget_widget.dart';
import '../widgets/expense_history_widget.dart';
import '../widgets/expense_total_widget.dart';
import '../widgets/welcome_name_widget.dart';

class SummaryMobilePage extends StatelessWidget {
  const SummaryMobilePage({
    super.key,
    required this.valueNotifier,
  });

  final ValueNotifier<FilterBudget> valueNotifier;

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.only(bottom: 124),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const WelcomeNameWidget();
          } else if (index == 1) {
            return const ExpenseTotalWidget();
          } else if (index == 2) {
            return const SizedBox(height: 8);
          } else if (index == 3) {
            return FilterBudgetToggleWidget(valueNotifier: valueNotifier);
          } else if (index == 4) {
            return ExpenseHistory(
              valueNotifier: valueNotifier,
            );
          }
          return const SizedBox.shrink();
        },
      );
}
