MT5 modification for finding the mixing preferences of cochlear implant recipients.
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

Windows instalation tutorial
----------------------------------
0. Install Apache
1. Install Nodejs and NPM: <a href="http://blog.teamtreehouse.com/install-node-js-npm-windows">http://blog.teamtreehouse.com/install-node-js-npm-windows</a>
2. Download the GitHub repository and copy the scripts in the htdocs folder of the Apache server.
3. Move (with cd and dir into the cmd command prompt) to the htdocs folder of the Apache server where the scripts are. For example: "C:\Bitnami\wampstack-5.5.25-0\apache2\htdocs\MT5”.
4. Install NPM repositories from a cmd: npm install
5. Run in a cmd: node server.js
6. Go to a browser and type 0.0.0.0:3000 or localhost:3000.
7. Enjoy!

Author of the modification:
-----------------------------------
Jordi Pons (idrojsnop@gmail.com)
