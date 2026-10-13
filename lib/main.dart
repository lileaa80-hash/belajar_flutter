import 'package:flutter/material.dart';
// import 'package:rpl2/container_widget/LatihanContainer.dart';
// import 'package:rpl2/row_column_widget/ColumnWidget.dart';
// import 'package:rpl2/row_column_widget/RowWidget.dart';
// import 'package:rpl2/row_column_widget/RowColumnWidget.dart';
// import 'package:rpl2/row_column_widget/layout2.dart';
// import 'package:rpl2/row_column_widget/LatihanDua.dart';
// import 'package:rpl2/sized_expanded_stack/SizedBoxWidget.dart';
// import 'package:rpl2/sized_expanded_stack/ExpandedWidget.dart';
// import 'package:rpl2/sized_expanded_stack/StackWidget.dart';
// import 'package:rpl2/sized_expanded_stack/LayoutTiga.dart';
// import 'package:rpl2/list_grid_view/grid_basic.dart';
import 'package:rpl2/list_grid_view/grid_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const GridBasic(),
      ),
    );
  }
}