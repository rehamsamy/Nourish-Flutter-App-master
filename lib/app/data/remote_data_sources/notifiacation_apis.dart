import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/notification_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
class NotificationApis {


  Future<List<NotificationItem>?> getNotifications() async {
    List<NotificationItem>? notificationsList = [];
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'notifications',
      data: const NetworkRequestBody.json(
        {},
      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      NotificationModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          Get.log('notif   => '+model.toString());
          NotificationModel notificationModel = model;
          notificationsList = notificationModel.data?.notificationdata;
          String? time =notificationsList?[0].time??'';
          Get.log('notif   => '+time);
          return notificationsList;
        },
        orElse: () {});
    return notificationsList;
  }

}