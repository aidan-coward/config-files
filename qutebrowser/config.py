# sets d to go down with a 4x larger scroll increment than j
config.bind('d','scroll-page 0 0.2')
# old - interacted with text boxes and youtube videos
# config.bind('d','run-with-count 4 scroll down')
    
# 
config.bind('<Control-d>','scroll-page 0 -0.2')

# x closes tab
config.bind('x','tab-close')

# control-tab switches to next tab
config.unbind('<Control-Tab>')
config.bind('<Control-Tab>','tab-next')
# control-shift-tab switches back a tab
config.unbind('<Control-Shift-Tab>')
config.bind('<Control-Shift-Tab>','tab-prev')

# open new tab 
config.bind('t','set-cmd-text --space :open --tab')

# change scrolling so that it doesn't interact with text boxes that are currently focused
config.unbind('k')
config.unbind('j')
config.bind('k', 'scroll-page 0 -0.05')
config.bind('j', 'scroll-page 0 0.05')

# open quickmark with go
#config.unbind('go', mode='normal') 
#config.bind('go','set-cmd-text --space :quickmark-load')

# set search engines
c.url.searchengines = {
        "DEFAULT": "https://www.google.ca/search?q={}",
        "aw": "https://wiki.archlinux.org/?search={}",
        "tpb": "https://thepiratebay.rocks/search/{}",
        "ew": "https://en.wikipedia.org/wiki/index.php?search={}",
        "tube": "https://www.youtube.com/results?search_query={}",
        "tu": "https://invidio.us/search?q={}",
        "maps": "https://www.google.com/maps/search/{}",
        "a": "https://www.archlinux.org/packages/?q={}",
        "aur": "https://aur.archlinux.org/packages.php?K={}",
        "fr": "https://fr.wiktionary.org/wiki/{}",
        "fc": "https://fr.wiktionary.org/wiki/Annexe:Conjugaison_en_fran%C3%A7ais/{}",
        "g": "https://github.com/search?q={}",
        "cr": "https://crates.io/search?q={}",
        "mw": "https://mtg.gamepedia.com/index.php?search={}",
        "mc": "http://gatherer.wizards.com/Pages/Search/Default.aspx?name=+[{}]",
        "td": "https://www.torrentday.com/t?q={}&qf=#torrents",
        "ft": "https://facetofacegames.crystalcommerce.com/products/search?query={}",
        "gk": "http://www.gamekeeperonline.com/products/search?q={}",
        "ab": "http://www.labyss.ca/products/search?q={}",
        "urban": "https://www.urbandictionary.com/define.php?term={}",
        "en": "http://www.wordreference.com/enfr/{}",
        "s": "https://scryfall.com/search?q={}",
        "sc": "https://soundcloud.com/search?q={}",
        "deb": "https://packages.debian.org/search?searchon=sourcenames&keywords={}",
        "bulba": "https://bulbapedia.bulbagarden.net/wiki/{}",
        "r": "https://doc.rust-lang.org/std/index.html?search={}",
        "fsyn": "http://www.synonymes.com/synonyme.php?mot={}&x=0&y=0",
        "t": "https://terraria.gamepedia.com/index.php?search={}&title=Special%3ASearch&go=Go",
        "th": "https://www.thesaurus.com/browse/{}",
        "way": "http://web.archive.org/web/*/{}",
        "sw": "https://stardewvalleywiki.com/{}",
        "rg": "https://genius.com/search?q={}",
        "ls": "http://libgen.is/scimag/?q={}",
        "lb": "http://libgen.is/search.php?req={}",
        "lf": "http://libgen.is/fiction/?q={}",
        "dc": "https://deadcells.gamepedia.com/index.php?search={}&title=Special%3ASearch&go=Go",

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

c.tabs.background = True

# ad blocker whitelist
#c.content.host_blocking.whitelist = ['host1.com', 'host2.com'] 
c.content.host_blocking.whitelist = ['canadiantire.ca'] 
