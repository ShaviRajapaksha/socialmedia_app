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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          // Gradient background (Spotify-style)
          Container(
            width: size.width,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green.withOpacity(0.35), Colors.black],
              ),
            ),
          ),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  /// Top Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recently Played",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.history, size: 22),
                            SizedBox(width: 18),
                            Icon(Icons.settings, size: 22),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Recently Played (Horizontal)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: const [
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

                  /// Good Evening Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Good Evening",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Good Evening Grid (Spotify style)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _quickPlayTile("Liked Songs", "assets/album1.png"),
                        _quickPlayTile("Top Hits", "assets/album2.png"),
                        _quickPlayTile("Daily Mix 1", "assets/album3.png"),
                        _quickPlayTile("Chill Beats", "assets/album4.png"),
                        _quickPlayTile("Workout", "assets/album5.png"),
                        _quickPlayTile("Focus", "assets/album2.png"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// Made For You Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Made for You",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: const [
                        AlbumCard(
                          image: AssetImage("assets/album3.png"),
                          label: "Daily Mix 1",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album4.png"),
                          label: "Daily Mix 2",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album5.png"),
                          label: "Release Radar",
                        ),
                        SizedBox(width: 15),
                        AlbumCard(
                          image: AssetImage("assets/album1.png"),
                          label: "Discover Weekly",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Spotify-style quick play tile
  Widget _quickPlayTile(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
            child: Image.asset(
              imagePath,
              width: 56,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
