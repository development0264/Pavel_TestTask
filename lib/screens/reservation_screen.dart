import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/constant/app_colors.dart';
import 'package:test_task/constant/app_images.dart';
import 'package:test_task/screens/bag_scanner_screen.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    double scaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: SvgPicture.asset(AppImages.arrowLeft, fit: BoxFit.contain),
        ),
        title: Text(
          "Reservations",
          style: TextStyle(
            fontFamily: "SiemensSans",
            fontWeight: FontWeight.w400,
            fontSize: 16 * scaleFactor,
            color: AppColors.whiteColor,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 24),
        actions: [SvgPicture.asset(AppImages.reset)],
      ),
      backgroundColor: AppColors.primaryColor,
      body: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BagScannerScreen()),
              );
            },
            child: _buildColumn(size, scaleFactor),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 8);
        },
      ),
    );
  }

  Widget _buildColumn(Size size, double scaleFactor) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.bgBoxParentColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 62,
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Text(
                        "487242",
                        style: TextStyle(
                          fontFamily: "SiemensSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 14 * scaleFactor,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 14 * scaleFactor,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: SvgPicture.asset(AppImages.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "EK 008",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 14 * scaleFactor,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "JFK",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 14 * scaleFactor,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      "New York John Kennedy",
                      style: TextStyle(
                        fontFamily: "SiemensSans",
                        fontWeight: FontWeight.w400,
                        fontSize: 13 * scaleFactor,
                        color: AppColors.whiteColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 71,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        "19:10 – 19:15",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SiemensSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 14 * scaleFactor,
                          color: AppColors.whiteColor,
                          height: 0.87,
                        ),
                      ),
                    ),
                    SizedBox(width: 11),
                    SvgPicture.asset(AppImages.arrowRight),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.bgBoxChildColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Terminal 3",
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * scaleFactor,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  "T3 Belt 11 Stand A03",
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * scaleFactor,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
