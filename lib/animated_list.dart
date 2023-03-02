import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fristproject/login_screen.dart';
import 'package:fristproject/share/comp.dart';

class Animatedlist extends StatefulWidget {
  const Animatedlist({super.key});

  @override
  State<Animatedlist> createState() => _AnimatedlistState();
}

class _AnimatedlistState extends State<Animatedlist> {

  final item =[];
  final keylist = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const 
        Text('Animated List', 
        style: TextStyle(color: Colors.white) , 
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(onPressed: () { 
          Mynavigate(context: context, widget: loginScreen()); 
        }, icon: const Icon(Icons.arrow_back)),
        elevation: 0.0,
        ),
        
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container( 
                   width: size.width*0.2,
                   height: size.height*0.055,
                   decoration:  BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                   ),
                  child: IconButton(onPressed: () {
                    insertitem();
                  }, icon: const Icon(Icons.add , color: Colors.white, size: 28, )),
                ),
              ),

              Expanded(
                child: AnimatedList(
                  key: keylist,
                  initialItemCount: 0,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: Card(
                      color: Colors.deepPurple[400],
                      child: ListTile(
                        title: Text(
                          item[index],
                          style: const TextStyle(color: Colors.white ,fontSize: 20),
                        ),
                        trailing: IconButton(onPressed: () {
                          removeitem(index);
                        }, icon: const Icon(Icons.delete), color: Colors.white,),
                      ),
                    ),
                    ) ;
                },),
              ),
            ],
          ),
        )
            
            
          
          );    
    
  }
  
void insertitem() {
  item.insert(0, "Item ${item.length + 1}");
  keylist.currentState!.insertItem(0);
  const Duration(milliseconds: 300);
}

void removeitem(int index) {
  item.removeAt(index);
  keylist.currentState!.removeItem(index, (context, animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.red[300],
        child: const ListTile(
          title: Text(
            'Deleted',
          ),
        ),
      ),
      );    
      
  },
  );
  const Duration(milliseconds: 300);
}
}
