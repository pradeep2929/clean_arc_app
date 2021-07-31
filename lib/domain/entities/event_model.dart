/// name : "Camden Town Football Event"
/// dateTime : "2/12/2021 16:00:00"
/// bookBy : "2/7/2021 16:00:00"
/// ticketsSold : 6
/// maxTickets : 20
/// friendsAttending : 2
/// price : 10
/// isPartnered : true
/// sport : "Football"
/// totalPrize : 150
/// location : "34 Crest Rd, London, NW2 7LX"
/// isRecommended : true
/// mainImage : "https://i.pinimg.com/originals/a9/88/a4/a988a47e605cacc02b0bb41c85270de3.jpg"
/// id : 2

class Event {
  String? _name;
  String? _dateTime;
  String? _bookBy;
  String? _sport;
  String? _location;
  String? _mainImage;

  int? _ticketsSold;
  int? _maxTickets;
  int? _friendsAttending;
  dynamic _price;
  bool? _isPartnered;

  int? _totalPrize;

  bool? _isRecommended;

  int? _id;

  String? get name => _name;

  String? get dateTime => _dateTime;

  String? get bookBy => _bookBy;

  int? get ticketsSold => _ticketsSold;

  int? get maxTickets => _maxTickets;

  int? get friendsAttending => _friendsAttending;

  dynamic get price => _price;

  bool? get isPartnered => _isPartnered;

  String? get sport => _sport;

  int? get totalPrize => _totalPrize;

  String? get location => _location;

  bool? get isRecommended => _isRecommended;

  String? get mainImage => _mainImage;

  int? get id => _id;

  Event({
    String? name,
    String? dateTime,
    String? bookBy,
    int? ticketsSold,
    int? maxTickets,
    int? friendsAttending,
    dynamic price,
    bool? isPartnered,
    String? sport,
    int? totalPrize,
    String? location,
    bool? isRecommended,
    String? mainImage,
    int? id}) {
    _name = name;
    _dateTime = dateTime;
    _bookBy = bookBy;
    _ticketsSold = ticketsSold;
    _maxTickets = maxTickets;
    _friendsAttending = friendsAttending;
    _price = price;
    _isPartnered = isPartnered;
    _sport = sport;
    _totalPrize = totalPrize;
    _location = location;
    _isRecommended = isRecommended;
    _mainImage = mainImage;
    _id = id;
  }

  Event.fromJson(dynamic json) {
    _name = json["name"];
    _dateTime = json["dateTime"];
    _bookBy = json["bookBy"];
    _ticketsSold = json["ticketsSold"];
    _maxTickets = json["maxTickets"];
    _friendsAttending = json["friendsAttending"];
    _price = json["price"];
    _isPartnered = json["isPartnered"];
    _sport = json["sport"];
    _totalPrize = json["totalPrize"];
    _location = json["location"];
    _isRecommended = json["isRecommended"];
    _mainImage = json["mainImage"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["dateTime"] = _dateTime;
    map["bookBy"] = _bookBy;
    map["ticketsSold"] = _ticketsSold;
    map["maxTickets"] = _maxTickets;
    map["friendsAttending"] = _friendsAttending;
    map["price"] = _price;
    map["isPartnered"] = _isPartnered;
    map["sport"] = _sport;
    map["totalPrize"] = _totalPrize;
    map["location"] = _location;
    map["isRecommended"] = _isRecommended;
    map["mainImage"] = _mainImage;
    map["id"] = _id;
    return map;
  }
}