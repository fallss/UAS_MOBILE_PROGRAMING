import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

import '../../core/data_file/data_file.dart';
import '../../widgets/custom_elevated_button.dart';
import 'cotroller/onBording_controller.dart';
import 'model/onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardingModel> introList = DataFile.onBordData;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<OnBoardingController>(
            init: OnBoardingController(),
            builder: (controller) {
              return Stack(
                children: [
                  Container(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        controller.onChange(value);
                      },
                      controller: controller.pageController,
                      itemBuilder: (context, index) {
                        OnBoardingModel modelIntro = introList[index];
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(modelIntro.image),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 16.h, right: 16.h, bottom: 175.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  modelIntro.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.fSize,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w600,
                                    // height: 0.05,
                                  ),
                                ),
                                SizedBox(height: 16.v),
                                Text(
                                  modelIntro.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF030401),
                                    fontSize: 16.fSize,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    // height: 0.09,
                                    // letterSpacing: 0.16,
                                  ),
                                ),
                                SizedBox(height: 30.v),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: introList.length,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          introList.length,
                          (index) {
                            return AnimatedContainer(
                              margin: EdgeInsets.only(left: 4.h, right: 4.h),
                              duration: const Duration(milliseconds: 300),
                              height: 7.v,
                              width: (index == controller.sliderIndex)
                                  ? 16.h
                                  : 7.h,
                              decoration: BoxDecoration(
                                  borderRadius: index == controller.sliderIndex
                                      ? BorderRadius.circular(16.h)
                                      : BorderRadius.circular(100.h),
                                  color: (index == controller.sliderIndex)
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.primary
                                          .withOpacity(0.30)),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.v),
                        child: CustomElevatedButton(
                          height: 50.h,
                          width: double.infinity,
                          buttonStyle: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                theme.colorScheme.primary),
                          ),
                          text: (controller.sliderIndex == introList.length - 1)
                              ? "Get started"
                              : "Next",
                          onPressed:
                              controller.sliderIndex == introList.length - 1
                                  ? () {
                                      PrefUtils.setIntro(false);
                                      Get.toNamed(
                                        AppRoutes.loginPage,
                                      );
                                    }
                                  : () {
                                      controller.pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.bounceIn);
                                    },
                        ),
                      ),
                      // SizedBox(height: 16.v),

                      // SizedBox(height: 44.v),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.v, bottom: 40),
                          child: InkWell(
                            onTap: () {
                              PrefUtils.setIntro(false);
                              Get.toNamed(
                                AppRoutes.loginPage,
                              );
                            },
                            child: Text(
                              (controller.sliderIndex == introList.length - 1)
                                  ? " "
                                  : "Skip",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  backClick() {
    PrefUtils.closeApp();
    // Constant.closeApp();
  }
}
