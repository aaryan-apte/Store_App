import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:store_app_git/controllers/productcontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Center(
          child: Center(
            child: Text("Shopping App",
            style: TextStyle(fontSize: 20.0, fontFamily: "PlusJakartaSans-Regular", fontWeight: FontWeight.w800),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        leading: const BackButton(),
        iconTheme: const IconThemeData(color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body:
              Obx(() => MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) => Container(
                height: 200,
                width: 100,
                color: Colors.orange,
                child: Center(
                  child: Text("Aaryan"),
                ),
              ),
              itemCount: productController.productList.length,
            )
              )

        );


  }
}

// Column(
// children: [
// const Padding(
// padding: EdgeInsets.all(30.0),
// child: Text(
// 'Shop More! Udaao!!',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w400),
// ),
// ),
//
// StaggeredGridView.countBuilder(
// crossAxisCount: 2,
// itemCount: 2,
// crossAxisSpacing: 10,
// mainAxisSpacing: 5,
// itemBuilder: (context, index) {
// return Container(
// height: 100,
// width: 100,
// color: Colors.orange,
// );
// },
// staggeredTileBuilder: (index) => const StaggeredTile.fit(1)),