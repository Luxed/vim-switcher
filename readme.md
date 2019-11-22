# vim-switcher

## Description

vim-switcher aims to be a simple plugin that helps you switch from one filetype to another.

## Why?

Let's say you are working on an *angular* project, you surely switch between filetypes of the same name but with different extentions a lot.
For example, you want to switch from `app.component.html` to `app.component.ts`. Depending on how you use vim, you may want to simply change buffer.

## How to use

- Calling the `switcher#Switch()` function will prompt you to input the wanted file extension.
- Calling the `switcher#OpenNewPath([extension])` function (where extension is a `string`) will edit the file in a new buffer.
- Calling the `switcher#OpenNewPath([options])` method will switch to the file by using input from a dictionnary of options:
  - `extension: string`: extension used for the new buffer.
  - `remove: string`: part of the _filename_ to remove.
  - `subdir: string`: adds a subdirectory to the path
  - `edit_command: string`: command to launch when editing a files. Defaults to `edit`.
- Calling the `switcher#SwitchWithOptions([options])` function (where `[options]` contains the options above), will ask you for an extension and add it in the `[options]` so you don't have to add it yourself.
