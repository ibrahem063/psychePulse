import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psychepulse/view/widget/compoents/components.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.3,
                  blurRadius: 5,
                  offset: const Offset(0,1),
                ),
              ]
          ),
        ),
        systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.grey.shade400),
        title: Padding(
          padding:  EdgeInsets.only(left: widthOrHeight0(context, 1)*0.153),
          child:  ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [Color(0xFFFDCCC5),Colors.pink.shade200, Colors.deepPurple.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Text(
              'PsychePulse',
              style: TextStyle(
                  fontSize: 25,
                  color:Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children:
        [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
              pref: Icons.search,
              radius: 20,
                height: 50,
                text: 'Search',
                controller: searchController,
                tybe: TextInputType.text,
                validator: (String? value){
                  if(value!.isEmpty)
                  {
                    return 'search must not be empty';
                  }
                  return null;
                })
          ),
        ],
      ),
    );
  }
}
