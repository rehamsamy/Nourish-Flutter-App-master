import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/branch_select_controller.dart';

class BranchSelectView extends GetView<BranchSelectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BranchSelectView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BranchSelectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
