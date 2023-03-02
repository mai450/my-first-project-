import 'package:flutter/material.dart';

Widget MyTextFormField({
  required String text,
  required IconData prefixicon,
  //IconData? suffixIcon,
  bool obscureText =false,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  required TextEditingController controller
  //required double padding,
  
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(color: Colors.deepPurple),
      fillColor: const Color.fromARGB(255, 247, 241, 255),
      filled: true,
      prefixIcon: Icon(prefixicon , color:Colors.deepPurple ,),
      //suffixIcon:IconButton(onPressed: () {  
      //}, icon: Icon(suffixIcon)),
      enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 247, 241, 255),
          )),
     ),
     validator: validator,
  );
}

Future Mynavigate({
  required BuildContext context,
  required Widget widget,
})
{
 return Navigator.push(context,MaterialPageRoute(builder: (context)
 {
  return widget;
 }),
 );
}

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(
        0, size.height * 0.6444536, 0, size.height * 0.8592714);
    path0.cubicTo(
        size.width * 0.3886643,
        size.height * 0.7519000,
        size.width * 0.6311643,
        size.height * 1.1772286,
        size.width,
        size.height * 0.8568714);
    path0.quadraticBezierTo(size.width, size.height * 0.6426536, size.width, 0);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
