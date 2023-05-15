import 'package:apiero_medica/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Utils/Search.dart';
import '../NotificationScreen/Notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Items and Icons in Categories
  List<String> categories = [
    'All',
    'Dentist',
    'Cardiologist',
    'Dermatology',
    'Gynecologist',
    'Neurologist',
    'Pediatrician',
    'More',
  ];

  //icons path
  List<String> icons = [
    'assets/Icons/eye.png',
    'assets/Icons/eye.png',
    'assets/Icons/cardiology.png',
    'assets/Icons/darmatology.png',
    'assets/Icons/eye.png',
    'assets/Icons/neurologist.png',
    'assets/Icons/eye.png',
    'assets/Icons/eye.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().Bg,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning 👋',
                          style: TextStyle(
                            fontSize: 13,
                            color: Constants().TextColorGrey,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                        Text(
                          'Andrew Smith',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Constants().TextColorBlack,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        size: 30,
                        Icons.notifications_none_outlined,
                        color: Constants().TextColorBlack,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 30,
                        Icons.favorite_border_outlined,
                        color: Constants().TextColorBlack,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  // search bar
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Constants().White,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Icon(
                        Icons.search,
                        color: Constants().TextColorGrey,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<Search>(context, listen: false)
                              .search(context);
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 15,
                            color: Constants().TextColorGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Icon(
                        Icons.filter_list_outlined,
                        color: Constants().TextColorGrey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: CardSlider(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants().TextColorBlack,
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Constants().TextColorBlue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants().Bg,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Constants().ContainerBg2,
                              child: Image.asset(
                                icons[index],
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Constants().TextColorBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(
      () {
        setState(
          () {
            _currentPage = _pageController.page!.round();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            itemCount: 4,
            controller: _pageController,
            itemBuilder: (BuildContext context, int pos) {
              return Card(
                shadowColor: Constants().Button,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://w0.peakpx.com/wallpaper/957/184/HD-wallpaper-blue-background-gradient-geometric-shapes-pointer-abstract.jpg',
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 15,
                          bottom: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medical Checks!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants().TextColorWhite,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Check your health regularly\nto minimize the incidence of\ndisease in the future. ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Constants().TextColorWhite,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              // check now button
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: Constants().White,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'Check Now',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Constants().TextColorBlue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/Images/Doctor.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.35,
          right: 0,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Constants().Primary,
              dotColor: Constants().TextColorGrey,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 4,
              spacing: 5,
            ),
          ),
        )
      ],
    );
  }
}