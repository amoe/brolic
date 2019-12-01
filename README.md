# brolic

Podcast generator.

## Install

Run `make install`.

## Call

The parameter is `pod_name`, which references stuff defined in the ini file.

## Ini file example

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
