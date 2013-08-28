relaymyhome
===========
OSX Bash Script for automating the process of getting Nintendo 3DS StreetPass hits via Internet Connection Sharing.

What's New
==========
**v 0.3**

Specifying the port (en0,en1,etc.) is no longer necessary. You can now run the program using either of the basic commands:

* **./relaymyhome** (basic mode)
* **./relaymyhome full** (full mode with random addresses) **Recommended**

Thanks go out to @imariaprime for the changes.

**v 0.2**
* New Mode - running the script with the command **./relaymyhome full** will now cause the script to randomly select addresses from the "Extended Prime MAC's" list (currently 160 addresses). While this mode will likely get you more duplicate StreetPasses, it can be run multiple times within the 8-hour cooldown period. You should be able to run this mode, clear out your StreetPass hits, and run the script again ~15 times before you run out of potential StreetPass hits within the 8-hour cooldown window.

What It Does
============
By setting up your Mac computer to act like a StreetPass Relay, you can get StreetPass tags from all over the world. This script cycles through over 20 of the most popular streams in order to fill up your StreetPass queue in 20-30 minutes. Just set your 3DS down, configure your computer, and run the script.

What You'll Need
================
* A Nintendo 3DS that has **updated firmware (as of August 2013)** with WiFi turned on, all apps/games closed, and in sleep mode (lid closed).
* An Apple computer running OS X (only tested on 10.8, although earlier versions may work as well) with both wired and wireless network interfaces (MacBook Airs will need a USB or Thunderbolt to Ethernet adapter for the wired connection). Your wired connection must be connected to a wired network and able to access the Internet over that connection.
* An account with administrator rights on the computer.

Installation & Usage (Mac OS X 10.8)
====================================
1. Download the script file from this page. The easy way is to download the ZIP file using the "Download ZIP" button on the bottom right of this page. Double click the downloaded file to unzip it.
2. Move the **relaymyhome** file to somewhere you can access (if you're completely unfamiliar with using the OSX Termainal, stick it in **Documents**).
3. Using the WiFi icon in your menu bar at the top of the screen, select "Create Network..." and create a network named **attwifi** and make sure to set *Security* to **None** (you can ignore the Channel option).
4. Open **System Preferences**, then select **Sharing**. Select **Internet Sharing**, then set "Share your connection from:" to **Ethernet**, and check off **WiFi** in the "To computers using" box. Finally, check off **Internet Sharing** and click **Start** at the prompt.
5. Open **Terminal** (in your Applications folder under *Utilities*), and navigate to the location you placed **relaymyhome** -- if you put it in **Documents**, then in *Terminal* type: **cd ~/Documents**
7. If this is the first time you are running the script, in Terminal enter the command: **chmod +x relaymyhome**
8. Now type **./relaymyhome full** and you should see the script do its thing. If you get an error that stops the script, something went wrong. The script takes about 20 minutes to run, after which you should have a list full of StreetPass hits on your 3DS.
9. Once you have greeted your new visitors in the StreetPass Plaza, you can run the script again to get another batch of StreetPasses. You should be able to run the script at least a dozen times before you will need to wait for the eight hour cooldown on hitting the same relay twice.

Credits
=======
All credit for the original idea of duplicating StreetPass Relays goes to the many folks [listed here](https://docs.google.com/spreadsheet/lv?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE&f=true&noheader=true&gid=0). All I've done is automated the process that they discovered.

Want to Help?
=============
If you'd like to improve this script, please make the changes and submit a pull request. Thanks in advance!
