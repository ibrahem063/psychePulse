import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/language.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'PsychePulse',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: widthOrHeight0(context, 1) * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: widthOrHeight0(context, 1) * 0.05,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Settings",
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.0, // You can adjust the thickness as needed
          ),
          Padding(
            padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
            child: Column(
              children: [
                Row(
                  //    mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const Icon(
                      Icons.language,
                      size: 35,
                    ),
                    SizedBox(
                      width: widthOrHeight0(context, 0) * 0.02,
                    ),
                    const Text(
                      "Language",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.036,
                ),
                LanguageSelection(),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: widthOrHeight0(context, 1) * 0.07,
                      width: widthOrHeight0(context, 0) * 0.4,
                      child: OutlinedButton(
                        onPressed: () {
                          //click logic here
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius as needed
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.support_agent_sharp,
                                color: Colors.black),
                            SizedBox(width: 8.0),
                            Text(
                              'Support',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(), // Use Spacer instead of SizedBox
                            Icon(Icons.arrow_forward_ios_sharp,
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.02,
                ),
                Container(
                  height: widthOrHeight0(context, 1) * 0.07,
                  width: widthOrHeight0(context, 0) * 0.4,
                  child: OutlinedButton(
                    onPressed: () {
                      //click logic here
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius as needed
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.people_alt_rounded, color: Colors.black),
                        SizedBox(width: 8.0),
                        Text(
                          'Invite Friends',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(), // Use Spacer instead of SizedBox
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
