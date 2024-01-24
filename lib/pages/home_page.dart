import 'dart:convert';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dating_app/constants/colors.dart';
import 'package:dating_app/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import './auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  String myjson() {
    var json = {"id": "01", "name": "thanatcha", "sub": "saleekongchai"};

    print(json);
    var demjson = jsonEncode(json);
    print(demjson);
    return demjson;
  }

  Widget showjson() {
    var json = jsonDecode(myjson());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 6.0,
      shadowColor: Colors.blueGrey.withOpacity(0.7),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.deepPurple,
          child: Text(
            json["id"],
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        title: Text(
          json["name"],
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        subtitle: Text(
          json["sub"],
          style: const TextStyle(
              fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black54),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.deepPurple, size: 20),
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProfileCard> profile = [];
  final AppinioSwiperController swiperController = AppinioSwiperController();

  List<String> images = List.generate(40, (index) {
    return 'assets/images/user${index % 10 + 1}.jpeg';
  });

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  void _loadCards() {
    for (String image in images) {
      profile.add(ProfileCard(image: image));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'For You',
          style: TextStyle(
            color: ColorConstants.primaryColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AuthPage()), // Replace AuthPage with the actual name of your widget in auth_page.dart
            );
          },
        ),
        actions: [_appBarIcon(Icons.message)],
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: AppinioSwiper(
          //     controller: swiperController,
          //     cardBuilder: (context, index) => profile[index],
          //     cardCount: profile.length,
          //   ),
          // ),
          widget.showjson(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _appBarIcon(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: ColorConstants.primaryColor),
      onPressed: () {
        // จัดการเมื่อปุ่มถูกกดที่นี่
      },
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _actionButton(
              Icons.close, ColorConstants.close, swiperController.swipeLeft),
          _actionButton(
              Icons.star, ColorConstants.star, swiperController.swipeUp),
          _actionButton(Icons.favorite, ColorConstants.favorite,
              swiperController.swipeRight),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, Color color, VoidCallback onTapAction) {
    return InkWell(
      onTap: onTapAction,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
