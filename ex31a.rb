# an adventure game written from scratch for exercise 31 of Learn Ruby the Hard Way
# basic scope is to use if else decision trees
# added a player class with carious attributes
# used various random number games
# TODO refactor to separate Snarg attributes from player with Snarg class
# TODO use custom methods for death, errors etc. rather than code on a case by case basis
class Player
  
  attr_accessor :name, :role, :inventory, :location, :health, :alive, :snarg_health, :snarg
  
  def initialize(name, role)
    @name = name
    @role = role
    @inventory = []
    @location = ""
    @health = 12
    @alive = true
    @snarg_health = 12
    @snarg = "alive"
  end
end

# INTRO
# get player name and role, populate inventory.
puts ">> A wizened figure in a filthy robe hails you:"
puts "Greetings mortal. Please enter your name:"
print "> "
p_name = $stdin.gets.chomp
puts "A strange name, '#{p_name}', no doubt it makes you happy."

puts "Tell me puny one, are you a WIZARD or a WARRIOR?"
print "> "
p_role = $stdin.gets.chomp.downcase
until p_role == "wizard" || p_role == "warrior"
  puts "Art thou a dolt? Wizard or Warrior.."
  print "> "
  p_role = $stdin.gets.chomp.downcase
end

hero = Player.new(p_name, p_role)

puts "Well, here we are then #{hero.name}, \noutside the lair of the grim and redoubtable Snarg."
puts "Tell me oh pimple nosed imp, \ndidst thou think to bring any supplies to this place of terror and woe?"
print "(Y)es / (N)o > "
ans_1 = $stdin.gets.chomp.downcase.chr
until ans_1 == "y" || ans_1 == "n"
  puts "You bore me with your prevarications."
  print "(Y)es / (N)o > "
  ans_1 = $stdin.gets.chomp.downcase
end

if ans_1 == "y"
  puts "A WAND or SWORD no doubt? A packed LUNCH perhaps, or your lucky DICE?"
  puts "Sad to say, the Snarg has a 'one item per adventurer' policy. Choose wisely!"
  print "> "
  ans_2 = $stdin.gets.chomp.downcase
  until ans_2 == "wand" || ans_2 == "sword" || ans_2 == "lunch" || ans_2 == "dice"
    puts "That's not on the list, oh inventive one. \nNo trying to sneak in more than one item either!"
    print "> "
    ans_2 = $stdin.gets.chomp.downcase
  end
  hero.inventory << ans_2
else
  luck = rand(2)
  if luck == 1
    puts "Yes, getting out of the house in an organised fashion is quite the bother isn't it? \nHere, why don't you borrow my most pussisant AMULET."
    hero.inventory << "amulet"
    puts ">> You put the mysterious amulet in your pocket."
  else
    puts "Well that was careless. \nI would advise you to plan ahead in future, but I don't think that will be a problem."
  end
end

#DUNGEON ENTRANCE
puts "Well, that's that then. \nRun along now, I'm sure the next adventurer will be along in a minute...\n...\n..."

print "HIT ENTER >"
$stdin.gets.chomp

puts ">> The gate keeper ushers you through the time worn and scarred threshold."
puts ">> As you stumble forward into the gloom, the great door slams behind you plunging you into darkness!"
puts ">> You just have time to catch a glimpse of a TUNNEL ahead and mouldering STAIRS leading down to your left."
# wiz with wand makes a light:
hatch_visible = true if hero.role == "wizard" && hero.inventory.include?("wand")
if hatch_visible
  
  puts ">> What's a wizard with a WAND good for if he can't make a magelight? Lets have a look around."
  print "> HIT ENTER"
  $stdin.gets.chomp
  puts ">> Now that you can see, you notice a HATCH in the ceiling." 
end
puts ">> Hmm. Which way?"
print"> "
path_1 = $stdin.gets.chomp.downcase

until path_1 == "tunnel" || path_1 == "stairs" || (path_1 == "hatch" && hatch_visible)
  puts ">> Maybe try the the TUNNEL or the STAIRS..."
  puts ">> Or that HATCH of course!" if hatch_visible
  path_1 = $stdin.gets.chomp.downcase
end
hero.location = path_1

#BRANCH 1 - TUNNEL - The Orc
if hero.location == "tunnel"
  puts ">> You enter the tunnel and move forward."
  puts ">> Around a corner you see flickering torch light."
  puts ">> You creep around and you are confronted by..."
  print "HIT ENTER >"
  $stdin.gets.chomp
  puts ">> An orc, with a big nasty axe! This looks dangerous, especially for the scholarly type."
  puts ">> Will you RUN away or FIGHT?"
  print "> "
  ans_3 = $stdin.gets.chomp.downcase
  unless ans_3 == "run" || ans_3 == "fight"
    puts ">> The orc looks bored... RUN or FIGHT?"
    print "> "
    ans_3 = $stdin.gets.chomp.downcase
  end
  
  if ans_3 == "fight"
    if hero.role == "warrior"
      if hero.inventory.include?("sword")
        puts ">> Good thing you brought your sword! You parry the orcs first clumsy swing, and he turns tail and runs like a big ugly baby."
        hero.location = "antechamber"
      else
        puts ">> Maybe you should have brought your sword? I suppose you'll have to wrestle or something. \n>> Watch out for that axe though..."
        fight = rand(2)
        if fight == 1
          puts ">> Your wrestling moves confuse the orc enough for you to soundly trounce him."
          hero.location = "antechamber"
        else
          puts ">> The orc looks puzzled by your wrestling stance, and swings his axe with deadly effect."
          puts ">> #{hero.name}, YOU ARE DEAD."
          hero.alive = false
        end #wrestle
      end #sword
    else # you are a wizard
      puts ">> Let's face it, wizards shouldn't fight orcs with big nasty axes. Maybe you should have run away or something."
      puts ">> You put up your dukes and challenge the orc to fisty-cuffs. Meanwhile he bisects you with the aforementioned axe."
      puts ">> #{hero.name}, YOU ARE DEAD."
      hero.alive = false
    end #role
  else #run
    puts ">> Good idea scaredy cat, that orc looked really super dangerous."
    if hatch_visible
      puts ">> Back where we started. What will it be, the HATCH or the STAIRS?" 
      print "> "
      path_2 = $stdin.gets.chomp.downcase
      until path_2 == "stairs" || (path_2 == "hatch" && hatch_visible)
        puts ">> STAIRS or HATCH? It's not hard is it?"
        print "> "
        path_2 = $stdin.gets.chomp.downcase
      end
    else
      puts ">> Looks like you'd better take the STAIRS."
      puts "HIT ENTER >"
      $stdin.gets.chomp
      path_2 = "stairs"
    end
    hero.location = path_2       
  end
  print "HIT ENTER >"
  $stdin.gets.chomp
end 

# death check
raise "GAME OVER" unless hero.alive

#BRANCH 2 -STAIRS - DICE/LUNCH?
if hero.location == "stairs"
  puts ">> You stumble down the pitch black mouldering staircase."
  puts ">> You come to a heavy door with boisterous sounds coming from within."
  puts ">> You open the door to find..."
  print "> HIT ENTER"
  $stdin.gets.chomp
  puts ">> a nasty looking group of Kobolds, playing dice."
  puts ">> The Kobolds pause their game and turn your way:\n"
  puts ">> 'Look lads, lunch!' says the largest Kobold"
  offer = ""
  if hero.inventory.include?("lunch")
    print "HIT ENTER >"
    $stdin.gets.chomp
    puts ">> You think instantly of the healthy packed LUNCH you brought with you."
    puts ">> Would you like to offer it to the Kobolds?"
    print "(Y)es / (N)o >"
    offer_lunch = $stdin.gets.chomp.downcase.chr
    until offer_lunch == "y" || offer_lunch == "n"
      puts ">> Decisions, decisions..."
      print "(Y)es / (N)o >"
      offer_lunch = $stdin.gets.chomp.downcase.chr
     end 
  end
  
  if offer_lunch == "y" && hero.inventory.include?("lunch")
    puts ">> You proffer it hopefully, and the largest Kobold is delighted with your sandwich!" 
    puts ">> You slip past before the others realise they're still hungry..."
    hero.location = "antechamber"
    hero.inventory.delete("lunch")
  else 
    puts ">> In desperation you suggest a game of dice! Luckily, Kobolds love to gamble."
    puts "'Okay!' says the largest Kobold, 'Loser gets eaten. First one to roll a six wins!'"
    puts ">> The smallest Kobold is ushered forward to play dice with you. He looks unhappy."
    puts ">> You ask if you can play with your own lucky DICE. \n>> The Kobolds don't mind. Kobolds are stupid." if hero.inventory.include?("dice")
    # dice game
    your_roll = 0, kobold_roll = 0
    until (your_roll == 6 || kobold_roll == 6) && your_roll != kobold_roll
      if hero.inventory.include?("dice")
        your_roll = rand(6) + 4
        your_roll = 6 if your_roll > 6 
      else
        your_roll = rand(6) + 1
      end  
      kobold_roll = rand(6) + 1
      print "> HIT ENTER TO ROLL!"
      $stdin.gets.chomp
      puts "You roll #{your_roll}, the Kobold rolls #{kobold_roll}."
      puts "A draw! REROLL!" if your_roll == 6 && kobold_roll == 6
    end
    if kobold_roll == 6
      puts "Bad luck, the Kobolds eat you"
      puts ">> #{hero.name}, YOU ARE DEAD"
      hero.alive = false
    else #your_roll == 6
      puts "Good job! You slip past while your opponent gets eaten."
      hero.location = "antechamber"
    end
  end
  print "HIT ENTER >"
  $stdin.gets.chomp
end    

# death check
raise "GAME OVER" unless hero.alive

#BRANCH 3 -HATCH -RIDDLE
if hero.location == "hatch"
  puts ">> You pull the hatch shut behind you, and find yourself in a cosy room lit by warm lamp-light."
  puts ">> At a table you see a grumpy looking hobbit. He looks hungry."
  puts "'Hello there!' the hobbit waves, 'I'm terribly bored and hungry. Would you like to play a game of riddles?'"
  print "> HIT ENTER"
  $stdin.gets.chomp
  puts ">> You agree reluctantly, sensing a catch."
  puts "'Okay', says the hobbit, 'I'll ask you a riddle, and if you get it right I won't eat you.'"
  # riddle game
  riddle = rand(3)
  riddle_answer = false
  if riddle == 0
    puts "'Here goes!'"
    puts "\t'Thirty white horses on a red hill.'"
    puts "\t'First they champ, then theys stamp, then they stand still.'"
    puts "\t'What am I?'"
    print "(a one word answer please) >"
    ans_4 = $stdin.gets.chomp.downcase
    riddle_answer = true if ans_4 == "teeth" || ans_4 == "tooth"
  elsif riddle == 1
    puts "'Here goes!'"
    puts "\t'What has roots as nobody sees,'"
    puts "\t'Is taller than trees,'"
    puts "\t'Up, up it goes,'"
    puts "\t'And yet never grows.'"
    print "(a one word answer please) >"
    ans_4 = $stdin.gets.chomp.downcase
    riddle_answer = true if ans_4 == "mountain" || ans_4 == "hill"
  else # riddle == 2
    puts "'Here goes!'"
    puts "\t'Alive without breath,'"
    puts "\t'As cold as death;'"
    puts "\t'Never thirsty, ever drinking,'"
    puts "\t'All in mail never clinking.'"
    print "(a one word answer please) >"
    ans_4 = $stdin.gets.chomp.downcase
    riddle_answer = true if ans_4 == "fish"
  end
  print "HIT ENTER >"
  $stdin.gets.chomp
  #result
  if riddle_answer
    puts "'That's right!' shouts the hobbit, 'I really need some new riddles...'"
    puts "'Off you go then. Best of luck!'"
    puts ">> You beat a hasty retreat out of the room, vowing never to trust a hobbit again"
    hero.location = "antechamber"
  else
    puts "'Wrong!', shouts the hobbit, 'Lunchtime!'"
    puts ">> With an expression of glee the hobbit clubs you with his hobbnanigans stick."
    puts ">> #{hero.name} YOU ARE DEAD"
    hero.alive = false
  end
  print "HIT ENTER >"
  $stdin.gets.chomp
end
#death check
raise "GAME OVER" unless hero.alive
#BRANCH 4 - ANTECHAMBER
if hero.location == "antechamber"
  puts ">> You look around you, and find yourself in grand hallway."
  puts ">> At the end of the hall is a great wooden door decorated with a pair of Snargs rampant."
  puts ">> This is it! The final confrontation!"
  puts ">> With a sense of terrible doom you venture onward."
  print "HIT ENTER >"
  $stdin.gets.chomp
  hero.location = "snarg"
end

# DUNGEON END -SNARG
if hero.location == "snarg"
  puts ">> The mighty portal slams behind you with sonorous boom."
  puts ">> Before you stands the Snarg, terrible and oddly indescribable."
  puts "\n\t 'Greetings #{hero.role}, prepare to meet your doom!'\n"
  if hero.inventory.include?("amulet")
    puts "\t 'Oh, what a lovely and most puissant AMULET you have there, oh #{hero.role}.'"
    puts "\t 'Tell you what, lets give it a toss.'"
    puts "\t 'Heads, I let you out the back door. If it's tails, then its doom for you I'm afraid.'"
    print "HIT ENTER >"
    $stdin.gets.chomp
    toss = rand(2)
      if toss == 1
        puts ">> Heads!"
        puts ">> The Snarg ushers you out the back door."
        puts ">> Though you are glad to be alive, you feel disappointed by the lack of a satisfying resolution after all this adventuring."
        puts ">> #{hero.name}, YOU HAVE ESCAPED"
      else
        puts ">> Tails!"
        puts ">> The Snarg dutifully subjects you to a terrible doom."
        puts ">> #{hero.name}, YOU ARE DEAD"
        hero.alive = false
      end
  elsif hero.inventory.include?("dice")
    puts "\t 'Oh, I see your brought some loaded dice with you!'"
    puts "\t 'As it happens, I have a set of my own."
    puts "\t 'I know! Let's roll off against each other, first to roll a total of fifty wins!"
    puts ">> The Snarg brings out his gently glowing pair of dice, and you begin to roll..."
    hero_total = 0
    snarg_total = 0
    until hero_total >= 50 || snarg_total >= 50
      print "HIT ENTER TO ROLL!"
      $stdin.gets.chomp
      hero_roll_1 = rand(6) + 1
      hero_roll_2 = rand(6) + 1
      hero_total += ( hero_roll_1 + hero_roll_2)
      snarg_roll_1 = rand(6) + 1
      snarg_roll_2 = rand(6) + 1
      snarg_total += ( snarg_roll_1 + snarg_roll_2)
      puts "You roll a #{hero_roll_1} and a #{hero_roll_2}."
      puts "The Snarg rolls a #{snarg_roll_1} and a #{snarg_roll_2}."
      puts "You have a total of #{hero_total}, the Snarg has a total of #{snarg_total}."
    end
    if hero_total == snarg_total
      puts "\t 'A dead draw! Okay, tie breaker: 4+ to not die."
      puts ">> You roll a single hopeful D6..."
      print "HIT ENTER >"
      $stdin.gets.chomp
      final_roll = rand(6) + 1
      if final_roll >= 4
        puts ">> You rolled a #{final_roll}!"
        puts ">> The Snarg howls and keels over dead in a fit of pique."
        puts ">> What a bad loser!"
        hero.snarg = "dead"
      else
        puts ">> You rolled a #{final_roll}!"
        puts ">> The Snarg howls with glee, and vaporises you."
        puts ">> Oh well, at least you gave it another victorious dice rolling story to tell dinner guests."
        puts ">>#{hero.name}, YOU ARE DEAD"
        hero.alive = false 
      end
    elsif hero_total >= 50 && snarg_total >= 50
      puts "\t 'Gah! Let's see who got the highest total."
      puts "\t 'So, I rolled #{snarg_total} and you rolled #{hero_total}..."
      print "HIT ENTER >"
      $stdin.gets.chomp
      if hero_total > snarg_total
        puts "\t 'Which means you win! No way! That sucks!'"
        puts ">> The Snarg howls and keels over dead in a fit of pique."
        puts ">> What a bad loser!"
        hero.snarg = "dead"
      else #hero_total < snarg_total
        puts "\t 'Which means I win! Hahahaha! Sucks to be you!"  
        puts ">> The Snarg howls with glee, and vaporises you."
        puts ">> Oh well, at least you gave it another victorious dice rolling story to tell dinner guests."
        puts ">> #{hero.name}, YOU ARE DEAD"
        hero.alive = false
      end
    elsif hero_total >= 50
      puts "\t 'What! No! You must have cheated! I always win at dice!'"
      puts ">> The Snarg howls and keels over dead in a fit of pique."
      puts ">> What a bad loser!"
      hero.snarg = "dead"
    else #sarg_total >= 50
      puts "\t 'I win! I win! I'm the best at dice rolling!"  
      puts ">> The Snarg howls with glee, and vaporises you."
      puts ">> Oh well, at least you gave it another victorious dice rolling story to tell dinner guests."
      puts ">> #{hero.name}, YOU ARE DEAD"
      hero.alive = false
    end  
  elsif hero.inventory.include?("wand")
    # harry potter? three spells? expleiarmus, expecto, er? 
    # Snarg uses crucio, avarda? wizard gets clues?
    # place holder for the time being
    puts "\t 'Ho! A WAND! That frightens me not!'"
    puts "\t 'Although, if you knew how to cast spells, I might be a bit worried."
    if hero.role == "warrior"
      puts ">> Hmm. You wish you'd taken the wand elective at warrior school."
      puts ">> You wave your WAND in what you hope is a convincing manner."
      print "HIT ENTER >"
      $stdin.gets.chomp
      wand_orientation = rand(2)
      if wand_orientation == 1
        puts ">> By some fluke you make the wand produce a rather impressive fireball."
        puts ">> When the smoke clears, you see no sign of the mighty Snarg. That was easy!"
        hero.snarg = "dead"
      else
        puts ">> Oops! Maybe you should of checked you had that WAND pointing the right way!"
        puts ">> You incinerate yourself, while the Snarg looks on with a weary expression."
        puts ">> #{hero.name}, YOU ARE DEAD."
        hero.alive = false  
    else # hero.role == wizard
      puts ">> 'What, you say, 'like Bingewinkles most excellent negation?'"
      puts ">> With a nasty smile, you wiggle your wand and negate the Snarg from existance."
      puts ">> That was easy!"
      hero.snarg = "dead"
    end
  elsif hero.inventory.include?("sword")
    puts "\t 'A SWORD eh? Very well, let us duel to the death!'"
    puts ">> The Snarg draws a wicked looking blade steps toward you with a grin."
    puts ">> Your sword shakes in your soft delicate hands. You are beginning to wish you had brought your wand..." if hero.role == "wizard"
    until hero.health <= 0 || hero.snarg_health <= 0
      puts ">> The Snarg takes a swing at you! Will you try and block High or Low?"
      print " (h)igh / (l)ow >"
      block = $stdin.gets.chomp.downcase.chr
      until block == "h" || block == "l"
        puts "Quickly now! High or Low?"
        print " (h)igh / (l)ow >"
        block = $stdin.gets.chomp.downcase.chr
      end
      snarg_hit = rand(2)
      if snarg_hit == 1 #high
        puts ">> The Snarg swings high!"
        if block == "h"
          puts ">> You block the Snarg's high slash, and deliver a quick riposte under his guard."
          hero.snarg_health -= 6
        else #block == "l"
          puts ">> The Snarg delivers a nasty blow to your head!"
          if hero.role == "wizard"
            puts "Your magical training really hasn't prepared you for this sort of thing. Ow!"
            hero.health -= 4
          else #hero.role == "warrior"
            puts ">> You take the blow with aplomb, and fight on."
            hero.health -= 3
          end
        end
      else #snarg_hit == 0 #low
        puts ">> The Snarg delivers a cutting underhand blow!"
        if block == "l"
          puts ">> You block the Snarg's low cut, and turn your blade to slash across his chest."
          hero.snarg_health -= 6
        else #block == "l"
          puts ">> The Snarg staps ye vitals!"
          if hero.role == "wizard"
            puts "Your magical training really hasn't prepared you for this sort of thing. Ow!"
            hero.health -= 4
          else #hero.role == "warrior"
            puts ">> You take the blow with aplomb, and fight on."
            hero.health -= 3
          end
        end   
      end
      puts ">> You feel close to death!" if hero.health <= 4
      puts ">> The Snarg looks a bit peaky!" if hero.snarg_health <= 4
    end
    if hero.health <= 0 && hero.snarg_health <= 0
      puts ">> What a battle! You both keel over dead in pool of ichor."
      puts ">> The Snarg is vanquished, but that's cold comfort to you."
      puts ">> #{hero.name}, YOU ARE DEAD."
      hero.snarg = "dead"
      hero.alive = false
    elsif hero.health <= 0
      puts ">> The Snarg has defeated you!"
      puts ">> #{hero.name}, YOU ARE DEAD."
      hero.alive = false
    else #hero.snarg_health <= 0
      puts ">> You have defeated the Snarg!"
      hero.snarg = "dead"
    end
  elsif hero.inventory.include?("lunch")
    puts ">> Thinking quickly, you offer the Snarg a sandwich!"
    puts "\t 'Oh, how did you manage to bring a sandwich so far through my lair?'"
    puts "\t 'Between the Kobolds and the Hobbit I never get anything to eat but adventurers!'"
    puts ">> The Snarg begins to munch on your carefully preserved sandwich."
    puts ">> He seems engrossed, and gestures distractedly for you to go."
    print "HIT ENTER >"
    $stdin.gets.chomp
    puts ">> Though you are glad to be alive, you feel disappointed by the lack of a satisfying resolution after all this adventuring."
    puts ">> #{hero.name}, YOU HAVE ESCAPED"
  else # hero.inventory.empty?
    puts "\t 'So' quoth the Snarg, 'what terrible artefact did you bring with which to vanquish me?'"
    puts ">> You look sheepish and scuff the floor with a shoe..."
    print "HIT ENTER >"
    $stdin.gets.chomp
    puts "\t 'What?! Nothing? I almost feel bad for you! I mean, that's embarrassing stuff."
    puts "\t 'Tell you what, I'll think of a number from 1 to 10, and if you can guess it I'll let you go.'"
    puts "\t 'Otherwise, I shall use you to make a terrine."
    print "HIT ENTER >"
    $stdin.gets.chomp
    snarg_num = rand(10) + 1
    puts "\t 'Okay, I'm thinking of a number. I won't cheat I promise!"
    print "1-10 >"
    hero_guess = $stdin.gets.chomp
    if hero_guess == snarg_num.to_s
      puts "\t 'Oh! Good guess! Off you go then, see you soon I'm sure!'"
      puts ">> The Snarg ushers you out the back door."
      puts ">> Though you are glad to be alive, you feel disappointed by the lack of a satisfying resolution after all this adventuring."
      puts ">> #{hero.name}, YOU HAVE ESCAPED." 
    else
      puts "\t 'Sorry, I was thinking of #{snarg_num}! Bad luck.'"
      puts "\t 'Now stay still while I mince you...'"
      puts ">> #{hero.name}, YOU ARE DEAD."
      hero.alive = false
    end
  end
  print "HIT ENTER >"
  $stdin.gets.chomp
end

# death check
raise "GAME OVER" unless hero.alive



if hero.snarg == "alive"
  puts ">> Well you escaped, but the Snarg lives to eat you another day."
  puts ">> Have another try why don't you?"
else
  puts ">> Congratulations! You have slain the ineffable Snarg. All glory to #{hero.name} the mighty #{hero.role}!"
  puts "\n"
  puts ">> #{hero.name}, YOU HAVE WON!"
end











