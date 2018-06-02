## Keyboard config files

The file `dvp-1_2_1.map.gz` is placed in /usr/share/kbd/keymaps/i386/dvorak and should be renamed to `dvp.map

Note 
- You must add `KEYMAP=dvp` to /etc/vconsole.conf to effectuate these changes 
- This file configures the behaviour of the virtual console, not X 
- Differences between stock dvp.map 
  - Caps lock key is set to Control
  - Control key is set to Caps Lock
- Differences between dvp.map and dvp.map-chromebook
  - keycode 1(escape key) is set to Escape
  - keycode 125(chromebook search key) is set to Control
- To find keycodes run 'showkey --keycodes'

The file `us` is placed in /usr/share/X11/xkb/symbols 
Note
- Configures X's keyboard behaviour
- Changes made to file
  - `AltGr + ;` is remapped to a dead key providing a diaresis (umlaut)
  - `AltGr + a` is remapped to a dead key providing a circumflex accent
  - `AltGr + '` is remapped to à (a with grave accent)
  - `AltGr + Shift + '` is remapped to À (a with grave accent)
  - `AltGr + o` is remapped to provide œ (oe ligature)
  - `AltGr + Shift + o` is remapped to provide Œ (uppercase oe ligature)
  - `AltGr + e` is remapped to provide é (e with acute accent)
  - `AltGr + Shift + e` is remapped to provide É (uppercase e with acute accent)
  - `AltGr + j` is remapped to provide è (e with grave accent)
  - `AltGr + Shift + j` is remapped to provide È (uppercase e with grave accent)
  - `AltGr + k` is remapped to provide ù (u with grave accent) 
  - `AltGr + Shift + k` is remapped to provide Ù (u with grave accent) 

the chromebook version has swap_caps removed

The file `10-keyboard.conf` is placed in /etc/X11/xorg.conf.d/



