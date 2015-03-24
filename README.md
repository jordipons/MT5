MT5 modification for "Automatic music simplification: improving cochlear implants music perception" 
===========
Forked from: https://github.com/squallooo/MT5. A demo online is available at http://mt5demo.gexsoft.com and also you can take a look to the author's <a href="http://miageprojet2.unice.fr/Intranet_de_Michel_Buffa/MT5%2c_multitrack_player_for_musicians">documentation</a>.

This modification of MT5 adapts the original framework to be used into my specific research context. The aim of this extension is to use MT5's modification to study the music mixing preferences of cochlear implant recipients.

Ubuntu instalation tutorial
----------------------------------

1. Install apache: sudo apt-get install apache2
2. Install nodejs (required for MT5): sudo apt-get install nodejs
3. Install npm: sudo apt-get install npm
4. Download the GitHub repository.
5. Extract and copy the files into the apache folder: /var/www/. What will lead you to have: /var/www/MT5-master/.
6. Move to that folder: cd /var/www/MT5-master/
7. Type to the terminal and wait: npm install
8. Type to the terminal: nodejs server.js.
9. Now, the server is running in local. As you can see in the output of the terminal, there is an IP:port direction (i.e.: 127.1.1.1:8081). Don't close the terminal!
10. Go to your browser and type the IP:port direction that showed your terminal (i.e.: 127.1.1.1:8081).
11. Enjoy!

Author of the modification:
-----------------------------------
Jordi Pons (idrojsnop@gmail.com)
