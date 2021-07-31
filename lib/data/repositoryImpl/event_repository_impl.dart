import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:alchemy/domain/repository/event_repository.dart';

class EventRepositoryImpl extends EventRepository {

  late EventRemoteClient _eventRemoteClient;
  EventRepositoryImpl(this._eventRemoteClient);
  @override
  Future<List<Event>> getAllEvent() {
    return _eventRemoteClient.getAllEvent();
  }

  @override
  Future<List<EventDetail>> getAllEventDetails() {
    return _eventRemoteClient.getAllEventDetails();
  }
}

abstract class EventRemoteClient {
  Future<List<Event>> getAllEvent();
  Future<List<EventDetail>> getAllEventDetails();
}