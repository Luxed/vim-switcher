# vim-switcher

## Description

Switcher aims to be a simple plugin that helps you switch from one filetype to another.
Its only purpose is giving you access to functions that will help you create mappings to switch or open different file types (by simply changing the file extension) in a new or already existing buffer.

## Why?

Let's say you are working on an *angular* project, you surely switch between filetypes of the same name but with different extentions a lot.
For example, you may want to switch from `app.component.html` to `app.component.ts` regularely.

## How to use

- Calling the `switcher#Switch()` function will prompt you to input the wanted file extension.
- Calling the `switcher#OpenNewPath([extension])` function (where extension is a `string`) will edit the file in a new buffer.
- Calling the `switcher#OpenNewPath([options])` method will switch to the file by using input from a dictionnary of options:
  - `extension: string`: extension used for the new buffer.
  - `remove: string`: part of the _filename_ to remove.
  - `subdir: string`: adds a subdirectory to the path
  - `edit_command: string`: command to launch when editing a files. Defaults to `edit`.
- Calling the `switcher#SwitchWithOptions([options])` function (where `[options]` contains the options above), will ask you for an extension and add it in the `[options]` so you don't have to add it yourself.

## Configuration example

Switcher doesn't create any key mappings or commands to avoid adding clutter.

~~~vim
nnoremap <leader>ss :call switcher#Switch()<CR>
nnoremap <leader>sv :call switcher#SwitchWithOptions({'edit_command': 'vs'})<CR>
nnoremap <leader>sh :call switcher#SwitchWithOptions({'edit_command': 'sp'})<CR>
~~~
