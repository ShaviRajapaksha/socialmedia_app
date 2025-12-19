import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/album_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recently Played",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Icon(Icons.history, size: 20),
                            SizedBox(width: 15),
                            Icon(Icons.settings, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        AlbumCard(
                          image: AssetImage("assets/album1.png"),
                          label: "Best Mode",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album2.png"),
                          label: "Daily Mix",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album3.png"),
                          label: "Top Hits",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album4.png"),
                          label: "Motivation",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album5.png"),
                          label: "Chill Vibes",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
