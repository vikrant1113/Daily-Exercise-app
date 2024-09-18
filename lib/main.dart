import 'package:daily_exercise_app/constants.dart';
import 'package:daily_exercise_app/screens/details_screen.dart';
import 'package:daily_exercise_app/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_app/widgets/category_card.dart';
import 'package:daily_exercise_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cario",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //This gonna give us a total width and height of our device!!!
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            //accourding to the design height of the contaier should be 45% of total height
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEBB),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text(
                  "Good morning \n Malabe!!!",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SearchBar(),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                      title: "Diet Recommendation",
                      svgSrc: "assets/icons/Hamburger.svg",
                      press: () {},
                    ),
                    CategoryCard(
                        title: "Kegel Exercises",
                        svgSrc: "assets/icons/Excrecises.svg",
                        press: () {}),
                    CategoryCard(
                        title: "Meditation",
                        svgSrc: "assets/icons/Meditation.svg",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsScreen();
                          }));
                        }),
                    CategoryCard(
                        title: "Yoga",
                        svgSrc: "assets/icons/yoga.svg",
                        press: () {}),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: "Today",
            svgSrc: "assets/icons/calendar.svg",
          ),
          BottomNavItem(
            title: "All Exercises",
            svgSrc: "assets/icons/gym.svg",
            isActive: true,
          ),
          BottomNavItem(
            title: "Settings",
            svgSrc: "assets/icons/Settings.svg",
          ),
        ],
      ),
    );
  }
}
