import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_repository.dart';
import 'package:json_cubit/src/features/contact/models/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  Future<void> getContactsData() async {
    emit(ContactLoading());
    try {
      // runtime exception
      ContactRepository _contactRepository = ContactRepository();
      List<ContactModel> _contactList =
          await _contactRepository.getContactsData();
      emit(ContactLoaded(_contactList));
    } catch (e) {
      emit(ContactLoadError("Error Found"));
    }
  }
}
