import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mausam/settings/setting_tile.dart';
import 'package:mausam/theme/cubit/theme_cubit.dart';
import 'package:mausam/theme/theme.dart';
import 'package:mausam/weather/cubit/unit_cubit.dart';
import 'package:mausam/widgets/secondary_background.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
        previousPageTitle: 'Mausam',
        border: null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SettingTile(
                title: 'Theme',
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return CupertinoSlidingSegmentedControl(
                      children: const {
                        0: Text('Light'),
                        1: Text('Dark'),
                      },
                      groupValue: state is ThemeLight ? 0 : 1,
                      onValueChanged: (_) {
                        if (_ != null) {
                          context.read<ThemeCubit>().toggleTheme();
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SettingTile(
                title: 'Metric Unit',
                child: BlocBuilder<UnitCubit, UnitState>(
                  builder: (context, state) {
                    return CupertinoSlidingSegmentedControl(
                      children: const {
                        0: Text('\u00B0F Fahranheit'),
                        1: Text('\u00B0C Celcius'),
                      },
                      groupValue: state is UnitFahranheit ? 0 : 1,
                      onValueChanged: (_) {
                        if (_ != null) {
                          context.read<UnitCubit>().toggleUnit();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
