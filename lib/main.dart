import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbose_task/category/domain/category/category_useCase.dart';
import 'package:verbose_task/category/domain/vendors/vendor_useCase.dart';
import 'package:verbose_task/category/presentation/views/category_page.dart';
import 'category/presentation/bloc/category_bloc/category_cubit.dart';
import 'category/presentation/bloc/vendors_bloc/vendor_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (_) => CategoryCubit(CategoryUseCase())..getCategories(),
        ),

         BlocProvider<VendorCubit>(
           create: (_) => VendorCubit(VendorUseCase()..vendors()),
         ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CategoryPage(),
    );
  }
}

