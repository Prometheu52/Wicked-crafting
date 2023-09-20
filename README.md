## Usage
***

Run the AHK scritp with the AHK runtime
 - Basicly if you have AutoHotkey installed, you just double click it. It should create a hidden tray icon with the AHK logo. That means it is running

#### Input Latency feature

This feature is a bit technical. In my experiments the game seems to handle input much better when it is running on a higher fps, so I exposed the internal InputLatency field. This fields' value is used when executing the Input Fields' characters. By lowering this value you leave less time for the game to process the input, thus the earlier explaination. So in a nutshell, if you want to have more than **4** input in the Input Field, try bringing up the fps by a bit and lowering the latency. I found that on 45 fps 6 inputs was reliably hit, but you may need to adjust your settings.

#### Ingame: 

**While the destiny window is active, and the game is in Windowed Fullscreen mode**

 - Press Ctrl + 1 to bring up the GUI
 - In the GUI the "Source" fields are the starting point (usually the shotgun)
 - The "Ending" is the weapon you wnat to have the trait on
 - The Inputbox at the bottom is where you put in characters to move the ingame menu

## Example:
***

#### The Auto Shotgun Rifle

1. Source row: 1 , Source col: 1

2. Ending row: 2 , Ending col: 1

3. Input field: A (the chars are uppercase by default)

4. After inputing these press OK

5. Navigate where the shotgun is in at the Enclave menu

6. Then press F2 to begin

To exit, on the hidden tray icon right click -> exit

The Keypress Latency is gives contol over how many ms should be between keypresses. The default value is 60. It is used for crafting weapons that needs to travel more than 4 keys. In that case set a higher FPS ingame, and lower the latency. This way the game can recognise more input.


#### Important

The script is not sucessful at 100% of the time. Limiting framerate or your connection is definitly helpful!

Also, I have only tested it on a 2k display. In theory it should work on any display, but without testing I can not be sure!

If something seems off, check the values with the "Debug" button

If you are having trouble geting the bug to work try clicking while the mouse is resting on the Ending card.
