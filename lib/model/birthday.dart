class Birthday{
  
  int _id;
  String _nic;
  String _time;

  Birthday(this._nic,this._time);

  Birthday.withId(this._id,this._nic,this._time);

  int get id => _id;

  String get nic => _nic;

  String get time => _time;

  set nic(String newNic){
    this._nic = newNic;
  }

  set time(String newTime){
    this._time = newTime;
  }

  //convert Note Object into Map object
  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();
    if(id != null){
      map['id'] = _id;
    }
    map['nic'] = _nic;
    map['time'] = _time;
    return map;
  }

  //Extract Note object from the map object
  Birthday.fromMapObject(Map<String,dynamic>map){
    this._id = map['id'];
    this._nic=map['nic'];
    this._time = map['time']; 
  }

}