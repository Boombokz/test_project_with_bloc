import 'package:test_project_for_internship/screens/module_4.dart/data/contact_data_source.dart/contact_data_source.dart';
import 'package:test_project_for_internship/screens/module_4.dart/model/contact.dart';

class ContactRepository {
  ContactDataSource contactDataSource = ContactDataSource();
  Future<List<Contact>> getAllContacts() => contactDataSource.getContacts();
}
