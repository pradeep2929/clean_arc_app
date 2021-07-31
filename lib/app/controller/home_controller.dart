import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:alchemy/domain/use_case/event_use_case.dart';

import 'base_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with BaseController {
  Status? status;
  late EventUseCase _eventUseCase;
  List<Event> eventList = [];
  List<EventDetail> eventDetailList = [];
  HomeController(){
    _eventUseCase = Get.find();
  }

  Future<void> getEvents() async {
    status = Status.LOADING;
    update();
    try {
      _eventUseCase.getAllEvent().then((response) {
        eventList = response;
        status = Status.SUCCESS;
        update();
      });
    } catch(e) {
      status = Status.ERROR;
      update();
    }
  }
  Future<void> getEventDetails() async {
    status = Status.LOADING;
    update();
    try {
      _eventUseCase.getAllEventDetails().then((response) {
        eventDetailList = response;
        status = Status.SUCCESS;
        update();
      });
    } catch(e) {
      status = Status.ERROR;
      update();
    }
  }
}
