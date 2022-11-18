import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Center(
          child: Center(
            child: Text("Shopping App",
            style: TextStyle(fontSize: 20.0),),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        leading: BackButton(),
        iconTheme: IconThemeData(color: Colors.blue[900],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
        ],
      ),

    );
  }
}
