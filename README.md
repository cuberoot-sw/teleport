Getting Started

    Install Teleport on your local machine.

    $ sudo gem install teleport

    Create a Telfile config file. Here's a simple example. Note that we actually define two machines, server_app1 and server_db1:

    $ mkdir ~/teleport
    $ cd ~/teleport

    Put this into ~/teleport/Telfile:

    user "admin"
    ruby "1.9.3"
    apt "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen", :key => "7F0CAB10"    
    role :app, :packages => [:memcached]
    role :db, :packages => [:mongodb-10gen]
    server "server_app1", :role => :app
    server "server_db1", :role => :db    
    packages [:atop, :emacs, :gcc]

    You'll want to copy files to your new machines too. Put the files into your teleport directory. For example, maybe you want to automatically have your .bashrc and .emacs files copied to your new server. You'll want the memcached and mongodb config files too. Here's what your teleport directory should look like:

    Telfile
    files/home/admin/.bashrc
    files/home/admin/.emacs            
    files_app/etc/default/memcached
    files_app/etc/memcached.conf
    files_db/etc/mongodb.conf

    Now run Teleport:

    $ teleport server_app1

Teleport will ssh to the machine and set it up per your instructions.
Full Documentation

Full docs are in the wiki:

https://github.com/gurgeous/teleport/wiki

More at:

http://dennisreimann.de/blog/setting-up-ubuntu-with-teleport/
