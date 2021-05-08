class ImageAdressConverter{
   static String getImageUrl(String imageurl) {
    var imagename = imageurl.split("/");
    imagename[2] = "admin.jpneer.com";

    imagename.removeAt(3);
    imagename.removeAt(3);

    var demostring =
        imagename.reduce((value, element) => value + '/' + element);

    print(demostring);

    return demostring;
  }
}