import 'package:movie_app/model/person_response.dart';
import 'package:movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonListBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();


  getPersons()async{
    PersonResponse response = await _repository.getPersons();
    _subject.add(response);
  }

  void dispose(){
    _subject.close();
  }


  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonListBloc();