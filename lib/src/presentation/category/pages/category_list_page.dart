import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../main.dart';
import '../../../core/common.dart';
import '../../../data/category/model/category.dart';
import '../../widgets/paisa_empty_widget.dart';
import '../bloc/category_bloc.dart';
import 'category_list_mobile_page.dart';
import 'category_list_tablet_page.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt.get<CategoryBloc>();
    return Scaffold(
      appBar: context.materialYouAppBar(context.loc.categoriesLabel),
      body: ValueListenableBuilder<Box<Category>>(
        valueListenable: getIt.get<Box<Category>>().listenable(),
        builder: (BuildContext context, value, Widget? child) {
          final categories = value.values.toList();
          if (categories.isEmpty) {
            return EmptyWidget(
              description: context.loc.errorNoCategoriesDescriptionLabel,
              icon: Icons.category,
              title: context.loc.errorNoCatagoriesLabel,
            );
          }
          return ScreenTypeLayout.builder(
            breakpoints: const ScreenBreakpoints(
              tablet: 600,
              desktop: 700,
              watch: 300,
            ),
            mobile: (_) => CategoryListMobileWidget(
              addCategoryBloc: bloc,
              categories: categories,
            ),
            tablet: (_) => CategoryListTabletWidget(
              addCategoryBloc: bloc,
              crossAxisCount: 3,
              categories: categories,
            ),
            desktop: (_) => CategoryListTabletWidget(
              addCategoryBloc: bloc,
              crossAxisCount: 5,
              categories: categories,
            ),
          );
        },
      ),
    );
  }
}
