# brolic

Podcast generator.

## What is to be done?  [Chto delat'?]

Template list should be defined in a server-side config file somewhere.

Set of restricted strings should be passable to select a template.

Script can then read the config to determine what template to render and what
directory to read.

## Install

Run `make install`.

## Call

The parameter is `pod_name`, which references stuff defined in the ini file.

## Ini file example

    [daily_politics]
    episode_path = /home/amoe/episodes
    template_path = /usr/local/share/brolic/daily_politics.atom.tmpl

```
[adam_and_joe]
episode_path = /mnt/bones/speech/adam_and_joe
template_path = /usr/local/share/brolic/adam_and_joe.atom.tmpl
```
