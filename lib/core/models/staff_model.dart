class Staff{
     String? uid;
     String? username;
     String? email;
     bool? isAdmin;
     String? imageUrl;
     String? unit;

     Staff({
       this.email,
       this.imageUrl,
       this.isAdmin,
       this.uid,
       this.username,
       this.unit
     });
     

     Staff.fromMap(Map snapshot, this.uid)
        : email = snapshot['email'],
          isAdmin = snapshot['isAdmin'],
          imageUrl = snapshot['imageUrl'],
          username = snapshot['username'];

    toJson(){
      return{
        "email":email,
        "isAdmin": isAdmin,
        "imageUrl": imageUrl,
        "username": username
      };
    }
}