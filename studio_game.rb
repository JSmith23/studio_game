require_relative 'game'

player1 = Player.new "moe"
player2 = Player.new "larry", 60
player3 = Player.new "curly",125
player4 = Player.new "Shemp", 90

knuckleheads = Game.new("Knuckleheads")
puts knuckleheads.title
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player4)
knuckleheads.play(2)
knuckleheads.print_stats



