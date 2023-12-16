# base_project

flutter pub run build_runner build --delete-conflicting-outputs

#Next page
context.go(AppRoutes.navigation.toPath());

#Show Msg in StatelessWidget
showMsg(context, 'Đăng nhập thành công');

#Show Msg error in StatelessWidget
showErrorMsg(context, 'Đã có lỗi xảy ra');

#Show dialog custom
showDlg(context: context, children: [
const TextView('Thông báo', fontSize: 20, bottom: 16, fontWeight: FontWeight.bold),
]);

#Show confirm Dialog
showConfirmDialog(context: context, content: 'content', onSubmit: (){});

Build IOS to QC:
flutter clean
flutter build ios --release  --flavor stg

Build Android to QC:
flutter clean
flutter build apk --flavor stg -t lib/main_stg.dart

Build Deploy prod Android:
flutter clean
flutter build appbundle --flavor prod -t lib/main_prod.dart

Build Deploy prod IOS:
flutter clean
flutter build ipa --release  --flavor prod

build runner:  flutter pub run build_runner build --delete-conflicting-outputs