// ignore_for_file: sort_child_properties_last, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/shayan3.jpg',
    'assets/shayan4.jpg',
    'assets/shayan2.jpg',
  ];
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  final List<String> _headings = [
    'NO   1\n Featured\n Tailored',
    'NO   2\n Featured\n Tailored',
    'NO   3\n Featured\n Tailored',
  ];

  final List<String> _texts = [
    'Jennifer Kingsley exploring the\n new range of winter fashion wear',
    'Jennifer Kingsley exploring the\n new range of winter fashion wear',
    'Jennifer Kingsley exploring the\n new range of winter fashion wear',
  ];

  final List<TextStyle> _headingStyles = [
    const TextStyle(
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255)),
    const TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    const TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ];

  final List<TextStyle> _textStyles = [
    const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
    const TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _startTimer() {
    const duration = Duration(seconds: 5);
    _timer = Timer.periodic(duration, (_) {
      setState(() {
        if (_currentIndex < _images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            _images[_currentIndex],
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.0,
            left: 20.0,
            child: SlideTransition(
              position: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _headings[_currentIndex],
                    style:
                        _headingStyles[_currentIndex % _headingStyles.length],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _texts[_currentIndex],
                    style: _textStyles[_currentIndex % _textStyles.length],
                  ),
                ],
              ),
            ),
          ),
          // Rest of the code...
          Positioned(
            top: MediaQuery.of(context).size.height / 1.1,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_currentIndex < _images.length - 1) {
                    _currentIndex++;
                  } else {
                    _currentIndex = 0;
                  }
                });
              },
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_currentIndex > 0) {
                    _currentIndex--;
                  } else {
                    _currentIndex = _images.length - 1;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
