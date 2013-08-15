relaymyhome
===========

OSX Bash Script for automating the process of getting Nintendo 3DS StreetPass hits via Internet Connection Sharing.


Installation & Usage (Max OS X 10.8)
====================================

**First of all -- Make sure your 3DS is on, all 3DS games/apps have been closed, and it is in sleep mode.**

1. Download the script file from this page. The easy way is to download the ZIP file using the "Download ZIP" button on the bottom right of this page. Double click the downloaded file to unzip it.
2. Move the **relaymyhome** file to somewhere you can access (if you're completely unfamiliar with using the OSX Termainal, stick it in **Documents**).
3. Using the WiFi icon in your menu bar at the top of the screen, select "Create Network..." and create a network named **attwifi** and make sure to set *Security* to **None** (you can ignore the Channel option).
4. Open **System Preferences**, then select **Sharing**. Select **Internet Sharing**, then set "Share your connection from:" to **Ethernet**, and check off **WiFi** in the "To computers using" box. Finally, check off **Internet Sharing** and click **Start** at the prompt.
5. Open **Terminal** (in your Applications folder under *Utilities*), and navigate to the location you placed **relaymyhome** -- if you put it in **Documents**, then in *Terminal* type: **cd ~/Documents**
6. **IMPORTANT**: At this point, you need to know which interface your WiFi is on. For most modern Apple laptops, this will be en1 (if your laptop has a wired Ethernet port as well as WiFi) or en0 (if you have a WiFi-only laptop, such as the MacBook Air). This guide does not cover the specifics of how to find this interface, since it differs by model of Mac.
7. (Note for this step: we assume your WiFi is on interface en1. If it is on en0 which will be common for the MacBook Air or any Mac without a wired network port, use en0 instead of en1 wherever you see it in this step) -- Now type **./relaymyhome en1** and you should see the script do its thing. If you get an error that stops the script, something went wrong. The script takes about 20-30 minutes to run, after which you should have a list full of StreetPass hits on your 3DS.


Credits
=======
All credit for the original idea of duplicating StreetPass Relays goes to the many folks [listed here](https://docs.google.com/spreadsheet/lv?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE&f=true&noheader=false&gid=3). All I've done is automated the process that they discovered.
