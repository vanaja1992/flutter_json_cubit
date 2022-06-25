import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_cubit/src/core/constants/app_colors.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_cubit.dart';
import 'package:json_cubit/src/features/contact/pages/contact_detailes_page.dart';

import '../models/contact_model.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  _MyContactState createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocListener<ContactCubit, ContactState>(
        listener: (context, state) {
          if (state is ContactLoadError){

          }
          // TODO: implement listener
        },
        child: SafeArea(
          child: Center(
            child: BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
                if (state is ContactLoading) {

                  return const CircularProgressIndicator();
                } else if (state is ContactLoaded) {

                  return      ListView.separated(
                    separatorBuilder: (context,pos){
                      return const Divider();
                    },
                    shrinkWrap: true,
                      itemCount: state.contactList.length ,
                      itemBuilder:(context,pos){
                        ContactModel contacts= state.contactList[pos];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                             backgroundImage: NetworkImage(state.contactList[pos].photo?? ""),

                            ),
                            onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactDetailesPage(contactDetails:contacts)));
                            },
                            title: Text(state.contactList[pos].name?? ""),
                            subtitle: Text(state.contactList[pos].contact?? ""),

                          ),
                        );
                      });
                }
                else {
                  return const Text(
                      "Hello!!! I am the Error State - Error Found !!!! ");
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void getData() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<ContactCubit>().getContactsData();
    });
  }
}
