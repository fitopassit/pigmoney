import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingPage extends StatefulWidget {
  OnbordingPage({Key? key}) : super(key: key);

  @override
  State<OnbordingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnbordingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(),
              child: Text(subtitle, style: const TextStyle(color: Colors.teal)),
            )
          ],
        ),
      );
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/pig.png',
                title: 'Reduce',
                subtitle: 'Lorem ipsum dolor sit amet',
              ),
              buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/pig.png',
                title: 'Reduce',
                subtitle: 'Lorem ipsum dolor sit amet',
              ),
              buildPage(
                color: Colors.orange.shade100,
                urlImage: 'assets/pig.png',
                title: 'Reuse',
                subtitle: 'Lorem ipsum dolor sit amet',
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Navigator.of(context).pushNamed('/main_screen');
                },
                child:
                    const Text('Get Started', style: TextStyle(fontSize: 24)),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: Colors.white,
                    backgroundColor: Colors.teal.shade700,
                    minimumSize: Size.fromHeight(80)),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text('Skip'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/main_screen'),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text('Next'),
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ],
                )),
      );
}
