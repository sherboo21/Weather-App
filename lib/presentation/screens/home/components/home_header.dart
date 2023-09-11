import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/domain/model/weather.dart';
import 'package:gst_task/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../widgets/custom_text.dart';

class HomeHeader extends StatelessWidget {
  final WeatherDataModel weatherDataModel;
  const HomeHeader({Key? key, required this.weatherDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height / 3.5,
            margin: EdgeInsets.only(bottom: AppSize.h50),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: DecorationImage(
                    image: AssetImage(AppImages.cloudImage),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 0,
          left: AppSize.w20,
          right: AppSize.w20,
          child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      CustomAppText(
                        text: weatherDataModel.name ?? '',
                        textSize: 20.sp,
                      ),
                      AppSize.h20.ph,
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                CustomAppText(
                                  text: '34°C',
                                  textSize: 28.sp,
                                  textColor: AppColors.mainAppColor,
                                ),
                                CustomAppText(
                                  text: weatherDataModel.weather![0].description ?? '',
                                  textSize: 16.sp,
                                  textColor: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              AppIcons.icon,
                              fit: BoxFit.contain,
                              height: AppSize.h100,
                              width: AppSize.w100,
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
        )
      ],
    );
  }
}
