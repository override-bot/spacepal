class Staff{
     String? uid;
     String username;
     String email;
     bool isAdmin;
     String imageUrl;
     String unit;

     Staff({
      required this.email,
      required this.imageUrl,
      required this.isAdmin,
       this.uid,
      required this.username,
      required this.unit
     });
     

     Staff.fromMap(Map snapshot, this.uid)
        : email = snapshot['email'],
          isAdmin = snapshot['isAdmin'],
          imageUrl = snapshot['imageUrl'],
          username = snapshot['username'],
          unit = snapshot['unit'];
        

    toJson(){
      return{
        "email":email,
        "isAdmin": isAdmin,
        "imageUrl": imageUrl,
        "username": username,
        "unit": unit
      };
    }
}