// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SkeletonCardWidget extends StatelessWidget {
  const SkeletonCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 20,
            bottom: 8,
          ),
          child: Skeleton(
            radius: 100,
            width: 85,
            height: 85,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 15,
            bottom: 8,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Skeleton(
                width: 85,
              ),
              SizedBox(
                height: 8,
              ),
              Skeleton(
                width: 160,
              ),
              SizedBox(
                height: 8,
              ),
              Skeleton(
                width: 180,
              ),
              SizedBox(
                height: 2,
              ),
              Skeleton(
                width: 230,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.height,
    this.radius,
    this.width,
  }) : super(key: key);

  final double? radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: height ?? 15,
      width: width!,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(
          radius ?? 16,
        ),
      ),
    );
  }
}
