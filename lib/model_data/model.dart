class Task {
  String _title;
  bool _completed;

  Task(this._title, this._completed);

  //Business Logic:

  //Setters
  void setTitle(String newTitle){
    _title = newTitle;
  }

  void setStatus(bool newStatus){
    _completed = newStatus;
  }

  //Getters
  get status => _completed;
  get title => _title;


}