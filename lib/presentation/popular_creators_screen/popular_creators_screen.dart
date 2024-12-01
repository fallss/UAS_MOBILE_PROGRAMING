import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/popular_creators_controller.dart';
import 'models/popular_creators_model.dart'; // ignore_for_file: must_be_immutable

class PopularCreatorsScreen extends GetWidget<PopularCreatorsController> {
   PopularCreatorsScreen({Key? key})
      : super(
          key: key,
        );
  final List<PopularCreatorsModel> list = DataFile.popularModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.v,
        ),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.v,
                mainAxisExtent: 130.v,
                // childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return animationFunction(index, GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.ronaldRichardsScreen);
                  },
                  child: _buildCreators(
                    biographies: list[index].name.tr,imagePath: list[index].image,
                  ),
                ));
              },
            ),
            // _buildRowbiographies(),
            // SizedBox(height: 12.v),
            // _buildRowbiographies1(),
            // SizedBox(height: 5.v)
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: AppbarLeadingIconbutton(
        margin: EdgeInsets.only(
          left: 16.h,
          top: 21.v,
          bottom: 18.v,
        ),
        onTap: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: Text(
        'Popular Creators',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
      ),
      // onBackPress: () {
      //   Get.back();
      // },
      // title: AppbarTitle(
      //   text: "msg_popular_creators".tr,
      // ),
      styleType: Style.bgOutline,
    );
  }



  /// Common widget
  Widget _buildCreators({required String biographies, String? imagePath}) {
    return Column(
      children: [
        CustomImageView(
          imagePath: imagePath,
          height: 90.adaptSize,
          width: 90.adaptSize,
          // radius: BorderRadius.circular(
          //   45.h,
          // ),
        ),
        SizedBox(height: 7.v),
        Text(
          biographies,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
    );
  }



// @override
// void onReady() {
//   Future.delayed(const Duration(milliseconds: 3000), () {
//     Get.offNamed(
//       AppRoutes.insightsResultImageScreen,
//     );
//   });
// }
}
