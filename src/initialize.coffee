window.MouseEvent = {}
window.onmousemove = (e) -> window.MouseEvent = e

window.App =
  Scene: {}
  Entity: {}
  Skill: {}
  UI: {}
  View: {}

window.app = {}

App.Entity.GroupId =
  Player: 101
  Enemy : 1001

window.onload = ->
  enchant()
  new App.Core(320, 240)


App.View.ColorListCtrl = ($scope) ->
  $scope.colors = [
    {"name":"桜色","kana":"さくらいろ","color":"#fef4f4"}
    {"name":"黄金","kana":"こがね","color":"#e6b422"}
    {"name":"櫨染","kana":"はじぞめ","color":"#d9a62e"}
  ]
