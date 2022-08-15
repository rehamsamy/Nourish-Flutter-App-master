import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

///*PLEASE DON'T put future like this future: Futurefunc()
///*DO it like this
///initState() {
///  super.initState();
/// _future = Futurefunc();
/// }
///*future: _future,
///To prevent  Futurefunc() from being executed everytime the Screen is rebuilt,

class CondtionalBuilder extends StatelessWidget {
  const CondtionalBuilder(
      {Key? key,
      this.future,
      this.errorWidget = const Text('Error getting data'),
      this.loadingWidget = const Center(child: CupertinoActivityIndicator()),
      required this.successWidget})
      : super(key: key);
  final Future<dynamic>? future;
  final Widget errorWidget;
  final Widget loadingWidget;
  final Widget successWidget;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return FadeIn(child: errorWidget);
          }
          if (snapshot.hasData) {
            return FadeIn(child: successWidget);
          } else {
            return FadeIn(child: loadingWidget);
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return FadeIn(child: loadingWidget);
        } else {
          return FadeIn(child: errorWidget);
        }
      },
    );
  }
}
