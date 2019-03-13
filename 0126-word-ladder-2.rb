# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {String[][]}
def find_ladders(begin_word, end_word, word_list)
  res = []
  word_list = Set.new(word_list)
  queue = [[begin_word]]
  min_path_length = word_list.length + 1
  while !queue.empty?
    path = queue.shift
    break if path.length > min_path_length
    word = path.last
    word_list.delete(word)
    if word == end_word
      min_path_length = path.length
      res.push(path)
    end
    next_words = word_list.select { |other_word| single_dist?(word, other_word) }
    next_words.each do |next_word|
      next if path.length >= min_path_length
      next_path = path.clone.push(next_word)
      queue.push(path.clone.push(next_word))
    end
  end
  res
end


# p find_ladders("a", "c", ["a", "b", "c"])
# p find_ladders("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])

# p find_ladders "red", "tax", ["ted", "tex", "red", "tax", "tad", "den", "rex", "pee"]
def find_ladders(begin_word, end_word, word_list)
  word_list = Set.new(word_list)
  depth_map = {}
  queue = [[begin_word, 0]]
  max_length = word_list.length
  min_path_length = max_length + 1
  while !queue.empty?
    word, length = queue.shift
    depth_map[length] ||= Set.new
    depth_map[length] << word
    if word == end_word
      min_path_length = length      
      break
    end    
    word_list.delete(word)
    word_list.each do |next_word|
      next unless single_dist?(word, next_word)
      queue.push([next_word, length + 1])
    end
  end
  p depth_map
  if min_path_length >= max_length
    return []
  else
    dfs(begin_word, end_word, depth_map, min_path_length)
  end 
end

def dfs(begin_word, end_word, depth_map, depth)
  res = []
  return res unless depth_map[depth].include?(end_word)  
  return res.push([begin_word]) if depth == 0
  depth_map[depth - 1].each do |next_word|
    next unless single_dist?(end_word, next_word)
    dfs(begin_word, next_word, depth_map, depth - 1).each do |path|
      res.push(path.push(end_word))
    end
  end
  res
end

def single_dist?(word1, word2)
  dist = 0
  0.upto(word1.length - 1) do |idx|
    dist += 1 if word1[idx] != word2[idx]
    return false if dist > 1
  end
  dist == 1
end

# def find_ladders(begin_word, end_word, word_list, path = [], res = [])
#   return res if !res.empty? && res.last.length < path.length
#   return res.push(path.clone.push(begin_word)) if begin_word == end_word
#   path.push(begin_word)
#   word_list.delete(begin_word)
#   next_words = word_list.select{|word| single_dist?(begin_word, word)}
#   next_words.each do |next_word|
#     find_ladders(next_word, end_word, word_list, path, res)
#   end
#   word_list.add(begin_word)
#   path.pop
#   res
# end

def dist(word1, word2)
  dist = 0
  0.upto(word1.length - 1) do |idx|
    dist += 1 if word1[idx] != word2[idx]
  end
  dist
end

def partition(word, start_idx, word_list)
  same, idx, last = start_idx, start_idx, word_list.length - 1
  while idx <= last
    next_word = word_list[idx]
    dist = dist(word, next_word)
    if dist == 0
      word_list[same], word_list[idx] = word_list[idx], word_list[same]
      same += 1
    elsif dist > 1
      word_list[last], word_list[idx] = word_list[idx], word_list[last]
      last -= 1
      idx -= 1
    end
    idx += 1
  end
  [same, last]
end

INF = 1.0 / 0
def find_ladders(begin_word, end_word, word_list)
  dist_map = Hash.new(INF)
  visited = {}
  neighbour_map = {}
  queue = [[begin_word, 0, 0]]
  while !queue.empty?
    word, search_idx, dist = queue.shift
    dist_map[word] = dist if dist_map[word] > dist
    next if word == end_word
    start_idx, end_idx = partition(word, search_idx, word_list)
    start_idx.upto(end_idx) do |next_idx|
      next_word = word_list[next_idx]
      neighbour_map[next_word] ||= Set.new
      neighbour_map[next_word] << word
      queue.push([next_word, end_idx + 1, dist + 1])
    end    
  end  
  p dist_map
  p neighbour_map
  build_ladders(begin_word, end_word, neighbour_map, dist_map)
end

def build_ladders(begin_word, end_word, neighbour_map, dist_map)
  res = []
  return res unless dist_map.key?(end_word)
  level = dist_map[end_word]
  return res.push([begin_word]) if level.zero?
  neighbour_map[end_word].each do |neighbour|
    next if dist_map[neighbour] >= level
    build_ladders(begin_word, neighbour, neighbour_map, dist_map).each do |path|
      res.push(path.push(end_word))
    end
  end
  res
end
















INF = 1.0 / 0
def find_ladders(begin_word, end_word, word_list)
  word_list = Set.new(word_list)  
  level_map = {0 => Set.new([begin_word])}
  neighbour_map = {}
  distance = 0
  reached = Set.new([begin_word])
  word_list.delete(begin_word)
  while !reached.include?(end_word)
    next_level = Set.new
    reached.each do |word|
      for_each_combo(word, word_list) do |next_word|
        next_level << next_word
        word_list.delete(next_word)
        neighbour_map[word] ||= Set.new
        neighbour_map[word] << next_word
      end
    end    
    distance += 1
    level_map[distance] = next_level
    reached = next_level
  end
  p neighbour_map
  build_ladders(begin_word, end_word, level_map)
end

def build_ladders(begin_word, end_word, level_map, level = 0, stack = [], res = [])
  return res unless level_map.key?(level)
  if level_map[level].include?(end_word)
    res.push(stack.push(end_word).clone) 
    stack.pop
  else
    level_map[level].each do |word|
      stack.push(word)
      build_ladders(begin_word, end_word, level_map, level + 1, stack, res)
      stack.pop
    end
  end  
  res
end

def for_each_combo(word, word_list)
  word = word.chars
  res = []
  0.upto(word.length - 1) do |idx|
    current_ord = word[idx].ord
    97.upto(122) do |replacement_ord|
      next if replacement_ord == current_ord
      word[idx] = replacement_ord.chr
      new_word = word.join
      yield new_word if word_list.include?(new_word)
    end
    word[idx] = current_ord.chr
  end
end

x = ["hot","dot","dog","lot","log","cog"]
# p partition "hot", 1, x
# p x
#p find_ladders "hit", "cog", ["hot","dot","dog","lot","log"]

#p find_ladders "hit", "cog", ["hot","dot","dog","lot","log","cog"]
p find_ladders("red", "tax", ["red", "ted", "tex", "red", "tax", "tad", "den", "rex", "pee"])

# p find_ladders("qa", "sq", ["si", "go", "se", "cm", "so", "ph", "mt", "db", "mb", "sb", "kr", "ln", "tm", "le", "av", "sm", "ar", "ci", "ca", "br", "ti", "ba", "to", "ra", "fa", "yo", "ow", "sn", "ya", "cr", "po", "fe", "ho", "ma", "re", "or", "rn", "au", "ur", "rh", "sr", "tc", "lt", "lo", "as", "fr", "nb", "yb", "if", "pb", "ge", "th", "pm", "rb", "sh", "co", "ga", "li", "ha", "hz", "no", "bi", "di", "hi", "qa", "pi", "os", "uh", "wm", "an", "me", "mo", "na", "la", "st", "er", "sc", "ne", "mn", "mi", "am", "ex", "pt", "io", "be", "fm", "ta", "tb", "ni", "mr", "pa", "he", "lr", "sq", "ye"])


# p find_ladders "sand", "acne", ["slit","bunk","wars","ping","viva","wynn","wows","irks","gang","pool","mock","fort","heel","send","ship","cols",
#   "alec","foal","nabs","gaze","giza","mays","dogs","karo","cums","jedi","webb","lend","mire","jose","catt","grow",
#   "toss","magi","leis","bead","kara","hoof","than","ires","baas","vein","kari","riga","oars","gags","thug","yawn","wive","view","germ","flab","july","tuck","rory","bean","feed","rhee","jeez","gobs","lath","desk","yoko","cute","zeus","thus","dims","link","dirt","mara","disc","limy","lewd","maud","duly","elsa","hart","rays","rues","camp","lack","okra","tome","math","plug","monk","orly","friz","hogs","yoda","poop","tick","plod","cloy","pees","imps","lead","pope","mall","frey","been","plea","poll","male","teak","soho","glob","bell","mary","hail","scan","yips","like","mull","kory","odor","byte","kaye","word","honk","asks","slid","hopi","toke","gore","flew","tins","mown","oise","hall","vega","sing","fool","boat","bobs","lain","soft","hard","rots","sees","apex","chan","told","woos","unit","scow","gilt","beef","jars","tyre","imus","neon","soap","dabs","rein","ovid","hose","husk","loll","asia","cope","tail","hazy","clad","lash","sags","moll","eddy","fuel","lift","flog","land","sigh","saks","sail","hook","visa","tier","maws","roeg","gila","eyes","noah","hypo","tore","eggs","rove","chap","room","wait","lurk","race","host","dada","lola","gabs","sobs","joel","keck","axed","mead","gust","laid","ends","oort","nose","peer","kept","abet","iran","mick","dead","hags","tens","gown","sick","odis","miro","bill","fawn","sumo","kilt","huge","ores","oran","flag","tost","seth","sift","poet","reds","pips","cape","togo","wale","limn","toll","ploy","inns","snag","hoes","jerk","flux","fido","zane","arab","gamy","raze","lank","hurt","rail","hind","hoot","dogy","away","pest","hoed","pose","lose","pole","alva","dino","kind","clan","dips","soup","veto","edna","damp","gush","amen","wits","pubs","fuzz","cash","pine","trod","gunk","nude","lost","rite","cory","walt","mica","cart","avow","wind","book","leon","life","bang","draw","leek","skis","dram","ripe","mine","urea","tiff","over","gale","weir","defy","norm","tull","whiz","gill","ward","crag","when","mill","firs","sans","flue","reid","ekes","jain","mutt","hems","laps","piss","pall","rowe","prey","cull","knew","size","wets","hurl","wont","suva","girt","prys","prow","warn","naps","gong","thru","livy","boar","sade","amok","vice","slat","emir","jade","karl","loyd","cerf","bess","loss","rums","lats","bode","subs","muss","maim","kits","thin","york","punt","gays","alpo","aids","drag","eras","mats","pyre","clot","step","oath","lout","wary","carp","hums","tang","pout","whip","fled","omar","such","kano","jake","stan","loop","fuss","mini","byrd","exit","fizz","lire","emil","prop","noes","awed","gift","soli","sale","gage","orin","slur","limp","saar","arks","mast","gnat","port","into","geed","pave","awls","cent","cunt","full","dint","hank","mate","coin","tars","scud","veer","coax","bops","uris","loom","shod","crib","lids","drys","fish","edit","dick","erna","else","hahs","alga","moho","wire","fora","tums","ruth","bets","duns","mold","mush","swop","ruby","bolt","nave","kite","ahem","brad","tern","nips","whew","bait","ooze","gino","yuck","drum","shoe","lobe","dusk","cult","paws","anew","dado","nook","half","lams","rich","cato","java","kemp","vain","fees","sham","auks","gish","fire","elam","salt","sour","loth","whit","yogi","shes","scam","yous","lucy","inez","geld","whig","thee","kelp","loaf","harm","tomb","ever","airs","page","laud","stun","paid","goop","cobs","judy","grab","doha","crew","item","fogs","tong","blip","vest","bran","wend","bawl","feel","jets","mixt","tell","dire","devi","milo","deng","yews","weak","mark","doug","fare","rigs","poke","hies","sian","suez","quip","kens","lass","zips","elva","brat","cosy","teri","hull","spun","russ","pupa","weed","pulp","main","grim","hone","cord","barf","olav","gaps","rote","wilt","lars","roll","balm","jana","give","eire","faun","suck","kegs","nita","weer","tush","spry","loge","nays","heir","dope","roar","peep","nags","ates","bane","seas","sign","fred","they","lien","kiev","fops","said","lawn","lind","miff","mass","trig","sins","furl","ruin","sent","cray","maya","clog","puns","silk","axis","grog","jots","dyer","mope","rand","vend","keen","chou","dose","rain","eats","sped","maui","evan","time","todd","skit","lief","sops","outs","moot","faze","biro","gook","fill","oval","skew","veil","born","slob","hyde","twin","eloy","beat","ergs","sure","kobe","eggo","hens","jive","flax","mons","dunk","yest","begs","dial","lodz","burp","pile","much","dock","rene","sago","racy","have","yalu","glow","move","peps","hods","kins","salk","hand","cons","dare","myra","sega","type","mari","pelt","hula","gulf","jugs","flay","fest","spat","toms","zeno","taps","deny","swag","afro","baud","jabs","smut","egos","lara","toes","song","fray","luis","brut","olen","mere","ruff","slum","glad","buds","silt","rued","gelt","hive","teem","ides","sink","ands","wisp","omen","lyre","yuks","curb","loam","darn","liar","pugs","pane","carl","sang","scar","zeds","claw","berg","hits","mile","lite","khan","erik","slug","loon","dena","ruse","talk","tusk","gaol","tads","beds","sock","howe","gave","snob","ahab","part","meir","jell","stir","tels","spit","hash","omit","jinx","lyra","puck","laue","beep","eros","owed","cede","brew","slue","mitt","jest","lynx","wads","gena","dank","volt","gray","pony","veld","bask","fens","argo","work","taxi","afar","boon","lube","pass","lazy","mist","blot","mach","poky","rams","sits","rend","dome","pray","duck","hers","lure","keep","gory","chat","runt","jams","lays","posy","bats","hoff","rock","keri","raul","yves","lama","ramp","vote","jody","pock","gist","sass","iago","coos","rank","lowe","vows","koch","taco","jinn","juno","rape","band","aces","goal","huck","lila","tuft","swan","blab","leda","gems","hide","tack","porn","scum","frat","plum","duds","shad","arms","pare","chin","gain","knee","foot","line","dove","vera","jays","fund","reno","skid","boys","corn","gwyn","sash","weld","ruiz","dior","jess","leaf","pars","cote","zing","scat","nice","dart","only","owls","hike","trey","whys","ding","klan","ross","barb","ants","lean","dopy","hock","tour","grip","aldo","whim","prom","rear","dins","duff","dell","loch","lava","sung","yank","thar","curl","venn","blow","pomp","heat","trap","dali","nets","seen","gash","twig","dads","emmy","rhea","navy","haws","mite","bows","alas","ives","play","soon","doll","chum","ajar","foam","call","puke","kris","wily","came","ales","reef","raid","diet","prod","prut","loot","soar","coed","celt","seam","dray","lump","jags","nods","sole","kink","peso","howl","cost","tsar","uric","sore","woes","sewn","sake","cask","caps","burl","tame","bulk","neva","from","meet","webs","spar","fuck","buoy","wept","west","dual","pica","sold","seed","gads","riff","neck","deed","rudy","drop","vale","flit","romp","peak","jape","jews","fain","dens","hugo","elba","mink","town","clam","feud","fern","dung","newt","mime","deem","inti","gigs","sosa","lope","lard","cara","smug","lego","flex","doth","paar","moon","wren","tale","kant","eels","muck","toga","zens","lops","duet","coil","gall","teal","glib","muir","ails","boer","them","rake","conn","neat","frog","trip","coma","must","mono","lira","craw","sled","wear","toby","reel","hips","nate","pump","mont","died","moss","lair","jibe","oils","pied","hobs","cads","haze","muse","cogs","figs","cues","roes","whet","boru","cozy","amos","tans","news","hake","cots","boas","tutu","wavy","pipe","typo","albs","boom","dyke","wail","woke","ware","rita","fail","slab","owes","jane","rack","hell","lags","mend","mask","hume","wane","acne","team","holy","runs","exes","dole","trim","zola","trek","puma","wacs","veep","yaps","sums","lush","tubs","most","witt","bong","rule","hear","awry","sots","nils","bash","gasp","inch","pens","fies","juts","pate","vine","zulu","this","bare","veal","josh","reek","ours","cowl","club","farm","teat","coat","dish","fore","weft","exam","vlad","floe","beak","lane","ella","warp","goth","ming","pits","rent","tito","wish","amps","says","hawk","ways","punk","nark","cagy","east","paul","bose","solo","teed","text","hews","snip","lips","emit","orgy","icon","tuna","soul","kurd","clod","calk","aunt","bake","copy","acid","duse","kiln","spec","fans","bani","irma","pads","batu","logo","pack","oder","atop","funk","gide","bede","bibs","taut","guns","dana","puff","lyme","flat","lake","june","sets","gull","hops","earn","clip","fell","kama","seal","diaz","cite","chew","cuba","bury","yard","bank","byes","apia","cree","nosh","judo","walk","tape","taro","boot","cods","lade","cong","deft","slim","jeri","rile","park","aeon","fact","slow","goff","cane","earp","tart","does","acts","hope","cant","buts","shin","dude","ergo","mode","gene","lept","chen","beta","eden","pang","saab","fang","whir","cove","perk","fads","rugs","herb","putt","nous","vane","corm","stay","bids","vela","roof","isms","sics","gone","swum","wiry","cram","rink","pert","heap","sikh","dais","cell","peel","nuke","buss","rasp","none","slut","bent","dams","serb","dork","bays","kale","cora","wake","welt","rind","trot","sloe","pity","rout","eves","fats","furs","pogo","beth","hued","edam","iamb","glee","lute","keel","airy","easy","tire","rube","bogy","sine","chop","rood","elbe","mike","garb","jill","gaul","chit","dons","bars","ride","beck","toad","make","head","suds","pike","snot","swat","peed","same","gaza","lent","gait","gael","elks","hang","nerf","rosy","shut","glop","pain","dion","deaf","hero","doer","wost","wage","wash","pats","narc","ions","dice","quay","vied","eons","case","pour","urns","reva","rags","aden","bone","rang","aura","iraq","toot","rome","hals","megs","pond","john","yeps","pawl","warm","bird","tint","jowl","gibe","come","hold","pail","wipe","bike","rips","eery","kent","hims","inks","fink","mott","ices","macy","serf","keys","tarp","cops","sods","feet","tear","benz","buys","colo",
#   "boil","sews","enos","watt","pull","brag","cork","save","mint","feat","jamb","rubs"]

#p partition "hit", 0, ["hit", "hot","dot","dog","lot","log"]