# brolic

Podcast generator.

## Install

Run `make install`.  This runs as a CGI script -- old school, huh?  As such, it
needs to be deployed into the relevant `cgi-bin` of your web server.

## Call

The parameter is `pod_name`, which references a group of configurations defined
in the ini file.  Thus, a single config file supports serving multiple podcasts,
differentiated by the value of this parameter.

## Configuration

The configuration is searched for at `/usr/local/etc/brolic.ini`.  It should
look roughly as follows:

```
[adam_and_joe]
episode_path = /mnt/bones/speech/adam_and_joe
template_path = /usr/local/share/brolic/adam_and_joe.atom.tmpl
uri_prefix = http://kupukupu.solasistim.net/adam_and_joe/
pod_title = Adam and Joe Archive
self_link = http://kupukupu.solasistim.net/render_atom.cgi?pod_name=adam_and_joe
```

AFAICT self link isn't really used for much.  The other ones are obvious.

## Fictionalize updated times on files

If you have weird updated times, you can try this really stupid method.

    find . -type f | sort | while read file; do echo "file: $file"; touch "$file"; sleep 2; done
