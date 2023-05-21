import 'package:flutter/material.dart';
import 'package:plant_app/const/constans.dart';
import 'package:plant_app/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // Profile Image
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(0.5),
                    width: 5.0,
                  )),
              child: const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
            // End of Profile Image
            const SizedBox(height: 20.0),
            // Profile Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ساناز امینی',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20.0,
                    fontFamily: 'YekanBakh',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 30.0,
                  child: Image.asset(
                    'assets/images/verified.png',
                  ),
                ),
              ],
            ),
            // End Profile Name
            const SizedBox(height: 10.0),
            // Profile Email
            Text(
              'Sanaz@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(0.4),
                fontSize: 16.0,
              ),
            ),
            // End Profile Email
            const SizedBox(height: 30.0),
            // Profile Options
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back Button
                BuildOptions(title: 'پروفایل من', icon: Icons.person),
                BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                BuildOptions(
                    title: 'اطلاع رسانی ها', icon: Icons.notifications),
                BuildOptions(
                    title: 'شبکه های اجتماعی', icon: Icons.share_rounded),
                BuildOptions(title: 'خروج', icon: Icons.logout),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
