import 'package:event/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/events_feed_widget.dart';
import '../views/menu_hamburger/navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      drawer: NavBar(), // Assure-toi que NavBar est correctement défini
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(), // Passe le contexte au CustomAppBar
                Text(
                  "Les nouvelles du jour",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                EventsFeed(),
                Obx(() => dataController.isUsersLoading.value
                    ? Center(child: CircularProgressIndicator(),)
                    : EventsIJoined())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
