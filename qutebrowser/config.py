# sets d to go down with a 4x larger scroll increment than j
config.bind('d','run-with-count 4 scroll down')

# x closes tab
config.bind('x','tab-close')

# control-tab switches to next tab
config.unbind('<Control-Tab>')
config.bind('<Control-Tab>','tab-next')
# control-shift-tab switches back a tab
config.bind('<Control-Shift-Tab','tab-prev 1')

# open new tab 
config.bind('t','set-cmd-text --space :open --tab')

# open quickmark with go
#config.unbind('go', mode='normal') 
#config.bind('go','set-cmd-text --space :quickmark-load')

# set search engines
c.url.searchengines = {
        "DEFAULT": "https://www.google.ca/search?q={}",
        "aw": "https://wiki.archlinux.org/?search={}",
        "tpb": "https://thepiratebay.org/search/{}",
        "ew": "https://en.wikipedia.org/wiki/{}",
        "tube": "https://www.youtube.com/results?search_query={}",
        "maps": "https://www.google.com/maps/search/{}",
        "a": "https://www.archlinux.org/packages/?q={}",
        "aur": "https://aur.archlinux.org/packages.php?K={}",
        "fr": "https://fr.wiktionary.org/wiki/{}",
        "fc": "https://fr.wiktionary.org/wiki/Annexe:Conjugaison_en_fran%C3%A7ais/{}",
        "git": "https://github.com/search?q={}"
        }

# set vim as editor
c.editor.command = ["urxvt", "-e", "vim", "{}"]

c.aliases = {
        "m": "open -t gmail.com"
        }

# increase font size - default is 16
# change fonts

c.fonts.web.size.default = 16

c.fonts.tabs = "13pt Source Code Pro"

c.fonts.statusbar = "13pt Source Code Pro"

c.fonts.prompts = "13pt Source Code Pro"

c.fonts.completion.entry = "13pt Source Code Pro"

c.fonts.completion.category = "13pt Source Code Pro"


