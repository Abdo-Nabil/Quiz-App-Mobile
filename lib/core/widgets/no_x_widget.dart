import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

import '../../resources/app_margins_paddings.dart';
import '../../resources/constants_manager.dart';

class NoXWidget extends StatefulWidget {
  final String msg;
  final String imagePath;
  const NoXWidget({Key? key, required this.msg, required this.imagePath})
      : super(key: key);

  @override
  State<NoXWidget> createState() => _NoXWidgetState();
}

class _NoXWidgetState extends State<NoXWidget> with TickerProviderStateMixin {
  //
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(
        milliseconds: ConstantsManager.noXWidgetAnimationDuration),
  );
  //
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.reset();
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      //ToDo: note :All this complex logic is just for centering the widgets in list view!
      child: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p40),
                    child: Image.asset(
                      widget.imagePath,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.011,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.msg,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
