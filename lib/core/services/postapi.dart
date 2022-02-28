import 'package:cloud_firestore/cloud_firestore.dart';
class PostApi{
        final _db = FirebaseFirestore.instance;
        final String path = 'posts';
      late  CollectionReference ref;
        
        PostApi(){
          ref = _db.collection(path);
        }

       Future<QuerySnapshot> getDocuments() {
          return ref.get();
       }

       Stream<QuerySnapshot> streamDocuments(){
         return ref.snapshots();
       }

       Future<DocumentSnapshot> getDocumentById(String id){
         return ref.doc(id).get();
       }

       Future<DocumentReference> addData(Map data){
         return ref.add(data);
       }


}