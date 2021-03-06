import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {

  BlocProvider({
    Key key,
    @required this.bloc,
    @required this.child,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();

  static Type _typeOf<T>() => T;

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}