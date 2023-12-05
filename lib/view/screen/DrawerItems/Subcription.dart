import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';
import 'package:psychepulse/view/widget/profile/gender.dart';
import 'package:psychepulse/view/widget/profile/language.dart';

class Subcription extends StatefulWidget {
  const Subcription({super.key});

  @override
  State<Subcription> createState() => _SettingsState();
}

class _SettingsState extends State<Subcription> {
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
                fontWeight: FontWeight.w800),
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
            child: Text(
              "Subscription information",
              style: TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.all(widthOrHeight0(context, 1) * 0.02),
            child: Column(
              children: [
                SizedBox(
                  height: widthOrHeight0(context, 1) * 0.026,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: widthOrHeight0(context, 1) * 0.07,
                      width: widthOrHeight0(context, 0) * 0.4,
                      child: OutlinedButton(
                        onPressed: () {
                          //click logic here
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius as needed
                          ),
                        ),
                        child: Row(
                          children: [
                           Icon(
                          Icons.add_card_sharp,
                          color: Colors.black,
                          size: 40.0, // Set the size to your desired value
                        ),
                            SizedBox(width: 8.0),
                            Padding(
                              padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.009),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Visa',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '10.00jd / month',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
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
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                       Icon(
                          Icons.add_card_sharp,
                          color: Colors.black,
                          size: 40.0, // Set the size to your desired value
                        ),
                        SizedBox(width: 8.0),
                        Padding(
                          padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.009),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Google pay',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '10.00jd / month',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.black),
                      ],
                    ),
                  ),
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
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_card_sharp,
                          color: Colors.black,
                          size: 40.0, // Set the size to your desired value
                        ),
                        SizedBox(width: 8.0),
                        Padding(
                          padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.009),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Visa',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '10.00jd / week',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.black),
                      ],
                    ),
                  ),
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
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_card_sharp,
                          color: Colors.black,
                          size: 40.0, // Set the size to your desired value
                        ),
                        SizedBox(width: 15),
                        Padding(
                         padding:  EdgeInsets.only(top: widthOrHeight0(context, 1)*0.009),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Google pay',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '10.00jd / week',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
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
