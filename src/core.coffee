class App.Core extends enchant.Core
  constructor: ->
    super 640, 480
    window.app = @
    @fps = 30
    @keybind('W'.charCodeAt(0), 'w')
    @keybind('A'.charCodeAt(0), 'a')
    @keybind('S'.charCodeAt(0), 's')
    @keybind('D'.charCodeAt(0), 'd')
    @keybind('E'.charCodeAt(0), 'e')
    @keybind('Q'.charCodeAt(0), 'q')
    @keybind('I'.charCodeAt(0), 'i')
    @keybind('C'.charCodeAt(0), 'c')
    @keybind('B'.charCodeAt(0), 'b')

    @preload [
      "img/chara0.png"
      'img/roguetile.gif'
      'img/char/player.png'
      'img/char/mochi1.png'
      'img/map0.png'
      'img/map1.png'
      'img/Data/CharaChip/[Chara]Civilian_Male_A.png'
      'img/Data/CharaChip/[Monster]Slime1_pochi.png'
      'img/Data/CharaChip/[Monster]Goblin1_tapis.png'
      'img/Data/CharaChip/[Monster]Skelton_pochi.png'
    ]

    @onload = =>
      @player = new App.Entity.Player
      @pushScene new App.Scene.Field @player

    @start()

  _key_free:{}

  isKeyFree: (key) ->
    # 初回
    unless @_key_free[key]
      @_key_free[key] = new Date().getTime()
      true
    else
      # 最終入力から1/3秒経過
      if new Date().getTime() - @_key_free[key] > 1000/3
        @_key_free[key] = new Date().getTime()
        true
      # 待機中
      else
        false
