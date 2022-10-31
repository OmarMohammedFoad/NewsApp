import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../News_App/WebView/web_view.dart';
import '../cubit/cubit.dart';


Widget default_button(
        {required Function? function(),
        Color? background = Colors.blue,
        double width = double.infinity,
        required String text,
        bool isupperCase = true}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            isupperCase ? text.toUpperCase() : text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );

Widget defualt_textform(
        {required TextEditingController? controller,
        required String label,
        bool? obsecurred,
        required IconData? prefix,
        IconData? suffix,
        bool ispassword = false,
        Function? onsubmitted,
        Function? onchanged,
        required String? warning,
        Function? ispressed,
        Function? istapped,
        required TextInputType? keytype}) =>
    TextFormField(
      cursorColor: Colors.white,
      obscureText: ispassword,
      keyboardType: keytype,
      controller: controller,
      onFieldSubmitted: (s) {
        onsubmitted!(s);
      },
      onChanged: (s) {
        onchanged!(s);
      },
      onTap: () {
        istapped!();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return warning;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          // fillColor: Colors.black,
          prefixIconColor: Colors.black,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    ispressed!();
                  },
                  icon: Icon(suffix))
              : null),
    );
Widget buildTaskitem(Map model, context) => Dismissible(
      key: Key(model['ID'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['TIME']}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['TITLE']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    '${model['DATE']}',
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateData(status: 'done', id: model['ID']);
              },
              icon: const Icon(Icons.check_box),
              color: Colors.green,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archive', id: model['ID']);
                },
                icon: const Icon(Icons.archive),
                color: Colors.black45),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).Delete(id: model['ID']);
      },
    );

Widget ListArticlItem(article, context) => InkWell(
      onTap: () {
        NavigateTo(context, Webview(article["url"]));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}' != null
                          ? '${article['urlToImage']}'
                          : "semantic-ui.com/images/wireframe/image.png"))),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article["title"]}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ListArticlItem(list[index], context),
        separatorBuilder: (context, item) => myDivider(),
        itemCount: 10),
    fallback: (context) => const Center(child: CircularProgressIndicator()));

void NavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void NavigateAndNotBack(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
