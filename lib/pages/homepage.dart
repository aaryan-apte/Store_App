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
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
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
              height: 295,
              width: 100,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        products[index].title!,
                        style: const TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(products[index].image!),
                      height: 100,
                      width: 100,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('\$' + products[index].price!),
                  ),

                  // Text(products[index].rating!.toString()),
                  // SizedBox(height: 8)

                  if (products[index].rating != null)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            products[index].rating!.rate!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
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