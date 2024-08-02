import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ColorScheme on BuildContext {
  Color primaryColor() => Theme.of(this).colorScheme.primary;
  Color onPrimaryColor() => Theme.of(this).colorScheme.onPrimary;
  Color accentColor() => Theme.of(this).colorScheme.secondary;
  Color neutralColor() => Theme.of(this).colorScheme.tertiary;
}

extension BlocProviderExtension on BuildContext {
  T getCubit<T extends StateStreamableSource<Object?>>() {
    return BlocProvider.of<T>(this);
  }
}
