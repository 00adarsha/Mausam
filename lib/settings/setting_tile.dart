import 'package:flutter/cupertino.dart';
import 'package:mausam/widgets/secondary_background.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SecondaryBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title),
          const SizedBox(height: 8.0),
          child,
        ],
      ),
    );
  }
}
