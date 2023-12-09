import 'package:flutter/material.dart';
import 'package:psychepulse/view/screen/home_screen/chat_screen/message_screen.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:widthOrHeight0(context, 0)*0.02,
            ),
            defaultFormField(
                controller: _controller,
                tybe: TextInputType.text,
                validator:(p0) {
                  return null;
                },
                radius: 10,
                pref: Icons.search,
                text: 'Search',
                width: widthOrHeight0(context, 1) * 0.4,
                height: widthOrHeight0(context, 0) * 0.05),
            SizedBox(
              height: widthOrHeight0(context, 0) * 0.02,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: widthOrHeight0(context, 1)*0.02,right:widthOrHeight0(context, 1)*0.02,top: widthOrHeight0(context, 1)*0.03  ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)
                      ),
                      child: ChatsButton(
                          pathImage: 'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1347',
                          text: 'ibrahem',
                          time: '10:08pm',
                          message: 'hi',
                          function: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MessageScreen()),
                            );
                          },
                      ),
                    ),
                  ),
                  itemCount: 4,
              ),
            ),
          ],
        ),
    );
  }
}