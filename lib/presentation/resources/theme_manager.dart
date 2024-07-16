import 'package:flutter/material.dart';
import 'package:tut/presentation/resources/styles_manager.dart';
import 'package:tut/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';


ThemeData getApplicationTheme() {
  return ThemeData(
      // main color
      primaryColor: ColorManger.primary,
      primaryColorDark: ColorManger.darkPrimary,
      primaryColorLight: ColorManger.lightPrimary,
      disabledColor: ColorManger.grey1,
      splashColor: ColorManger.lightPrimary,
      // ripple effect color (color of button when pressed )
      // card view theme
      cardTheme: CardTheme(
        color: ColorManger.whit,
        shadowColor: ColorManger.grey,
        elevation: AppSize.s4,
      ),
      // app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: getRegularStyle(color: ColorManger.whit),
        color: ColorManger.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManger.lightPrimary,
      ),
      // button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManger.grey1,
          buttonColor: ColorManger.primary,
          splashColor: ColorManger.lightPrimary),

      // text button
      textButtonTheme: TextButtonThemeData(
        style:ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ColorManger.primary), // Text color
        //  backgroundColor: MaterialStateProperty.all(Colors.blue), // Background color
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ColorManger.lightPrimary; // Color when button is pressed
              }
              return null; // Defer to the default value
            },
          ),
        ),
      ),

      // elevated button theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle:
              getRegularStyle(color: ColorManger.whit, fontSize: FontSize.s17),
          backgroundColor: ColorManger.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManger.darkGrey, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManger.darkGrey, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(color: ColorManger.darkGrey,fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorManger.primary, fontSize: FontSize.s16),
        bodySmall: getRegularStyle(
          color: ColorManger.grey1,
        ),
        titleLarge: getMediumStyle(color: ColorManger.whit,fontSize: FontSize.s16),

        labelLarge: getRegularStyle(color: ColorManger.primary,fontSize: FontSize.s18),
        bodyLarge: getRegularStyle(color: ColorManger.grey),
      ),


      // input decoration theme (text form filed)
      inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManger.grey, fontSize: FontSize.s14),
        // label style
        labelStyle:
            getMediumStyle(color: ColorManger.grey, fontSize: FontSize.s14),
        // error style
        errorStyle: getRegularStyle(
          color: ColorManger.error,
        ),
        // enable border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // focus border
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        // error border style

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.error,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),

        // focus error border
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ));
}
