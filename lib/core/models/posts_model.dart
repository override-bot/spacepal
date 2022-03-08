class Posts{

  String? id;
  bool isImportant;
  String posterId;
  String post;
  String username;
  String imageUrl;
  dynamic timeStamp;
//  String posterUnit;

  Posts({
    this.id,
   required this.imageUrl, 
    required this.isImportant, 
   required this.posterId,
    required this.post,
    this.timeStamp, 
   required this.username,
 //  required this.posterUnit
    });
  

  
  Posts.fromMap(Map snapshot, this.id)
  : username = snapshot['username'],
  imageUrl = snapshot['imageUrl'],
  isImportant = snapshot['isImportant'],
  posterId = snapshot['posterId'],
  post = snapshot['post'],
  timeStamp = snapshot['timeStamp'];
 // posterUnit = snapshot['posterUnit'];


toJson(){
  return {
     "imageUrl": imageUrl, 
     "isImportant": isImportant,
     "posterId": posterId,
     "post": post,
     "timeStamp": timeStamp,
     "username": username,
   //  "posterUnit": posterUnit
  };
}

  
}