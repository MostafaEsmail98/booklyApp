
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_appBar.dart';
import 'custom_list_view.dart';
import 'custom_list_view_best_seller.dart';



class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  CustomListView(),
                  SizedBox(height:30,),
                  Text("Best Seller",style: Styles.textStyle18,),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomListViewBestSeller(),
            ),
          )
        ],
      )
    );
  }
  }
