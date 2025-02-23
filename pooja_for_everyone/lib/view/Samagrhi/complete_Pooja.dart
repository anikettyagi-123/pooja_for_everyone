import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/global/appbar.dart';


class Complete_samaghri extends StatelessWidget {
  const Complete_samaghri({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: MyAppbar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:10,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(

                      // icon: Icon(Icons.search),

                        filled: true,
                        prefixIconColor: Colors.black,
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.grey.shade300,
                        hintText: 'search pooja'

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('सुंदरकांड का पाठ',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('सत्यनारायण की कथा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('गणेश जी की पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('शिव महापुराण कथा',style: TextStyle(fontSize:25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('दिवाली पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('दशहरा पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('जन्माष्टमी पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('शिव जी की पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('राम नवमी पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('नववर्ष पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('संतोषी माता पूजा',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('अक्षय तृतीया पूजा ',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('नवरात्रि पूजा ',style: TextStyle(fontSize:25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('गंगा पूजा',style: TextStyle(fontSize:25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('तुलसी पूजा ',style: TextStyle(fontSize: 25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('लक्ष्मी जी पूजा',style: TextStyle(fontSize:25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('गौ माता पूजा',style: TextStyle(fontSize:25,color: Colors.black87),),
                ),
                Divider(color: Colors.black87,thickness: 1,),


              ],
            ),
          ),
        );
  }
}