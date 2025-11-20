import 'dart:ui';
import 'package:clientapp_studio/Utilities/E-books/bookPaymentSuccess.dart';
import 'package:clientapp_studio/Utilities/E-books/descriptionPage.dart';
import 'package:clientapp_studio/Utilities/E-books/ebooksHome.dart';
import 'package:clientapp_studio/Utilities/E-books/viewBook.dart';
import 'package:clientapp_studio/Utilities/General%20Vault/generalStart.dart';
import 'package:clientapp_studio/Utilities/General%20Vault/generalfiles.dart';
import 'package:clientapp_studio/Utilities/General%20Vault/generalupload.dart';
import 'package:clientapp_studio/Utilities/Id%20Vault/documentuploads.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/UploadPage.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/addnewfile.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/documents.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/vaultImage.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/vaultotp.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/vaultpin.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/viewdocument.dart';
import 'package:clientapp_studio/Utilities/Legacy%20Wallet/legacyHome.dart';
import 'package:clientapp_studio/Utilities/Legacy%20Wallet/vaultUpload.dart';
import 'package:clientapp_studio/Utilities/Legacy%20Wallet/viewimage.dart';
import 'package:clientapp_studio/pages/VideoPlayer.dart';
import 'package:clientapp_studio/pages/dashboard.dart';
import 'package:clientapp_studio/pages/home_screen.dart';
import 'package:clientapp_studio/Settings/dhistory.dart';
import 'package:clientapp_studio/Settings/settingsmenu.dart';
import 'package:clientapp_studio/Utilities/Iron%20Vault/vaultStart.dart';
import 'package:clientapp_studio/Utilities/utilities.dart';
import 'package:clientapp_studio/pages/listandgridfavourites.dart';
import 'package:clientapp_studio/pages/movie_details.dart';
import 'package:clientapp_studio/pages/notification.dart';
import 'package:clientapp_studio/pages/otp.dart';
import 'package:clientapp_studio/pages/payments.dart';
import 'package:clientapp_studio/pages/phonelog.dart';
import 'package:clientapp_studio/pages/plans.dart';
import 'package:clientapp_studio/pages/podcast_details.dart';
import 'package:clientapp_studio/pages/selecting_studio.dart';
import 'package:clientapp_studio/pages/sending_studio.dart';
import 'package:clientapp_studio/pages/splash.dart';
import 'package:clientapp_studio/pages/splash18.dart';
import 'package:clientapp_studio/pages/success.dart';
import 'package:clientapp_studio/pages/video_details_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:studio_app/presentation/bankscreen.dart';
// import 'package:studio_app/presentation/client_details_screen.dart';
// import 'package:studio_app/presentation/clients_screen.dart';
// import 'package:studio_app/presentation/contactscreen.dart';
// import 'package:studio_app/presentation/dashboard.dart';
// import 'package:studio_app/presentation/notification.dart';
// import 'package:studio_app/presentation/otp_screen.dart';
// import 'package:studio_app/presentation/upload_pictures.dart';
// import 'package:studio_app/presentation/createclient.dart';
// import 'package:studio_app/presentation/stats.dart';
// import '../presentation/profilescreen.dart';
// import 'package:studio_app/presentation/LogginIn.dart';
// import 'package:studio_app/presentation/sign_in_screen.dart';
// import 'package:studio_app/presentation/splash_screen.dart';
// import '../presentation/sucess_screen.dart';
import '../pages/image_viewer.dart';
import '../pages/upload_pictures.dart';
import '../services/AuthService.dart';
import '../utils/CrashlyticsNavObserver.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  // debugLogDiagnostics: false,
  // observers: [CrashlyticsNavObserver()],
  // overridePlatformDefaultLocation: false,
  routes: [
    GoRoute(
      path: "/view-legacy-item",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return LegacyImageView(  imagePath: data["image"],);
      },
    ),
     GoRoute(
      path: "/legacy-vault",
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(LegacyWalletHome(), state);
      },
    ),


    GoRoute(
      path: '/legacy-upload',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return CommonLegacyUpload(
          fromPath: data["fromPath"] as String,
          appBarTitle: data["appBarTitle"] as String,
          uploadHeading: data["uploadHeading"] as String,
          uploadInfoText: data["uploadInfoText"] as String,
          buttonText: data["buttonText"] as String,
          nextPath: data["nextPath"] as String,
        );
      },
    ),

    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
       // return buildSlideTransitionPage(Dashboard(), state);
        return buildSlideTransitionPage(Documentuploads(), state);
      },
    ),
    GoRoute(
      path: "/general-start",
      pageBuilder: (context, state) {
       // return buildSlideTransitionPage(Dashboard(), state);
        return buildSlideTransitionPage(GeneralVaultStart(), state);
      },
    ),
    GoRoute(
      path: "/general-files",
      pageBuilder: (context, state) {
       // return buildSlideTransitionPage(Dashboard(), state);
        return buildSlideTransitionPage(GeneralFiles(), state);
      },
    ),
    GoRoute(
      path: "/viewBook",
      pageBuilder: (context, state) {
       // return buildSlideTransitionPage(Dashboard(), state);
        return buildSlideTransitionPage(Viewbook(), state);
      },
    ),GoRoute(
      path: "/book-payment-summary",
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(BookPaymentSuccess(), state);
      },
    ),
    GoRoute(
      path: "/movie_details",
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(MovieDetails(), state);
      },
    ),
    GoRoute(
      path: "/book-details",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return BookDetailsPage(
          image: data["image"],
          title: data["title"],
          author: data["author"],
          description: data["description"],
          price: data["price"] is String
              ? double.tryParse(data["price"]) ?? 0.0
              : data["price"],          // ✅ handles both String & double
          isFree: data["isFree"],
        );
      },
    ),
    // GoRoute(
    //   path: '/e',
    //   pageBuilder: (context, state) {
    //     return buildSlideTransitionPage(Ebookshome(), state);
    //   },
    // ),
    GoRoute(
      path: '/ebooks',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Ebookshome(), state);
      },
    ),



    GoRoute(
      path: '/uploadPage',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(UploadPage(fileType: ''), state);
      },
    ),
    GoRoute(
      path: '/addNewDocument',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(AddNewDocument(), state);
      },
    ),
    GoRoute(
      path: '/vaultDocuments',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(VaultDocs(), state);
      },
    ),
    GoRoute(
      path: '/list_grid',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Listandgridfavourites(), state);
      },
    ),
    GoRoute(
      path: '/upload',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(UploadPictures(), state);
      },

    ),
    GoRoute(
      path: '/viewImage',
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, String?>?;

        return MaterialPage(
          key: state.pageKey,
          child: ViewImagePage(
            img: {"name": data?["name"] ?? "", "path": data?["path"] ?? ""},
          ),
        );
      },
    ),
    GoRoute(
      path: '/viewDocument',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(ViewDocumentPage(doc: {}), state);
      },
    ),
    GoRoute(
      path: '/Documents',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(VaultDocs(), state);
      },
    ),
    GoRoute(
      path: '/otpcommon',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return CommonOtpScreen(
          title: data["title"],
          buttonText: data["btn"],
          nextPath: data["path"],
        );
      },
    ),
    GoRoute(
      path: '/vaultpin',
      pageBuilder: (context, state) {

        return buildSlideTransitionPage(Vaultpin(), state);
      },
    ),
    GoRoute(
      path: '/sp',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Splash(), state);
      },
    ),
   GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Dashboard(), state);
      },
    ),
    GoRoute(
      path: '/upload-new',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Generalupload(), state);
      },
    ), GoRoute(
      path: '/dashboard',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Dashboard(), state);
      },
    ),
    GoRoute(
      path: '/video_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(VideoDetailsScreen(), state);
      },
    ),
    GoRoute(
      path: '/video_player_screen',
      builder: (context, state) {
        final String message = state.extra as String;
        return VideoPlayerMain(videoUrl: message);
      },
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(HomeScreen(), state);
      },
    ),
    GoRoute(
      path: '/select_studio',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(SelectingStudio(), state);
      },
    ),
    GoRoute(
      path: '/image_viewer',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return ImageViewer(
          images: data['images'],   // List<String>
          initialIndex: data['index'], // int
        );
      },
    ),
    GoRoute(
      path: '/send_studio',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(SendingStudio(), state);
      },

    ),
    GoRoute(
      path: '/ironvault',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return CommonIronVault(
          imagePath: data["image"],
          title: data["title"],
          subTitle: data["sub"],
          buttonText: data["btn"],
          nextPath: data["path"],
        );
      },
    ),
    GoRoute(
      path: '/utils',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(UtilHome(), state);
      },
    ),
    GoRoute(
      path: '/notification',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(NotificationScreen(), state);
      },
    ),
    GoRoute(
      path: '/downhistory',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(DownLoadHistory(), state);
      },
    ),

    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(SetMenu(), state);
      },
    ),
    GoRoute(
      path: '/log',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Login(), state);
      },
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) {
        final fromPath = state.extra as String;
        return OtpScreen(fromPath: fromPath);
      },
    ),
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Splash(), state);
      },
    ),
    GoRoute(
      path: '/sp18',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Splash18(), state);
      },
    ),
    GoRoute(
      path: "/success",
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>?;

        return CommonSuccessScreen(
          imagePath: data?["imagePath"] ?? "assets/images/successgreen.png",
          title: data?["title"] ?? "Success",
          subTitle: data?["subTitle"] ?? "",
          buttonText: data?["buttonText"] ?? "Continue",
          nextPath: data?["nextPath"] ?? "/dashboard",
        );
      },
    ),
    GoRoute(
      path: '/podcast_details',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(PodcastDetails(), state);
      },
    ),
    GoRoute(
      path: '/payments',
      pageBuilder: (context, state) {
        final bool fromBook =
            (state.extra as Map<String, dynamic>?)?["fromBook"] == true;

        return buildSlideTransitionPage(
          Payments(fromBookPage: fromBook),
          state,
        );
      },
    ),
    GoRoute(
      path: '/plans',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Plans(), state);
      },
    ),
  ],
  // errorBuilder: (context, state) {
  //   final err = state.error ?? 'Unknown router error';
  //   FirebaseCrashlytics.instance.recordError(
  //     err,
  //     StackTrace.current,
  //     fatal: false,
  //     information: [
  //       DiagnosticsNode.message('matchedLocation: ${state.matchedLocation}'),
  //       DiagnosticsNode.message('uri: ${state.uri}'),
  //       DiagnosticsNode.message('pathParams: ${state.pathParameters}'),
  //       DiagnosticsNode.message('queryParams: ${state.uri.queryParameters}'),
  //     ],
  //   );
  //
  //   return const Scaffold(body: Center(child: Text('Something went wrong')));
  // },
);

Page<dynamic> buildSlideTransitionPage(Widget child, GoRouterState state) {
  // if (Platform.isIOS) {
  //   // Use default Cupertino transition on iOS
  //   return CupertinoPage(key: state.pageKey, child: child);
  // }

  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
