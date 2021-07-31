
import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';

/// An abstract repository for a Event.
abstract class EventRepository {
  Future<List<Event>> getAllEvent();
  Future<List<EventDetail>> getAllEventDetails();
}