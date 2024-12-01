import '../../../core/app_export.dart';/// This class is used in the [notifications_item_widget] screen.
class NotificationsItemModel {NotificationsItemModel({this.notificationsShow, this.justNow, this.id, }) { notificationsShow = notificationsShow  ?? Rx("Notifications show when you swipe down.");justNow = justNow  ?? Rx("Just now");id = id  ?? Rx(""); }

Rx<String>? notificationsShow;

Rx<String>? justNow;

Rx<String>? id;

 }
