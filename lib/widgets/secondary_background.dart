import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/theme/cubit/theme_cubit.dart';
import 'package:mausam/theme/theme.dart';

class SecondaryBackground extends StatelessWidget {
  const SecondaryBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: state is ThemeDark
                ? Theme.secondaryDarkBackground
                : Theme.secondaryLightBackground,
          ),
          child: child,
        );
      },
    );
  }
}
