/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii4048@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTdiZjZlZmE3ODk1ZTgxZjJiYjFjYyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5MDQ2NzY3LCJleHAiOjE3NDY4MjI3Njd9.sG7szSzJqJzQEj7wapusY6KSCcncuviLdnzMvc2caAs"

class RegisterEntity {
  RegisterEntity({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii4048@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
