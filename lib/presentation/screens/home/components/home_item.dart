import 'package:flutter/material.dart';
import 'package:gst_task/presentation/screens/home/components/home_imports.dart';

class HomeItem extends StatelessWidget {
  final List<WeatherOptions> weatherOptionsList;
  final int index;
  const HomeItem({Key? key, required this.weatherOptionsList, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.h15, horizontal: AppSize.w20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          children: [
            CustomAppText(
              text: weatherOptionsList[index].title,
              maxLines: 1,
              textSize: 20.sp,
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
            ),
            AppSize.h10.ph,
            CustomAppText(
              text: weatherOptionsList[index].value.toString(),
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              textColor: Colors.grey,
            ),
            AppSize.h10.ph,
            Image.asset(
              AppIcons.icon,
              fit: BoxFit.contain,
              height: AppSize.h60,
              width: AppSize.w60,
            )
          ],
        ),
      ),
    );
  }
}
