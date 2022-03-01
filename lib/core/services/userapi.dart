import 'package:cloud_firestore/cloud_firestore.dart';
class UserApi{
        final _db = FirebaseFirestore.instance;
        final String path = 'staff';
      late  CollectionReference ref;
        
        UserApi(){
          ref = _db.collection(path);
        }

       Future<QuerySnapshot> getDocuments() {
          return ref.get();
       }

       Future<DocumentSnapshot> getDocumentById(String id){
         return ref.doc(id).get();
       }

       Future<DocumentReference> addData(Map data){
         return ref.add(data);
       }

        updateData(Map<String, dynamic> data, String id){
            return ref.doc(id).update(data);

        }
}