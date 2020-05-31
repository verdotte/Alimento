import 'package:flutter/material.dart';

AspectRatio imageContainer(String url) {
  return AspectRatio(
    aspectRatio: 18.0 / 11.0,
    child: Image.network(
      '$url',
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null)
          return child;
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    ),
  );
}

AspectRatio imageOpaque(String url) {
  return AspectRatio(
    aspectRatio: 18.0 / 11.0,
    child: Image.network(
      '$url',
      fit: BoxFit.cover,
      color: Color.fromRGBO(0,0,0,.7),
      colorBlendMode: BlendMode.darken,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null)
          return child;
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    ),
  );
}

Padding mainLabel(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 0.0),
    child: Text(title, style: Theme.of(context).textTheme.headline),
  );
}

Padding loader() {
  return Padding(
    padding: EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 0.0),
    child: CircularProgressIndicator(backgroundColor: Colors.red, strokeWidth: 5),
  );
}