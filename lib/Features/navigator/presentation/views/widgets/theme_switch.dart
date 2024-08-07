import '../../../../../Core/utils/helper_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/shared/cubit/user_info_cubit.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({
    super.key,
  });
  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  late bool lightTheme;

  @override
  void initState() {
    lightTheme = context.getCubit<UserInfoCubit>().userTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Theme ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: context.onPrimaryColor(),
          ),
        ),
        Switch(
          value: !lightTheme,

          activeColor: context.onPrimaryColor(),
          inactiveThumbColor: context.accentColor(), //
          inactiveTrackColor: context.primaryColor(),
          activeTrackColor: context.accentColor(), //
          onChanged: (value) {
            setState(
              () {
                lightTheme = !value;
                context.getCubit<UserInfoCubit>().changeTheme();
              },
            );
          },
        ),
      ],
    );
  }
}
