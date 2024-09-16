import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of images from assets folder
  final List<String> _images = [
    'assets/images/fash1.jpg',
    'assets/images/fash2.jpg',
    'assets/images/fash3.jpg',
  ];

  // List of titles for each slide
  final List<String> _titles = [
    'DISCOVER TRENDS',
    'ADD TO MY WISHLIST',
    'IT IS SIMPLY FOR YOU',
  ];

  // List of descriptions for each slide
  final List<String> _descriptions = [
    'Explore the newest styles and find your perfect look.',
    'From casual to formal, we have the outfits for you.',
    'Start your fashion journey with us today.',
  ];
  final TextStyle _titleStyle = TextStyle(
    fontFamily: 'YourFontFamily', // Replace with your font family
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  final TextStyle _descriptionStyle = TextStyle(
    fontFamily: 'YourFontFamily', // Replace with your font family
    fontSize: 16,
    color: Colors.grey,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image from assets
                          Image.asset(
                            _images[index],
                            height: 400,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20),
                          Text(
                            _titles[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            _descriptions[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center, // Center-align text for better presentation
                          ),
                        ],
                      ),
                      if (index == _images.length - 1) // Show button only on the last slide
                        Positioned(
                          bottom: 40, // Adjust as needed
                          child: ElevatedButton(
                            onPressed: _navigateToLoginPage,
                            child: Text('Get Started'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                              textStyle: TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero, // Makes borders square
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 8.0,
                width: _currentPage == index ? 24.0 : 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              );
            }),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  void _navigateToLoginPage() {
    Navigator.pushNamed(context, '/login'); // Ensure that '/login' route is defined in your app
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
