super8Gui
=========

ipod gui for super8, un ejemplo de como algo sencillo se puede enrevesar.....
our devide is limited to run iOs 4.2.1 wich its the last version of iOs with armv6l support
jodido ipod, runs on of_preRelase_v007_iphone and patched ofxosc (last ofxosc version without ofParameter support)


=========
OSC CONNECTIONS:

- listen on port 12344
- send using port 12345

----------------------------
receive intructions:
- /estado
- value as string "play" or "rec"

send instructions:
- /lutIndex
- value as int, range 0-4

- /saveVideo
- value as int, 0-1




