# https://leetcode.com/problems/reconstruct-original-digits-from-english/

require 'set'
NUMS = %w[zero one two three four five six seven eight nine]

p ({}.tap do |letter_map|
  NUMS.each_with_index do |word, num|
    word.each_char do |c|
      letter_map[c] ||= Set.new
      letter_map[c] << num
    end
  end
end)

# @param {String} s
# @return {String}
def original_digits(s)
  nums = ""
  map = letter_count_map(s)
  while !map.empty?
    0.upto(9) do |idx|
      nums << idx.to_s if possible?(map, NUMS[idx])
    end
  end  
  nums.chars.sort.join
end

def letter_count_map(s)
  map = Hash.new(0)
  s.each_char do |c|
    map[c] += 1
  end
  map
end

def possible?(map, str, idx = 0)
  return true if idx == str.length
  if map.key?(str[idx]) && map[str[idx]] > 0
    map[str[idx]] -= 1
    if map[str[idx]].zero?
      map.delete(str[idx])
    end
    return true if possible?(map, str, idx + 1)
    map[str[idx]] += 1
  end
  false
end
p original_digits "ertfsxvxttiorseenivsoiwosefeinoinwoioousiieihtfirrnioeenwiortwsefwnnniseoisontieiitnvsovthrenwfitfenoiwouwtrtnxneisieinovhuieenrveenoiuoireooieiuittefotnoeeftfsetooeniuvrsnvetwieetvoneeoiieeiiirhftnrntihenseveeorioriononnuhweixefoiotowxreossentetresvzoerfeonvhfoestveooxesintstvefewrifsneeexveefoxonvueituwoieefvofwrfistixeesooxoeweteortfevtsuffohnfruiwitnuxexrevrhfenwenofnzfvsiofeneesoshoefxoefieiieeoueofoivshvtrsoneenenwiexnifttfeoooetesnouewtneisfeenwiiwnvuntnwuesniffweeoretviftseeexeoetzntefnfoxesfforvrwrrhrewtegwsnvinotonitvxeerwooeefswxxtfixenwfxioevierefevinviwvxonfitouevwxnshiewuntwunniennvunvfnnxinovfsvohrresenffintfissstnrfwinsegrrnesentoitoieneiiinuenrtssgosetoufnniuesneseonesetnstiofieeosvoowooeueietrheiienstifweeueitioretiwefwvonsernsxrtteeiisofttwnorovenoisnrsoxseoeeoeeovnoweeowhfirovesxeutisnnviieneetvuxnreoenxinfnrvxntooeonroewxeoirxenfeeehietriuoofxiexwntotointhwvtnfwtnrieeofifinevsfxioninsvntenrhwiwovfenwfrffiofeiehuriieeeswooeofienuoeifoffrfetewoofeusoeiireootseisouvoofntexsnorovrersoovnoovtvvreineerrieeooxtoeseeowixtfeoettiornofunintonsrenoooosxifsrviuitonnetosfwnewnetoznvfhueovwrnnooexnnfeieninetihvwnrexiinvnieevexnwnvtfewexftixiernoonfeinffisofoefevviownoeionforfevufoefreisetvovixxoehuiniivvirewsrsoxoiohtoovvveioertfhveoitoxoiexniieneteiwerngfiesiiifwehsifrteieiwoueenwssnrtxnoevefrtxtoesnferxveeoeifoxuivononeeentsohofwexinrweuovoutoenhnnxenveoihfstturoeeeitrwiirisiinuhrosooiinffnoriweixeiuuenxtoouwosnnshiixnnefgereothioiinrfnneioeenitofieerwtreniortiweoinniewinxeerxtneeneoofutiiirrnsvoefoetssxonfxenowirutohnxerisweewuntnwfwounnentnohevnooxwwiifsoooevtviwsfeounfeitfxostgfgtnnfsounireiiingofxwesfroeofsxefirstrfnerfonitorneneiuifvhnninfvwsiffrffowxetvnfsrwweruiirfoooeeneetuioveoiioowxwsihvowfsrefifvetnwnzfoesnnevfoitrioniehtovwhreonensnhixsifnioeuushswtnnnfnofvneeetooeenheinurowzvftsoofwwgewsunnioffwersrtttohsrfxsoooitvnnsgruieuvteznwrueiisrineoewnxooiwnrreeofnxtuieesrnvtwotfiiewtoteriifwoofieriesoteofterverrroievoitnnnoweineehiowwvsweruooioffovoonrxvsresitrsnfinnostheeffosieeewntewotwfehonvfonrwrennwxeouontwxroitefnveneessrneeiiioeufeevofnxiifxwhefevxxtiosieonoexfrnvtfntnonereioiiferoutwtweouxoeneiirwotenrexvoouiooztnnvreotweeetveefwzeiueseiittitivsenrfseeisieosinnsreifeewnffiiffisfoiwfirtevewwuforiroteiefetiexwioenshneiiooesirhnonnnoriieoioruevroesntoffnuvievtinierfroxveriutofiovweivnifuwrwniteneefoeirxtnfiovogvfoinnrnnitviwiointtwneitnhetihuetnogwvfvevtxwefooiihevxnvxefftnnihfrrieoeortsseeoetnoioeiisowixnfowioseffexvoiwtteouieoexrfeeefeioxotniintoxwtfnofvxoenneoxowwoviionefnnssoifeoxrssovteeietoiirfeeretnerhoegoiesfvenwnnovzonifetorititohrtoixsinvieivfeivueufnisfoeinetioeoeonwiustxnstenwisnownornsievevtuwnontsntuonseeeneeeeheorivoeigoxtnwessuvfviniuuivoeeoetwvnxixxrnuvfweosofseohivuvvofivowiveinwvouueoeettwoxswnervtnovtfxionosweuisooiwnewwxnruowootisinrveowieoonewroefnsietfeentxoonoxvezroeutvefnueioihhxeoeeuxxifotwneeihewuefwexnftsnonofvfveoufniegionswreotrwfeowfeexxeofxtnuevieffoeeeeivteeeseofeniorevrftenrtnrnotfworsvifuesfvofxweoffvienitnonfeiotwnofnruswfonwottoenxorntfnxeoeeveotnouwetnfteuifnoxnvnnffssxfnuwiefveowexwiioffeewuwnewroiegnwzsniiinoixxeiitstsiztoeoefeesnvfniehotxouwtsrieernouwueuovfwreernovniwofrsvenioevnwoeotnuenfxientsooneexwioueioeeneouoeouteeweiitrreuioheonteuweroewiuiooftooutfeueesfenuwvniueniniforotviewinwxnhnteeftotfnoxiruonutofvrevvsutvrtnexeovoxffoxnfeiiirevesrooueeonnwnxetfofseoioenwnoxeeiwiofxnfteottufnfowseteeeeofwnxreevnvovuurroeefefenuwtoriofxwuiestonhreeuieeoonirefieeostieeeeossnveueerosinweefrsihrnveuiwnesoeetwvietoretzxonnuseixhsrtgnofnietseoenwvonnoieftvoefotwrooetxetueinruizotwuooiooveonoiftuevvenhroerenrfhfsfifwreoewwrtsesoewtvtfueiszviewieourioeinurnsrethertivnsenswenffhnrsvosuftffetwfoenneseffrenfnewsneneeisfwfoettfsstnnweteffotnfitsriotoswsuiioeenternsvfxivtiiwtnfosrwwretsfitsoioohfveosfovtifneeieuivtnexfuoeeiewirioruzonrenvitrsovoovvterswfweiiioorewhsefrieinerenexsirivifrxrsnsexoosveexvotoiofitiexfoioiveteitroizeisiehoeeoniuiewooeisuifxtotitehoswvtfntiiwseouxnhvfnteiwvrooioisnhesowreosiswenrnseeiweisieiewfsxfoxtreeinxxixueuunhwoetosxnvrfeeewhtxeuufiowifefnnneesonfxitveeeooiivetnovtiwtneoortoioeuroosfxfewnxeeinnetnnrfwrfhvnieniwtivxteussoieeotetuooxnuseioiwxsorroeuenrentnsnvosrufioeonteofiniiexfuisseooeiownsnvutwsrfeeieeseiiwvfxrivnfhhteftuvfuexifweentfoovsooveruutoinsofeswuxofiowififnsennsrixveovowfeeueevtinvifrooftirofwvuoutnuxwifweteoiosieeusesoiirneuiusnnxiiwxontverxferuefxsnnorrenrzeruxxnsvooetfxiiseirrneetnnniioovnxieesweewfieeuftzoovnoifofwheexofxsurweesinweooxnnoeeownieiisoowteiofonewxwreoeevrswretotvnewetvxtutufeoeoieeuhnoiieuiheweiteeniftxerntsenoxrittievosineuuxesrwfeneeineruxiosiveeeenftenvinivveroxhtetfwnttgftvninhnonesteoexnoooriowoisenoofowwrtwowffttfrrtervfvufeotffhnxfeueftwwfotrifwenfrfetennisftefeiewvnniiowveooiirorwivvxftieoweeufotorsnrorveiftsirvofoontixfnooteoneeiorneosurnhnxfioiiteoieineeerwftxviiwnteotefesutreeenenvutxieiohvhzrironixovonrsiiteefeeeiiotwfrnhutouitfreiresefeofofiniifnennowoifuevteoioiixtnweeveroeeunetoeeeteesewewfxunioeufoefroreofwnrznvifewoeeouxxetoirnoinnsttwiiigrnoufrerhovfiveefreteoswsfvsrseietneewtwsionisxotortnsvfsvfriioisnfuuvifiwssfofnxienxftisxeheoffesveioiitnseowfoeniofeetfesninfvusiootetixfwewwvvxniurefwioheriiooiwfvsoveifenetroeosonhfvfwooeononfghuonesefoofnfstxeevoenieeuofuvonniueoooinizxfieexutwxvnosroorfovtoruoetenrsfexnweiinxotfnvfieiiinixitvwwweoevnhveftrrorseeeetouefiuxoewtxnuotvoieesivefrvivfweeihwwxiexnwotffnxiwerxtwnwiixufeoeenrieeoeouseftifxensioiiegornezonxenuxwotvrsiivsowffnwoinhfooxriuninioownftoewvsoeteuefxorexfeevnfinnineitwtiietiufitntoowiutthrtoiefsewsuonvveetefoeixiexovriiitnfrfeuntwwnsgiuworuosvenoniswitrernnerfvoftihonhoxwfosevirfnwftseghxrsitiirvfvvefhvvufiooerowtunewthfvfeoeoiwouvefffiftietvnsoinforoegsrsexiowefoeoufeofiinoiioifgvoiteieorenevieteeitwuuienoioxvriowoewioenrrxooseexiuzeewoeirwotozetvoreortxefuvewofeftnueisoneeivroniewuwniveheoohsinonnfnvofovxetveiifniuiwvwfieoseseisveitsghtteeeiottsivovonveinvwtteofifevwnexieevfvvefhniwiueurieefeifoevnnexwivieewnoeerinewoeefofeoohnteneeenofoewvifvixnoetvtitoiwovsifxeeueoexeeiwioeeeonxnotriveionseioxvewnfvxfsrnstwwvivvehvnesevereivfftonrvoviosethueevhientinxvefiintvisoiefeiteexfsuonotieniievereeinexrvstnoosnrwhexoffrweuehonuetoutrsxisthrrfwixueeuurvnseiefeifrtenivtonovrontesnrouenweiisreetunwonvethifewesegiifwnevfotihwinenffnxtnirgownxhifiiwfeewfienrviixnitoufeoiiwioueovueungvoxeienuffifroxfifninoxetteetioxwoxexwfevswtvonrtrsentierusuuitiotevnonootriioivoonwvxiewivwotetuevnefentxfivwxxrwivrwevuheueeuohsfesxnivonwnsonriteirwehfehtrhunioofverwssuvstssenxifneriienneretevowererfnifnnriewfwsiriffseuvvvforisxvosntetrixofffewiiuurnerninurfhsfvxonforeexoeirxtneeifvootxnioewfettfeiseninwuxtutsnrfeonewioioiufutvviweuoennowfvtieiuuunnitttxoinitnwtoiiiifxnftenoioterfofofnhofxitvvisvuinnuveeefrowhioouioisxoenevthuinfeifixesrherienftfsiuvereuooetofsiofeuhxvnhsrirtvuwxtrnisstxtnoioewixfieootovefintegtieioeftifrnnextgeeirnfhoiznesxefrvvinnosetoiftennoonnxenwwhtiuwshoxirfefeeeeneoivoifnfvwsneeotnueuusohxwvnnweosinefefeoeoeeoovnwifeunfwfooosoostiroertosfvtetxixffertxvnrnxetfnunehwsxtirnueviowuffrureufuieiiefweneritrufxxnronresussnueiwetxxiofxntvrtxinfuuesroivnntiieosoffiroohtetoroeotfirfvnhoffieuonexewsxnssrvottexiifweohfeeevtfewonotnhixeiintetzrtweeeevenwunoonfefnontnsvviunxvritfohtenuuvoioouroeieovnesoeotnsevffvueuonwneeeoutioeieeoeeitwieuiteoesesheinvouffrerinnnoonesiwreoietfxeirforotninfonnvttfnvooenessnsuhnonnoxnterifwxefrfiruwvseshrwressufifoeixtentnsneuninivnioeonwxsoofnvrenwsoifrivvewnosreweewreveetfiinhtifeoxuoienosovoffexoinwnvieeoteneosuoeeisfnoeotooeveeiitfeonifesnineeeriiiwffeovuoofrwwevioisftstwveowetwsrusefhriexnfnwewsevenneinvxoiswefesetffonioxsowwveefsneeeooerxnefxiovsvoesewiifvxeeoxxxuteofoeosinifiestoroffosswwuinroixvoeiirzeesfsfvfreffifwveiroeiisieeeifwexfewhewxuwnofftihwovevstvisnnzorefnoteneiirirfffiuonuuuveoexiiotefoneevsfonsrifueoerfonneteoostieiiitfuuoeuufveuerorxtvnnfentreoofunfieoessxosfwotonuxsfwniounwuwiwioxoierfewioirvtseutooostnifreesofinefefnnoeneesioinfhoeuieoeweueoonstutentnffoesvfoneoeixrffuivrnooeiewieenfvieeiowrroiirrseoeieiiovneoiroetetooeexovositwneuvetiotxvtentursoethwiievreeixoiieieeerwieviuefefowvewoerxeivffntriouonveoinsvotfienneietfinutoovexennvinieofxoveixvoettvxeoewsfsiisxefuegsooiniieuffoveoewfnoxefoewuisgtnessnetftifvwfeftxfwtnenzvtnrinofeteinvxuftoueisofitixrweixvviounenvsgtfnnietnufohvrfxrfesrfoixeievxtseioeieeoesseetxeioiswnuseoofsefenfeitewottoiutofssreniextevsreiesfrvwnifhfueeuitfxoneivnrvhfiwxoiiinxoneiosvwuevverehexinsnoonsreuietnoeouiiwitwfvutovitsuienriifeotirxvnieenfoftooxovorvstetfoeontexfnnnhtrvniooohtewxooruiuhsfnerexvosnnotwvvoeeowvtiiiuiviisonroxffwooetevneeeuotntofwvietotsseeusuevnosutswoeirofeietvitvfonneuouuiseriixurooforvnneeefgvurivfgxfierfwwoveoootxnefefwssvvvisoohevfnowntuniseieewunofentxieoiiseonexnxofuefeniiixttwtesioifsenevtoontreevwwrveefeeenooerensooeetovivvvineiuisfofnfrwnvfvonsefvexwvtntifueveswwfxiennrnwfegiishniinesenuweieeofonsvnesvfrwnexweetooeteuxovnrowwsenoxunfwntonithwnenfifnsrnffisnwneeirhnuvfurroewoeeeoroteoxoxifwxerrfvrnefoixeeweooiohitnnnesrnisositsesfuuisvovfretgxivvofeuefvniisveenuoreenwswtwnvewuevwurfevfennoveoixeuuuifnfronverieivsntthrorhoroxootzoonoriofisiueenoievseveffoffunvfftiwofnnessfevuerevuinenffntsooftnoieirnoioshtnnoionoewritoinfseheoweoitiesneiusrinvifnieouohexnrtsintxooninrseoexrfsniefvexoeirxorwtefoefexovewwoftetrtixfxeuwtfefsrnntoiteifiewxoioveeviftefoiirinivwnitswxifvuieonvworstofoeovoienxnwfwuesoonviuivuniwnwrrwrfiexunnerofnnxoovezvosneeeftoeowewooegoenwoevowfttniifoosneweixsoenttrtutftsreenioerroovewenfetovrrfeefwitseoeevhfifsiioeerrftxowexfrrseevtheisefonofofneifutfeseenwrsswoovetfxofvroevxnnrtviowxvtssriwinfnhoonsfsifwewornuehfnrnvsnffiohoneoufnreiertfueenifofeoxtowiiivnioreouexfhnvsiosnnsifxfoeeooofeefnneotionhieinvhhniefxtsinxeneerinterrnfnvniionsviniroheositifuisiienvisntenininxeoiifnrruineowsiveewtieieurvhuteioeinnoovreeeiexiiffieufetiiossvtnosotesxifofitevusrforunrffniintfefnwiefxwiieoufooneiiusnoiwvohoivuiufuosiennnffnztiirnxetiiiieifotviiowfiveexnoivenfnitfoinrivtvtuiffstwxvfofwfiefxfnowroofveeeftoegrwsetfixtnefoouurionitonnrvsvwouirittoeefiooietifurrnfinwfvivewxuoxxftionrnrowinuuietnenriunwfiefoutnroxtewhotinvoritnvnoeerwnffveuiorixeoefefeiiniueiowxsosexortfreevtoxnfiwvnorzsiuoiiioftevhieerxeoisneneeutfgoitwftoeiervneessoreooviuusfioonsxtroviroxoenovrnowntienooiiuitroxortsfueinuwiwfofnoevveorvweixvefnfsnronhirrfrevonevsvviioieiiviireovffeeetiutevsnowoetsfevfnuxetxtnfssswxetftueirfefnrwixixxvtoieeninxofvooiveeooxteseeveeneenexeeoxtoieinoowuofoexveeiotosexosffrnexoernuvoiniohiivinoirwntstniriieiooeeeioietrxxeshooetienxeefneotifnnevriefnnsfouvvenfeoeotisienweneexufffffwntffutnnsuennxnotinrvooisfesweeoiownvxvwroeehrirotehoveorviwenxeuexhfrxwovsivonuvifiinfweeefoonoexhnefoxserxvoxovoeeettfoinevvfesoeonffiifieneuneheeiirueowsuvtefiovinoneowxeiveieoifieoieirnrenefnetevtoteowusrweiiioisrvrewtssgoeisxwfueewneeefiseexfntnfxtiirtiweservxtsxwnixvwniruotentgtxozouooruivfniihweuireizoenssevurfiniorueneuifoeonenoooiwxxewtfeewoxifiiosoifeeunuinfxvinfuovfwiuvnxnoxsonxsrteiitnrvneewrnefsufeovorowenoouretrsgotinvveeesotoeieissnuisenffvnouovssoooitntifeiioseosrfnotnsunrxeveitviiihoivfirxroreisiwovwfsoowosuwrsssnvuoninssnxreoenetfuifnoeoozoiroxeowinieeuhvsoixostzftefwxxeuxiusowsuseoeesevefseieexnorevsniiitwoiitttixvirirorfwveovwnnttuivrivtvuovuvitnnrsrseefeewnnvoifieniusonvfosnxeivixrifttreeotefsvitoneenivisovsineototvfvfnrnivovieiixnuhteirootixousetvfvenenveoevhtoviensretiioinionifoswffnriifhixevifuennivsxeeisfnotvrofrtooerxwvheitiuoitrrnueeoereenfitsnneiugtffoeenoeswxiowfnvivfnefxwusuretvesngiuuoensruxhnvnfwietwitfixernvwfntuioiiwiftrsfoifntinotfufinwuhtefoooiitvuoivoneieowntesrfioitnwuwtoinitioeonefxufsreersonnixxenftvueoeesfiefuifxnnfverixriiorxstwstofttffonwnvnsnehfeefxtnsvootvftwixneieoiiueennofeontoefrwioefeosrwnifrtixotwerffniunxoeositeneffeevtewisisosvsenzeinovtesoxoerefssoennwiestoxfexinfftnheouxtihirexeuewoouixihwfeviffiiftietsseneweooviofonnifiohswrfoxoveesiovxxeviveoneeeoifinennvefvrfvwoxnufrfuewfruitnhsirinvffohweoeenxifxeirnoientfiuuwnitfnrfnuivvsevwneerievrtontunoneienexuwtnuuioiofttiunvxevieevierxoixosnwiofrffnsevnoiexoffsntfftnoewnsefnoieeeonxxxviuefshterenotioonfzuuristrioeniwhreevusfnnroooverneieifrvtitnnntiotuurofsfxfuerxesefrehexefniffofotnxiinexortizffwiosfusuoteusesesxvinewoeofnvseiseinnxeeofneeoeuirioiievirffiisefrftioewrutnivsoeefwexfxorhvfeensnnnxvgvsrvvxvxeeeewufuivfvsisfsveiirftxooefrfesfiifrxooerevooentrotisshnixeitftovxfveusnreietfeueieinwienuivirfwsfvneerfeioesissvvvsrtfonvnsfffiveeieonviihtgsoroewnwfohxexhnirsoowinexiiiiooieisohiunwnofennfvsswneoeeioionieoxwowitfofofriefxevnsrowieuistfnixtuxniwseiuwixotstiientfvoeorosntextonsexnsiitiffrovonionnoftevehewuirwtsfnuifiiiveoifrfoeexfsneeionnersrnioiueuoteonortiftthnoueivnrwisxuonieofervieohrfxhvnetsnnfxirernxesnotoenshofvfvoxevvouononhxroresiivreriesoeiueuffifiivtieihihurtweesfnsieffntnvvieineufnxnnoinneivseoisneifnononfteoofifsnuntwfooorrsifunoixueuenivifeofroswinhwrsrfiwswuoronnevexxvxonsvieeeteinsovtwoxieievoxfsteeeheweeensnshenvvftnoivwihnnxveeooxofierisnhnnuxeninnvoerxisersethhnztxouexutefxuxztrexrorintnivufxenwfsrxruxuxexxooneotvrsifwiuvwwnuxufefvtifsfeiitsiuxnwfietoeffernwiniteeeserswxooueonzvinefuowvneiexoestneeoigsoofwiovveoiviirwnnntoffovonieeeotwfnwvtevfevfinwworeehetfxiixtxnievoveifofnsvwooxvxerewnfeuuifiwinoouovifwvwtrfeoieiisnfvnnfsvoenenxvfftswivxowfiuherisnssrnseionsosxsfofevouneenifeefieuexfefnorrhoeetuoweveunwnevseoouevwrxnrwesnensxefeofeitfiewxveoniesiiosnwifnenesnsrnwnvfvowrxsxixfenriffoxroxrinoiweviotofiiufnwwfeotsnihexvvorinnewvoseixovnetisefrfohhveeeteoofosetteereotfwnneieeiivrfrtnihxfeeirrifuerfrusofsefesrooovritrrxxfwsevtviinfoseouofitnnewfoffowiseeitiottvegvnvvieseixoirofnerwfvoneeiiofroeronehovfrnweofworonxoexroenoeseoweoinfveeenegrsxenettxfoofieoinesftfoxnirszeoifeesoixtonntevixesevoitenfntnurvtnftiooeniueirnifftiweeienfoiixviinsuefzfwovnvwtvwfefuiefnoineeveeeiwvtoooevnisfienninoutvesfvneeisxeoeovoesfeheuriieuotugesvvninnvrusrteonifhszoofnioniefwxtioisneuzuxnfseveovvenewoevitfvnstniewtxwoefeeuoevvoiresewieivsitvixrfienooeuurwvitonretfenvowetohontnixteeufesniinseeufixxfowxxxvvvfvoeoeoertieieeeoeeftfvsoefioieirsfrseotiuexiiisefrotonoenownwufeerwheeonxwsisiienwiootiefnxtiefizuvivovereefonsenovfnofiweewoornevofieoxinnixietfuxreiinfxexevfoenvteosfrstrufvtvrvvievxiiffftoiefvhisofeonihwwftenvoieveeinftoweouefteinfeetnoffrwtiseinrnivexosunfeohotoevnoiooisegvseniivsniozieoueufroeiveoenesfsonnvnfteshnfxnionwuixooeioxiroivheiihoeeeouooixieetvvfsieeuhnegfeteeeofrifofevteeeosvoveuwietusvxtonrteiteehsnofsefetsionnfiioiiiexefiveuixiofnnsisviuxhsfxwteoftwureuninrniwexunsvivvivofeunfesxofonsxwefisxvnfnefsivoxiotsfeefiitnsefviftrtovoenifirvifoshfuxeetgreenoneoeefoxonfhofixfeiietnsstvsseenuoiweouisfftfwiiwoosreresnoneuriiunoffoftivvetiiineftznszsfisveoovinenssfeeesoseehfnfvnvnsoetvxsewerireenonwfnfftoveiesseeniztownietwtoniroosefextreifieososexxefnevivfninexeienhvehrsvnetewefowetoiinfiiuxoetfnnxirxnioesfnvieuifouwnvufiinniviwnfesnonnwwefieoxoewiuoinsreoiffsennxowovxieixiewnovfgisunfvfntrieoossonsietoeitifteovinfnveeeevoieeofeesserefoxrisfeoienitvievtifweiexitunirefurnvwnvotnfoononhxeeisehoovnieieesiwwuetufnnvefeeeoeinevefoioeitivovniriiinxosivfeftoiieofriofouoweuxiofifveeeenizeoxxveeneovwtonifeooiiirinixnifosfvioisfvthevxnnvessuzffntsiwiinftiiwoeexsrrneoxiveonxeoeeonifseesfxtsisoiiooiefoieotntenoswhfsxnssewseuftfeeifevsftvrxnosfweionxeonfoevofixesvsefoovoveenfveiwonofsetnefeenzofossronwftnefeetoetvnitrivsoinrnuwgiinssveiteseoosfnveteinieefnwttefveiewiiuenfusutfiniseiowfiiginietreusvenoewwofvwitfeefrxrtfoivioeninoooivsfetoinxfswtinoviroiixtefoextooriewoiesofesvvvesitixernofixnxteeeiehohtiivteexoosnooeninieuxeefvowenortofwefooieefexfrenisezenswivotsusfffivoneofvwninnirfiesouwrowiiftsvewwuottoenveeiriivevienfvnfnuwxenwtffstevhovitnioiirnonierivorhnfniewnnviiffixtefteenoiiosfeotfnxwrivenoinfnxnnieeffheeeweetvexnrofivxortuftfsnetxwwtfioisirinnniseeiehvofueishtwnoooftooewisesoirnusoixeinioxreseuenrsstrevvxsiwfvsvoenwveisuveeizusxftwvioiiveoerweusfehefouwvunwixieeixfwuovinvintvontvenvrueieoooxnufsxevevxrevnivnievrirnrevxewxforviitieoiiosnwfioisixuixefeersxhfvrrrioeeeoeooveuienoofisoxefrxenviorfneoivifeeostnfeeorswnxouvnevieorxwioehoifiohieftufttrxnexfitruoneheexerwrtnseuenvtesrioeveuivfseoouvevnrttetrofswxuiexnetoefionoinegeooionevrevteivevoewefxreierseevnffrfeworhooiiesxeiguwesnsoosoeeotvevreoznfhoiwxouefrthiiixiiiifiosiunrxfniexstsoeeeiofuforveitsnnxinhsoxevnvxvnxwngxneofvefrroxfvsvfnisniooxefuunisvtnuvexxssieseiiexefxuuiostfoewnnoofonovoufuwovsxovnsihiixvnieosieewistsiovwuooweesefounefruwtoifhvsestennrosruetreeftfionwtenvtfeiesfeovfeeiiivtifsufirfnwevgtreeuiixievxnonfninvoiiutteioesrtvuovvrvfsowrineoteiiisuizvtisitoivosenieeiiieoittreoowfsoeffnenxosowvrnvswnnensfexeuwwwutwuefhffxienviontiwfffneioeonsrenxixeihouisiifsowoneexrewvsfgfswfssfotinsxneienfeeinerweoetesiosofeeonoswuitfvneeisetitofiohgninvwinuhrieownveiufetxvensifvftenrieoxorfnsfoexnoesenxnotfeovxorioeouvviexnsvvvsnfiooeuoeiineosuiohxiixgteivifwihofriooeonneoeuioxftonvsrwnixftsvviinfroeirfiexeiowfineseneiowwtexoeoxsnieufneuiteifxifxieorwesznnwnfeoueiiuvexotexrnosvxinrruveeivfnieniexsnnfiexeeeresorvveoonwwissiuruxeishxveiwtonxfeivnnviffeixifowtositwwxrfieiisitewsoesoeinioihxewfiovffxsevvowifftoeieeneinttneixiioteiixeeiofiottoofeoxferneettnftesrnuievfouoruntiiernoheosroxtonfwhrhitinoowonfiresounoirwiwixttfssxwieoerertfiswsfnenvnewofeeotnuuirntvutesxtixfuonexivfrxfrutfthoiiiovunfeonsiinxieiooioeuwuoeznixvnffgeresueiereiweofusttttnxnrvnenfxzieosftoiuwesoxonnnoixsixivxvixferststiefiztitoiefsxnnetuxnnunfoeooioiooiewrtwtionntisoretrovniseonvivrofnutioewriieiefnwrsretuevogfeuiffworiioointtnsinewehfsuoesneonituinvetofineifienteivtiwereosffontstxesfitxwieirotsxrriihuiexuvuffnrovhnthsfotwxhiniiornueoritntfvexsonfusfetnuofeirfewnovwfifwsorioossezftwvfuteuieivxnenffeitreeetnvfetfrrnvoeervnvsefeofroooenovorvfoiinuinrxoeeeoisixevwxtzisewiesoeiiiuisoenexitsriosizwsiwseroiiixunfreontxeixineeffnrtiiioeonsoswuiioerruwxinevewxiiienfnifnvrxnvnnnsnvexeuoneoniunvtenxtorfeewsvnevxvoesiosuvtonvisweuotioeooeonnfvoforontnooxnxrfiuihisufnitsnffxteeeoenwwinwxettiioirevuveitfvovovnueeifxffwfieoeiisovenoieioonfinesoooeiiournfvooveethnnenvsienovvunseeitiffxsirfeonttwofeeinfnevriuvtneenneeriirhxwfnoeewvosrvssnvntiossxtvevwniwfoxsoiuefiuwieeiiirioteewegovineorvtnoinnuffrvtnntensxofvvruivrifftfieintruooioevsivrwiesoxisnrsrgosfxoenosxirnoierowiivfexxeeiseiierfiefnoefiineiveitfxwxiewvtwwueneinssvinstnvfniwxnivooeeeinvvniegvsvsioxineeeofeeneennvhitxeetioseezgnsuutoiveeitenstsnirreseroevenwissfinnnzirierrevuwerfefiiovfnniiioirirninfrnfnefnnvftvuerveooftoxniiifoieiviufrfnoxwxnornfhxeeiexenineifnnvtftsweeiuioosoioofeveexixonuifuinrowioeixeitrxxnswioeonissefnxeueinexnvesioitonevieirzvorexoeooxeisiioiieofvnxwiinexfieiifsneoifituefrixwnxoefvuiifeeffsiirfuntiiegieoisiufiwiexnnoifxfroeffoforvooivvtoeieesxttnuiwffeeexueiesotifiefvofniiueoixrnitsnefosvroxieenerowsevnwvswiexnisxnseouxtrsntrrooeeofriofofwivnseivrhvteiiooexetusrvnvtffentieenfnvxtnfofifwueffnfteeheoeiweiefuniehnneituevieiiiereowifvonuohvvrtsofeeovifoiixsefuwsesierfiensohewsfefsvinvifxfeietiwofinnoxssfofeihnifivtfniewiensenrvoreefovxeeioofewifniieovwrernontrrfrtsiotoixnvifivnrousouwsiiueitsfeihnfwrxrntsttviwxunwoexuufuoerofeerfnheenvneiitfverefiirseeostehteswufesfuetexivfeevfofieesfeineevfvnosehfoiovwnsirnerevieouxfuuniefnfhuowontninnowoernffxistrisrioeueiofevursxeewotosxfertxseoinsnnefithnenxrotevtieonnxeoissitieuoeniteefnnxenxnesnsfevefffxniteertitnoreenfzexfsxxfsivenxoeevswntxeiwvfoiheetneuohnsnoerefwexewoieneeooviiinhrfwxvoeixiinnitfowifrieetvivxtxsvfftovneooexoheeosnwroorowiisuuensrsiesnrviwiirevifeffeirnrfnniwtxioonoetfsvwuswewseiushneseionnisrvxrixtnrfuettfeitutheetfexnereiforestournefweseiuwtinfwsrotiofiennunseuuiteuuhfxosnwrwvewwserfnriifieoswihstsefvvnexnwieueesewsuooniixuootirsvusxwfeunoinxexesnnnfvvizrrwiffteoenfevetxnsegffienexsotenextiefuxienxtfsoioeuoxeehifixteftnioeintnrieeortivwfitxtieenefetxntioixegsinrosxxrnnoofeovooihterfonvusiissnuseentoeozosffueixwnhrfewiioinnorovennvhxvxsrvswntosinrfiierieneriitonxivtsevesnoroviwxitnfeniivefesietovsxuiwnnuwsfosiiufuifiiefoeetveofxnvioefrsvnnfeeeososnvxnentxrvxoithunrnrsfwtoeveeeoeexoiueiftiveifofsrriesneovntsviueztettxinoiohiinfuiewefeeeufvvweiinfeseveeiifuhhoeivisevuueoeifinhrfxerxitxfnnssuvrvfentesteuswesnsffeoinevniirtseonisvivowtfivxifiotifiiexuwirsfnvtnrfeeiiwotnuixosovoniovnvzvttseuesvvnseirsewffrofxfeetsotvwoefneinsosoifiixeniowtrnnxeewfefvefoohxewfeuxxnsveewievozseoofhtonfnniiutvzxsxnroeofexovewxxfsetenxresoivsfiexfigfevoexifeneotsrfsefovsneusiewronwivuwveeionsrroffroerfzweetthniefuoetivhinnexieinewnfoovnirhweoetntitfxooneouvrifneteeniestfntfooxveotinresusoffiiivsisffvefnefnnffwiiriiixrensifxvuiiievewinwxvexosrrnoeoitterniseeuteftnniezeneewviosefnevionsnnfosirenxeneeniverioefxoerwosvowvonseteoenxinftsensetvisnongoennfutixeorrtevnxitxnowutnswiftviinwoewtzwnoeetfniiwvioonveevwrewxsenoiiennrfeiteisfezefoivififitxeorunrttiinxsniotinotretsegeoniiieeotouroiotovwfiirxiiwieoexrxnivetfinienieotirnwfxeevftnoohstsveoiniionsosireiethrexoeuhhvofeeexeoizvtvsfvvvnsvtovevooiierhoniwoiiougexwrneowshriixinoofvnunientoiixsfiioestoiintoixioruesrwuonenineieefnnuiveoixixesetofexhoeiuenteezoeerinsiiniosusfvftvxoevewitfinfvwtnreixoftnnnososiovionfhveoxeueoonxoxiioitnfoorntnennnefffsesnnovuffrxvunreexewretuenxwonisofnfxxwvtrnerwriitvnefexfteennixvientxunfonoottoetsenwofefvitwnefiweotvsoohxwseiiftwotftinxsnniefenfixeieoveeooonoofeioenevesoifiieoirrorxoxteneionvtntiersoixftnxvsihoxuosowrevoteeniigwsinrisvostniniiureoniuxoezfexvnosniuxttwitroeeuseexosoiofvunottxfforsnotreesewoersnireoivsrusvsixnrvoferrxiuretevenevixooetheiotwiustxwneeitxoivereeeoofevhnoinetneeenxfnwfiofxniwnieoeseixotrveiexorfsxwwivxnooovfrstoiehsonfvsrioififttfeehxuoeveieogntoieerseeffieiixxxoieotreioirxfseisxxvregneossostiooxuousteetoxfwoxiofngtniivnrnentnxfsonnseuivisevsevooiieerxivovxeixoeotuonifwtisewtsooeetuxoennsewxsifxttviietxovxoxxnwsoeteiieefevtnoiteihswsihoxoiofwveooiwoosowrninfntenrnisvieiiseniwxvuxixewroeeoniufeuvnuetwosfeseeeristovssiroeftrxirwwrfwneoffeieeeoeneornseniveoineernfswfttntiinntowtnowxtttetenonoeexsneineeneivnvtxisiwefefnehonoosrunsxssvsonnxtneteeseuxeoixrnsrwfnowsfioiiissioweesfonsroinxoseriuoninfnwuwuxtoixsfnnfevrreoitfoefnnrswiixfeofswwivzrniixfoutveoesennewvenefnvfexitfosvtefsvwvnstvverifnorioehvtevooroiiexeruwfsrxewunxiwxwnithfnvtotefoieiewiwisvfwtoxoiniivsenxnssoteeenfnxrteievseevoeueonnuteesfwvrnfeiuuwoirrvnnvovoenownfotoeooeewrwueseeroosveoeefsfnnixvieivrrnnfnnfeutenewxofnensoonvofxxfeinireinverooevsoeiirrosoevuenotrvitoserstivsfvoixvvfitenieftfteinoienesuvhnxvtotwoeorffeneoinoxtiwioitoxneneeontwxvsvnetrveoesieethixfeiossohiixoonsoirxtiesrwzwnesneotritwonsuneofiiofxiiueeoiinirvfuutrhtreiieeeevfeeswrvovovuiwioeefnwffooefoeiesiiiiinneveoxxoxxonttfxfeionnesgiinnwfniiefwntswteonwiiwterioosnenrinernvfheveirfsvnerwfesnwfvseifxevnrieveesetvhsisrnxfeistewxstfooniwruxsoifnhoirinsrneersirgfneoirithvieeftuunevvroerueustnfuewethonxtivuvitvfwneisttioxioinetivstfforwfinerxioieexrixtrneneeeeieviiineisevexewrhwiittixrnwvoiesseoesweortfvfxitofuwvivninwsnweeevfronotneeozwrwrxoneereneveiiofieffvfriivvweifnuiwefoxgefrfneiiiownsnnerisoxssvreoeotfnfxxirfwreeivioswovnnxxvneeoieoostievixnseooioessvooiuruxfoueroooessioeiiffwrwnfenwhfeihitfennoiiwoigsorrrwwotftxevxwvenxfvroovotssixtwoieuotioisnonrxnsnnvesntofvioesioovretonwitvsvxthovfwevfuwofrxnfexxnitronxwnsnueooxeeoxoeetveotwiooinioxviixefiovreinioivxxsnoeihuefotsrfrtieeetesxisoeneuwennfneieisnweneonhiefniihorfswefrnoseowrveeoieftowsoffvxnxtveervewoesvessesiswiwrntnwifwuuierfoiivetxeetetretnfnnnwrofensxwnwxseseesixeifereeihonffwsowntvihntioeorvovinoieeetsisfftgoofexfnwsivxievofeisiesretvezuiwifxihevtievtonniweixniriseessoooonxvirfitxuoeoeowvoontiuowterxeruofxetisuffroitfieeefxefoovtfxwxioxniifvxounvxeioiifoengixutsstnoixeifeivifxnrvsnftsfioritefosiozowenetexsnowwieonrfvnoxfueownrstnifsievvortoofinereeonneieseiinreetesrfrxxniexvvnnsfxxtwoiefwxniowiursrrttreunsforisernsvffinvexrrftseionixiesnixfoersentiteioiiierneienfssrinirxvwtovtifurneseneonnrsonsvrwrnoievieiowwvootnnfootiouotvtnnfeeefexrnhrninsoriounneoveiteessnutnxhtsovtfusxonovnrsuxrsxviinioonvoinniuussfrtennnonvevtooffrsonxvvrtrwovetesoteonougnuefnnioosfoexrxtorfnxeewteeiiiofvotenxseeezwrwitxhhxefrtfiinofvhiioeftsittwifhxvoeoitntfswwnuoititreeoeveseeriowviifnzexeefwvefssnsxesinonixxxsieerefxenfeeuiuefifwvxoniowenetorsnoxuosoinwiieweineeifesxewieixrhfteoiiszooiexfevioefwxvxetehnuuifextvfoiitntioviorutsowenoitrxnntxwsrvnouseiwifeiteeeennneeoffeoevvtuihtiwnuifniefioorxrfnfexsevntxnnsewosetutnxseseextonvvsiuxieivnoniiihoxxtextssirwowvoxfsvsirhoitrwvxifeoenoesoixenfruivtniweoxivsnfieniorwnesfviiservoeooeeonenehsnirieixofsieeiirfnoeioxfssftfwtiousiofwooeinsfnrvfvteeseievfffvowsesveviixxiretiieoewhvrovowienenvifreowsfvouteeiohsnxnirffnfsxeoeeiestfviiosoiohntwneifhfrfeniefnieeeixioiifrsoswxesofnwsietentoioifneniseuioeswroeiowwexvtwtnstrfgoeigiiwwiierwiexneefiswsxeewiuhvsefvsveoneietsxeiirxsiieuiefeissrieuoonreewtiooiwinrfuvuvsoersssovnvxonwiifvrroeoxuseoovfietxoteenvivtosofiorxxsernsexwnfeefihnseseoifrewfofossirieeivostwiugnoeeoifresntvixooieunfwuxrnxwivntsnfsnefeeorxnusrwexiefovvweneietfxvfeneesoxxeiioeiuutxeetexiuooiifeuieswnfiensewftfotsnuenrfoerszxrufvexxnoexniownotrnoftifnvrivinnnsxiioxosorwihsfninieetrfgefntfeeswfnrxssevseveennfnifgfetefhuitsenfnxsiefsooneivseoeoohesixesnotwwwivixxintfnixonftswwrerweetoxxnixosowuronenivhrsfutenfnuweeenioehneifntseeexreifeeftetwneexixeiesfennonnneoetoionfvnrenxeutiexunvoxwvriifvsoxsuxxnfvuxoiniroinesuioirusfurvstesrioewseixneowoineeveinevivtoeinsevtiwwswioriosfviveifrxoriisvioofosnornivfvonftnixfefvfwofnofevnfevvhnsieowiseonxrrsnxrifesioixxsuveotieixenffreoivxgofofnooroiisoteuuevefvisisfonoovtsefxneezsivvfrheeiteisuieivfnixfneounvfixfnervenfntesnsteototieeoiotvnvervxerrwewowsisxisrsuieuexxoeexoistiwirvwtfefnresfiifteoefviseussivexixteoewivouefoeuxfoexeotfiiiuevvewziexneefnonifveoihworexeunietnvvxnosoeoonrieovevoinoisvwionfrnvtfifeeooeiietintsosswenoeeetnvxuxfzrufeeinwwevwoiuusuueiviswfeznrsereuowsuwsirnznsvxfoeueruioeofeeeowsvetounixsvvvewiouxueeewevennxftwvfivniwufsxuoenewifeoeeewxtfxeoswvtisveovsivurwexfxeeotfxnwxtsvvsftesroeeiowfitoinunfnvwnwnswsiefivxttrveseivoxiinuntefenuewitfftxnrwsixsoheinxeenvetoownxeefneenwsoeoxoofoweohfrtexnsnviigiienefvxnveioiitttooviiooohsiiiwtsieinowretixniieorfofoeenrufhzxisisvonsnxeexxrwnxreresensitfeiohxihwesnuouwevtntioteofexxixorviioooxxtxoiwosuinvesisnethfneniwtxfiiuxihroiwvteentuoxoeseeesfweevixivvoeivetnswxishooioinexevxrreirerfntvfioresowursznoeneoeesihsvensenonswuvsfnsionovvrwfsffneeeixnofiuxtrxvnninhnstiownnefnnheiweieioixiiseeefsvvxeoonuofrniswxzuneeffteewhwofuesrrttseeoeonnoeesxirnfefigeveefiififvnuoinssfervxrrenesewniienoexfsiiiivvnineisinuwwsinsiveeewhisuxnineuufxrorntxtnxwewneexeewioeetoosieirxoinexieiefevofnstoonfstftfiseinexsneiesinetveftefeefneoeoxsfvxuironuvtevnesfvtwvrfvnfsooeeosfeeiotteoserfvwfivseinuoietofvhnxhsifonioowoowvosiffoseooefeeotewuortioionrrrussvvosxieiteniifroenuvotuonnseertnsfoxnweffsongswoxreievtxfrnhrtsssnoievfzwnnwiixrerfixrtioesneweeioooeevvenveuooigtwroxioontriwsewuewroeniorstneftrvoeeeseiirnxuvivxnfewxnnnsfnfuneeoevveiffnswviiwwieinnteoxvierefeioxnwonnxotrxenetxertsnfonntwtfwxxessreiesxoeixihxihnsnnxieuioifvnvirnsrusnnnivennihixtiinfeiiinonvgsiseiuieoesvreffwunutionsernstrfrvweivovtzritieoserevoonowfiieieviriivviinneouxfvnuvvrzoiieovnfwizeefwxnfwoewsnoweesftefhtheioiinnreeesxosxreexeevexieefeseifoifgooeensnfiifwwvteeeoonnexwrvioxossfwhzinixsoieevnnuvertrriiwvriwnuntftvnssesuntneifeeefewseexoierwsesnixxofitrhewxiiieizeiieiiissosnnxoeoewneviffwnoeoesontvnfgifiiiiwewiieiifevrvtrzifnovfennifiiinwfsefnssonvweooiweeoufwxeifisiieewevifovtwofvseirnonovrfninennvuuiofifsusnnnoivonrwesueeoirueiofuwrvvnovtiuxtnevtnoivfwivnsistsouffiouvtvnenuowvvsthrfniiwisxriinnefuresosisenfnsoreefuinixotioienoiwntovrewfiisonenetosovrfvotwenvsefowrvounvxihwnefunienrowenueeesieoeffsntvexnsnssoeniieevennxtunovevnevexenieifiinotsifofvissufewxotreeisnivxnfsveveefnosnhwefxxwniieiuevxutneiwtowniieoeieifwevtetssenovfnvtoiriseonooxtininwffewoifehwvitnwefwieonvefetveeetftesszefxioerftusrwxeefsverooisiwswsrinnsrunrrsetsvewrevoiesgoxreioieowveovoteiriefwnesoiiuinoneooeswsosiieuwtooeisueofefeeneuxovntxrnrxwworweoesffoeneoiossroefinoreritseeeixwisfisetrnwtfvrifesieereoinwxrifsostfveerxivrosofeiftfieisonvnnvwuieeiieixxsoieentsfnootuwvronsuooenrornxenunfntetnssftieeniineuvixifeeooihfvsfeeoinwereetinsoufsenefiisfrsfeneewtxeotnntooofexhixswenfevftvonixiifufintniviievfeoowveotvtexronrtesegtwuvsneennifxineohxwrionvtionoeinewnxrviseetegsoetexnunweienevveiexnoofietoofxvoirirothrfiennorienoneffoefsfveewwsfiweoetfeorooriieviwnotfutnnrsertrviwooefeoworefeureoenvwxrnneuntvevinoeereeoenrvnheexsnttrsnniveerenvueuovosxxuooefnesfrextenieonrsxeetowehnonsiieeietrenhfxeeresveiringefttowuxifovseooewiiuostixvsewrnevvogoiufirssfwnfisonroeewsvvoonexwvfowintetvnsrietxrexrvfwnxwfnwneieennrreffenureefitoeffrotxoxoenoteeenviootffoxrevifeoeiivtrrtvwiofsovssnonuosiiirstxtewfieotovsioetntinoovnitvfsoeeswvotnisinitoeietefvtxfofixsgefevwotixvoeswfvnferevfooioffseeoiifnefvwguioevofxxuovfvsuenotviuvxseeshfoxroixifvoweoesoxesiwtefvneueoeeiievwnvoitnrvtifeeifoeninvertxteriieeoxinuouhuiesvinihisfrnfoxxfwintrevnenfeeeosonffnxxentioitrretihiewszowoffeensrooeooisrexnsxeesfxufereirrntiiunfhzrhvxszeenoeniferfssnisnonxreoifsooxeinizfsefeefeioxvnoitiiefsninfifoeoenwueoeuingeeeusvnwruooxwsfoenwitiriitivsefheifoewxetrofswnoexntvvfhsiwtsonoooniwexeenfiiuitveeexwifntnniwvrufeofoioneevgsifoowoifevihoteuuongtfiuewesonvxiweusvuoooeiineehsfxssneisnoootstshfuirtsfierveiivewfniooioeenornufewevofinonifxvfwuveuutwnwtgnoetssoitiwninnwfnseonxehrxefesoiefveswnixtexefxexxxtenieefonhrrsisitfewnfwvwreswetexsusxhswvtnotwwiwvfeoiutiinrnoxxneoiueenwsiireehtvxwsreeeefvteoeievnnxfevforofooiwefvovwofvosxrntevnoeeitieoetniiittoiheieethfffxvrfeonnsrfeossetoxnvfehvnteiiioufixhftssniohnowfnfovnhtftiitureieonfeiesnwvnotuehutefsenntvwvuoffoeeewuitnorienrereeeefsvsextsonifgxszefiiertefhnroteiisxtoweifeexeoerevesriuxexosowiefffenoiienenoosieeotugunevuenfffsiivftnennsiivxnrxwfsoiestoeuvoieonnxivoeeneeivrveoefxtnoefxtsnrxsnhoiennoveitnoefxffieievieuseeorenhixoievinenertetfrnifrserosueeenwtwhiunhowtfinenssisnwrtefrnnxgxnetieiovwosoiiiirinevwovffwnrniiifivwtvtnesievnortennnffnvwsosorxentiofteehirirsotreoosevoxsvtewinovnenoinnvxwfxfxnoeeiinvefvnoxnznxfonniwoeeuetnerernfootrfeooiievireoseixotriehefonfvrhootioforvfweetfexfrninftntorotfeitixfeeneheiwinnrinretoetiofwinevxehrrxoswvtewroniiuxienevoifunouxefonfotsfioiteuietesfeinfvrsiivetrnxevoveirtfoevunseuufirvsnurteuoweuigreetovtvieonnenifsiooonnefntnnoovssnveennssvvfuntiiefixiixnveiseiseewinnowffneiwvviesittontesevxvtnvoieoentienenserwnniefxitnwevneiwonxeieeroeftoeiovtteriniennsiesnfrnnnxniofnheeeevnsnonnfwxetvnntnehiestfrioiwxnuwexseinfvoeftnvhiersexfisneieziexnexufwxtehenwieiuenowneinfirsxuovoieifrusieswieefofiwfoousiuevtsivvieeseoxtvtstuorfrfexeneneeieooneivieeewefntiviuhtvfeftooxewuwintfxeorosiiwonrefsxnonoiwenrstrnernfenienowteverfseeofwiwrteetweofoxseervwteethsivvnoviweowoieerhionvfoosoeowfiwhrsufooirweeewniuunrwsenrxoeoxfeoevnitiztreufxtuoettvoiefioeheineoeetitnnefntxwvixfiiiunexvniewxoniviftfifxivtenhvsftufninnosuoeeoeoionvennneinerieresostostwoovzwohoftreioeoixoxeininessneeetnntetieoieueiwrruieooowfsixeienefexehfuxxnhisosoeevevioinfoexniooefeinivfnviioneinofoeinsffifvesoooeonovtrterhewiisfvnoteutesetuooueiiufhnoitvotisovsieieovtoiwsieueieeosefouitevoertnotfoxonoetrnxoivhixisweoteonreiooffhivfesfwshueriwonowenseveoxftsivefihoeoofnoewtiorofuveofrnsinewvwtesvnrtsitiuouoeexweoenveiwothoowoeowexiioovvenierfxineiwxwxerenoetenieenenninsfineetnfnnsffvetsiitoffsssneseeeevftxoiiorwforznfestunurinvofevoeefenertovefiiofftreiooevxisuseosroeexsefisrsovftihfnsxttuforenoueosnonterounonfssntouieenesurewfieiovtsnoxteweenienuirfvitnonenwoeortnwiseutxestwiwuseetuefeuetwoevorinefnixsiseenstttovewireeooererotfiveoieinfnvvnevwsnsioxtvsnsterxereftnteeoeesfrxwneerfwtenrxifroeenexfonnsxovouiuroefvtofnneioeeessetntewvtxeifhvonewvnrinheneeeoifxwiffheszsnxonwifsfnfeoxxfeoiiefsfoxsxneeuieteveeeseieswoefzeeeofxownfeneeerxnufxextxwwierfiiifwineterwffifriurvoeofvwtrnronfrsrfieotfsseovsusfioexnsrenfnfsiiiwoeeiefifoxnenixnniefiesuxuvifeuwxuosfieosxfhnwfnfvvfexeinnntixwfohsoeenrheueieeeveotnvzoiwuoroxnoefsfovesiifewxxnsztevienvorovfseineofoofsvfooeriniooivessrxwfonwnveeuvsssiewxorsioveintnetetoiifsteeienooonisvnfrnttwieheinfifssorxnovoetonrroeswiutiosiuerwteitfweeroovfserneenofiionfiioteoievzeviieffoesowiwnoxoetssotteeeuvfneixnuzvetntivfrgeuerfxnxnifeftrntirvenefvsuivivnwiwfrvnoixxtrveefisizorrioeeitohesvuefnsotvtfrooowxfvonrovetosxiroeevoifoxfseevnfnoienetoenrsiineoessireoeroiifousfxerftswiievuiwrneisfinwonigfofwoxoiexionieroooetoiveefrwtovsfisexeonrnneiofuvewnusounnoffofvrieizoosnteswnfnofesifteuivnueisivrfxoofrutnitxwwnftxiuwxsouwfooxowiefruosooxiixvtrvotegntiosrveffhroieitxnetnfsiuifesfionevfsfoirefiviffittrwwevturooixfvinevhrtswneetritvteosttesineueoovoiexotufivutuoooofiuvwhfsviuteehoffofewoviwefooeivexuofvhiieienwfuwsehsriuntienrweoivoxvwouevsoifeeoixsnioeoenunofiexrixuexteereoovvurvvoreorftfneoftisesefowswrtfoorrxhifuivoveetfirseixfvituriwvwrreiioifevtixeionwffeeouisotfvfniwnfowrifftvneitooeevsvwwsoifueioxosutronenesnssiritoifffexfrnitetvrxveeufvtserzviseoneroossxrnuitteonnouinxrtiseettefrxvfxfinfoiieeivwrweenwerswxioefeetioivfwewtswvewvinfteeueofioohueseoootoorhufxownexirnoiiifisffiteofhxsreffeotiftiwieoxxevihusffsosrniviuwuxoexerosoievisiioeoetowtxostfrsfeefussoffwithihxtwrfifioououwensrisewesofroefuseresooxsooxvxtsixtosxgxeofieuoovfiwieoxuoenissieoouuifhuvuvwierrrsfosioieiseoioivioeefefonsfvxiifvweoorotuevofvotroresewffuieunseftvoexereofetneuifsxoviettxoxesxrvriesvvvfnwroioifvrhreffxueunentvueeeoivfoweeeeoosufrefrxextifexxfhsutefifwsievihirvsioiiiotffersetieweeioreiirfviefiriseeifvwottfvsweuneffhvfoewtioteoiooerxswioesivfetxeixvsoetexwxsuoorenrvoiortrefifixsfvoervvtrevnonsoovntoiievfrxsoivesvivisrewshuoetennsxexeoiorvgwoouuefvifstfriirveseriooeevvioxrzvtttieifhrohvtirrsiwvrfrosfwxxxfwsextesiriveiseiirsunwoinefwiwsexirusoowwufoesruxiesuvtssvwoufeneifenfwegoiovtvtooixifreeoonshnxwrhorotofewrnfwvenoxwweheshehetxvvneoittisvsewvsiwnwwuofovvwexiofonnfetrivwrftsowrhotroiuerxeiizsoeswxofehuviotenevthoessuofntoterneiowrtooreeivwezooivtvfuwifinisfttrvxvexunerewioretfrtissoevienuievofssueowniewwvovrfeeoxetvissxouxunwueivhewoorrtixseinofiexneentieeooeifetiiexreftfifeieoooeonfoetiihreninfifhtfesfoosisoirtruwfneesuwixxerxiriofiizgxiteixwrofneunvfvffxtrsreexfxirnhrwhsofnwveiiffrxfferifwiwnnxnsutvxffuevoeeerivtfthiiouieweiheeiioneusfenittvofxezrnehxotenehoewwiifiitenwisenvifxveeinitervifrseooiiveesutifrvewxntvneiifnfeoiootesnwutexihefgwniteohhoorfefixsefoexoioewvnveisviihsweofstrsioennfiwisiffixoeeuoisnfoeenusorfofenxowrrwiniifvuefortnrenfwwereetfrfterueeoetxnesieiwioxefteventrorrvieuovoxtffiretioxursnzovovoxtoefenevrrusesehtifnntvovsftuoviuoihvniiivxtoooneoeuufeixfeefxosowfnuetsinitfvsoonxsfxnxetheiuvifeoxosvniiesvifexsxvotouienvhneseofeoitovnuvfsisforwuifteserifrtxohnnoourhffexfoeotvtfsohofooeoxwrwstteinxursftsioesinnrsfrnitfiwieiosefsiooorxnevioieiisoeeuoeoinfuvtfefxwonttnvixorxtoveifenwsnnooovsiefwfieoeeeeneweexohiuefsvtxenrereestiofsofsofnettorzroxsiffewofseoeoxoiitostonvfvsxtverisovtvewwrsetehetwfeiuffniirirteeifrxerrvsgnteosettieiuoeveuwosvftsnwririueeoeeznnoovinwitetnvtvfuwsifieveionfoixrnhefrfefvevotohveievntxxeeuohfsvstterefuefxtoeoruoxxeeioosoevfifnfinosvivoteriivfosuehxtrnoteeiifosovfoentnnstrtsiievoiixooiinfosuvsfoonvxtvuoozouefeieetxhrnxixoxiereoenitefiehetenowviooihfxeeewivioofinftxtowoorneffeeonofoxeeihvniewxuiivrsinvrihftiiiihvotnwfeoonfweeinoriotofiwuxsuiinsieewhwnefeehwisrieenvieeriteiiiroesfeferofvwovfixowfwefevovrfvxeeeootnfrioreititrfvohoitoreiovotvfnnvnseusfxeoeinrotueooeuvxfoeofosxstetxsftonrvtesftfsovexotxronvieifeeueewiervuoeonuesxefienowoonfvntoufvewvietiiioorsnrhnfevefoowoixeefesexsttenwieuttnxoouootfiweofeoooxneutfiveonshxovwioetoisnxftohrusoeouhtfnevhxsfifuesfnihoofwexsovnerweoiezwxeueixiwvfwoeorffeefxrvexenrirviuueiruxovoeneioxuuiiuotttfvtxvsnevsisxftwestffnnsxonofnoifitoeiwintieisevsesgieorxonooxvhofusfuoteofonhvevovsenienoeerfoisffiiuinoeehnenoxtwnxwevwtufteusftvnsntxooesiweostvoerxitoxsnesefunioivnsesvzfofrgsirerefowfnsvvsferiveiofrofwssvneowoehoofiriouefovesvfeuonrwnineseuhfirvtetnivnefxeevwiofrhtenzeivoneinntwxevituostfeiowsweniivitnntooenerssoeriuoeitftfwevxruusuvowurexosvutowrffxoeneswoeifeoiioevehotuwuewnnwwintiuntfontovifffwfofivvenevhrrenfixeieweusevrfzohuovrtisooeexioonorioorvtfnnfteseirtuefestsweouxtxvvnrefwoitiefooveihsnweswnxniewffeexnrnvhsxeenhtizeiitzvivifeefoxwosifwfxeiixwosunttesvvrxrwesxioeeeexferohetoixtvtosereitfnerrwshuonhwoieeiofeeiioieefrfeixhexevnfosestfnnxvnsresowvwnunennietiiwototeunrissouoveitotnewroofeotfoonewfewxifvuefnrnnvseosffexfisetttuvrweovuzittiivtowvoiiofvoeevefxoisnwxneoooiiweeetwfvituofxvttfteweeifnreiisooreitotniwenonetffenvhzteviioinnoioixewnieefuwtfvnireefrfxennooesvuuwnesisvxfxfeoneonfoewoosneoooiiefuxnezxfvvffsteierovoneiunewrfeeiouuwtwooifiernetsooefxifoxeinzrieuieeunrienvnnroeioxvxweonxsennsxeuhzerwseewnoefsinnuxvovswevieuffsexieeewoifoennssioooufniixesensxnftegetnuiieeivfteoervxiinxeinfetsnnetixnewifnvieinnotroerwfessuooiewfrtooxofetivrnsohosoeseweseffnrxsneeintrfneoieioeixwneervvxxitewufiieeniieftsffisefooitxeteeenurvieefhieorneivvheunewevfxuoonfseffofrfnnfxwxsueffnirsiftirnfiwonoonoieonzeivheivfsxuoeerrtoiooeeszvweitnevstrxfeurtsrooevfiseonhnetnnxoinfeeixtvtrfrziieeenineevenftwirnixwuenwenteiiieufoffounfesfehuxiveinoifiofwfeiiexnfixivnetoixrieiueeeofoowteenrtoxunoenffisnefivvnosfvwewwexvoveovitrvnxoofnireovvfeeihierexntihinresexwnontteexrveeefeoneissswwfnsooisxevwfiivosonuusuowenusoennowiersorirrefufixueewofoeerioevnoinvietfnifxvsssnntoxeeeteniiiiehoefixnereiioefeoufifieesioseveviinwriiosoiuivesrnrwwsxoeiiiotnxnevsxrusoeeefiorihsoewxoifeuietexsweixfifowsefeifofowtfnevnfhvfotwsnevwifon"