import 'package:flutter/material.dart';

void main() {
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isPlaying = false;
  double currentPosition = 30.0; // Represents the seconds played

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade600, Colors.purple.shade900],
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // App Bar (Top Settings and Playlist)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.settings, color: Colors.white),
                      Text('Playlist4',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045)),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),

                // Album Art
                Container(
                  margin: EdgeInsets.all(screenWidth * 0.05),
                  width: screenWidth * 0.6,
                  height: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/en/1/1b/Khalid_-_Free_Spirit.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Song Title and Artist
                Column(
                  children: [
                    Text(
                      'Talk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Khalid, Disclosure',
                      style: TextStyle(
                          color: Colors.white70, fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),

                // Progress bar
                Slider(
                  activeColor: Colors.pink,
                  inactiveColor: Colors.white24,
                  value: currentPosition,
                  min: 0,
                  max: 247, // Example: Song length in seconds
                  onChanged: (newValue) {
                    setState(() {
                      currentPosition = newValue;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0:30',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.035),
                      ),
                      Text(
                        '2:47',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                ),

                // Playback controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shuffle, color: Colors.white),
                      iconSize: screenWidth * 0.07,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_previous, color: Colors.white),
                      iconSize: screenWidth * 0.1,
                      onPressed: () {},
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: screenWidth * 0.09,
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: screenWidth * 0.15,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next, color: Colors.white),
                      iconSize: screenWidth * 0.1,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.pink),
                      iconSize: screenWidth * 0.07,
                      onPressed: () {},
                    ),
                  ],
                ),

                SizedBox(
                    height: screenHeight * 0.05), // Extra space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
