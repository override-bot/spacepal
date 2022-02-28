class Posts{

  String? id;
  bool? isImportant;
  String? posterId;
  String? post;
  String? username;
  String? imageUrl;
  String? timeStamp;
  String? posterUnit;

  Posts({
    this.id,
    this.imageUrl, 
    this.isImportant, 
    this.posterId,
    this.post,
    this.timeStamp, 
    this.username,
    this.posterUnit
    });
  

  
  Posts.fromMap(Map snapshot, this.id)
  : username = snapshot['poster'],
  imageUrl = snapshot['imageUrl'],
  isImportant = snapshot['isImportant'],
  posterId = snapshot['posterId'],
  post = snapshot['post'],
  timeStamp = snapshot['timeStamp'];
  


toJson(){
  return {
     "imageUrl": imageUrl, 
     "isImportant": isImportant,
     "posterId": posterId,
     "post": post,
     "timeStamp": timeStamp,
     "username": username
  };
}

  
}