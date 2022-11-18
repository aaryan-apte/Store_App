import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Shop More! Udaao!!',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  );
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1)),
          )
        ],
      ),
    );
  }
}
