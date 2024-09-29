import 'package:bookly/Features/homePage/data/models/BookModel.dart';
import 'package:bookly/Features/homePage/data/repo/home_repo_impl.dart';
import 'package:bookly/Features/homePage/presentation/manager/details_of_books/details_of_books_cubit.dart';
import 'package:bookly/Features/homePage/presentation/views/widgets/book_details_view_body.dart';


import 'package:bookly/Features/search/presentation/view/searchPage.dart';
import 'package:bookly/Features/splash/presentation/view/splash.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/homePage/presentation/views/homePage.dart';

abstract class AppRouter {
  static final splash = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splashview(),
      ),
      GoRoute(
        path: '/searchPage',
        builder:   (context, state) =>  const SearchPage(),
        ),

      GoRoute(
        path: '/homePage',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/bookView',
        builder: (context, state) => BlocProvider(
          create: (context) => DetailsOfBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsViewBody(
            books: state.extra as Items,
          ),
        ),
      ),
    ],
  );
}
