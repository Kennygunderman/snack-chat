# Snack Chat

### A chatting app focused on real-time data sync using firebase | Built in Flutter

I made a YouTube video about learning Flutter in 7 days, and it ended up getting over 500k views. This chatroom app is the project that came out of that video: https://youtu.be/RGdg-TCmldY?si=-hzdr3S9LxSsIqBh

![screeenies](https://user-images.githubusercontent.com/16354865/114061608-9fcb8980-9864-11eb-8ace-7f0c4cc2d1c8.png)

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
