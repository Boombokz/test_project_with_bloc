import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project_for_internship/screens/module_4.dart/data/repository/contact_repository.dart';
import 'package:test_project_for_internship/screens/module_4.dart/model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository contactRepository = ContactRepository();
  ContactBloc() : super(ContactLoadingState());

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is ContactLoadEvent) {
      yield ContactLoadingState();

      try {
        List<Contact> loadedContacts = await contactRepository.getAllContacts();
        yield ContactLoadedState(loadedContacts);
      } catch (e) {
        yield ContactErrorState();
      }
    }
  }
}
