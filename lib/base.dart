import 'package:flutter/material.dart';

abstract class BaseConnector {
  showLoading({String? message});
  showMessage({String? message});
  hideLoading();
}

class BaseViewModel<c extends BaseConnector> extends ChangeNotifier {
  c? connector;
}

abstract class BaseView<s extends StatefulWidget, vm extends BaseViewModel>
    extends State<s> implements BaseConnector {
  late vm viewModel;
  vm initMyViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initMyViewModel();
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading({String? message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  showMessage({String? message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("error"),
          content: Text(message ?? ""),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"))
          ],
        );
      },
    );
  }
}
