import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/constant/app_colors.dart';
import 'package:test_task/constant/app_images.dart';

class BagScannerScreen extends StatefulWidget {
  const BagScannerScreen({super.key});

  @override
  State<BagScannerScreen> createState() => _BagScannerScreenState();
}

class _BagScannerScreenState extends State<BagScannerScreen> {
  // Declare this somewhere accessible, maybe in your parent widget:
  ValueNotifier<int> scannedCountNotifier = ValueNotifier<int>(0);

  List<Map<String, dynamic>> bags = [
    {
      'bagId': '0176338186',
      'dateTime': '30 Apr 18:43:22',
      'timeAgo': '6 seconds ago',
      'scanned': false,
      'collected': false,
      'delivered': false,
      'isFound': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    double scaleFactor = MediaQuery.of(context).textScaleFactor;

    int scannedCount = bags.where((bag) => bag['scanned'] == true).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SvgPicture.asset(AppImages.arrowLeft, fit: BoxFit.contain),
          ),
        ),
        title: Text(
          "Bag Scanner",
          style: TextStyle(
            fontFamily: "SiemensSans",
            fontWeight: FontWeight.w400,
            fontSize: 16 * scaleFactor,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bags scanned: $scannedCount / 3",
                    style: TextStyle(
                      fontFamily: "SiemensSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 14 * scaleFactor,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: scannedCount / 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.greenColor,
                        ),
                        backgroundColor: AppColors.progressBarColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            InkWell(
              onTap: () {
                _modalBottomSheetMenu(context, size, scaleFactor, scannedCount);
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.bgBoxParentColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reservation No: 487242",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16 * scaleFactor,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Flight No. EK 0008",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 14 * scaleFactor,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.bgBoxChildColor,
                      ),
                      padding: EdgeInsets.all(6.67),
                      child: SvgPicture.asset(
                        AppImages.arrowUp,
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _modalBottomSheetMenu(
    BuildContext context,
    Size size,
    double scaleFactor,
    int scannedCount,
  ) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (builder) {
        int scannedCountLocal = scannedCount;
        return FractionallySizedBox(
          heightFactor: 0.85,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  print("setModalState $scannedCount");
                  return Container(
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      color: AppColors.bottomBgColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11.0,
                                ),
                                child: Text(
                                  "Reservation info",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "SiemensSans",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16 * scaleFactor,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 34.67,
                                width: 34.67,
                                padding: EdgeInsets.all(9),
                                child: SvgPicture.asset(
                                  AppImages.close,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgBoxParentColor,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reservation No: 487242",
                                style: TextStyle(
                                  fontFamily: "SiemensSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16 * scaleFactor,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Flight No. EK 0008",
                                style: TextStyle(
                                  fontFamily: "SiemensSans",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14 * scaleFactor,
                                  color: AppColors.whiteColor.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Text(
                                    "$scannedCountLocal / 3",
                                    style: TextStyle(
                                      fontFamily: "SiemensSans",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 26 * scaleFactor,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Bags found and scanned",
                                    style: TextStyle(
                                      fontFamily: "SiemensSans",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14 * scaleFactor,
                                      color: AppColors.whiteColor.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0),
                                ),
                                child: LinearProgressIndicator(
                                  value: scannedCountLocal / 3,
                                  // progress as a fraction
                                  minHeight: 6,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.greenColor,
                                  ),
                                  backgroundColor: AppColors.progressBarColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Bags",
                          style: TextStyle(
                            fontFamily: "SiemensSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 14 * scaleFactor,
                            color: AppColors.whiteColor.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 8),
                        // // Bag 1 (found)
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: bags.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final bag = bags[index];
                              return bagStatusCard(
                                scaleFactor: scaleFactor,
                                bagId: bag['bagId'],
                                dateTime: bag['dateTime'],
                                timeAgo: bag['timeAgo'],
                                isScanned: bag['scanned'],
                                isCollected: bag['collected'],
                                isDelivered: bag['delivered'],
                                isFound: bag['isFound'],
                                onScannedChanged: (value) {
                                  setModalState(() {
                                    bags[index]['scanned'] = value;

                                      scannedCountLocal = value ? 1: 0;

                                  });
                                  setState(() {});
                                },
                                onCollectedChanged: (value) {
                                  setModalState(
                                    () => bags[index]['collected'] = value,
                                  );
                                  setState(() {});
                                },
                                onDeliveredChanged: (value) {
                                  setModalState(
                                    () => bags[index]['delivered'] = value,
                                  );
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 8),

                        //Bag 2 (not found)
                        buildBagCard(
                          scaleFactor,
                          "0176338186",
                          null,
                          null,
                          false,
                        ),
                        SizedBox(height: 8),

                        // Bag 3 (not found)
                        buildBagCard(
                          scaleFactor,
                          "0176338186",
                          null,
                          null,
                          false,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget buildBagCard(
    double scaleFactor,
    String bagNumber,
    String? dateTime,
    String? timeAgo,
    bool isFound,
  ) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
        color: AppColors.bgBoxParentColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 33),
            child: SvgPicture.asset(AppImages.delete),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
              Text(
                bagNumber,
                style: TextStyle(
                  fontFamily: "SiemensSans",
                  fontWeight: FontWeight.w400,
                  fontSize: 14 * scaleFactor,
                  color: AppColors.whiteColor,
                ),
              ),
              if (isFound && dateTime != null && timeAgo != null) ...[
                SizedBox(height: 4),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 11 * scaleFactor,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  timeAgo,
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 11 * scaleFactor,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
              ],
              if (!isFound) ...[
                SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(72)),
                    color: AppColors.redColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "Not Found",
                    style: TextStyle(
                      fontFamily: "SiemensSans",
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * scaleFactor,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget bagStatusCard({
    required double scaleFactor,
    required String bagId,
    required String dateTime,
    required String timeAgo,
    required bool isScanned,
    required bool isCollected,
    required bool isDelivered,
    required bool isFound,
    required ValueChanged<bool> onScannedChanged,
    required ValueChanged<bool> onCollectedChanged,
    required ValueChanged<bool> onDeliveredChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgBoxParentColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bag icon box
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 33),
            child: SvgPicture.asset(AppImages.delete),
          ),
          SizedBox(width: 8),

          // Bag info
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7),
                Text(
                  bagId,
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 14 * scaleFactor,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 11 * scaleFactor,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  timeAgo,
                  style: TextStyle(
                    fontFamily: "SiemensSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 11 * scaleFactor,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),

          // Switches
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSwitchTile(
                  isScanned ? "Scanned" : "Not Scanned",
                  isScanned,
                  onScannedChanged,
                  activeColor: Colors.green,
                ),
                buildSwitchTile(
                  isCollected ? "Collected" : "Not collected",
                  isCollected,
                  onCollectedChanged,
                ),
                buildSwitchTile(
                  isDelivered ? "Delivered" : "Not delivered",
                  isDelivered,
                  onDeliveredChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchTile(
    String label,
    bool value,
    ValueChanged<bool> onChanged, {
    Color activeColor = const Color(0xFF00DA45), // Green
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: activeColor,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade600,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: "SiemensSans",
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: value ? AppColors.greenColor : AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
