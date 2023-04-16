import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;

  const BuildOptions({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16.0,
            color: Constants.blackColor.withOpacity(0.4),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "iranSans",
                  color: Constants.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5.0),
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(0.5),
                size: 23,
              ),
            ],
          )
        ],
      ),
    );
  }
}
