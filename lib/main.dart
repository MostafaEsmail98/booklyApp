import 'package:bookly/Features/homePage/data/repo/home_repo.dart';
import 'package:bookly/Features/homePage/data/repo/home_repo_impl.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_best_seller/best_seller_cubit.dart';
import 'package:bookly/Features/homePage/presentation/manager/data_of_featured_books/featured_books_cubit.dart';
import 'package:bookly/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly/Features/search/presentation/manager/search_of_books/search_of_books_cubit.dart';
import 'package:bookly/Features/splash/presentation/view/splash.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/routers.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Features/search/presentation/manager/search/search_cubit.dart';
import 'bloc_observer.dart';

void main() {
  setup();
  runApp(const BooklyApp());
  Bloc.observer = MyBlocObserver();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchOfBooksCubit(getIt.get<SearchRepoImpl>())
            ..fetchSearchOfBooks(),
        ),
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchFeaturedBooks()),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<HomeRepoImpl>())..fetchBestSeller(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.splash,
      ),
    );
  }
}
