import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_filed_widget.dart';
import '../dailogs/poll_added_scusse_dailog.dart';
import 'controller/add_new_poll_answer_screen_controller.dart';

class AddNewPollAnswerScreenPage extends StatefulWidget {
  AddNewPollAnswerScreenPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<AddNewPollAnswerScreenPage> createState() =>
      _AddNewPollAnswerScreenPageState();
}

class _AddNewPollAnswerScreenPageState
    extends State<AddNewPollAnswerScreenPage> {
  AddNewPollAnswerScreenController controller =
      Get.put(AddNewPollAnswerScreenController());

  @override
  void initState() {
    print("dfgjrfgreg----${controller.isVisible.value} }");
    controller.isVisible.value = false;
    controller.isVisibleImage.value = false;
    controller.isVisibleVoting.value = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar(),
      body: Column(
        children: [
          Expanded(
              child: GetBuilder<AddNewPollAnswerScreenController>(
            init: AddNewPollAnswerScreenController(),
            builder: (controller) {
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 16.v),
                  _buildQuestionvalue(),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "Options".tr,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 18.fSize,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v),
                  controller.isVisible.value == true
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: AnimationLimiter(
                            child: Column(
                              children: AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 375),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        horizontalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: widget,
                                        ),
                                      ),
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        border: Border.all(
                                          color: appTheme.gray300,
                                          width: 1.h,
                                        ),
                                      ),
                                      child: Text(
                                        'Lamborghini',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.fSize,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        border: Border.all(
                                          color: appTheme.gray300,
                                          width: 1.h,
                                        ),
                                      ),
                                      child: Text(
                                        'Toyota',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.fSize,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        border: Border.all(
                                          color: appTheme.gray300,
                                          width: 1.h,
                                        ),
                                      ),
                                      child: Text(
                                        'Range rover',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.fSize,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                  ]),
                            ),
                          ),
                        )
                      : Container(),
                  controller.isVisibleImage.value == true
                      ? AnimationLimiter(
                          child: GridView(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 200.h,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 16.h),
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle3845,
                                  fit: BoxFit.contain,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle3846,
                                  fit: BoxFit.contain,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.h),
                                    color: appTheme.gray100,
                                  ),
                                  child: Center(
                                    child: CustomImageView(
                                      imagePath: ImageConstant.add_image,
                                      fit: BoxFit.contain,
                                      height: 48.h,
                                      width: 48.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  controller.isVisibleVoting.value == true
                      ? AnimationLimiter(
                          child: GridView(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 200.h,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 16.h),
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: widget,
                                ),
                              ),
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle3843,
                                  fit: BoxFit.contain,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgRectangle3844,
                                  fit: BoxFit.contain,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.h),
                                    color: appTheme.gray100,
                                  ),
                                  child: Center(
                                    child: CustomImageView(
                                      imagePath: ImageConstant.add_image,
                                      fit: BoxFit.contain,
                                      height: 48.h,
                                      width: 48.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  controller.isVisibleImage.value == true ||
                          controller.isVisibleVoting.value == true
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            Get.bottomSheet(Container(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.h),
                                    topRight: Radius.circular(32.h)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Add new',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.fSize,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 44.h,
                                          width: 44.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: appTheme.gray50,
                                          ),
                                          child: Center(
                                            child: CustomImageView(
                                              height: 24.h,
                                              width: 24.h,
                                              imagePath: ImageConstant.close,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Divider(
                                    color: appTheme.gray50,
                                    thickness: 1.h,
                                  ),
                                  SizedBox(height: 24.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "dgfjdggi==dsfdsf=${controller.isVisible.value} ${controller.isVisibleImage.value}  ${controller.isVisibleVoting.value} }");

                                            controller.isVisible.value = true;
                                            controller.isVisibleImage.value =
                                                false;
                                            controller.isVisibleVoting.value =
                                                false;
                                            controller.update();
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                              border: Border.all(
                                                  color: appTheme.gray300),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16.h),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 44.h,
                                                    width: 44.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: appTheme.gray50,
                                                    ),
                                                    child: Center(
                                                      child: CustomImageView(
                                                        height: 24.h,
                                                        width: 24.h,
                                                        imagePath: ImageConstant
                                                            .answer,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    'Answer',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.fSize,
                                                      fontFamily: 'Satoshi',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        SizedBox(width: 16.h),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "dgfjdggi==676=${controller.isVisible.value} ${controller.isVisibleImage.value}  ${controller.isVisibleVoting.value} }");
                                            controller.isVisibleImage.value =
                                                true;
                                            controller.isVisible.value = false;
                                            controller.isVisibleVoting.value =
                                                false;
                                            controller.update();
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                              border: Border.all(
                                                  color: appTheme.gray300),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16.h),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 44.h,
                                                    width: 44.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: appTheme.gray50,
                                                    ),
                                                    child: Center(
                                                      child: CustomImageView(
                                                        height: 24.h,
                                                        width: 24.h,
                                                        imagePath:
                                                            ImageConstant.image,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    'Image',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.fSize,
                                                      fontFamily: 'Satoshi',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        SizedBox(width: 16.h),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            print(
                                                "dgfjdggi==rw44=${controller.isVisible.value} ${controller.isVisibleImage.value}  ${controller.isVisibleVoting.value} }");

                                            controller.isVisibleVoting.value =
                                                true;
                                            controller.isVisibleImage.value =
                                                false;
                                            controller.isVisible.value = false;
                                            controller.update();
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.h),
                                              border: Border.all(
                                                  color: appTheme.gray300),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32.h,
                                                  vertical: 16.h),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 44.h,
                                                    width: 44.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: appTheme.gray50,
                                                    ),
                                                    child: Center(
                                                      child: CustomImageView(
                                                        height: 24.h,
                                                        width: 24.h,
                                                        imagePath: ImageConstant
                                                            .voting,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    'Voting',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.fSize,
                                                      fontFamily: 'Satoshi',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.h),
                                border: Border.all(color: Color(0xFFDBDBDB)),
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    height: 24.h,
                                    width: 24.h,
                                    imagePath: ImageConstant.addNewPoll,
                                  ),
                                  SizedBox(width: 16.h),
                                  Text(
                                    'Add New',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 17.fSize,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              );
            },
          )),
          _buildAddPoll(),
          SizedBox(height: 40.v),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Add new poll".tr,
      ),
      styleType: Style.bgOutline,
    );
  }

  Widget emptyView() {
    CustomBottomBarController controller = Get.find();
    return Column(
      children: [
        CustomImageView(
          height: 120.h,
          width: 120.h,
          imagePath: ImageConstant.insights_empty,
        ),
        SizedBox(height: 28.h),
        Text(
          'No added polls yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.fSize,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 13.h),
        Text(
          'Your added polls list is empty please add polls.\n go to home and enjoy your service',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.fSize,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 28.h),
        CustomElevatedButton(
          text: "Go to home",
          margin: EdgeInsets.symmetric(horizontal: 54.h),
          onPressed: () {
            controller.getIndex(0);
          },
        )
      ],
    );
  }

  Widget _buildQuestionvalue() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomTextFormField(
        controller: controller.questionvalueController,
        label: "Ask question".tr,
        hintText: "Ask question".tr,
      ),
    );
  }

  Widget _buildAddPoll() {
    return CustomElevatedButton(
      height: 56.v,
      text: "Add poll".tr,
      onPressed: () {
        Get.dialog(AlertDialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(horizontal: 0.h),
          content: PollAddedSuccess(),
        ));
      },
      margin: EdgeInsets.symmetric(horizontal: 16.h),
    );
  }
}
