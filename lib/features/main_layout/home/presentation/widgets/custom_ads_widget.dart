import 'dart:async';

import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdsWidget extends StatefulWidget {
  final List<String> adsImages;

  const CustomAdsWidget({
    super.key,
    required this.adsImages,
  });

  @override
  State<CustomAdsWidget> createState() => _CustomAdsWidgetState();
}

class _CustomAdsWidgetState extends State<CustomAdsWidget> {
  int _currentIndex = 0;

  late Timer _timer;

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.adsImages.length;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            child: Image.asset(
              height: 210.h,
              width: double.infinity,
              widget.adsImages[_currentIndex],
              key: ValueKey<int>(_currentIndex),
            ),
          ),
          SizedBox(
            height: 210.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.adsImages.map((image) {
                int index = widget.adsImages.indexOf(image);
                return Container(
                  width: 8.w,
                  height: 8.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 4.0.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? ColorManager.primary
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
