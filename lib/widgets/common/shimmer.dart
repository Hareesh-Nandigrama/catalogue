import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShowShimmer extends StatefulWidget {
  const ShowShimmer({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  State<ShowShimmer> createState() => _ShowShimmerState();
}

class _ShowShimmerState extends State<ShowShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Shimmer.fromColors(
                baseColor: Color.fromRGBO(47, 48, 51, 1),
                highlightColor: Color.fromRGBO(68, 71, 79, 1),
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color.fromRGBO(47, 48, 51, 1),)
                )),
          ),
        ],
      ),
    );
  }
}