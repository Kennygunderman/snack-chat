# Snack Chat

### A chatting app focused on real-time data sync using firebase | Built in Flutter

![screeenies](https://user-images.githubusercontent.com/16354865/114061608-9fcb8980-9864-11eb-8ace-7f0c4cc2d1c8.png)


A Chatroom application designed to chat about your favorite snacks with others... Very stupid idea, but I just needed a random idea to build a project in Flutter

Firebase Schema:

`chat_rooms`
```
- icon (string)
- id (string) - This is the document ID
- message (string)
- snacks_sent (int)
- title (string)
```

`chat`
```
- chat_icon_color (string)
- chatroom_id (string)
- message (string)
- send_date (timestamp)
- user_email (string)
- username (string)
```

`user`
```
- username (string)
- chat_icon_color (string)
- username (string)
```
