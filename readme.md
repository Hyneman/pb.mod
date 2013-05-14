![pb.mod](pb.mod.png "pb.mod")


The Reason Why...
-----------------
This is my own personal approach to improve and extend the syntax of PureBasic. In my opinion, PureBasic is a good tool for small and medium-sized applications, but quite a few parts of its syntax have always bugged me. This is one of the reasons why I moved on to other languages (mainly C#) a long time ago. However, I often find myself coming back to PureBasic if I need to write small tools, especially when native binaries are required.

By creating this package I tried to compile some additions and improvements that make me feel more comfortable working with PureBasic. The focus here is on developing small applications that don't require a lot of time or maintenance.

I decided to publish this project on github.com because I know there are a handful of other programmers out there that have a similar history like me. Those guys might have some use for this project too.



How it Works
------------
Using this package doesn't require any tools or patches to be installed that change the language. I think this is a necessary design choice because PureBasic often receives updates that break compatibility with such tools. These additions solely rely on PureBasic's macro support via "Resident Files". If you have a look at the code you will be able to figure out pretty quickly how the changes are made. Do note that pb.mod is, of course, not built on its own features in order to avoid compilation problems.



Building pb.mod
---------------
Building the project is a ridiculously easy:

1. Clone the project onto your computer.
2. Compile the source code with the latest version of PureBasic.<br />
   `pbcompiler pb.mod.pb /RESIDENT pb.mod.res

*You're done.*



Installation
------------
All you need to do is copy `pb.mod.res` into PureBasic's `/Residents/` folder. *That's it.*



License
-------
*Please feel free to use this concept as you like with no restrictions.*



Development
-----------
*More details will follow as this project evolves.*


