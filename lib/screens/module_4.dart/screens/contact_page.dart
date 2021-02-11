import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_project_for_internship/screens/module_4.dart/model/contact.dart';
import 'package:test_project_for_internship/screens/widgets/app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_project_for_internship/screens/widgets/custom_icons_icons.dart';
import 'package:test_project_for_internship/screens/widgets/textfield_widget.dart';

class ContactPage extends StatefulWidget {
  ContactPage(this.contact);
  final Contact contact;

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0B21),
      appBar: AppBarWidget(
        title: widget.contact.name,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 26,
            ),
            CircleAvatar(
              backgroundColor: Color(0xFF251E57),
              radius: 35,
              child: Icon(
                CustomIcons.vector,
                color: Color(0xFF979797),
                size: 28,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${widget.contact.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                height: 1.50,
                letterSpacing: 0.01,
                fontSize: 16,
              ),
            ),
            Text(
              '${widget.contact.email}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6C63FF),
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 1.33,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 20, right: 16, bottom: 33),
              child: Column(
                children: [
                  TextFieldWidget(
                    data: widget.contact.email,
                    title: 'E-mail',
                  ),
                  TextFieldWidget(
                    data: widget.contact.phone,
                    title: 'Phone number',
                  ),
                  TextFieldWidget(
                    data: widget.contact.website,
                    title: 'Website',
                  ),
                  TextFieldWidget(
                    data: widget.contact.company.name,
                    title: 'Company',
                  ),
                  TextFieldWidget(
                    data: widget.contact.address.street,
                    address: widget.contact.address.suite,
                    title: 'Address',
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 215,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: {
                          Marker(
                              markerId: MarkerId('1'),
                              position: LatLng(
                                double.parse(widget.contact.address.geo.lat),
                                double.parse(widget.contact.address.geo.lng),
                              ))
                        },
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            double.parse(widget.contact.address.geo.lat),
                            double.parse(widget.contact.address.geo.lng),
                          ),
                          zoom: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
