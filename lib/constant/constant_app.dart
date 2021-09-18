import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
var style = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
Widget builderArticles(article, context)=>  Row(
    // mainAxisSize: MainAxisSize.min,
    // mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
            ),
          )
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${article['title']}',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10,),
            Text('${article["publishedAt"]}',style: TextStyle(fontSize: 16,color: Colors.grey[300])),
          ],
        ),
      )
    ],
  );
Widget myDivider()=> Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: double.infinity,
      height: 2,
      color: Colors.grey[200],
    ),
  );
