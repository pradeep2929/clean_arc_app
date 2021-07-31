import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:alchemy/domain/repository/event_repository.dart';

class EventUseCase {
  late EventRepository _eventRepository;
  EventUseCase(this._eventRepository);

  Future<List<Event>> getAllEvent() {
    return _eventRepository.getAllEvent();
  }

  Future<List<EventDetail>> getAllEventDetails() {
    return _eventRepository.getAllEventDetails();
  }
}