import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget{

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onReady;

  @override
  State<StatefulWidget> createState() => ProviderWidgetState<T>();

  ProviderWidget({
    this.model,
    this.child,
    this.onReady,
    this.builder,
  });
}

class ProviderWidgetState<T extends ChangeNotifier> extends State<ProviderWidget<T>>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if(widget.onReady != null){
      widget.onReady(widget.model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    print(T.toString()+"销毁了");
  }
}