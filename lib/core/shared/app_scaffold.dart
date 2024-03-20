import 'package:flutter/material.dart';
import 'package:joysper_homework1/core/utils/base_provider.dart';

class AppScaffold<T extends BaseProvider> extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;

  const AppScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.backgroundColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: backgroundColor,
    );
  }
}
