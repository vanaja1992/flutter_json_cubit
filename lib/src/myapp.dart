import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_cubit/src/core/constants/app_colors.dart';
import 'package:json_cubit/src/core/constants/app_strings.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_cubit.dart';
import 'features/contact/pages/my_contact.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(primaryColor: AppColors.primaryColor),
        home: const MyContact(),
      ),
    );
  }
}
