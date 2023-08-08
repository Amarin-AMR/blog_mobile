// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  ) builder;

  final T model;
  final Widget? child;
  final void Function(T model)? initModel;
  final VoidCallback? onDispose;

  const BaseWidget({
    required this.builder,
    required this.model,
    this.child,
    this.initModel,
    this.onDispose,
    Key? key,
  }) : super(key: key);

  @override
  BaseWidgetState<T> createState() => BaseWidgetState<T>();
}

class BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.initModel != null) {
      widget.initModel!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  Widget _baseScreen() => ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (context, value, child) {
            return widget.builder(context, model, child);
          },
          child: widget.child,
        ),
      );

  @override
  Widget build(BuildContext context) => _baseScreen();
}
