
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/block_consumer_for_otp.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_field_for_verification.dart';
import '../view_model/verify_password_view_model/verify_password_cubit.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late VerifyPasswordViewModel viewModel;
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  bool _isCodeInvalid = false; // Track invalid code state

  final String _errorMessage = AppStrings.invalidCode;

  @override
  void initState() {
    viewModel = getIt.get<VerifyPasswordViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16),
            child: Column(
              children: [
                CustomAppBar(
                  title: AppStrings.password,
                  color: ColorManager.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: AppSize.s40),
                Text(
                  AppStrings.emailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.black,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                Text(
                  AppStrings.subTitleOfEmailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.grey,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
                const SizedBox(height: AppSize.s32),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      AppConstants.listGenerate,
                          (index) {
                        return CustomFieldForOtpVerification(
                          controllers: _controllers,
                          viewModel: viewModel,
                          isCodeInvalid: _isCodeInvalid,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_isCodeInvalid)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: AppSize.s16,
                        color: ColorManager.error,
                      ),
                      Text(
                        _errorMessage,
                        style: const TextStyle(color: ColorManager.error),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                BlocConsumerForOtpVerificationPage(
                  onCodeInvalid: (isInvalid) {
                    setState(() {
                      _isCodeInvalid = isInvalid;
                    });
                  },
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.dontReciveCode,
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.black,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.resend,
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.pink,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}