import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_notes/core/constants/color_constants.dart';
import 'package:personal_notes/core/routes/app_routes.dart';
import 'package:personal_notes/core/services/encryption_decryption_service/encryption_decryption_service.dart';
import 'package:personal_notes/core/services/isar_db_service.dart/isar_db_service.dart';
import 'package:personal_notes/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.keys');
  EncryptionService().init(dotenv.get('encryptionKey'));
  await setupServiceLocator();
  IsarDbService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                return MaterialApp.router(
                  routerDelegate: AppRoutes.appRouter.routerDelegate,
                  routeInformationParser:
                      AppRoutes.appRouter.routeInformationParser,
                  routeInformationProvider:
                      AppRoutes.appRouter.routeInformationProvider,
                  debugShowCheckedModeBanner: false,
                  title: 'Notes',
                  theme: ThemeData(
                    scaffoldBackgroundColor: ColorConstants.backgroundColor,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
