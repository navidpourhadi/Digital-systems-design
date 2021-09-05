## Introduction
In this repository , I decided to implement projects of micro-processor laboratory class. I was supposed to implement them in C language , then test them in proteus application 
with an appropriate circuit , after these steps, I should program them on Atmega16 with TNM programmer or using raspberry pi (for final project) and make that circuit physically.
In the way of implementing them , I faced a lots of problems and errors in terms of constructing circuits, implementing programs and using Atmega libraries, and troubleshooting I/O pins.

## Projects
3 projects which implemented for this course are :
* [LED blinking](#LED_blinking)
* [Morse code password](#Morse_Code)
* [Line follower robot](#line_follower)


<a name="LED_blinking"></a>
### LED blinking
In order to implement this project, I have used 'mega16.h' library in C . by initializing a delay time , the LED starts blinking and we can handle the pace of blinking by 2 buttons in circuit. I used TNM programmer to write the program on an 'Atmega16' IC. then construct our circuit and connect the used PINs in code to LED and buttons and a resistor. 



<a name="Morse_COde"></a>
### Door opener with Morse Code
Morse is a coding used for wide range of applications ( e.g. Telegraph ) . It's like a talking language that consists of sets of dots and lines. The Morse code used for each letter is as follow :


![morse code translator](https://upload.wikimedia.org/wikipedia/commons/5/5a/EB1911_Telegraph_-_Morse_alphabets_-_international_code.jpg)


We used this coding to set a sequence of dots and lines for door password. in order to do that , I used a 8 bit variable that zeros represents dot and Ones represents lines. Then calculate the time of pushing button to understanding the inputs. finally i compare the input and predefined password in order to open the door.



<a name="line_follower"></a>
### Line Follower Robot
This is final project of this course. we used a Arduino , 4 IR sensors, and a car robot which wheels are controlled by given signals from raspberry pi. you should put this code on your arduino and then connect the PINs to wheels. There are lots of tutorials of this projects with videos of how to do that. 
