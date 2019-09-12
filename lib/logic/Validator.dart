import 'dart:async';

mixin Validator{
  

  var noValidator = StreamTransformer<String,int>.fromHandlers(
    handleData: (email,sink){
      String email1 = email;
      if(email1.contains('v') && (email1.length == 10 || email1.length == 12)){
        String no = email1.substring(0,email1.length-1);
        
        var nonic = int.parse(no);
        sink.add(nonic);
      }else{
        sink.addError('Nic No is Invalid');
      }
    }
  );

  var noValidator1 = StreamTransformer<String,int>.fromHandlers(
    handleData: (email,sink){
      String email1 = email;
      if(email1.length >0){
        int email2 = int.parse(email1);
        sink.add(email2);
      }else{
        sink.addError('Nic No is Invalid');
      }
    }
  );

  // var noValidator2 = StreamTransformer<String,int>.fromHandlers(
  //   handleData: (email,sink){
  //     Birthday birthday;
  //     DatabaseHelper().getBirthdayList();
  //   }
  // );

  
}