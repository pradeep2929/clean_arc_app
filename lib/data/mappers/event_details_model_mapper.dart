import 'package:alchemy/domain/entities/event_detail_model.dart';

class EventDetailsModelMapper {
  List<EventDetail> list = [];
  EventDetailsModelMapper.map(dynamic data) {
    if(data != null) {
      var allEvents = (data['eventDetails'] as List);
      list = List<EventDetail>.from(allEvents.map((model)=> EventDetail.fromJson(model)));
    }
  }
}