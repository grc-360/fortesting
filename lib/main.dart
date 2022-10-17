/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020, 2021 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wger/providers/add_exercise.dart';
import 'package:wger/providers/base_provider.dart';
import 'package:wger/providers/body_weight.dart';
import 'package:wger/providers/exercises.dart';
import 'package:wger/providers/gallery.dart';
import 'package:wger/providers/measurement.dart';
import 'package:wger/providers/nutrition.dart';
import 'package:wger/providers/user.dart';
import 'package:wger/providers/workout_plans.dart';
import 'package:wger/screens/add_exercise_screen.dart';
import 'package:wger/screens/auth_screen.dart';
import 'package:wger/screens/dashboard.dart';
import 'package:wger/screens/exercise_screen.dart';
import 'package:wger/screens/exercises_screen.dart';
import 'package:wger/screens/form_screen.dart';
import 'package:wger/screens/gallery_screen.dart';
import 'package:wger/screens/gym_mode.dart';
import 'package:wger/screens/home_tabs_screen.dart';
import 'package:wger/screens/measurement_categories_screen.dart';
import 'package:wger/screens/measurement_entries_screen.dart';
import 'package:wger/screens/nutritional_diary_screen.dart';
import 'package:wger/screens/nutritional_plan_screen.dart';
import 'package:wger/screens/nutritional_plans_screen.dart';
import 'package:wger/screens/splash_screen.dart';
import 'package:wger/screens/weight_screen.dart';
import 'package:wger/screens/workout_plan_screen.dart';
import 'package:wger/screens/workout_plans_screen.dart';
import 'package:wger/theme/theme.dart';

import 'providers/auth.dart';

void main() {
  // Needs to be called before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ExercisesProvider>(
          create: (context) => ExercisesProvider(
              WgerBaseProvider(Provider.of<AuthProvider>(context, listen: false))),
          update: (context, base, previous) =>
              previous ?? ExercisesProvider(WgerBaseProvider(base)),
        ),
        ChangeNotifierProxyProvider2<AuthProvider, ExercisesProvider, WorkoutPlansProvider>(
          create: (context) => WorkoutPlansProvider(
            Provider.of<AuthProvider>(context, listen: false),
            Provider.of<ExercisesProvider>(context, listen: false),
            [],
          ),
          update: (context, auth, exercises, previous) =>
              previous ?? WorkoutPlansProvider(auth, exercises, []),
        ),
        ChangeNotifierProxyProvider<AuthProvider, NutritionPlansProvider>(
          create: (context) =>
              NutritionPlansProvider(Provider.of<AuthProvider>(context, listen: false), []),
          update: (context, auth, previous) => previous ?? NutritionPlansProvider(auth, []),
        ),
        ChangeNotifierProxyProvider<AuthProvider, MeasurementProvider>(
          create: (context) => MeasurementProvider(
            WgerBaseProvider(Provider.of<AuthProvider>(context, listen: false)),
          ),
          update: (context, base, previous) =>
              previous ?? MeasurementProvider(WgerBaseProvider(base)),
        ),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (context) => UserProvider(
            WgerBaseProvider(Provider.of<AuthProvider>(context, listen: false)),
          ),
          update: (context, base, previous) => previous ?? UserProvider(WgerBaseProvider(base)),
        ),
        ChangeNotifierProxyProvider<AuthProvider, BodyWeightProvider>(
          create: (context) =>
              BodyWeightProvider(Provider.of<AuthProvider>(context, listen: false), []),
          update: (context, auth, previous) => previous ?? BodyWeightProvider(auth, []),
        ),
        ChangeNotifierProxyProvider<AuthProvider, GalleryProvider>(
          create: (context) =>
              GalleryProvider(Provider.of<AuthProvider>(context, listen: false), []),
          update: (context, auth, previous) => previous ?? GalleryProvider(auth, []),
        ),
        ChangeNotifierProxyProvider<AuthProvider, AddExerciseProvider>(
          create: (context) => AddExerciseProvider(
            WgerBaseProvider(Provider.of<AuthProvider>(context, listen: false)),
          ),
          update: (context, base, previous) =>
              previous ?? AddExerciseProvider(WgerBaseProvider(base)),
        )
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'wger',
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                iconColor: wgerSecondaryColor,
                labelStyle: TextStyle(color: Colors.black),
              ),

              /*
    * General stuff
    */
              primaryColor: wgerPrimaryColor,
              scaffoldBackgroundColor: wgerBackground,

              // This makes the visual density adapt to the platform that you run
              // the app on. For desktop platforms, the controls will be smaller and
              // closer together (more dense) than on mobile platforms.
              visualDensity: VisualDensity.adaptivePlatformDensity,

              // Show icons in the system's bar in light colors
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                color: wgerPrimaryColor,
                titleTextStyle:
                    TextStyle(fontFamily: 'OpenSansBold', color: Colors.white, fontSize: 15),
              ),
              textTheme: TextTheme(
                headline1: const TextStyle(
                    fontFamily: 'OpenSansLight', color: wgerPrimaryButtonColor, fontSize: 12),
                headline2: const TextStyle(
                    fontFamily: 'OpenSans', color: wgerPrimaryButtonColor, fontSize: 15),
                headline3: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: wgerPrimaryButtonColor,
                ),
                headline4: TextStyle(
                  fontSize: materialSizes['h4']! * 0.8,
                  fontFamily: 'OpenSansBold',
                  color: wgerPrimaryButtonColor,
                ),
                headline5: TextStyle(
                  fontSize: 16,
                  fontFamily: 'OpenSansSemiBold',
                  color: wgerPrimaryButtonColor,
                ),
                headline6: TextStyle(
                  fontSize: materialSizes['h6']! * 0.8,
                  fontFamily: 'OpenSans',
                  color: wgerPrimaryButtonColor,
                ),
                subtitle1: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'OpenSans',
                  color: wgerPrimaryColorLight,
                ),
                subtitle2: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'OpenSansLight',
                  color: wgerPrimaryColorLight,
                ),
              ),

              /*
     * Button theme
     */
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: wgerSecondaryColor,
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  primary: wgerSecondaryColor,
                  visualDensity: VisualDensity.compact,
                  side: const BorderSide(color: wgerSecondaryColor),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: wgerSecondaryColor,
                ),
              ),

              /*
    * Forms, etc.
    */
              sliderTheme: const SliderThemeData(
                activeTrackColor: wgerSecondaryColor,
                thumbColor: wgerPrimaryColor,
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: wgerSecondaryColor,
                brightness: Brightness.light,
              )),
          darkTheme: ThemeData(
            dividerColor: wgerSecondaryColorLightDark,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.white,
              unselectedItemColor: wgerSecondaryColorLightDark,
              backgroundColor: wgerPrimaryColorDark,
            ),
            focusColor: wgerSecondaryColorDark,
            splashColor: wgerPrimaryColorLightDark,
            primaryColor: wgerPrimaryColorDark,
            primaryColorDark: wgerPrimaryButtonColorDark,
            scaffoldBackgroundColor: wgerBackgroundDark,
            cardColor: wgerPrimaryColorLightDark,
            appBarTheme: AppBarTheme(
                color: wgerPrimaryColorDark,
                elevation: 10,
                titleTextStyle: TextStyle(
                    fontFamily: 'OpenSansBold', color: wgerSecondaryColorLightDark, fontSize: 15)),
            textTheme: TextTheme(
              headline1:
                  const TextStyle(fontFamily: 'OpenSansLight', color: Colors.white, fontSize: 12),
              headline2: const TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontSize: 15),
              headline3: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
                color: wgerSecondaryColorLightDark,
              ),
              headline4: TextStyle(
                  color: wgerSecondaryColorLightDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSansBold'),
              headline5: TextStyle(
                fontSize: 16,
                fontFamily: 'OpenSansSemiBold',
                color: wgerSecondaryColorLightDark,
              ),
              headline6: TextStyle(
                fontSize: materialSizes['h6']! * 0.8,
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
              subtitle1: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                fontFamily: 'OpenSans',
                color: Colors.white,
              ),
              subtitle2: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w200,
                fontFamily: 'OpenSansLight',
                color: Colors.white,
              ),
              bodyText1: TextStyle(
                color: darkmode ? wgerSecondaryColorLightDark : wgerSecondaryColorLight,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              iconColor: wgerSecondaryColorDark,
              labelStyle: TextStyle(color: Colors.white),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: wgerSecondaryColorDark,
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                primary: wgerSecondaryColorDark,
                visualDensity: VisualDensity.compact,
                side: const BorderSide(color: wgerSecondaryColor),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: wgerSecondaryColorDark,
              ),
            ),
            sliderTheme: const SliderThemeData(
              activeTrackColor: wgerSecondaryColor,
              thumbColor: wgerPrimaryColor,
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: wgerSecondaryColorDark,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: ThemeMode.system,
          home: auth.isAuth
              ? HomeTabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            DashboardScreen.routeName: (ctx) => DashboardScreen(),
            FormScreen.routeName: (ctx) => FormScreen(),
            GalleryScreen.routeName: (ctx) => const GalleryScreen(),
            GymModeScreen.routeName: (ctx) => GymModeScreen(),
            HomeTabsScreen.routeName: (ctx) => HomeTabsScreen(),
            MeasurementCategoriesScreen.routeName: (ctx) => MeasurementCategoriesScreen(),
            MeasurementEntriesScreen.routeName: (ctx) => MeasurementEntriesScreen(),
            NutritionScreen.routeName: (ctx) => NutritionScreen(),
            NutritionalDiaryScreen.routeName: (ctx) => NutritionalDiaryScreen(),
            NutritionalPlanScreen.routeName: (ctx) => NutritionalPlanScreen(),
            WeightScreen.routeName: (ctx) => WeightScreen(),
            WorkoutPlanScreen.routeName: (ctx) => WorkoutPlanScreen(),
            WorkoutPlansScreen.routeName: (ctx) => WorkoutPlansScreen(),
            ExercisesScreen.routeName: (ctx) => const ExercisesScreen(),
            ExerciseDetailScreen.routeName: (ctx) => const ExerciseDetailScreen(),
            AddExerciseScreen.routeName: (ctx) => const AddExerciseScreen(),
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
