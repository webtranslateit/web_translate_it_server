# Web Translate It Synchronisation Console

![Web Translate It](http://f.cl.ly/items/2Z413Q3A2b331c0O2m04/wti_server.png)

`wti-server` is a sinatra app you can use to run a friendly web interface to sync your translations. It allows a translation team to refresh the language files on a staging server without asking the developers to manually `wti pull`.

To get started, go to the directory of the application you want to sync and do:

    wti-server

By default, it starts an application on localhost on the port 4000. You will find the tool on `http://localhost:4000`.

Should you need to use another host or port, you can use the `-h` and `-p` options. For example: `wti server -p 1234`.

You may want to run some commands before or after syncing translations. You can use the hooks to do so. For instance, you could add the following in your `.wti` file:

    before_pull: "echo 'some unix command'"
    after_pull:  "touch tmp/restart.txt"

`before_pull` and `after_pull` are respectively executed before and after pulling language files.
