import 'package:flutter/material.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElevationOverlay.applyOverlay(
        context, Theme.of(context).scaffoldBackgroundColor, 4);
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
        children: [
          Container(
            height: widthOrHeight0(context, 0) * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey))),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: widthOrHeight0(context, 0) * 0.11,
                        ),
                        CircleAvatar(
                          backgroundColor: const Color(0xff337180),
                          radius: widthOrHeight0(context, 0) * 0.04,
                          child: Icon(
                            Icons.person,
                            size: widthOrHeight0(context, 0) * 0.05,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          'Ola',
                          style: TextStyle(
                              fontSize: widthOrHeight0(context, 0) * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildContainer(
                                context,
                                'Add frind',
                                Icons.person_add_alt_1,
                                widthOrHeight0(context, 1) * 0.15,
                                widthOrHeight0(context, 0) * 0.05),
                            SizedBox(width: widthOrHeight0(context, 1)*0.01,),
                            buildContainer(
                                context,
                                'Message',
                                Icons.send,
                                widthOrHeight0(context, 1) * 0.15,
                                widthOrHeight0(context, 0) * 0.05),
                            SizedBox(width: widthOrHeight0(context, 1)*0.01,),
                            buildContainer(
                                context,
                                '',
                                Icons.more_vert,
                                widthOrHeight0(context, 1) * 0.03,
                                widthOrHeight0(context, 0)*0.05)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 4,
          )
        ],
      ),
    );
  }

  Container buildContainer(BuildContext context, String text, IconData iconData,
      double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (text.contains('')) ...[
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ],
          Icon(
            iconData,
            color: Theme.of(context).scaffoldBackgroundColor,
          )
        ],
      ),
    );
  }
}
