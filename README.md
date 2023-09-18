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