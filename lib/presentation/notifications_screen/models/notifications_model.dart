import '../../../core/app_export.dart';import 'notifications_item_model.dart';/// This class defines the variables used in the [notifications_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {Rx<List<NotificationsItemModel>> notificationsItemList = Rx([NotificationsItemModel(notificationsShow: "Notifications show when you swipe down.".obs,justNow: "Just now".obs),NotificationsItemModel(notificationsShow: "The act of telling someone officially about.".obs,justNow: "1 Min ago".obs),NotificationsItemModel(notificationsShow: "You must give the bank written notificatio.".obs,justNow: "5 Min ago".obs),NotificationsItemModel(notificationsShow: "Notification that the vehicle failed inspec.".obs,justNow: "10 Min ago".obs),NotificationsItemModel(notificationsShow: "Either system or app notifications turned. ".obs,justNow: "20 Min ago".obs),NotificationsItemModel(notificationsShow: "Power or data settings are preventing app.".obs,justNow: "30 Min".obs),NotificationsItemModel(notificationsShow: "Retrieving notification alerts outdated. ".obs,justNow: "40 Min ago".obs),NotificationsItemModel(notificationsShow: "Freeze or crash and not deliver notification.".obs,justNow: "50 Min ago".obs)]);

 }