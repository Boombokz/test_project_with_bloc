part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> loadedContacts;
  ContactLoadedState(this.loadedContacts);
}

class ContactErrorState extends ContactState {}
