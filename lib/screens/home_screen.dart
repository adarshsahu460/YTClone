import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            leading: Image.asset("assets/yt_logo.jpg"),
            leadingWidth: 130,
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: 25,
                icon: const Icon(Icons.cast),
                // padding: const EdgeInsets.all(15),
              ),
              IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
                // padding: const EdgeInsets.all(15),
              ),
              IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.search),
                // padding: const EdgeInsets.all(15),
              ),
              IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: Image.asset("assets/usr.jpg"),
                // padding: const EdgeInsets.all(15),
              ),
            ],
          ),

          // Hello
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {}),
          )
        ],
      ),
    );
  }
}
