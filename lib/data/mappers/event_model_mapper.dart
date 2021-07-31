import 'package:alchemy/domain/entities/event_model.dart';

class EventModelMapper {
  List<Event> list = [];
  EventModelMapper.map(dynamic data) {
    if(data != null) {
      var allEvents = (data['allEvents'] as List);
      list = List<Event>.from(allEvents.map((model)=> Event.fromJson(model)));
    }
  }
}