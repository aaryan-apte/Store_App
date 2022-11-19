import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:store_app_git/controllers/productcontroller.dart';
import '../models/Product.dart';
import '../services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
  RemoteServices services = RemoteServices();
  String status = "loading";
  List<Product> products = [];

  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  getAllProducts() {
    setState(() {
      status = "loading";
    });
    services.fetchProducts().then((value) {
      setState(() {
        status = "completed";
      });
      products = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      if (status == "loading") {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return buildWidget(context);
    });
  }

  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Center(
              child: Text(
                "Shopping App",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "PlusJakartaSans-Regular",
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
          leading: const BackButton(),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        // body: Obx(() => MasonryGridView.count(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 4,
        //       crossAxisSpacing: 4,
        //       itemBuilder: (context, index) => Container(
        //         height: 200,
        //         width: 100,
        //         color: Colors.orange,
        //         child: const Center(
        //           child: Text("Aaryan"),
        //         ),
        //       ),
        //       itemCount: productController.productList.length,
        //     )));

        body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) => Container(
              height: 200,
              width: 100,
              color: Colors.yellow,
              child: Column(
                children: <Widget>[
                  Text(
                    products[index].title!,
                  ),
                  Image(
                    image: NetworkImage(products[index].image!),
                  ),
                ],
              )),
          itemCount: products.length,
        ));
  }
}


// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final ProductController productController = Get.put(ProductController());
//   RemoteServices services = RemoteServices();



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Center(
//               child: Text(
//                 "Shopping App",
//                 style: TextStyle(
//                     fontSize: 20.0,
//                     fontFamily: "PlusJakartaSans-Regular",
//                     fontWeight: FontWeight.w800),
//               ),
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.blueGrey[900],
//           leading: const BackButton(),
//           iconTheme: const IconThemeData(
//             color: Colors.white,
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.search_rounded)),
//             IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
//           ],
//         ),
//         body: Obx(() => MasonryGridView.count(
//               crossAxisCount: 2,
//               mainAxisSpacing: 4,
//               crossAxisSpacing: 4,
//               itemBuilder: (context, index) => Container(
//                 height: 200,
//                 width: 100,
//                 color: Colors.orange,
//                 child: const Center(
//                   child: Text("Aaryan"),
//                 ),
//               ),
//               itemCount: productController.productList.length,
//             )));
//   }
// }

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