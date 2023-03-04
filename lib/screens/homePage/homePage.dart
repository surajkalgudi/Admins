import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:co_ordinators/screens/CreatePatients/createPatients.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  TextEditingController searchController=new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future<void> signOutCurrentUser() async {
      try {
        await Amplify.Auth.signOut();
      } on AuthException catch (e) {
        print(e.message);
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Can-cer vive',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent.shade200,
          leading: GestureDetector(
            onTap: (){
              signOutCurrentUser();
            },
            child: CircleAvatar(
              child: Image.asset('assets/images/pat3.png')
            ),
          ),
        ),
        body: Column(
          children: [
          Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 15,
                    ),
                    Text('Hello,',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('Co-ordinator',
                      style: TextStyle(
                          fontSize: 30
                      ),),
                  ],
                ),
              ],
            ),
          ),
        ),


          const SizedBox(height: 10,),


          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 17, 10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEFEFEF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search for patients",
                  suffixIcon: IconButton( onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Search(UHID: searchController.text )));
                    // print( searchController.text);
                  }, icon: const Icon(Icons.search),),
                  prefixIconColor: Colors.black
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Profiles',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => createPatients()));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/pat3.png'
                              ),
                            ),
                          ),
                          Text('Add new Patients',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),)

                        ],
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  Colors.white,
                          boxShadow: [new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                          ),]
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const  EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => DisplayPatients()));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/p2.jpg'
                              ),
                            ),
                          ),
                          Text('Update Patients',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),)
                        ],
                      ),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  Colors.deepPurpleAccent.shade200,
                        // boxShadow: [new BoxShadow(
                        //   color: Color(0xff918fa5),
                        //   blurRadius: 10.0,
                        // ),]
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )
    )
    );
  }
}
