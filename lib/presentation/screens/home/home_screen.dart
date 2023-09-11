import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gst_task/config/theme/app_colors.dart';
import 'package:gst_task/presentation/screens/home/components/home_header.dart';
import 'package:gst_task/presentation/screens/home/components/home_item.dart';
import 'package:gst_task/presentation/screens/home/cubit/home_cubit.dart';
import 'package:gst_task/presentation/widgets/custom_text.dart';
import 'package:gst_task/utils/app_extentions.dart';
import 'package:gst_task/utils/app_imgs.dart';
import 'package:gst_task/utils/app_size.dart';
import 'package:gst_task/utils/app_strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'components/home_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();
        var weatherDataModel = homeCubit.weatherDataModel;
        final List<WeatherOptions> weatherOptionsList =[
          WeatherOptions(
            title: AppStrings.pressure,
            value: weatherDataModel.main!.pressure ?? ''
          ),
          WeatherOptions(
              title: AppStrings.windSpeed,
              value: weatherDataModel.wind!.speed ?? ''
          ),
          WeatherOptions(
              title: AppStrings.clouds,
              value: weatherDataModel.clouds!.all ?? ''
          ),
        ];
        return Scaffold(
          body: SafeArea(
              child: ConditionalBuilder(
                condition: state is! HomeLoading,
                builder: (context) =>ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              HomeHeader(weatherDataModel: weatherDataModel),
              AppSize.h20.ph,
              SizedBox(
                height: 170.h,
                child: Center(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
                    itemCount: weatherOptionsList.length,
                    itemBuilder: (context, index) =>HomeItem(weatherOptionsList: weatherOptionsList, index: index),
                    separatorBuilder: (context, index) => AppSize.w10.pw,
                  ),
                ),
              ),
            ],
                ),
                fallback: (context) =>Center(child: CircularProgressIndicator(color: AppColors.mainAppColor),),

              )
          ),
        );
      },
    );
  }
}