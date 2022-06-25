import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_cubit.dart';
import 'package:json_cubit/src/features/contact/models/contact_model.dart';

import '../../../core/utils/launcherutility.dart';
class ContactDetailesPage extends StatefulWidget {
  final ContactModel contactDetails;

  const ContactDetailesPage({required this.contactDetails,Key? key}) : super(key: key);

  @override
  State<ContactDetailesPage> createState() => _ContactDetailesPageState();
}

class _ContactDetailesPageState extends State<ContactDetailesPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Details"),
      ),
      body: Column(
        children: [

          Image.network(widget.contactDetails.photo??""),
          const SizedBox(
            height: 7,
          ),
          Text(
            widget.contactDetails.name??"",
            style: const TextStyle(
                fontSize: 29, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 30, right: 25),
            child: Row(
              children: [
                Text(
                  widget.contactDetails.contact??"",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 155,
                ),
                InkWell(
                    child: Container(
                      height: 38,
                      width: 34,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.green),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    onTap:(){
                      LauncherUtility.makeCall("${widget.contactDetails.contact}");
                    }

                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                    child: Container(
                      height: 45,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue),
                      child: const Icon(
                        Icons.message,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onTap:(){
                      LauncherUtility.sendSms("${widget.contactDetails.contact}");
                    }

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20, right: 25),
            child: Row(
              children: [
                Text(
                  widget.contactDetails.url??"",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 55,
                ),
                InkWell(
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: const Icon(
                        Icons.link,
                        color: Colors.blue,
                        size: 26,
                      ),
                    ),
                    onTap:(){
                      LauncherUtility.openUrl("${widget.contactDetails.url}");
                    }

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20, right: 25),
            child: Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    widget.contactDetails.address??"",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  width: 195,
                ),
                const Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );


  }

  void getData() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<ContactCubit>().getContactsData();
    });
  }
}
