import 'package:flutter/material.dart';
import 'package:shared_design_components/colors/colors.dart';

class OrganizationTextStyle {
  const OrganizationTextStyle._();

  static const TextStyle heading1 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 96.0,
    fontWeight: FontWeight.w400,
    // height: 1.2,
    color: OrganizationColors.primary,
  );
  static const TextStyle heading2 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    color: OrganizationColors.primary,
  );

  static const TextStyle heading3 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: OrganizationColors.primary,
  );

  static const TextStyle body1 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: OrganizationColors.primary,
  );

  static const TextStyle body2 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: OrganizationColors.primary,
  );

  static const TextStyle subTitle1 = TextStyle(
    package: 'shared_design_components',
    fontFamily: 'Roboto-Regular',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: OrganizationColors.primary,
  );
}
