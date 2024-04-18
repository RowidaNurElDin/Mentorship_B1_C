import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/rocket.dart';
import '../widgets/rocket_image_widget.dart';

class RocketDetailsPage extends StatefulWidget {
  const RocketDetailsPage({super.key});

  @override
  _RocketDetailsPageState createState() => _RocketDetailsPageState();
}

class _RocketDetailsPageState extends State<RocketDetailsPage> {
  bool _isExpanded = false;
  double _dragOffset = 650;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMd().format(rocket.date);

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            _dragOffset += details.delta.dy;

            _dragOffset = _dragOffset.clamp(
                0.0, MediaQuery.of(context).size.height * 0.3);
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            if (_dragOffset > MediaQuery.of(context).size.height * 0.25) {
              _isExpanded = true;
            } else {
              _isExpanded = false;
            }
            _dragOffset = 0.0;
          });
        },
        child: Stack(
          children: [
            RocketImageWidget(imageUrl:rocket.imageUrl ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: _isExpanded
                  ? MediaQuery.of(context).size.height * 0.7
                  : _dragOffset,
              left: 0,
              right: 0,
              bottom: 0,
              child:IgnorePointer(
                ignoring: _isExpanded,
                child:  Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(35)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Colors.grey,
                        indent: 140,
                        endIndent: 140,
                        thickness: 3,
                      ),

                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        rocket.name,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        rocket.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        )  ],
        ),
      ),
    );
  }
}

