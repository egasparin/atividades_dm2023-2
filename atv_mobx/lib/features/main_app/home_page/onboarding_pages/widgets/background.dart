import 'package:flutter/material.dart';

class OBBackground extends StatelessWidget {
  final ImageProvider imageProvider;
  final String headerText;
  final String bodyText;

  const OBBackground({
    super.key,
    required this.imageProvider,
    required this.headerText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1),
            BlendMode.darken,
          ),
          opacity: 0.2,
          image: imageProvider,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 8,
              right: 8,
            ),
            child: Text(
              headerText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 0.5 * MediaQuery.sizeOf(context).height,
            alignment: AlignmentDirectional.center,
            child: Text(
              bodyText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
