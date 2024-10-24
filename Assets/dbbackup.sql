CREATE DATABASE  IF NOT EXISTS `pos_system` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pos_system`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pos_system
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronic'),(2,'Fashion'),(3,'Food');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `photo` longblob,
  `price` decimal(10,2) DEFAULT NULL,
  `category_id` int NOT NULL,
  `poprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_category1_idx` (`category_id`),
  CONSTRAINT `fk_item_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Rice','I00002',NULL,1200.00,3,1000.00),(2,'Kottu','I00003',_binary 'RIFFr{\0\0WEBPVP8 f{\0\0Põ*€€>I\"ŽE¢¡¥%£3©°		gK?¹\ÞÓ‡\Ïóø­grª	%K³cž<´;ðÿs»—•;\\ƒðx}ªA\Ý2Xô\í\\]$\í\ä\Üq\äcü\Z³^¦\Õ÷\×~ö\Ç™]¿\çðú>¥?¨ÿ½òl\ìU\çö\Ã\Õo\Í\Ã\Ô{û\×ö¾¼\ëþª}7Ÿ»^–úªÿ-ÿ\Û\Þû®\Ðúú/\'ðžöÿÀŸ\Ü<Dk§ï‹¸ú½C½ûû—ü\ïX‰Ÿ}k¨\æÇ°Ÿú¼>ÿ-ÿw\Øú?ùý?\ä½\æ¿\àÿóÿóS\Ý\Ï\ï_ò?mþ¿b?ñ‘ö\êÿÿÿO\áo\îÿÿÿûÿŸµ_ÿÆ ªƒ‚2<ì¥•\É\êóûe sþñ¤>e\ßv³‘\Í\Ç\Ó\×-V¨âŽž³\ç•5±û:1õ°i›’|«\í\Ëfœf\ÝÔ‰¶,\á:\Û\Þ\ÎõÉ¶¯›gC<Gfl\Zb™{€ü°_!ržcô­œ¾Ä›\Â\ïÊ¨?\àW(­(¹?\Í[\Æ\Z\ïD¼\ée}·\ï6ZÂŽˆeJ$bE3w*.ðóû¼ŒXG®¶-©c<»\"[,\Õk\É.\Ù7.öô~Yh\Çú¼ŽliC\\ÌŒ2b\n/Õ—;\Â\\vŠ\ãô\é\ç=jA^z\"ž½’\"™÷\Ö3µW-®X˜3\ÃÀd\0\É1L(Z÷&‚#qÎµ\æ\äd\Ìk@¬)l¬ª2CFoay¢ù,W•+Y^*x€\Êe–¾\í\ÛŠ\ï90“œ]\å]“T%Ò©¾“Â™«\Ão‡\Ò=GN/-¹oÃ¤î¨\Ûê›˜\é×­+w–8d»)¤–\Ï:¸·I=S¬Mª\Â5œ\Ùl;¯G\Ï+\æ‡Nü[H\ß\àZ3$ceƒ””;\"XxK··¢J}\Ä\à\Â*°d\×R¥s\0\ÛR±\Ñý¿\âJ£V‹\í](,\ê<0ò“g\é¡ñ\Z©\Z\êºKpŒ\nA{»ENªd¯\Ó#.¡.\Z›\ÛÛ¹,!	¶±®ó’ø	²\Å,:µ\ßHó&’\ì•4:dw\Ð\0Šsž›€ð\âVõ(\å\ÍQ3¯û \Æ}`rsº\ÍÇŠ:\Ú\êAÔ´SIr\ÈAØ—dð”&›A¹¤œ\0°\n\àoO\Ò\åD€þü˜\ê8\Ó ŸŒ6\àcùT\\m$SšQA°!&:k_½w\ÉùB\Þ(xšB`+•Ñ®\'5dü¨;’Dûlr\Â*c>3p\ì7Jñ‰&üF\é+\äOªº.‡¤Dzö\ê/Pÿ2\ØWã› ž\Ø\Û\í]Î¾½×¬{Q…œTú‘\Ð`=&H^U¾\à5uÿØ¬	\Í\É˜À®£¾—¿È¦[ª/3\ÕK›’\ç@ ß³\Ã[7gKÇ”©eÁ6Qos¸x7ÜŽs$/ŠS\×c¯• ª[	®¿\Ö\Û˜úñ°µ\åÉ‰\ÓY\ç¢ô+\í\êCßAW#Æ»\Z¾\ZU1ù€u·l÷]4LøE\ÅÓƒö›ÀaF\Þ\0ÀÑ¯V\0‹	\r–ûµ?\àopF\ç\ì\Öd©Çƒ\à\ï\ËnÒ¨NµT;/‰Jª‹J¼–\ìÎ¶‚eöBShRsø/ñ.ˆ{õ=X÷\Õ®š[849\ëL“\Ë\ßPõ\nuõ:\áß–\Ú.`j¿\\>û4ý²#üÉ™Lw‚x\Ó\ë\Þ3 r`G=q„‘\ï\Ã3f¦Ï„wñ\É\ãµô\ãñŒÀ/T0p\ÅcbŸ¿e\Ù?«}–(·‰\Ú¼P\ÑÙüˆc= Sü8hÛŸ«¶:Pk@>&1i\ê.4\ã\ÇMöT±Dahf‰e}Û¿%cþ\Ç|Uw+’\íœ\\´õ}Ô«\Ç\ïKrð9²>D,r²\ì+³\ßÒªD½Àaº\Ãe\ä\Ø\äi–\ÕVù|<\Ã ü¼Ú¤A7iM\Ýq&¹ˆ½–\ÍK\å¥\Èjç§‰- Ô°øGl&˜\Ìô&EG0\äd\ê,TQóÂ§\'µQpQ\Ï1m˜\à=‡~y\è<\Ég\Ê%\"-pªnšw	c†õ\è\ZR±›·\ãS›ž^]›h†ø¬ý©¢al\ÍÃŽ²²\ê\0Mw=*ý)\ÄN4\à\ãx\Òñ3°J½pvY1j\Ð\á”\Ù¹­\"i*V^\ÚË¬Ô§§u\í#\Ç\Ø\î‡>\ë_\ÂØ²´\Íú¶‘IV÷¾:$<r\"\Ð\Ñ\Ø\ã¯&\é×”•öû/PE\Ä\á©\Ê1ov”8\Â\neeZ|<æŸ©Mºª±Œ¼\Å{†%\å˜\ÒUšBkK\å\Òð„\Ëh5(õž8V®>y\Î«÷¶8Y6\Ê\í§\Ïòw¦…\Æ=Q\à\Ü†“\Ã:ºè·¸\È\"¬`5GÉ¢µA!™¤\'ó}\Ù%\Û\ß}\n\Zœ\Î\Ô\'üûH\n’p\È\ç;6\n¯ƒ¤\ÖP\ì\Î_0A{f\Út˜\Æ\âK¿Áy×»VD±¸\Ø|‚\Ýöže2x.–¸>\nð¢qm³QŠÎ±Q†\Ú:\é\0pµHfK\n\"ŒneÙ²\ì¿ðòÅ±|ä„–©Û¬±\Ì\îÚ\è\"DAQj.z\Z\Æ#\ØþFòŽº†!›\äa	g+”¾ôc~¨\n²Á¤\è\"\í\ç¤9v¹HS_¤ù¼¹y³7\æQþ;*\"Ä´\í|·•pv9>Yj®XÛ•®Á\Ço\ìŸt•ƒUk\Ñ9õG\ïi®‡¥\ìúQ_®n<`Wb±\Ò\\±†z’@L ¸4\ÂZc\ß=F4f¦1^!§F K>CŸúM}²=\r=0û\í™\Ç\Æó÷1V\Ç\Ä{ñ-,ü\îuœ Ê£?-õñ_ÿB ¬\Ë@öX ½\Çú&\"½1þWu\ÖurF\ßñý\Z-£\âú‡œ\î\à	]\çL\r*\Ê!óRC\Z\'¬—5>_\ÉýeK™¶‹N}i@—³<s9ƒL`%t) ¥–[@’L~\êbŒ¬IUbR\Z%\â\nKG\ä­Qq}m¬-rß·„o³|\ä\åy574¨ÿ„\âô·\Ð…3w+\î\æ\á\ÔPôÂ›­ò/úõ¨§˜[D\Ü!\É*g!p\àøw5ÿõ\Ü@Zü\ÞZM‘I\ÑF…(\å\Ý]\é{j\Ö»MòAO\Ó\Ò„wùªÁ5ö^w­õ#-´ü\'‰ƒ6¯`ùHGc\Ðà¦¨\æ\Ï?²À\"‚›\îƒ\èC0iÁ\'¡\ÚSA¼\Øß¼•[z¸šxv°j\îþ=9ð~}\Ù\nði\Ë\ä‹\ÎO@n§˜\Ärz´C\Üþ\â•Ì‰	$Nñk%¡\Öw/šŽòu6Ñª‚ð{§\Üü¶~“\Ò\"N>Ï ö÷û\'ú®øŸLT\Ævj¢3w›-\è?Œq{\Þ;\ë°\ÞhWn—`\É;ÛK}/\î§øO\á\ç{ˆ\å†,º¬½“Ä\èU™\æÄ¨\è¥D@\×9piI<†?\ÛÿŸh5º]®\æ°\Ð\èQ„0T}M•\ÙYº, \ìv_ƒ™ü#[z\í};\ÏJd8tp„ž³9±¸¡\Ú\É\ì\Ýk\Ô\\8\åõC\rý¡\Ò\ÏÍ‚‡6¼vr7ŠZ\ìðªMÿ “p˜“\Èý;¯O\"ƒ¢.G®\Ç\Ûò8	ùB@\01\í\\\Ç\'¥<Ka›\ÊIª¶ƒ\ÛS\î÷÷	\Éw\åfd£%\"òˆ- Á†\ÝåŸ‡E~;|ò›£”\\\×L+´JBl_Xu%ú;+–\ÍJ\êñ^\Ì	@ù~\Ýpoµ\Ãò§ûT\æ¦\\,OlªghÄ®\r´“[QÖ¿\0\ZVr]FU$8‹õ÷š:Bû¿Lh\Î8Î]=¿¹0,\íªiÏ¤KÂ„³ZCò¾\ÝH÷‘Y8¾7Ž^\ÏÖ«„ó®\â80\æ\àƒrÀ-<\Ó\×vl&ÿÏ³P>†\ãÑ•\ço\r\É\\§œ\É\0‚yM  ‹ýâ™‰O/„\Øo*\Ë&º#\à(„ÕªJ_¹\×\í0)­J%8ó•\ê¢_†ú½H™4Y\ß!U“›X\È÷ª2.s+˜Íz¢RüZ\ä©#\0\Ø\ë\Åe^¬m~Äˆ;{–öLXÊ€üW¤pt«”=«à¤¿\ã\É~.]k\êF¢F$»S³ +\Z1\í\Å9£i¾\Ìæœ«~\r¸b‚%ƒJ(cÍ¾’‹–—0|‡‰0\åK\×:>¿ð·ið•±è‚„@†z#ôÈyµ}–sATÀ%˜:Yž‹º\Z¦Ž \Ýhj0ò\ÈyM{±‰\Ìô\ÝE­\Ô\É\Ê\ÓÿBÁœ\äw\à*\Ðóœ‹¢\n\r—8¾Ú€\èŽ\Ë\\ \0jÿ\é\Ð\ä‘ \\p©›\ìj!©d\Êe\âO\Êdto¤\ÚBp¶…4M\Ä\Õs\0\Úmø}‡¤­]Û­\ÂEÙ¬:\Þ\Ü&ÿ\Ê\ÑTq®¸¶•P¤Þ¢ŸSXsSºa*J\Í‡\Ú\Ó\n™DYiv°\Þ/’ÿSJûf%€hWB2³ø\Ì?\íÀ\ïp¹R\Þjz¶œÄ±“\Ø\"Vhk\'§\ÅÀž+\Ö3±Q}œNš„\äF¼\Ãy¤_¦aO“<ú=7d\ZÄ­o*¡o\ÚL\Ôj9Ï jò\Ðh/\çŽØº–Z‹Û‡\ÍF\ëð\×\è„\ä„\Õ B‘c£0 ²5,0\n_c‰ö\ãµ:l<‰b{\â\í0r%:b¹jŒ\Åc\Å7À¤ï¸›\Üß\à»\î\Ê}¥õ\Âõóòu+m5æ¢¯W/o\Õ\àI=®ŽB[ŒŠ»™˜m\Ü\Z²M\'LJ5\"\Ø\ì\è­tŠ¼U\Ö\î!{P“›´ÿ”Á\ÓøùÞ„\â\Ó,k7`\åù\"\Ù\ëø\0\åy\"S`‘o,(Š\ÈUxû¹r’¶½\æ\è\Ó\Õõ“2\ã\î\r×³2KC8\í)8‘FD\0[¨¾\àV’	E‹x\ço%•ÿ/$\é \Ë\0Ž\í‰O\ä\×(¡O\\\Ù\àµŒS-®W#“\Ì\09<(x!¬WO’¤\ê÷\Í%\Ô;…9\n-+O\Ì(„ggö\ZØ©:zÊ°‰•²\ë½2Wú“\Ó\ÝB§ò{NŠ\ìXƒKk9 EwB\ë&øC]]\á´óq	MO­D2\ç¯Y‰\0¨¨ \ç»J}\Z\Äá¶‹¢\Äð,\æ´\×5a:’	øš½P98ƒ-lp|\á*6Ž[ý\ìò6\ìkudnºÀ[	—B\Ö\ç-+PË¡\Ý\"\ÏC<KûE¥†¦$\ÜöZ\Ïy\ÛNo\n\â\ÓLv`_V(7\Z]š½O\n^j”\r¥*Üž–¹ó\Ñ\Ã^Ì“§5Õ£zf\ÒQožªnòœfl1{\Ü(šTDc¬\Ñ	þm\á\à‚m0Ÿ\èŒ\Ð\Ø\Óu\×\Ä\r“%&jº\ä\Ò.›\×d1~™q\Å\Ò\à$©ú\íþ{\å\"œòck\Ð\Æ\×P\Ãr¼?\Ó\ïDLµ¯Š´J;‰¿Œú`\Â`©Æ²\"»,\ßH¶\'¼ÿ™ä¸‹\á)\ÉJZ5U†6\Ø\Ð\Îõ|ƒ¹\ß\r¯Gm•Ž>\ï\ÆF÷–µ\ÒŒL\ÖDÂ‚VŽT\Üý\ËZ\Ä\ÕQ\ä\×\ã\ÔnÜ€\Ú,\Ê\Ü*žqG\Z¹\Ó‘žw¿\ÂÜ€X‡¼\î\n;\Í\Ï\Ö,¶«\æbõ\ÔˆG\î\à\0þ\ì/\Ô&ú‹¨ºˆ\ÏY\"i0!±+\ãœ(…\n(>0´D#\Ù5\Ó(€…W #\Ör89( \Ú\Ä7a¼Ÿþ\å+\ê&mmœ{A€Xý\ÑEo\Ê3\Þ;A\èQ\àyT\Þ7wyYþ+>F\èðð¹9.\Ûg€\Ôˆf\Ën½,&\×\ÅFÝ†„«E;±š^6\ÂY\åög\Øj\×@\r\Ä\Ç\Ç^¡ü¦£zQ¾\ÄG5½x!i›?W|¹,DQq¯$\Øg®`þº©tF\ëY‡¢c,\Ë\\\è¤?\æ}Ñ—3“/[q{…/‡>_\á¯\ã\Äý\â4núÿ\ÓÿD\Ê\Å2è¼³/a©´#<}‰\ÝO²wÏ£duwv¿\æ›IÙ³rŒy£ôov=‘}3ŽQ·§¤MÁˆª&)\\WI¯€/¼iPQb³´\í¥9\èD@ oV,\Ó\Ä`µ¨\ï	_¯\ê\Ø\â\è\Í$²{MZíš‡\Ú‡³¹¥ƒ(’Gun\áxÙ˜­\×–\ÞlB8\éðF\î\è.½O)$jË uñp\Ü\á•l¦u\ÞüDj\ÉZ9\\:BN!À¿&‘\Ç*\ç=œ¸,wW\Æ&\Ø9šn@­\Ñ»\"}ÀK\Òpƒ•[gùÈ—\ç†\çˆ\âNÿ^·ª&7Û¸<\Z\î\Ý,¿µ\ÔCŽ>y!ö\ä]\íÐ·4a¯¬•ßªH\Å[ðƒ’Ø\n‘pŽj\î5uoºªfj®\ÞW\ê\Ö<+\ÅÕƒø\Z\Üiã—®œ¢ \Ó3-_\ï,m“p™ðµ¨ü÷ó?¶¡­—ð\íˆ\ï”R¼\Úz\0œ/¹.)©U\Äi¦2¹™vELCõÈ¿,§Œƒ_$JR\Þ\ßRœ\"]M=Á!cL”\æ–Pú\ä|#Úµ¬1.®JÀ‚”S§Àþo‡~\Ò8)\ì¬g1·­ús\Ì$\ZIP¢y5\Ê\Ù\Å8\×\äk\È&\ÝU\â-\àdDahtÇº.S¡((\ìÌ¼\ê*5ç½œéŒ‰\'<mó\ß\r\ÐbÉ~z\è–þrú$\Ð`¿š¤]Wß½~\åµPžg‡\ïAd­a°œ¾²C/53ðjŽžï‰‡™\ïcY…%Ž·‘¶´Iü÷|7„œQ<Í©zz{Q\ç¡¢ \ØÍµ$\Ë\Ú[eÕ¦CñY/G„\çôŽ®\rh—r«lj<õ½9\Ê\\P×¹þNV¼z@X=\Ã<\Ø.Œ&\ÒNj”DC´”±r\à©\Çÿ­×»I_\'˜\r\0\ÍUŽ\í ±X\ÆP¸RÿŒSú\ÚôYFu²+\Äˆ1\rFKf³££ˆ\íûºÝ§;¤+] ›‘Ž\à\ÛøŸ±¡\è\Ée>¢@ba²Ï”ˆ\Ó{Î„©k¬*qŽYiÔ‚¨ð\ã™^0AþSŠŸ`§Qf\'´p\Ù9nvžµ¦\Ã\å3\Ì\ÑZ}„Hö`\'¨\é\îšØ¥€™ƒ{†°§\0gXný*j[t>±\Òt\Ï_Qù`Ž\"³åµ›~>»\Ç+\ÜH\Û1E\å\Ðx\ÊÁ\ß-\ÜE·¬Ò©Ck\å÷qiT˜Œ@\å1]{\Ì\ç®%\Ðh“žo]™(tž	N°«Ã¸œE¤\Ê]\Í\È\Óo\è¨GG™|bN6\Ý\Ì\ê\Ô{¤€\Z<\Ze\ÐøžfY¿\ßcŒMƒI.½Dü\"Ñµ\Ù \În[®Ÿ‡zcJJ\ÐÀ7R\ï+º\Ær	\ê#A-4N®\àˆþ­	½<\éÝ™ð:®?ÔŸŽYš‘3)ú„iø\\(n\Ô\á·aó*’òc\Îq	©¬\È\ÜP~0-\'³\n\î§m²‹Qµ‹vµ\"A¼iR DNI,¯\ëƒÿ.°!S~p„²¦C‘\Û\ÊQNh¢\ë†B°‚“\Ír\Ç;o_{\Å`•­\Ô\r\ïö”HeWÖ¾j©\ãòk9y³ M@\âoi\èQ…»s1:\n\Ã\ß\Ð\rÿ¹Sø”}xøK9ƒùE@¨j=\î!-\Ã\Óãž½c\ÂGf+ö\"tL¶<žJ´+‰\ìÎ‚O]z\'¹=b)Ð²R¦®\ÃR	‚`\è}…¯\Õ2\Øo\Â\Ü\áM 8¥X3“CbN;½¿=\Ëdü}­Ý±I–dM¦^\rT\ã•—\Ç}š :’›y\çCz\èLxe²;\Ìõ\à7Þ/Le¡õMm]}\Ö^ö§›üùv\ÔÄ²\0b:_ó\Èô Š5`Ž?M¨gi)ò\î˜ÿHŸ\ÜE¯†;\Âüú?Á­i‡F\Â\Êt\ÈZ§ý\Ã\Þ\à¬E2ˆ(¢ß¤¢õzÊ†þ\Ï\ÑZn\ë4_œ@‘\ÃWF±9¥\çÀ\'Zˆ1ûŽú„#Tý+ŠY\åxa„só¯2Už\àz\×x).…F¨#«˜²ÿ¦;6\çI \rsiQnN\á\á*\Ö9°/edõ_5~[A 5o\âPˆ& š /3A¬ýµ\Ç•ý‘\èT\î«\Õú(3GiB°@W1zyg\æ+\0¿­P’(w†rÜ½H¹_c\Ã.HuwZ\Ç”>x³\"ˆ\ë\ä\âs²\Üdó\Ì\r®aœK\ë \ï‚ÿõh\Öp\æ¦\Í¥ŠqPÜ”Uª§\"Ÿeux.\ng‰£Á\Çi@G\Ä%ú¨\Ú\ÓB 0h©ù8E ý\Ì\Í?i—©X)låš¶\â¸<i+R7¨\ÄmE\0\á\ÑN\\šeD@v\æD\ÅQ†@I\Ø\æ¸eC²iÓ‘N\ßü¯;«UôG\Âðf_ˆDiyY\ÊÁ\Éw1z\ÒbsY\å-œCðhF¯¡÷c\Û07\É_?Í¦\Ã!U¿\Züz\ÜS¾bG¥	ŒuÕ°xvŒ–\"²zi\ìÄ‘Hb\ÆV­¯A\Î\'©ý½\Î8<Id\ÏY`›\ÊQ9¥e°1Q½`e\ÂDû	‰í”«_e„d\éeù=\ÄV¤õ8ú€¸W±\ëa·Þž\Ä\Z!û\Ò~T\æœ>™ 0\Ýp;ƒ4`PrÖ¢\â©?–û\Öþ\à0.÷?\Ò\ÛŽµÏ½+\ê\Ì\0(\0\Þù=§-q\\VØ« ¥\×\åÀ\îÌŽ8«‘P.¯\ê¿oõ\í“;˜)ô\É0\Ë\én\Ô%lÀý™·\0\ê«_e°¦\Ã<“\ê\æ7·Ë¸%\" $\Ó@­\Ðñ	s$?~ÁUU¡\ïS`\ÕOt7\å\â7±EÉ¥°û½µ(¼€–4\Ð4k•~\ÐY•¨H÷\ÒGG?ú½Û¬DKµ\Î\ÊBm>8±L«_†ƒ^›—<¥…»G\Ùâ´¶ÿ„$\áEÜ‚È‹2¿\0˜\Ãß†4g„kW\ÒBz\ÍD6Ê¼\á\ÍVæŽŸ\Ôõ!\Å\Ã\éu\Õ¾û\éRW*w²»p¼y\Éu1I€r\Ð\ÓOD\'8\ë4|®lò„\È\áF\Z\ë°\äü\0¿¦kú\Ì!{º“\ØWG\ê%\r«¥’\àø\Íó-»D>±–ó¢›¸4}\å[\ÔG’\ë\ä8ýŽøªwz\é¶-û«ù\ë9‹®O\ë\íñÅ¢9R-,?Q7)ðŒ\É,„;*\â@XúC–\'Zjfp\ÝÌ²\êú1‹-ô%~sb¶:2wCEA\Ì\êþ;H³Wþ5b¾\ÏCg–\Ð6$\Ç}d{\r\Ä\ÓCž†üB£ZlR\ËYä»²\Ó\ßÿo\ç(K@øxœ*¨G{\Í\ÒO‰Õ¤\íK*O­ó¸#\çF\Å6<f9¼­X¾\Û\ìµ\ê‰C2‘¤˜÷¯:‘½³,“+R\ZNfï¡º\â_o›g]M@3{ûrª]5üœ>}ƒ\è­\rù~Gô ”\n„ ‡¡œ2fay±x±”¿T\ÇÿÕ£“ù\å\äNaUqA©\Â: \Ì0«Æ‘q\Ò\ëVwø\ëÁX\É\çÁ>WºrVg‘Dµ\Ë0\ê\'\äž±‡?enô‹\Ó¤‹‡se_ó\Æ;\ÑaŽd‘0Ž\Þ\ÕWš7Y\Ñ\Ç\î<Þ¯™!\r|ý{©3Lôÿ‹vx¨\rtÞ¯\Ï\Ä\ïO_\á$E\ß\Æf¤$¿\ç‚{¼”0z­‹\æõ–b5ö!¥šSbPš³KeÓ³\"ö¤y\Ú\Ýos^7ß…bQ®^\Üöla!–\Ð8¿+·£\×?5[\îFu€\0þš%ž¹\Ä\ÕZ\Æ(\í<‰³‚Uö\Ñ\0BŽ¾\ï\Zó†6¤\Ç	\ë4Itd¹\×\Â\Ì\Ïk†Z=ºÿ—§d€@³{7K·Š\Ët%…\È\nlµ¶\ê(\Ãab:Ø‚S²>\"«\äþòˆ€œµõšžØˆ·jµ=öFL!_¾%`‹3À$ô\ÈS!\n*¤\Z…h(\'Æ§’OýxQ‚‰L\ÉX\\z\Úú\æR<sM¿’\Í;B7£m]\ÐT;$\ã¦+ð÷c)°\Ãk\n\ìVôc~‘»\"8±É¤~\è]\å%\î#û”\ë¤v>wõ¥+¦„x\ç(Šy4t\nJûo\é«\àFl)a\Í%\ëa\Ñ\Öm]\Ñ\\\è+[)£þv¼4\\‰›x\Ì\Æ%\Ë-c‚¬K8£Ê“©E½:øÿ_¼¼\ê\0\Öð$\îÄ¡)õ\ãKlÿ0\ß\çcùô\È\äf¾û_\Íx-/\Û`\á—\Ñk}‡ô¨Ï¡K¥\Þ\Þ/“/¬\ï8S\'\r˜!|\ã+§·‹ýù^…L±ÜºœH~›t\Â|#Cub´†=‚B^\î\æ†\Ô=”}‡º\×ò{C+1‡\ë\Ù/jÉ»ò\ã\Ç(X\r\ç\Çz°pa\ïží‚„\Ûd\'~|\ß\Ð*9\ZZ¸u¥³¸…˜›!¯1P\Ã3*X\Æ%ƒ\à1\à§\É\Ø\Ì¯KV§d¸¸{¹yTÉŽn\Ât\Ï\ÃJ\àÐœ\á\"O™B{2M­ì»»!Y^\áf\èV¸\Ö\â(‚¦\Æ<Õ ùw«x…C=)Ñ¡m\Ñ/tò6\Õ÷\Ãd\n\Ò7kÑ±¡—7€r…¸	ý\Ö«\ê‰\'…»\âµ,À\Üe\è’\ß#ùs\ZŸ{\0´W`±½\"\î\ÙFM«Œ‘2&F\Ó1ª#·\Æ8bW\È\×O\áÚ¾€–&j_\0Å±\í—\'‘\Ý;ß’\äAišm•m¸`†\èñ\ì{\ã“\Ï4(R\Ïq,f 4ü¾³ÿek\ïV¸PX ]24\è±\í—\Í4\ãv‡¯ÜƒÀ¬‡»T\í‘_ºpø\Ü\ØÁ\ÔK\Þt\å\Ô\æò\ç^\Ø!^²jm¦²œ\ßEº\Ç\æ»©\Îv¶„3;]W\Ýoº$ž\×©QÍ¯eß‘´ò¯{Xã¬¶v(‹¢zzW/~÷Z\íøVv\Ì\0Y]SWh‘\å;fø\î\ÏW“K\È6µl`\ç\Ø\rZ\'I¯\Ú^\í ^M–!\ÂN\íûü`ÇŠ\r\ZV£ð’‘e\ÑB¸Ê°?*\Øý¶¥É²\Ýôzßo\n\ÆbXF¹ \çò¹\Ó¼G»›\Ù\"F*@Ÿ>w\ÃYƒ\áC\ë	\\\Ð;!|f%\n‹Ÿ\ïº^0>\Ù˜\éô\Ð\íÿ\Ô\æ\ZÄŸIAÙþ\ãõ\Æ\ÑR\Ö6µ²\ë[8\'™YÆƒiY\Í[ˆ\Ó%ò7:<s>g À’\Z<aõ£µl%Áæª´=À\ä\ï`,†4!\Æ	$Dú¸ŽQý\ìá‡“7^\ã\ëEŽ`+,G“Ár©Agy›\Ò\Ç\ÚUVòKÕ„\"Q#4&\"ð@Ë \Ð+_K&7ô\ã\Ý\ÆÁfÎ†~‰\í¯†#ð4^¿+ib\nª4\Ë}/ðB—­È˜†¬Rk:³–B\"\Å8ø\\Š£‹ûFKvl‡%¨7\ìš\åT\ÃE8¹	†•½\É,Aþ2=°q«S_ÿ>jŽqeE\0³™q«¼c\Ý\Þ\ÇÄ£/=A€¥€\ãbø¯\é):jözš¬új\Ã|\×\älƒ¸\Z‘¤¡ð\Ûh“\Ë\ã\Ì/6ù®\Æ2©¼4<ûòö$ŽXY”i<\ÝNN\ÃH\Ë\"¥^cJº_\ç®\ßõn(ž«’@’Zae`|‚ ÷¿(‹¯új	cÀ‹¤\Âù\Ü\æ\ÞH‡€CªÌho\Éú\É\æÍ´\Zo\ÍC\ã­bú2ºü\"b1÷Z\ä\è.0“ /\'y‡S}\à8+š§©*{Qù\ío÷4~\ÉF·5ñ4\Û<’B‰«\Öp\ï\0šó«O\ÞD\ÓÀ€Š\ìXÏ©Œƒø¡\Þ3ˆG\Ú=’6õ‡Ì›li8`€dE^ý,\Í\Ìõ{U\\s¨6@\ZÉû»p\Ô\r°•±H„A\åÀ/\Õ>^_´R{Àxsòƒùm\â6\ÂÿEŽ\Ò\\ö*aù\äöÏˆ\Åq\å:Ž\ç:R\í|µmñc\Ø\Ó4\"\"¯xœ>Ê¥\â§™ö«š6ºLS$o\Å\Ï\Ãr¼~\\|{,%«2\Ìö*,\æ‘ÞŠm´ÉRPø\Â3„)KL60ƒŽÿ\ÏÜŽ©5lö\ë\Ïv½ÿ†VuE¢\á\ÒÅª`ø™\è°W²ƒ½:•Žª}gNÓ¥}þ¨\ÛSó#÷­„‰FhT3§\Ã\ÎE”ðeûyS³b\ãð£l\è){”Nd,Hin7®Za\áe„LZ‚!\Ú{\ÛX1ŽüwoifÛŽj\Â\åµ\Ç\0\ÈXn(Ò³É¤,	¤EÌ‹—u¹–\Ê¹¢³}Eõ u\à2FØ­Š( I,\Äc\"M÷:Š%\Ôbg-£gInE˜Å–½.\î\Ü2 o÷öéŽ\ß\ë³úoÅ¹6öD‘khÂ¤\"C§\ížS\Z6Àp~À…\Âá€±\ç¤\ÌúAE\\Á\ã:~E²Fl=®øy¾Q\ã__;Q4½Oóøx\Ü‚\ê\04PV9¶\r }I-|p¨\Ä#”tO9\Z¯3t‡u­\Ó}ñ\ßÛ·\ë/¬9¿e\Â.\Èú=¨\Òê‚œ…´*\'e\ár ^lb>8<\æf1µp—©\Â\r»\Ót*\×\Þð¹@§	\"s\×Ø£•\×\ãúdG\"\Õ%D«\0KuH\Ëü\çI“p\ÎWÝ®T]—!Y¿8v–´*?\ÏK@\"«Ìª\ç)·¨\'\'\Âs\á-4ò\0³K\"\Û?‚\ïø\îô”\ÊöbË¤µ•¢\ê\ÜlÕ•|õ\êHŠ\'>Ç†(¡E¼o\Óõ\ï?XD½\ê¦vT\Æ\Ýe¯¨m’\Ï|™¦\r—S“€\Í\Æ\Óò\Êƒ\è\Ï2¤_\Ú÷x°ñ7\È\Â\Ýq+:\"²8\îNwüŠ«v:\àþFú*oV*ž\Ü\è\"\Ñòð\Ò÷›.[‡”Œ\à%gO\èTœÛž6k\'JU˜\ä\Ñ#r\í\Ûøøo5&|rW˜©f\ZŸ`§V\Ì73\'	\r,c\ÑÍ·t\ÃUŒ”\èCW|\àÍ—eL²öU?{Œ5º	E\Åmdª,UN)¦\Ã^\ï~.—ŠÊ¬!w>ŠHh/—\Ì\í@±®ò,\á\á4HšØŒfý{¢{®Å®ðSt,XQã¥†U¬ý¸\èR{6\â|ýø›©F¤Ñ³Þ‘.\ã5°lƒ²\Õ\ã\Ïò×¶\ã¶\Ê$“\Í\ÇOÛ‰/t¥¢Yñ@w­\Ô*\ÜQnõ]$©¥½»I\Î({Š\èÀ\ZœC¶À¢wB\Å\Õ8óOHm\ì\Üñ\ìÓ‹1\Ö0”~¿VÏ¦‚s+­R„Ë˜€µ‘A\0ö03½,–i\Ã\ÕC>©>ü©³b¼\nÆº[\Ðú£\ÑÖ YpR$6T®;=ž3ª\É\í\Ý~ˆ\Ë\ë\ÇA­1ç²Ž!l9ŸÊ‘¤\ÕÁkÿ9œÜšðoSA\Ô\ïN}—\ÇÍ¬¼fT;\ä‘~ý\á\â,Ja\Ëwhôò>„\è\Òù\Ò\ÑØˆ\Ü¡„zmXdó^šIxi\Ã\raò—\Â³-\Ó)&¡\È\æ5§h\çŠ$¾4\r­O²\àTBº6½šn`øÁ†2<…°	,†f_L«Qn]m&{<*˜ÿXg”–\ÍEœzpIm$¹ý\nMµ#…£°\ÖX_Hhðù™5ž\â&§»\ç\á[\'¬ ðZZ\Ô4k—2Ýœ\ï¤”\îfž¢_)+#§\Í\r|\É_¿3\ÞG’\0üš1üœ¿°^\áþ«Žú©w\æ\ê«2g\É0K5<N˜m\Ûö83½c8<…\'°”ol\"›Eu\Ä3°\à}\Í,\Ì\ä„\ÈÛsg,\Ýôø{^ø5Q“Æš\É1‘LY»@©:6%õTC9<\â<¼\Ò/?«gôú“ˆ\íy‚\ë:\Ò\Ó\\\0ƒ˜‰\à**@Árù\Õ&\Z\ß\Ö\Å¯ÿ§©Q%\à0nN*\'˜E\Åwª^¤\n0\æ76û-Š¨PQ\äD¾\ØúÜ«i±‘Vr\Úhk\ëWMŸ3ù\Ä,g©kwp™lc\'Ö¤1U}\Û\È\èk…¤ˆ˜>\ZŸWR\éU#ý\'I@\à.¹XÅ™jkr*i\Ñ\\\ËG\ØT“L[xv–T=#zcP\í\íó©—\ÃÁ³\Öò\Úöº³RsMqyy³(_<\Ä\É&\Ø;\Ð,YIœT¸\Ø\Ï\Ã*ƒ¯P\Ë$\Ü&ƒ÷h\éÍ–!£»D\âp_CF†6¤¯•\0­9•ªŸ\Ê6R`j4\Îø~€	\ËNx7Rs\é³\ævh\Ä2+\rae\âú:Mv}ð(\Ü\Ú\Ïa\ß\Þk\Ã\'ðûúP\îµf\Ít\ë`‘)4ge~fûÿf–M]ÿ,c\ã[Ï¡þY†œ]\Ç>\Ér}£?Šd04(ÖjŽr\ì\í\Ù}\ã\â¤4ƒ\ê1\Æ\ß\ç\Æ\ÈSº)\á!™#•JSOÂ‡\ê\×9z&þfTMHTR÷xö\é“4\í)›ißš\'[]·¼8Cxt\ÛUŠš\â&¦ùú\Ñ3Œ¨Ÿe/\ì»Ö™«š±\ã¯6“†\"`\í\\ýõ\ÃH\ç%½\Þu(z\Úgc\r\Ña‘\0M£¹üg\ÞT¶ hÁPX@û,Á\Ü,\Üñ\Î\r™¼÷•\ïü\'|J\Í\Óvm\æõ?\Â#Ã´¿`hÛ‰?\Ì5¥‚gjÛ€|\Ûe˜\ä^(ƒ\Í?@1\Ñ\Â\Ò\r­t’9ˆÃ»4œ;±¾“þ9uŒ\Þ\íc1v\ÚñtûC¥ˆkG\ïocúL?Bl—›h3\í<‚p\ï\Òz	Q\Úb\Z÷É‡uI5Œh¡\0\\d\Ü3!~P5_£|«&;w\Ër®Ÿ\'½‹¼“k\îú¯Z6¾6¤ðŠ`ƒï¨º\ç_OLú°°x€W\Æ?F…¥\í¯À2-v÷Œ˜\Íz‹ÁE\ß\ï<\ÒZ\èS^˜£;HYWšûUF{Wd?\æ\ë\Â	ö¬\rÂ—-<õ7À¬\Ór\ÄO«Ò–™•l²T¡ ÷©±x\È\ßr®°z•R%-t všZª\ê§X<mñ\ë(\"Ó”\Ý¦â—˜t$…\í³\ç\ÇÉ˜Bp\Âc(yžÛPÿ\ÈY\ÊeÏ«’\í®~\î\Æhš\ÞÁwÛ†G\Ðf/¸Z+o4ÚººCÍ·K\ä\Ëe-\ß\ã=N‘/5÷#\0Ôˆ*\êLªº\ÈË·Á\0\Ü\ÖL=÷X\è„\0\äJC\0\ÓÂ©Nª\È<z\à1rx9H3\è´N_–4w<C˜aX\ßC’†Š^„<m\ß\n”<\Z[\"oOü\Óõ:–¨;IŒ¡8þL`ví•¡\ÅÀÙ€—H.9§YXO\è=‘PvóG^W\Ç„DsA¡›…r+u\ä0\'øf‰˜¼\0M\à’F2|1\èôqš,ŠH\Ö M\0‹%ñ°Æ“/bÎ¢€£ÓŽ‘oh\0F\ßv˜Pý–¢Q—NZ1[\Ì\Ü_\Z‘TŒ\ró\Ê\áü=u¼X*\ÂN\Ú)\ã\Î7\îu†¬¶@ÿTiTý€\×A\î\Òs­AÆ¥!zº\Çj˜“™\Þ|]ø\Ó\Ên!\ßgû\ï@%\âöwþu]1\Éš-_Êˆ>\Ì\ïLú}a\ê\ÜûyR8x¸b>\ên¥!\ÂG³r\Ë;\ÝIl5hh¯»…ú\Ó\Æ+H=¸tðPðzò¹\n*:—pÓ±\ÊL\â,£%vü\ç§\Ì\í·1Ú³h\'Š=k,%9cd‹›S\î g4	%\åYýD`Nf\ïŸð\ë›\Û!×’·ÀIµCŒ†Jž\ß\ãþ¹\ä)¡¥<ŒY\îØ¿6þa÷X\È\á#\r\Ñ,\Ç\'\Ô)/>\ìb‡\éù­¥n’•µ™~\Â:¨\Ñ\Ãx§	þ‰ûv.6M:~J“\ä\ã\í\ë2 aü\Ë(\Ù4\Ómä˜šF/yx.’¾\å\å¸mÒ»RC\ÜÍ¿<ZV\Zfc\ìóVƒ\Ýõ3kK^?µHŒ\×\0p\Ô÷\íI‚-\ãIb\Ý\ÛÿJ\å\æ…\è\Éø\Æ<|bªl9žhŽ»-‚oKõ8bE•Š\å+©¶\ëfj€jôøF`\ëR\Ü|¸ÄŠ)õ‰“c±m\ëf†‰Iõ!\ÙR®„q2}\Ï9¶“\å÷VGP™-¿\ZžF\á#6m\àGe©©Ÿ¹¼\"m­\Ä*W\ìxBYºo	ñ}Wv§K‘\n~\ZG$´\íüQÕ¸\ÑBta€–ròa}@œg\ç\Ík(2@©\ÝÜ»)0Á\Ù:ò^¹zž˜V6¹\î³`\ZD\Ñ\0\Õg\â\r[LÏ´\Ó\äV¿X\Ú`´19¨óøHË”™\Ürm´š\'Oq\îšÂ¶ÿ\Z\×\ÑÀ07#pN»_Z4‘â²¾†´£ò\èªR–é¥Ylh†\åP0¸…\áy–1\×NU\ÒñSòÏ‰R+x`\â‡Y¦œ/\'\î/ñ¾|Œ\Ú<¯ó°\ÕûxQ	É¤—\Þ\Z‹Máµ ¢‚§(dÔµtc-\çh	ªsº2¾´OQC\ï“·û¿@°.#»\ë\Â\ä¸(3¦w\Í\ÅÂŸÑˆ\ï þB§¹fU˜³®Y4õ\Ú\Ç\ÝJqÄ€†^\ìyJŠ_õ”…{$}Dõ\ê\Ïsù-\ØÙ“ºð–\í¤Á\Úóœ¾½a0­¸·7ö¤R±\ìk	O¨ƒ?û¥¹7û¡†	¿r\ÍQ[¼\Åc|u˜\')‹ dƒ†¢.‘\Ø\îC>˜\\¤FW®\\©\\Pô\"´ƒ®Q\éOG\æ	‹ô¨s‰sÿ\ÊyD\Ù\Î^º‹P˜´\Æ+)6&\ÃA\Ý%½¦”\Ô\'ú…ù‰1‡E\nv¸\äþjlgbž¹Z>·Jð²qCo\ï\ØSÂ¼eM¿Ì”\â\Ñ6vo8 ÿ½\Ñ\Øo‘!‚c©\Äö\Æ\è¬˜\Öò¾+^X˜€,É±de\ï\×É˜¿‘¾d6••<·ûRFNl945‹x\\\ìGv:S¿\Ì\Zò\Ô¥(0k¤\ÒŒ¯zúlkugù1ÎƒU[K\r7Ë±»\Ï\"ˆkÀ†$\Ý\Ýa¼¦\å\ê7JI\nÝ\ÈT\íƒ^\ÓüH¾£\Â\ÆùŸ\'˜Qµõº\Ç:WªE‹€*,\Æ£\Èm+\0\Ü\\£d<eÕš\äÀ—¯ò\Ò\ã$¢\îo\ÒF´\î‡p~\\\é\Üô.\"#\ç{\Z3\Ú­\Ç-cþ\Íÿ¯GŠü\Æ.b­zÀ\èˆ¯È½\Ôf¿ZÀ	\ÚDø\Æg ­ô\Ú9&\êe$)NK\æ•b5–®š6õr\é-&*pMa\ëÂŠy(`cT¶I^]\Ìhry )%z«‡zÂ†\Æø©\Ñª{E:u#VN²Ñµ´\Ò\æ\á¥\ê)þrÜ‰2\n¶H+“ý[ƒdÞ«\'r_n\rÎ­.0²„~þ™„\ZTºCo´¥î™žK–Í±\äµ|ñ#\ézT”x\n*\Þ;¬®÷\ÎÜ·¸E\âc}Ô¸¸~Xg>SH&¶{8ðû\Îu\å€JFÇ–lw\Ê\äo\ç3€™\é\än]›\\s?/\æ@A¢\ÕB>L„\"‚ Œk\ÖF!sl¤öH†^“\ëô\'\íø?\r#g…ŽY\Z@3\ÅB\ÙU\ì(\Ô\0<xþ\Zˆ­rX:pˆ¯·®O•j;8O˜Qª\Ð\çó\Û:\nNôK\\hÈ¾ð<§¤¶yh\\zxk3Ú£lòŒú(qšµ³Áf6ð\Ëá¹·¥;*\Ô\0\Ômö\Ùx‘¼Á¹\ì{“™%Æ¢±\åñZ ­¨“m¯ôT¹ýU^¬…e¸+ÿ$7j\ãS³g*€.²R°\Ôy¦KL(›žŒ”þË³ˆ„½‰l\Ú:\0‡Ë„˜j6HeDô@\ã¨e¶t!/€kHJ\Æú3\ÍO{ªÀ·\Û%\ßS\Ø…&\'\ß2y±¬¢\Ý#9\å7Õ²¿\'d’@\Ã)Kj£·ˆ[r\àþ‹\ßñA\ZWse\ç\rõm¨5\å>Cº:‹ÁµŽ…fA\Æ\íc\n\ìiŠª•0dt\áV÷’µðNœ\Ý÷\ÞÎŠ\ÝxE°8\ÔÙ¸;ñ9©k,Á2u\î‘\Ô6	T®Ž\ï@sÜ¼þ\'\à½fž\êAƒ\ëj|øA“x±\'’÷·—\×\ßŠ£\Ü y.¯·Š™nÖ‚=´`\çxQšø>D‚ÁL\×A´\èƒùŽ7\Ç\Ù\×Ç°‘:…¿q#\ÝPªs\\\ËAK›½wØ›öY\Ãýmð\ë^ò\ïI¥vzoõ5$ž±8\n8\ÖT\Éú?\"kŠµ²ºcý?i\ß-\âa8nŽ†\\ã™«zûƒ|.*K\n\Î\ØX\ØT§~\íeXˆ{1`\ZEOt1´.ü±h„ý\Ò\Ý\0F¡$ ˜`u7\Ùñ@q¤\ê»4¶t\ÃTûðÚ¯\ë\ä\r—5ˆ\Z\ÞQD£s;:ð\âŠ\'\ÒÉŠ\Þ\ØÈ±4ö® \ì¥s1ðù\ÌL\Âñj6\Ëw\Z\×h\'-6\ß\ZAHôY\Z\È\Z³aºg¥O $—ƒ\Êz\'¦\âÿBr¶Á‘¬uî‡º¬™§où2\ãOUÛŒ‡\ÛÔ–3–Ö®ß¥ ¨ŽZC)vÿ’K‹\Ï\Ü\çÆ¬b{m´UI\Ã\Z0Ž;¹¶Re\0\ÔŠŠ=9|Ü’¿\à‚Ai¼&\ÎÌ\Äb\Ù~šƒ0\rF§y‰œ4‘sŸœ\r*T9SI\ïsX\nƒ÷Y”£QhQÖ³—.\è\Â­/–Ñœ\á\Ä\ìWQ–ùU\æþXY¼ Jôƒ8c5|E h6¢\rF\í557\"\éÄ¼t~¬>\Äb®1\èøHù\ì\ÏKm\èb>˜]8vg\Æ\ìˆò“&~¨,8!þ ?®	¡dE\æHLP\ÔÔ€…!YˆŒB\í\à‘\ÌqY\ä.F%¨H(òs)U-t•\éÏ†\Þ\ãÇžR/6Z\Äù…ºy\0É¥Ï®°\Ê”?¦\Ã>¾Kø\ÇóC\Z\Zr§kòÁh‰µ»m\énjo,	,¦kª¯i$B4¬ƒM˜+	…\'5\r™jùj.¤öÁJ¦¹} InOCF\ì\á\ßWv°Ù¼–‡¹k§Ÿ\Ô\çqþ\×*†Ÿy4l\Ú3¦Àš\éš›\åd€>T\å\Õ!L\ë¡¢\àP\\\Ë\êü\Ï\ÔMš oH‘+\Ö5¸ÿ)D³`ÌŠ\×Uþ\0±%Ñ“\nT™ùõr`@\èvù•‚\ê\Z/\ÇDGnÞ©\ÑNc?\äx\æFÂ†þ”nXõy\Ö\ã€$\ÌÿDI—d\Âze¹\Þ7¿ÕTŒ©¥\í”c¶‡\n®D\ÛÅœ\áŒE\\9»\Ã+SY\Úð}ØuÁh\×1\å ¥\Ú0\Ú”%.kvR‰i+L†fð\Õzy\ëw…1¤È¶ña¼œ3\ÊÒŠ3ú„‡0—´ó0ƒ\î6ô\ç\àò\Î\Übÿ%=W‡\è¹3_˜>b\èŠ!\àú-…Aÿo\á>ŒgŸb\ÊÐ®Ú°@\Ê-ToÃŸ1“µ\ß¡ÿ\æZs \Öóó\ZI%­œòRr¼m)“1Ç¾|öö†\î0\ÛjrD\àay\ç‡m\Ã& ExÌ¥™†jazG\Çy¡øU³2;*­Š\Üx5rI‚¿\Õ\Òe.ýuÒ‘±WJû\Ôu‚ŸC!»Í®\Äjg\ë7\Ê\Âó\ç\ß%u\'Ÿ‹üu\á+\\´º\Ãe5\î¾l~p{„…*\èd•0t(2%XtŠ\ÉV²ff\ÐVð\Ñ{p’9\æŒ/³×‚ŠO\í[[C°nR´œ\ÒÏ±lV‚E[[¢yN®ñ\É0n5~ôÃ¼‘s\Ì\æUO\äpø‡Kýak—D¼\ç\çvw…\ç›3µ[{h¬\ÚM¹-MQY\ë²\n}ò\Çòtx<L_r1 µ‰ƒ½„„\ÌM\Ô|~+\Ì\ZgÜ¡\Æ;ü\ä#a.,  \é†\Èj\Ä×£-I^±O¦Ø–@þXNpá‡”²¡:±|‡£ÔŠõŒRzDÑ¼>ÿð=\'\\ŒPŠ\å‰\ê:ó‡•D\ánMk¤¿C¨ú\no \ãÇ¢§¹\Ô\ã\ßu\Ù¬Qò+€¸]•@„©¿øRÀòa/U\Ëlj\ãö•W`Â”šžßˆ ¡öœÁñ‘s÷%\Ñ*=\rdü\ã„{*}I\Ùx\ÙyÁ\Ñ+\ÐüTS\à\î/Uþ¬È˜#bøaµ\ÅÇ’òJ[ð¿¡.ß•“‡ù÷C\"Ÿb­¯d\'ZV,h\nL\åû\Ó\È‰\'#¶2Eò\\–\ÊnþœM÷\ïJÿŸdC8]6ºcŸ\à?O\Õe\æL@b$\r=VÒŒü\ì\ç\Ö:\\\Þ\ra…1bB·Úš\ì)¼$\Òñ\n9˜\ïo±VYŠd\çdˆôÑ³_¾\Úo°÷$”¸_\î\Z\Ú\Ë=caŒ\ÉKTˆ²o‚\â>\àÉ«º\Ò×§¶4ÆŽ\Ë:\Û@\Ñ!`œ\Ä\0C¨\ÚÈ”“\Òsœ\íôû°¸—¦O<\íL»‘–|#e\è‡L&±	÷5¼Áv\×X¥Q£·ä±¦²\å—½\é\\”dYt‰˜y‚vø,>k,ü\ï\ßñŽ|\Âõ\Úh„ƒ\Õ\ÒL2€{s=½\Ê{5\Ê?\ï\à1ùEÛ°\î\Úa\ê´SòiUtho\Ð	\ØdS`B®\Õm¨’;V\ì‡4’\ÓzkØ…Iµ\Ö\ÞáŸ«Y²Šw²€\Îº”a\\e$õœm\ã¦f})Eo‡½D\Ë1{\Ó<\îb\Î=µ¡\î\ê\ÓùYƒlò\0F¦Û\0’¶ûŽ#\È\×À\Öq2¤K\ÖFÁÜ…>(\"ˆZˆ›ýId\Î\Î2‰–?£=úoY\Ã%õ¡„\ÉZ\ã9\Ê\Ä\Í}³üýÊ›ö¡2›û\ÕMx\\—\ïx\Ý\Ð\â„)Ÿ‘*xQº\'0U”¨÷ù,Á\ÛD»²\çU\r\ÂüZfª1¯Mú\Ã\ÜSY´†µT÷¶@Œ¢D\ï‡@\ë_2\ï˜\íaj\\\'\Z»Õ¸«\Ù3\ê8!m\Í\îˆ\Ïbª¢·¦ñiT]ƒs+ø\Ë?±\ã\Ò+u\Ü7\Z\Õ\Ö\Çuf\éõè®‡\éýp%ˆQ°ž1®Õ\Ãv³¥ŒJ\ÞdB.\á$B\0„B«•ñB\r—«\Âùÿ‡¨\à‰T:ö\á‚³¶ˆ§\ÓH\æ{v%UXý\éRk\Ñr¼BûZÛŸ^Þ…\æ{\Ï\î\àŽ2›¶7ùV5\n;´Š\0ð\áû¦\Ç\ç=,}\Þ\Ï\å\×\ähf\ßøquZC\Ý\ã	¥»}\éòEóŽS\r?\Ý/i½\Úa‡j\ÏQ\Ô\î0\Ô\ï4A.NW\\)´Ð¥§dô¹mn_\âù;%xJ£Nx·\æN³®õ9üF¦Bwå¦®“¢–‘¯F*\Z=beü6ƒø+65*‘\ÛJüüÐ³@eÌ¢þIJ‹\Í~\ïJTa\Õc‹Ÿÿ{¶¤÷¿™\ä\\S¥\n	ô\Í©Á\åÀ\Û^E\èd„J?„\à˜ŽòC(\éª\î\Íú„m±´\è\ëX\ÏÃ¬¿\Ç\ìÖ—¦ÿ\ì~EK]—\Ï{`•§\ÃP½7\ÏX\è,\à¤\ßÓƒ\éPjˆþFmh5 Çª@\çªy\Z#v·	,Z\Ú&\")k\Î\É/+•1¥”\æŽr\n>¡¥QŽ<µ\ÜGþ:50ª\à\æ\"\ã­é¸¢o%\ZÓŠÈ„\Ò¢bbk¹\ÞX¼Sô\\\ãT¹ùÌ®9‹ÿ…\Ù]¹Ê\ì(’\êB>cô¾„JŠŽ”^ŒP8šG¢\n÷tL&j\è),\àþŠ~\Ñå©ˆ—S=~¼ôˆDH\ÂÔ—C__k–\ÐÄš“ÿŸ;\Å8#®¦~¥Žµ\Ã\ÏðôŒ±ú[b€ŠÊœ\Ïa²„¼‚-\ÜÙ„¿§@\r$§\Ç\Ó\ÂB{”Ã‡D§œm¥[I,\âOG)˜)•\Ú/\Z^*|™|\í\ÒôU¨wvuuq¤>z\ÈÉ•…ðU-›\"­s<ß¬%ˆhe„¡ R	¯P\0‰^\ìk¾Z·MÈ½[B*Õ³!ó \ÉbŸ\Í\Ç\"\á10E…‹‘\ßôoÍ±¸\çs95™Y\à­\ì$û2…¸\Ór{¥m¥„Q[u\ïu\00\æýRÉ…e¼›@QIô3F»£•q#b0OB#ö]\ì€\Íô6ñùÞ«WÃ¶W|kŸ\ÜDú\Z¤\É\ê\åÖŸ\ÏPaQŠ9T3\Ú\ãm8€°4uÐ¦–}r/\çd7!Ä¦Œ\ëw\Ó\ì\ãBš›AX~‰\Z‹,M¶X\ã°<\àù˜\Ü\íý–£&ª!X\â“M\î\ÚvT\Z!O\Íx8!žÄ’¤?½«cmu_ÆŽ\æ\Í\ä‚/°†’3õ•šõ\0¼Ìˆ¬MW)\æ2+x~ûd¹E\")³J2\ïd¸\ëDˆ‘‘G¦\Ï-\Ã\Ü2\Åp\ÂEU/G)\ìx\ÂÐ¥\0¨ZšÏ¶ME\'@5£€~O\Ë\Óc`V./„¶J\Âø\Í8pyªŸý\Ý\Ìl\èf¯¯y­À\æ2Àw®½\ï\0D\Ê\Äúk{Ï„Á\É`\Ö¾hq\ëcS9\è`?NZ³´hšóZ\é\ç	¯û™\Õ}â…º´‹w\ì\Ê\Ì\ÓZÿcø^}\æe6X›\éø\n]˜\é˜_¨6O\í)\äag½\Ù1OxDŠ¦Zè–‘½Ua®\Õ`Æ±ð}‰‹®n¨ô$[Xj¥»cª°kùó\ä8{\ÔmRÅž¸ò\àþ\Ã[\Û=—-ò\ì>£\Ùi\"\ÉU†²0F\Õ(ú\Õ9iúdæ¿\Ê2‹3•~Z\ß÷“÷sŸ\\€\îI\ÊüV_f*JD·ÿc%«¸HZ‘?:\0ñ<4º\ÌLK¯e¡um­|\ÂLô\Ë\È³üU–\É\0\êp¼O\ÊÜ§cšƒ²K7öº\Èy\"0›ø\Î\ßÌš•[—½ðm3«E÷\éRÔ²À„;Ir¨\Ì3”Y–\ã\å \'Un¬ö	³?Bzz8\ê®X\ÂX\Ìi8ò\ë£8\"\Øõ4;µ¹\ìaº¥Å‚Ið\ãL\Ë\n¨›0½\æ}x‰5Èºvt“\Þd“\ìõçº»2vð¸\'\à&öK¥“`c!º\Â,e\r¶\Þ÷q…Í±^ˆz–Å³»ˆ.ï•£\Ò\ï\Æ\â´ðŽN|š­OùP\Üg»Ñ©—Ae²\â¬Õ¦h\Æ\ÚrrB3D™Á},=2\ÖÐ£²®)?¾>\ÊMµ˜^}\ËÊ¶X\ÈL\Þ|*L¦®Q\êŽV	\à/û\Ï4j:>D\álœ\Ãv+ªr)ŠÄ¨˜”öš•„]\Ô1I‡3®ý*\Ñe\âŸ:HÓù=¢f^e¥•@#ªqˆ•ê«•ÿ\à˜ÿÿe7óL\'\'s¶¯²\Âq\é=2s\éù›Î‡\ì¹k³£Y¹\Ï~d;‹+O\Å\Ì-†Û–¿-\é+D:\Ê\\À:t„h²Dub)r§r=\ï2\â.‘½¿4S\åKø\×\\kh«	cs¾\Ö”\×D\ã\é1Á}ÅŽy\"n¤JDHP`tRœŒqœ·Á†®@X0ø~ý®R-¯cBv{š.Y—ˆ>)½—·\ì\î?\0€9’°‰\0ÿ…€•\ÏB¬\èù\Ô\êS\ã\Ú_†\Îl\Ã_¿?–|¼õÝ„wMzy.&+}Lj\ÖržüÉ¼:¦` ªªz”˜[\Éæ¯º\ê\ÖXI,D‘~uf\á]ö\ÉMUe ýYøÄ¨ñ\0^\r\ê}1\ÄúfDüþµo:µŒ@9Š\ÄrI©«ö\'ªYL@B–ð\ã\Ö*¿©@P²®>\ZyÓ”#\Ò\×\í\âMúô\â4GL2i^\Í%Wò\Ç[Ið[\ÏJ~þŸ©\ï\Ï	Rtpµ®(úü\ä	IZJ9z“\Íð¤qt“„w}K!Õ†•ù\Ù\Ë3ú>õa§0|;ú\n\Ý\×r®)m\×tu¨\ÐÉ¨F\å¤x?¸\Ð\ïl\Â0¾ÿ,\èð)Ê¨D¸‘LŒ\Å\rðFl¤%£y>ò¤Qžó`y7ÿªji;H\Óù\ÐbXÁ8£8\åV\"Ö“Ga,:\×Z£\Ñ\ÔX¯µ–£\ì\\‰\í%IÀ¯h.gzRs˜%\Ñ*h•\è”\á¾ó½Nxo\í\ÃÓ¸¯üõ²\è]m*mhš·£Ê¯öC\ï\Ä\\\ä4jZ\è§3\ÑH:Z’¼\ÂGZ~\Ä~\ä/D\ÆN%A&\ÏYô]\ZAfÇ“bI›\ã­\Ûn›]\Çý\èXd%½Ä½X¥\×z\ÐugC\âÀùß—“¸wˆ\Ú\âú´K\Ð\Ã!8¢©«K\ä¸÷¡ƒÍŽ<¹/#–‡\Í^¼@\ïgô]øMœµ~›­¹¦a“Z–¥p£-}²2<-q-1´±½y¾m@ð54ª\îQLÙ¸£\Ê\Ì\ÉIŠÏ²\Î\ï¼)QŠ@]®šÆº?\r!…”\\õ4ûZO6f*bxyjtEM\åúuõ<ü¬ˆ*\áø$ø½³½&\ÇvAQ¾|Ï¿z\ìu¦\\?}c§\ëu\Z48S¸y±©§Þ´\nÏºTÌ´a„8\"\"^~ñ©ûf\Ó\ß&#¹“7Óµù	ú\Ñy	\Ü\æ>•\î\ß„\à V\Ï\ä¼f{šÛŠ}^Ó²F²Á˜“j\'\Ø\'\Ý^Î«Äš=oV¦÷$$&ÒªmšLa\Þb¥x\'?Rs(óWx\Z¬pP!»`ú\ãhv¢\rŸYqJnšbþ¥/#‹™¡ŽL˜&¨I 8™ \r}¨qþC\Ø\æ1$Í›\Ò\à]¬?\"\Ä|J2áŸšñ”\Í\Âd\'ñ3©<#G¥‰.#-òä½”0Àv\Ã#\îf)\áI\ÒqÚ†=\ÊQúya/_R\äyaõb\í¸N™O\ç²\×ó¿\çfQ\Z—¬5Y{Œ\È\àT–}µZ˜6\Â\Ö\äBL„d$\Ç}„†nC‘Xv!9x@7*Q´\äõ\Ñ\"j\Ê~´$¸\'LY™“P\ï<†zºóº¹\ï˜#\ãøG»\êozTºMt/b“X™ñ\êûd!ƒ\âÔ“\í¾úLuš\ÉüF|Ùƒ„a\Þž¶].<w\æ\ÓKEV‹DÜ„\ßrE`¥ÿ¯\Å[}~îš¢\Ó\ä>ª…¨R‚`’Àäµ \Ï*šY\Õ5-x;T¾A 	752t?ùl\\OVh\Ò\0J±\Ý±Ä ùò6„µ\n\á‰Ã¸1¾\ã1\ÓKz9;p6úŽ\ã1F}oL\Îc&˜K¸±~\Åz:¯Ex¹X“\nc‡Š?*µ¯º_Ó™s_/I{œ¯\Ø]ˆj\Î\r ~\ë¤kuJ*U“©Á&,\ÑøAB\ÏW{©}\ï”w¥¸š!dh}½ÑµY\ng\Ý(r›8VF\ã.lDT\ÐG\æPå“–\Âi	qh\ë¬IÔ´›öÃˆ\Ë_tª4\Ø:Rµ¦%‘R\rÀÐ€>l¤\ØL\0¤0@<\éÃ¢;«\í\é‹~\ßY¸¿\Öa\ÃP#¥\Å\Ã-¹Ñ¨÷\n\'µ=7¨ž\á¦\ÅIýý\Õ` g\ZT•TU1-8t3hw¬¤·B\ç½n¼ôB¸\è\î\à\×I‚‚4\Ò6\Í\Ô(ñt8U,\ÊXEs2*\â¶$ñ¼”y·¹*SŽø,.—*f.\ÃýEqmhFŽo¹ó\Â\\&>¶\"\Ò&J Á°D\Ò\Æc>¢öƒg0\Åwsû\Å4nžNqq\Í\ß[ij\Â\á\Ü\Ý)‡:‚þµ@\Ý\Ï\ZW\\l\é\Î×ªrP\ãú€Æ …Œ7Êª\é[ZyqWK\0‘­À©f\Â9Œ9Ö´k(\Øz4b	\Ä*x_ÁJ°€4bbp’‰\ã7½Ul†X\ëI‹·´¾\0Â­\ådpZ„N\É:s1·²\èó\è;Þ²\Ú\Ê\Ï,˜Ž^\n²ž\Ì÷žqfc…`‰\Ì2¶o±\ÜhÿÁÊ‘}AK\ØKm0%\ØJ\áø\Ë2.\Òfq¬WX\Ë^	OaQz\Ä=k¥ž\ég‡høý,\Z*ñ4$­—Ÿ³\á!Oƒô%g½T\"˜™‚5jÜM8tH$-q	¬\æ¨u{3	ü7¤DzN´ôÌ—\ì©\n]ôš \rB`\Úó±Šv\\°(\ìƒ~3MBþ¥µ!júõ\î0\í‡za8S[·º…m–ô\Ë}..‘™©¤žyœ¤\ë“7¤¸ù8¯#x4dzüš\ËÉ‹&,F.š”\ï)Jf\\\Î\Î@\Ù\áü€‰)Ÿ\\>\ÔMgL\àe\Ì\Ýw‰O=\Å0.Á\ÒR\Ès\è\ß>Ø)´mö[‰mŸ,\îÐŒC\ÂI%óZ³\×õJLu·@\\\íú\ï\ÓðPcùyý²U\æzÃ„¨W‰&\ÞgXoù\Ç\Î¾\ïmK\ç\"\ÇyW4ó¡Þ€ùÈ±¦›°Ÿþ\ÛÃy-n»[¨®%˜£«3¥®\ÞDO‰J•\Î?\â\Þ6qSñ§¤\ì×¾¹\ÛJ\rq\ï\ä%±\Òýv<}Ü€?a`%oF\êRô³m~·d¹õòJ3O:lj¹4\Ê]\ÐP\×\Ç*-\Þå¨¾2´îª‡Œ?¹›6^c\ç0\×G÷\Ø\Íy»&4›%&¦]À\ë\Þ`/›ô‰?9·4\Ô\è£¯˜4¯t˜ý2\Ég\n¹`N°Rº\ÙQ=1§¥\ÆKúHTa^\Å\É\ßRˆ»™\Ä\çefiF@1Ojµø¯\Ë3h©™=\Ès­\á\ÖýW¬ýu´À°\ZX\Z|€\Ñ>9\È\0\ËSÒ‡\ÂQ;ú3¿\Îø\Û+3½\Ê\Ï:aO\Äœ1ÀÀ¤\â’x·Y,\ï¾£\ãÅ­÷tnmŠ¨N¥LafÝ•+D„\Øà¬œB¬¥õ\ãG<\Êý¢`yO62š(p\Þ8§q\0nJ\n\ßi(?X\ÜÃ‚9Ê bú\É_\Â8Û¡¹A.Ç“#ó~¨™\ë&_\ßö\È\Ó’o^l,	[euD	\Îm\Zƒ\æa÷\Þl\0¨³~H*\×Ã¸b\ÇüD\ä\çV\ï9Z\Ü$Œ)1¶\">[þ\ÙU”4Ú“­Œˆ\\ƒ’4*«\Ûp\×>\Æ\àÔˆF\Ò;1¿\ë>&\Ó3¸\íüoòXxZ!\ÓÊ·¾l™¦\ËE³Ö’\çô\0€ÿrX\Ìx£rôYQ­¦kGFü(?%K\æ˜\Ðô˜5ôga\Ï7û\Ð\Û\ìY¹•¦H›\ë	\n¬¿N“E`\ì6d\ß\Ç\í2ÉºvøÏ‡x\ï\'T\è$! J±5K°Ê{x–Œ„^R$\Çýð\Õi\Ü\ë\Ñ\ßbwYL­£eÀô]·\ß	\0\"ûf›Œ]×µ;Ÿ þ<™öCø²±³ \Ð\Õ\Zš\Ó(\à¢\íÚŠ\ÞûaBÚÿ5 ]„°ÿ…Ç‘Áp\ác\í:!ö\ê‰Z\È²k¶oåº±ÁÞŸ‹.\ì…ny@®\Î~m{™§7½\Ã¿þ\É\\|™.kþ‰œ|\Ìð§¶\æ8¬\í«\\®L\";®O4ú5I\n\Ê|.Ö›\×1\Ø\ÓF;Å·X?\ë\\M•Ñ„ø\Ö\çu&¸\\X¸®‡!\ÄðªwÌƒk2‘j<1Œò0?ù\ï·þw?\Ý\Þ \ÑT\È1\Âú<f\ÜÂ¤‹¢\Ï¯¹»¨ópzNc¯\ë•!ób9¬\ÏN_VµYj%XM\î€\Ù\Ãu\á:Ü±·ðÉˆ1?Œ8H¹\Ó\í_5[\ÆƒšG¬Ú–szQˆJm\"„Áu\çói§ˆ\Ìd†\ë×°žs$6(>k:\ÃGjA\"\ä›WT¯d\íô“\Þj›gô¢6Sµ\',\ÝDZs¤!š]\Ñ/—¡ˆÀ\0\0kHø–nC–¬š7F\Î^¯†hŸ÷…;¹L\æ¡X\è‚.¡\Î\Ï1X\Ôò£¸ýK\ÍõµÎŸ€xfK¯4-‰œ¸¨€\Ä<€Ù¢ö\Ü\ëç¹“g÷õ4!Up°5dxŽX\Ñ3\Èl*ð“;Á:\Ú\ÚqEAŠñ\'cx\r\n\ró\êf„Ý’©\Ï\ëø=$“¯%ú\Ó3a\ã\nD9—Ñ‰¯ X Yf	÷Z›M­sp„Á;HK\r¤?NfXI\ZFq\ËqSÝ\ëa†h\ç#6ª7\Ô¿?÷GsYc±\r…\Z„±54†\Ù\Ü÷_{…‡{\ë\ïm`rÁüñ»\î\ê¡)¼M3Ë¬~ç‘…÷¨\â|¸\"qº¹\í\Ìe‹n\ÂzŒ\nVM˜:\Ñu«Fm_ÀI(2ôl1bI\rúL¸rÀŠ\é5ª»9\ßC¢7¯Á\Ð\r~\Þ@v\Í\Ôw¯‰\Î\ÎPÉ£U_£L•\Zš¢Gf$ 0¶\ëö‚[o@ñ5žûL$0}/\â©l’û}P\Â!\ê’û²\ìhw‹\Ü?¹…>ý\Þ\É#\ÍV·‰	ZU®ÿµòýz*#\ÙG±•y‹»L{ÿÀ¯œr©X‹\åÚš-\r.^ž1\àªH*(6ôXÉ‹vHÊ¬¾ü¸b\èð‚\ê\åwÑ“ø\Éô³¾ø*83\"_†lä£¾nvŠ\'©ô(•6Sž¿gê•œ\\}¦¡\×yG\ÈôX´a2ÿ?¸*2pz‡@¨e\Ò`>¢6‰J®\Æ\Ä%E\Ôðä—e`x\ä‰LŸõT<Œ§m}z\'|‡V\ÙÉ·´·ÀgtI.Sz\à‚l\Ë\Ú\æ\ß(R\ÞÈ™·(¨Y\à¨ÕŠú1\É\éý³\Ï(ŠtªBòv\Ø+a€\ß:b\Én\Ü\åB¨yn€”-(SÖ’¦t®\ï\ì}\nX\êLþ¡³^Ÿ\ípªQw€/‚\Ü\Öd£e`•©®Jí‹\áIÈ¼œ: \Ë\ÙùJ\Ì/ —Mn¥}\át3bÜµ‰u…÷C­|Ï†	¤\Ù\n\\yöC9\Ä<2|V~°=Áµ\ÅHŒRÂ¹jŠ\àþ\Â_ÓŠ•`‘søg\Ã\ÙÚ‰¥\ç1j¡\ßÚ­ó`9½÷2 E\ß|¯F\ZÕŒÆ—ZsÀ,\"²\Ñ\ê˜Vª\È\ã\ÃX-a\ÊÇ\É~¼;\è\ÈY–\0\Ð1\ÚCº \êp\è\Õ\0\Ð&.\Ã\ènª\"\ï±ûWÿs?@b>\ÉŸ1”\ä! »1o¦]@aw©\Ú2ÿüÊ\Ãê—™Ž\Ë\×\ÃE–j7\æ\ä\Ô`\Û\ákº‚<TP\ç+´hñ	¬[\\uL_\å‡E,\ê\áõÎ{’;(÷D¶\îx¶?¾k+q\ÔRœ(^xxy®÷rA“ú\"f·=\ç\Ë\Ã\Îú\Ç\ÒÓ€©³N%XD‰©_\\\ê\ÇD\ìdÛ¤_’>\Ö\à6)1h˜»þñzÿ\ãñù2÷+\Å²OS‹wˆ#\á†H-<Lü3¼þI{\ÚEŸð7\ÍÚ¬\ÃVd%!\\f\Îq†S¢Œ-bÍ§w}Ž\ZÑ²Z§]\Ì@Z¥þ6b,7-N\Þ\\«7-=2ú$¯,\\þˆ\ìýx\ßj\ì”3\å\ç—*\\_p’\×H¨Ž^õò£f?H/a5\ã\ÜT»\ÅÛ«¾\Õ\Ð\ï\Ö÷X\Â\á–-ùH+¼¥ó \Î%öør¨&‰¢½D…­v ~n\ç‡ ‚p€\ïX\Þ&ý^;bIÏ¥\Zù–6\"zi\ìm®P‹Sñ\ç¨Ã€S\ß.ž}\Òù$÷\àñ\ß\ÚÖ±Ý‚ª\n`®JqÜ£,”ù™	bŠW…;2ôS\ÝÍª\0j2-…ûM1	“A@žUKOü\ÄbÚ¿F\ç™÷Fž‰ùÖ”Iùõe«-f4KI›e\Î¤Yu\Ñ¬\Ø¢7¯I]« \Í\Ê8ñ\ÔK]\ãa\Î7&›¾®ƒ}²û¢Ý›Áe$\íGÂ‰ø|o\Ï\è~ŸB9¦†\Éü#¤›\äö£J1h¹C4@wš•õ\Z\Þ\êÓ‘ð=áŠ’\é\Úk <\í\É\ë\Ü-\å~{\Ï\ß:\Ú\Z<®švØšÄ\ÐÁŽ \0›\">‘¯kN\ÒÌªš%—	D>7¤uŒú*‡–\â\î]ˆ\å\Ï\Ü\ÉË™¯-\Ý D\ãhX_Á¡^…ÿQ¥¸\Ö1\È\Ùqý\È,?\Ò@^ƒ\ÌQT\'…\Ã}€¢\ê0‚\î\Þù\è·†\âB«\Ë^’FPN\ãV`$’/K.pö\×W>{=;Jj\Þ?‘¤¥BzXu«ˆn\à“^,aQ\í¢ab\Òf\\\Ó\È=\Ñm†¿“¬*³ô\rôófþU\ß\Æ\\ A\Ð|.\×\Ç\Ðp8,B\Ã\Ë_\ç\Ç\ä\áóó®¡Ë¿©®·¾PòlBx©rG‹7…o\ëÀ%\Ö5t \'\îÁdŽ\rG+T\á6‡^@\r\å\Ö÷\ë¤qô·H“ŸŸ\Ã#	\æ=:;•º½\ÊA”ÿ¬°©5žûb-i±ù`†\â³MŸ#\Ðü\ë£fuW\Ù\äe1úc\"ñ‰iv 8\ÒPbŠªðP0’C\É1_7ñyx:\r±·Iþ\Ïñ(\r\ïñ\áàºˆù›\\O “†It\Ö_\ÒñKËµUBo€‰ó\ï\æBÚ‰;oxGRf# oµ	\Â\Ïsÿ>r@\"¹\Ü*aG\Ç\ç›B>\ç¾6Qg-\Ï\êµ\Ò51Àr\0,†xsÚ¹Aú4Y\åÿ¥ŒZ½\ÈÀŽY©Vv)¤‡AXe\å0l\"³•Cº®\\—Ñ¶\ÖFdÊ‚p\Ý,/\à/œWC\'¾\Ær¼x¶—úŸø¤üGTGÎ¬¸W¾œRI©\ãÐ†U\×À¥\Ë*Šð™¶NWE\ã%©C\é\Å%šE`V& X¶õ_5_{˜V¬eÁù>ˆ\çcL´`aü=vŸ:\Ï\Óð\'©q\"\Ñ[\Ò5¬,t¨\0aG}Û­\ëº\ßsÛ[Ý€ƒ™ !p\Çd\é[\ÈPbˆ?ÿf¤1ø2š[¸{…ûû\Îü-%GÖ þ\Zù<\ÑÌ¾\éŠ\'\Ñ\æxŸW\Å43¥6¯Z \é\Ó4¬ó[…\âœP­\Æ \îŽ2x\Ã\âb\ÝPi%°fT~{ó*R\Ò^À ŸQ?—{f,‚öŒ\Ïd•>GgøÂ‡£fW7nšZ\Ôd6t¾\èQ_úZÙ°\\ÆŸZ§\\\Z\Ë(Á È¨\È\é‡&©%e/Kg~°\ëô2<3[&\ÌJóT\ê9\Þ\\I¾þô£¨¿\ÇOc1½¤Ÿõ\Æ\ÊÂŸ\ÙUTÆ‚04/¯ØšÄ©H~bŠG\É^}\0¹LV©Ó†\àlYøO\Í\à\åug Y¿£®¿\Ì N&\n+S\âª0\â>F}	f\ëcGµ\Î>cz™\Êxß‹\î ¾0É»\Ïfh|ñmúoùxÐŒVzq€£j¡¡Å¡ñUI·\åñ’\ä{žI‚òh°\çÌ½/\Z\×-×˜ÂšuûGó	9\Â}j \Òó74•e¹±ƒ@û÷ÛŠ~\Ý\ß\"]Ž\î]N[\áˆÿ•\ÛB\r\éFm¦\'ƒ£>Ÿe¸ŒÇº¶X0\ë\ãb–\íj,©¡¼¹^«·€•!a\Ä\í½ú‹\Ýê¨¬\îöö]¤h˜±\É14˜s»\îð$Ó¾™/n\Öþ«V1h\ÝH’NáŒšRöŒ\Z[N€S‡ðÏ¡vŒ\ÒO6\Îö4¿D^ý¨\Þû„òWw\ÐÅ›XÿEFp\ÞlRmJ!I‰t\ÃÇ·\ä\r”I©*½ j\Ñ\áE\æ±À{§\é•M’BQ/\Ó\í\ìFô€~&\0Fº¾¦>E \ä\ÃÿL³s\'òÅž:\Ò?b\Â\rm+¹›‹\"\á\çx\ï¾l\Ý{w›¦\Ó\ç³\â¾\Ã;Gª´z\rkzz\Èwy\Z\'nœˆk°?r2F`ò\ì@³&J8<O‰\è±ë½œ¬œ\Ã}“”¦³z‡`s8\02k¬p\Åt ýM\ï+\Ýù…ù\æÁš.‘©Uja`º\á£Ú”ÂŒÛ¨\ÄrôpE\Ïp¾\ÜE)™\É\Ìò,O\àˆ(•|}\æFC%2/+²–Ø½ö\ã\ä\ÄtpfXh1y—\à·Ra¢¸\àiuG¸¹m\nL{u\Ò\æYH„*o\'‹hˆV‘¨e¥\Ü5Í¨u<\ÑH\01/©å»®ÌŽ\Î\èM²‰Ÿ]ƒŠ„7w\ë\Öm]\Îj¥3aú\ÂI?Ÿ5Ø‘<\çLž‹œ[¨HpS—ÏŒp\î´\×0„ð€†a(†CZ“G\n\ÔI\Å\è\Ù0BM\ï–M¾¨z’ÙŽzü–5_\ÎP<$‰÷‹\ëS×¾ow\ê+‰MŠ°\Äb\ÅÁA²¸Ya\ÇaZhò£õ\Â$³fm™2;ø\ï‘þ²‡Ã³£[{FË–‚ÖŠŸ|\É1­zCŽþ\Å@.•†\Ô`R ó…˜C[fz+Á1r™¬@…m‹\îÀ©0µy\Î\á.”ò\È+²~­¯^º2?áŸT§UÝª\ã’Ì°\Ü \ç—\Ö\Ì\Ä2EBDl]LŸ»\ë‘Lt\ÍôF†TR¦Kž„u$\ìuùÀ‚<ª)G\Ñz;Z\ÜXF\Ü\ß6\êú\\„Nö¬ûJe-\àÜµ¡\n…7:ÏŸAb¦pÉ•Û®®‰\Äÿ”Œ=É…þ\á.oNz\ÈG“©(qN?÷«lzC`\ìù÷2\"±\ÃU$ó\Ð!QøB«8‰5´Þ¼\àúb)lO%¯=ˆ‚\é\ã°4Œ’M‡š®*œ¬$˜%D¶;¸\ä\Ç}TÉƒh!\Éof^’F\Èo.H³¡„c\Ûz\ßX}0`\0¤ýF\Í\\\Ò•›\èeû\Õ«\äŸ~S’cj)l$}\Û}ï„·s\ÊmrsŠõ·•\r¿\×ô»³vû‰²L_\äj¼†Ÿÿ<?+nµ/+”¬@Ÿo¡—’\íÄ¨5,\Ù\Íf6\'`p;¸Á¤ºôšYn\nTÿWP€DGýe\Ú[qŠ¹O\Ùw¿4&µ­§\Â*óq!\ê?˜´©\Ü\ìuÁr\ÐIx>úñ¥\ï\Þ\rò\áG÷,Z\Ã\Û\Ä.\r¦¶;4K·6\É*RZWƒ\íúÿ\Ã‚«ûZ9Î‘Þ‹Gô\âvNWðóZ±%>>ð\0¨O’¼	½\Òqtï˜Š¨>¹»š\ëP¶z\æc\ìS®\íÉºo\Ê\ZÚ²\ìö\ÝÛ¦jÖ¾A“ó\ÉO™ñŒl–¤ú\ä\Ø:ðƒ\Úþ0;K\ÇuV7ù·U\áž?—,-i±Qi`E\Ê\ØŽöø\Æ\èVz¿ýMª×­<	Ï>š\×b‹š\ÅS-¨¼Ð·O¤zy\ß=w\ã¥\ïƒ5‚d\î\\ª\Ã—\ëe\í	“âƒ<\á­C\ÏG¡/Š›:b\Ñ=¯\ÇZ\Ö\æ\Ûl¦þ¾V#\Ärªox*µ^\ßüO\Îl~@\Úb\íØº\Èý–\n!\å=]n‹4¼\ÛG4š~´“Eø-8Ç«9™‚õ\ÅX›X†ý·nL<Ÿ\É<Bl\Ì\"U\È\Ðj\é´\Ö\ÕØ‡÷tRût\ìLŒWB2\ß\nÃƒ6@P‚\Í(9\ß 9Gôp\è“Ár‘#÷\æ\Íf›uüGR4•<X…ª}\'÷2\Ã:&Z\æ¸\\Æ³©ITC¢Q\à\ê%%gþ[`\nG\Ýr€³\ßL¢¦¦Äƒ—s.Ñ’\á,±]ºúKˆ\Æ\r>Ã§§ªªJE¨¦¹/B¯6Û·÷9\0–•Q\ä\è\Â6…bP\ä\Ùñ\Ì^QÜ¡nÀ§Š/[d|%\Æ\ìi‘¥\ë‹|ô— Á\ÖÁs®ó\Íl×¾\Ú\âqDôÚ¨Ÿ  ±‡€f t\"½\×\îb\áò\å0Ü€\åp@™\Èþ³†.\ÃSuþ¨%šeV3\âöO6 \Æ\Ç[›¾ÃŸC\nƒŒcr]Ô”}´\0(fOX\ÇO“ûžB \ß\ê/®Ù¤™\íaœµ®&<‡0áƒœ\ÜF/\ÆòØ²-1k£hšD_€\Ãf±\ä\ß‚zk\Ü¾õoœ¸±fƒ%\çð\ëUý£\ì%¾R\áH£Oò’½t™\Ç\05GÀ›‡\ße\ä\\õ£\×ùe¯ Z¼ü\éð³¦ôºp™ûO\Ñêž®\Ð\"¶NåŒ½¾\ÂiZ¢œ\×ø®¥øž\Öi\ÇJ4ó:°+‡\0˜J¿}\ÑS6„96¥|qˆ+yÓ­mü¢ü…¼‹oÔ Ê„®T±1‘\ÙnW“\ï0\ã\ãë”…l;F-\â\ÈÁ7š,HUä½¨\ëT(cDª\â1q\"pf€û\î±j…KÓ² Tþ8\r„UF÷¡\ZaÈ›³ŠšôRö\ËZb8Á…\ÑeafPvˆ\ÛOnyÐ§.¤\Â\ZIò^†£ðI\ê\ä`°;Pb(¹üxˆb\ég ®•\ÏÊ„{xv€S—Á¥dw^ýž\âú\Ñß<5\Í^o\çbÑ¯~iñQõl&œ@¬3WN<Ê·\éúï—ŽzýAwwI•‚\×	\ß\Ç2ƒ\î>]„÷¾5SŽq\âö\ç9(¼¤`µ6hØ‚\ä\Ï!\Ï<V¡ž‹\ÚÈ¯eZ\ç•ë¬œðŸ<·04y=üb	=Ÿõ\ã\Ð5Û§òsð9\à-I-µ5q“kf‰…r\ÆV§]x¬nøw9>K~\0›\äa1!yÓ±~¨\ÕN>°7y¡\Ï\n^ f\êÀ\'´\å\à7»)5‰}\æNÕ›NÞ»be¿Ÿ”$ûûñ\èdœ\ß\Ôtpùø{¹\r\×\ì¥’qüø\Ôˆ\Ö3D]\à\î\"¿YL\Ù&ü±{\"\â8‘\ßö\\Bd\ÎRR\\¶¹ût7M\Í÷‡3\ß#š£\ÙÝ˜¨ª¿z~\Ú\éU3ùò\Ø1s\×8\Ï9\å*´1‚#u>Ý¿l³8€ž\ØH\ï\æ“Iq\â`ÿ„\Ñ¬HÃª\Õ6N\Ó\\V\Ø\ì&ó4hnò8³U>G|užS~CTß­\n\ÆRÑð}6ùyF~\ëÀgl4\\9$²;©…¹b§%R\ì5„f@Œ\×\ã¥\Åß¡\ÜE\Õúˆ™\×ÁJªRqP\ÃÇ¢\ßx•ûE…zWó“s\är\ç)L0c¼dJŽv*½º\r?Y\Ì_\ÖÃ¢#\ê6cy„e ®\×{Ê¸\Ð\ê*;R]Xsq\ËÒ¼ÀJ–œt²ùJÜ“\çi—z”\ÇBµ\äüQ\è4r\Ä\Í÷¤B¦<ñýù<@±xoö&pfXš¸\íR*\Z¿™SBp—\âLÎ»TQHAMV]¬8\Zx\ßÿU0ùsOÍ€.XÁñ†³\é§\é¤M\Z’\ÏvŸvJD\Ï;Vªet:%c’yTL&Œ\ç\ïuBÕ‰\â1|W{¯õ¸úù\ìM$û\åpX¢>q\åQ!¸_ýJúl&NT\'¦\ÐJP(4½m¾4ß»w\Ú\àc\Øa\î\0ôÔŸž\ZÐ¯\ßô«É¯¬¶bô,²&\Ì|…!\Ð)WTU¶°\Zs‰¶ý\íº5Žß°¤3<yÝ…,0XK&mi¦\ÄvC÷ BNšd\ÜS)y*\Ä9\Z„_ª\ÐpÝ—NYÞ±³ø~:\îs7¸À]¡\äub¾­³ß“\ÞBŒºb\í\n\Ú_9&M»TMaA’\ß\Z›\æ\Ñ&\Ñ÷¬:\æk©n›\044R—H2“eE\Å\Êë£¯N\ÖVuË–\Þ,\rIH\é\Ý&”w5ÿj¼ì™³·f•¥„<•Y¤ñ9\éK\æ_\ìtŠ.)™´\âõ­\ì˜\ÊBö>?»A\Ø\Õ\È\Ù% \Õg!Sm†N\Ã8\Òüzx0?\è\Å{‹\ÎÑ¯l+£$8?yh\Î\Z}TŽ\áa{PŒ=\ÖÖ ó»’u\Ê:[\Â)uÇ‰c\n}$SW‰bb‡G\Zc%!û!C8G\Ì\Îaø”´F.F9v±¶÷\â\çm–ôpqj\Zº‚œKíœ¬W2\×M\ÙuÃ²1Ã¿’!A©\á—X›~ÆšÅ²*58>6\Ä\êO\Ô&v\Z•\Ï\ÎPR\ä\'A”-+zF\ìù»\×û\è\Í4;\×Á,æ¿»Cw£Ü€\ç¨j¶x\ëš9Œ\ìJŽo\å?šó}ô\ë \Ó>j\Ñ\Ã>)\Ü6‹\Ô\ß:0CÀ\\-y\Í=÷œ®‘\ÎX$½¯†N%\âÄ¬»3\ç€vAE&\îK\Ö8Dp\Â\ç»ÏŸ\áê•\Ò#Ø½\î, §g™ZX2ˆ\ï:\âf\ãýXƒ\ÕX\Ú\Í\Í\Ù\Ü˜úþ»\î`\ëJú¥m8I?“«\Ð\à$\ßoÉ˜w^\Ñ\íH“pg¦/\r<pþÁQcc±ô&Y\"Jú“ój%<ÁHï§V@º6‰~|f_m@—\Õ\â \ïJS__	¸k\Z7\Ú\î\Ø}!šÀ\Ñ_\îþ/O38\ÛôaMd/\áLÉ¯\"ñŒ	Ö˜•:N\Û%±MY#½°Â‚zfþ\í^D•:ñ\Ù\ê\Ç_ù\'ûrLøg\Êhž°\Z“ºhÝ³pº‰ûÀ+;±\í—ÏG“X_6Á•w\â\Z¼ó\Ì-Ÿ»*Ð¥\Ó)?g[B\Ùg\ìt\è=	P*\í–J4¿n¬\Õö\åŒ\ß\0l¯\è½o\ã~\Ã(Où²Ž\ÝÛ£¹»C\ÌK†¾ú+mz½@\Ä;\ZÁ>uPsð¡\àÅºÍ¹\Ózsd@o\ëñ\èO\ØH\ï\ÊZ“+\Ð\Ø\"Xž{œj¢\êw\0lY¨Áþïœ\ÌD¶Â©pœŒy§\ËH@\å\Þ\è\åó\ÖT\Ô}ºn,.²ù\â4A\ä­\è-·P%|k%!\ÑL\Ã»ÿŽ\Ô4‹‡u¤\Û)‡/	anv:\Z´\Ñ$¯¶¬ó:£«Ô·P{>a*wo³\Ý\È\ïØ€–\r¨\Û\æ˜gÐƒ™\n–ÀjM\æûSE\Ëp\Îô\ÙLt\Ò@¡ô°\Ì‘ú\çI>t}xò·µ\0\ì\Ï-T$ð]™A/ \ÛòX\Óz¨7\å\Æ`…];\é2¡\Ùú´>gÿ…lÊŽu´\ÑùUÓ•º\åN8\ÂV[\Ý\Î[V\08C§\\eöc#\Îóz;—\n°þGV˜.\ÝV4\Ð#l¿\ÝŒv6\Ä`<Ár\'¯\Þh\á5Gš\Ðh*;„ˆ\å\×H9\Ðô~\È1:2+\Ú`{O\\\Ò\ÔUˆ_]:£N¯úDÙ½¯6\Èfl\ß\åjP¥Ç©4 ½’5xI\n\Üs;}M_]\è\â—HLâ¡šc¡ºp+(nÚ»x\Úg¬\ÌGD2ƒ\Ã\r”e\0C¶\àSð‰tÜ·—ö&8C*ÿ^ü¤\Õhvš†Uû²\ÞX™ f0N,‰ôy\Ð\å+8¢\Ç9^is\Ò.¼È…,C\"Æ¢]{ƒA¡¸SHF–ƒ®Ë…\àKb“\Ëõ\×\ãD©\Î9.‡\Ï\è\îDü#4cs¨•™	«¡/V\n9þH_?HüÄ] \r=¿\Ð\íŽ)L°\Æa u^Œ\è6u\éW\ÖbO‡FþÀ¤µxÛ„	@¯À\\s\Ý™ Z5€¡^DUnÊ•C\Ù*¸w  \Ð\ïŽö)b¿\ã3&Ÿ\ë|½)$h\Èxò®ˆ\Þ\Íõ¶?\Êe\ìkJ³$~!\ÇþHõ\ÕIb[*©\×<ù¤TgÞ¯d†ŒI¸>‘\åajÿƒbV©p”\â=>	E¡\å\ë \Òn6¢E‹…jH\É\í\"p0•kõ(›‰r\Ã\×I¿Y6¤Èšƒœ3ðIÅš/b\Ï[¼›Œ\ËÂ¯€•\Ç\Ä_™¦£.¦\ì\îÿ}\×Ë¤´\å(8oK¹r3¡\ã¬B¼wžF†]ý9#½‘ùùˆš©ó¾\Æn0Çƒ\Í\ØÞ§¤!,\Þ\0UÈ‰½V3\Ð~-«h\Ø\É\Â\Ú*w\ÏE%‡\æ$& *¸u•£k\Ë\Z\ØgZXsdAÿ‡S\Þ\Êß™W\îC¿rŒQ¼_7J±°Q;\è\ï\\IYÝ™™’66ez§’Ð®{Hw|Õ‘­‹<\Õ+C\î\ÏÉµ:»š\îZt\é&¿<\n=¸;¹ølœG\æš\Î\Ô	m\Â&\Øq]O_\Õ=mƒW¡\Âôs·¨„œ©»®pD6{÷	èža›­f+\Ó Í¾Â¶oë´±,+rÞ¯y\É\Ñr&úü\ãg“\Ëò@$õ<Ÿ\Òü¸h]g¼¾À ’¿!H\îsV3œ\Zp¿\Ís8o\â—þ[\äŒ4æˆ‹#1·&÷Àþ³ô\àxš»\Ó‰Bc¥\0Ê…J†Qgþ·ñBF[!\Øè­ª˜\ï@\Ì\îÞ«µ¤¨VU\ã\Í\ê\ÆUH\îM\Ä>o¾Dyœû¦½¿]Q”M7F\";Ñ±2£ƒm½¼µ\ä4S~\Óm\Ô.¨\Ï\æ7Fù…À¾‰É œ[%”­oTñü$\ë÷ÿD)BŸgö™¶+\Æ Œ–^\Äch¸;Ÿ›\ï‚\ì\í$8È¦\'Œ:\ä\Û\àþ/û=lz“ö¬†¶›\Ä+\ÙQ[bÞ©±Oõ«ýÀ¯Ào\ÌA\àF ¢cÁ:„\è}F„^\Ð4\"\Ò_g\ë°\ÕO«p\Ûeð\ãC§B¡–\âšzcl\ìV¼Ž6\0o€±QÚ©>ª\í\ÃÛ¡mû\ï0.S\'¢\é¼jœH\0<G\Ò³\"µ<¸]B\0`bF\nYœXfûüž¢bp~\È9ù$\Ä\Ð‰pñ§É¨_°E¹œz\Ì$\"{û(<W\ç[Û™v<0ý\ï\Ê\Æ\ç\Øô#ú÷”ún \Ì\énduœ\î‹\âu\åœ)l_\Ínµø\í\Ù?eq‚\Â0\Z˜Õ¨ò\å1¢B\â‡onUQ™>)¥±\áyNQ5Ð»{}Ì©Ë¢µ|z‚ºx\éð·Á·¤D=,,\æ\â\ã\è\ßR>”\Í²Œ\îP»}\Öö«H-ÿ—\äq.¿‰^\Ô\îBj¢|9ª/\Õvú‡\Ê{p…ª‹Ž|¶ hV8iã°’ù\Å`œ A)U\É\ÄÃœ—÷\'y\ÂF ø\Î\ãs2*yDT\îJI>:lkü\Îg,‰ö\Ò{¼SU™¹!F€Âœ\ïL¿\Ò[£l‹šú5Á\Ñ)„«Aý¿£†Á“ŠhÁ\ï–zw\ê…\ë–\Év_xd°Ã˜\Å\Ò~©	\æz}À\Û\â‡ö0ñ¶¶~º@\çPxQiÇ§£\Ö\"e}‘wo&#Ÿ\Í[w{5r}“‡œ\àƒò<e¦’\ÂÅ[IŒ&\Æ\Ç\Ä%\åX‚:vXBc[{Á‹»\Ù#¸÷)«¼j´Q\ÛcMe\ãga\áK\ë+¯VKŽrU\ÖÚ™\Ñc0-Gó\êQ/bxnudNÂ™=kª\Z\ï~á£»w\Z$_c\Å÷-Úµ¢V_[Žûô—fP £yñ©\Å<\Í6\Æb\å\î9ª	+¤ B¢3žFýŠ±}Ï¾FŸ\é\Ïöo‹µH\"4¿„\Ì[•a¢UZóQt\ãý—xŒ*µ\ÂmYRZýG€·„hˆ*‡Ÿuh;œ\Z¬¤\Öboùñ\r6\rk\ìA“§@‘™V¸†\æ6•\åÐ«_þIƒÁlu0£¨,´}ª7\Û:Jõ\àš\Ý\Ù\Ø\íšN¯°^\çPŒ\Ù\Ç\Ñ\ï[·Vª:Jö`‰	ö—ÚŸ;\í´\í\Åoâƒ‰bh™\ç3,‹e¸þ¾K  Cp“hö^É¦\ÂÿŠ˜†ö!\æ§>>\0<yº•,æ\åª|¬pb\à`u¬\è\Ç]\Ñ\ÊQæ­ƒ\0ª«‚\×@7„ëœ“\î\íó_\Ñ\Ãy\èÊ»\Â^3uóöŽ†bqQ$[·\Ò~Ñ·®<iyz\ÅC…£K\ã—3\Í\ãF£\Ýl!4Îµõ¢pf¬€­\Ñjð4_\n•mB¼\É\Ò&\ï=Tž_Œ\ß=\Zð÷\Â;S‡Y\Î.*´	‚vPûÿu´¡šN\æ\ÍS \ËBBµŠ\Ð*;\ïR·\â\æa©m‰–qbƒ^\Õ\Û`T8i\ZYq¹;O’w0«Í”¨ŠuxE#½ýI\ãt>\Ý(½›o\Ö\Ø\Ð\Â\È\ê¶\Ér\ëµú»œ g\Êv¹ˆ\Ì\ãý\í\ê\Æ\æV†Ô²r\Ï,´=“a\ØD\ÇU„Ÿ\'O÷#¹xØªwø¡\ée¦98«*\ì7\éVú\ävu\ï“t\ë ÷\Þüc\àÿ°Â³}»Ke\ã\íƒþÀ\Å74z\çs¼;¾N*\Õ\\Švõ­³‘d)1\èO‚\Ãz{\é\ËÀƒ\ëNÙ£\Ò\Ú@ý²\ÌÁ„}U÷=\ß\ßqfV\ß~ŸóŠ\Ý6#CiS³®¹x|‚\Ö\Ê\ÊÂ\ÖXØ[d\é+0*~·B“K\îþcì»«\Ñ\Ëþ\0Á”\çv\é8Unz\\\0±Ò«\Zc”TÝ¨£œú+Zÿ,Œ÷¤€õ\Í6¨\Zy\ìi+\í+·\Ç{\Ã@§\è\êI)\ÛZ\ïžtªÈŠè£·w¼Š\'ùˆ%Jz™z+MÞ¬\Ã Lø‘u©\Ç`qŽK­\â(Cû\á 14]J\í?Ù£ø>½c\Â$\Ñ]›øœ:ÀC\ßÞ\èc²ö4{N\àS¶®gðy)Pwÿ\ç\'\Þ\ësö\ÛnEK]G	\Õð	¡Äª\Ëp…\î\ì¡\å\Ä#\×\×\çJ<Ž:¯\Ö\Ícxx+aºLž.\Z}¼\Ðm&I\ë¿c<ÿOg7[²YK\0_\ïÃ™»¶\çŽp“­\ÃO5Ï‚xGI\î\ÈW\Î%\ÎLú\Þ_${À{»!H^‘\é\Z\ßr÷fm\"‡hÝ¸x÷‚8\ÙŒýb9¦Œ\Ö1-ˆ\×ø\ÐBNì‡•=a›ðB/¿zmU!1Jh…É»	R#‘bšK)U’¬À`·i³øy¼¿(Y\ìMú\Øû\ãñWsÿûl˜®Q3v,\áó\Ò:,ÿù,\Èÿ”opŠ\×ß¸n–\Ãaû£Ò•Žˆdrò\Ç\æ™\Â<þsI6^3‘F‰7#”\Ì\×J+\Z\ê?]xÅB\æÄŸš#•c\âN|\ÃúndiR-E}¯Ä¾z´˜\ãŸu~\Ù\n{| \0dvZ4ª¿NX\ÒšÿrFó’\ß\æªü\ìŒ\ç³º\ï¼÷Àw²]‡4:›L7‡\Õs¨ú\É\ØH\ÊZke“!=A£ö>\Æes_$\ì©ò2ºË±]}c·!§ûŠ\\$>ûvE/ûu ¦$\Ú\ÞM2ú\ë§Ä—  X8¥°\à›\ã\ãŽuG÷|\àV!ow½­\Ç\Ã\ÐF°\å{BƒA\í=3¦5ýW²3\ßld‰U²\rŽ}V1\í¹\Öø\ã;Î¨i\ìŠ\Ëø\ã\Ð<µ>hÙµD8@ua.ÿû!Q\Ú`2:R=|\â<\ÅüKU€ræ®¾»?\íŸ\0nô»t€ÿW\ßò™‘…«8Û½¿YJ(e¾±ŽJ\ç.¡S¹\æ\ÊbºG\\„z=p¨5\Æj‘hpF¥ó#KÊ\Üÿ27Ù½+A6g c\á\Â\åYù°\Þù©²R\Ôy^>\àû¢K \'ŽW\Ý\ä,ö´¥?ˆ 8}\ÙKf¼=kvó=W\nh\ä»\Þ1\ÛÏŠ§4C˜GN‚\Ú~«\r-y#\ÊDWÏ¡˜!¸Ä¦v7\æ¤ ú¤\ê=¢\Õ-¿9K/‘‚\Ý7_È¶$…h\Øf\ÒH¢\í®ˆK7F_Àª@9‰þ\"˜\ØHÒ€5\ê$òöc0\Z\å\É[\á™\ãô\×UÄ²w‡L\×w˜¦˜óöKú‹\é%Y´a\ê‡4_øJj\Å\ær\âû´ƒ˜ôŸˆR6›Å„X<ù&òpû\Æ^N6?U1\à\ë@\à\ÅB,bŽ\åòSÄ¥PŽ=g­Fthyˆ¬VÿÑ¥/#µnÿÿ\Â\èE<PöRº#\áGH+1Ê—¯ø\îYx¢™Ô‚\éW\è—‹\é\à\ìÂƒ\í\ë\'¯\Þ#\î²\æOO\n·„­@¶z¯zf\Ðþ\Ö\È\"\Û^á¤Š\Ît\È\Öö\èj˜I$˜É–ºw\ß\Â\Ìô˜	 tqÅžlz|¬ jL°:IC,Á¹‡\ÜVw×·°0Wñ³‡óm\Ãü¾˜¢Ê£?›ó\á4…7\Â`¸nô\"µgÁµ3²\ßLD/¿@]¤›Rw3›\Ì\Ï\ÇXƒ\0÷ú\êA6mqò)¼daÁ0\ZQ\Ãðø€¸yõ®i!\Ý}¨\ÕDS:Z	–\Ï	g\ÚÁ\Ú\ÃÂ€Œ¶)6!:†±\éÿ…\å²\Ö\ê÷¸DS™\Ýþ\ëüÑ³ö	W¨\íi¼t]Š¿B#pö\é·Á\äR1Î–C	m<n˜§Ø®É^]z+ŸÊ¯\ïÿ1[k\ç#š¸:W1$ü†.ô¢\' xb¤\ãL\ê\nBˆ}\Ë\î¶\ï¼\ÏJ•\ì[ðW\Þö.¬\"w\ã•û\Ô4ch\ê&8)•ö\à_#›Ï¼¾@­iÿ‘\ìu\à“øeˆúiµ4$û…^¤ùD\ê\ÜÿcP³Wh.§ÿ‚ÌŒõA\Úk\Æ\Å\Ø\ìn\"L¿I\rþž…C£M£¤\0¦79\Ñ\Óf¶nCÈ½Srø	µc[|< aþ\Ú\Ëu¯üœ$kŸ3dwƒ~¡2ES¼\Ú\Ð\Øg7\á½u5€À¶…ýz\Ënñ²@(\âšò¥ö¹‡¬j\Éûùw\äI7½€\ë\á\ß$G¡\"\î|€YC‚ >©3‡x“\ä\é=e«\ËSr™{GÁiÿ·öT,­„Ÿi\ËT\Ú\ãýR‰·*óøm\\(4\é÷¨µC\ë\Ë\Ó\â9ì¬£\Z:BfIa?ð§È°d\ÐN	\Î\å¨\×M–d?‡|rlÀ4\\^	’³±’\Æô¼`@i+\Ú\ÙGŠ4¡Q;^m2\î2\È\Þ(4-þÙ‰h\Ï^O\Ü\ï“\"Pl¥b¼~\ápœ¦¸%M\Úv«x‰¿è¹œ¸\rvam”\Ï.vû\æ~h²ú¶Ú‰\ÚTWb²\Öx\æò˜ñv¢Íš*PŒ†\'L~Á­Œaj\çs\æLq§–Ÿl±†¬\å\êœÅ\Å\r\ÐY¼\rV™\ÝX$$ðkZ		‘ýõ\n=…t\0±¶œp­®VÎ—ª\0oO{±†j”4\ÛV¶zgC1”cÝ®.\nÏ¢‘\çþ‚\Z¯Ž§Œ\ÈX·3\×2@°5ýbÅ‰ï…©Ï •A£epg²´/\0\ç`M‡\Õ}f\×Ê¶JCT’¬7GG’\ËýÅ„!8“4q¯› \Ç÷“\ë\'vg›]-µ0\ç‡„úÂ\í,P,™\Íÿ(l¤¹»¢fØœ`Ì¾÷†\ÚT\×8\ÃD¥`\æx\\#È‘XHLS?\ë—ù³»\èº2y_C\ß\r\Ï\Óþ«#/\ÊN˜‹\Õ\ëN\êöGN¦m2È¬^,V’3\Ö4\ås™\ãû/b£ÈŠ\Ú®š&\èôv­¥k\ê7­4;ù$Ži‚G šc_óBZÝžVºú©¸w ·”’=\ÌZõ Aö-±µS\à€¶«\êóBì°¸®“‘ükl×œ«\Z’\íŠm9:\É\ë|©‹Í¾\0A1¸\ÈhWÔŽYcm¡Špø£~\Î:¡	”=„\ÓÑ¿5?Žo.\Î\nû8s\â\É;s\ÂD´\Ì/«\×&\Ì\Ý/R–ò\ÔUÿ—yúj>0)aBÀ0Xxž¢&³*F\äŸ\Zx@¼•‡fþ\ï+Cù\æ]\Úó\"£¢j3 øD¾¥;€š[Ë*ñû¯¢:†O›@‰l†I#	õ>­\Ù5óCGÁ\ÊöwT[K\æ\æŠõ\Ç\r“¬M~$b69\ÞÿUJMOŠZó\â\è•\Ë\Ì–\×\É%\íb¢oð5÷Nôš»CU\å°\Ô\'B\È\à¢ýŸk_\Ö?7TVaœ\Ä	Lu|\âGv\Æ(\ÔX…&n»¢E²\É\ípB0Nžp8+J\ào\ÕQ¤Ç¨»L{„\Ë\ßnIh\\d\è\è‰z3\"\à	at`\ÛA¿†.¨=O÷€83c\\-‹)v:\rc\Ã\Ä!(¼ý%\'!\ÐÇž\îpª\à	\"\âf9‰\Î\â¼di\ß\Â\í#qŒ\ÊZ#¥o1\Ï\×j;:O}‰À\×Tój²tÍ½@k“w=f\ç%QkIzs¾yš»\ç³\ä4C(`\è„G,‘‚{c:\Ãn0ve¹Q\" S\r\ÍUõ3˜~¬\è©\ï\Ðöªö·_ñUwˆT™Q=¬5\Î\Ê4kÒ…Ñ™A\ëªE<Œ?RG\ÏmÒ¶\Í_\Ï\ìP\ëðVpž+¬}§@rz§\ìLixQYT¨nñ!……¡\à\'¨Vl•3jÀÒëŠ½\ç¼{à»¡B\r×°(oB8A\í`<)ƒŽC\Âÿ¶@Xk¤•{­\æ¸v\éˆ0K}ñš®\Øf\n#°\ØeÑ›ª\ë0\â\Óy,€¶TPCVBpw\ç\ê…d\éP<¯_{DŸQ=ù.^’û@\ã½Q«ÁI8\éðY\ÕUD~ŽC‰¿Î…Mú\ÎEI8	v™uSA\æXV,‰‹}óš m»¶TTž³\rœ¨\ÏQµEuÿ4\äò \Â\ï¤©\È\Ó\É)dßŠnoU\Ñ\áÊœg†|†ƒ\çú¾Ep¿½æ‘œV‚t\0-F\Õ\â\è\n£X\å³\Î/>®¡Õ¥ý\Z\ê/ð{\Ü$ix P<™‘\å)eˆ}¨\ê\Ô2W\è©yK\r\Ä8@EUx\ÆÀ¬bo)g-\É\äO»»\"5kDõ^³Ñ»\är\"Ž8¼ó\Òx\Óòw8\\¸}=<\0QL)…€\ç(l\Ï(DAXG\ÌÓº\"ŸC2U’•N¦k‹?w\Ï\\Ë›–ew©Dð \æ.\ã|D¦Ü1\à\Ì\Ûø™tÀ\á¯L\Õ\à‘\Ø*W†„£\È\ïP#x\ä€\ÈÜ¥@ý‚1Åš\ìF\ëN>w<+·\á\â\ãš\\sHš\ä^V‹?eŸE Lf([b†¶\â?‹	ƒ¹Á¾º%”$Ü³®³&\é_\êI\"¼Uq8E|Õ†%\ß\Õ<ŠBo‡ÿº\ï?‚ùÿy8”\Ä\Åtá‹¯XF\É(aÀ\Ü \0\0',1200.00,3,1000.00);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quentity` decimal(10,2) DEFAULT NULL,
  `lastupdated` date DEFAULT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_item1_idx` (`item_id`),
  CONSTRAINT `fk_stock_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `grandtotal` decimal(10,2) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_user1_idx` (`user_id`),
  CONSTRAINT `fk_transaction_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'2024-10-22',2000.00,1);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionitem`
--

DROP TABLE IF EXISTS `transactionitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quentity` int DEFAULT NULL,
  `linetotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_has_item_item1_idx` (`item_id`),
  KEY `fk_transaction_has_item_transaction1_idx` (`transaction_id`),
  CONSTRAINT `fk_transaction_has_item_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `fk_transaction_has_item_transaction1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionitem`
--

LOCK TABLES `transactionitem` WRITE;
/*!40000 ALTER TABLE `transactionitem` DISABLE KEYS */;
INSERT INTO `transactionitem` VALUES (4,1,1,10,2000.00);
/*!40000 ALTER TABLE `transactionitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` text,
  `mobile` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userstatus_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_userstatus_idx` (`userstatus_id`),
  KEY `fk_user_role1_idx` (`role_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_userstatus` FOREIGN KEY (`userstatus_id`) REFERENCES `userstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gglakshan','$2a$10$SPOuROyThgtOuhVbYuMUY.IExDiPXFt6jGBeIYOeCQRezoVtra5HO','0765299841','gglakshan@gmail.com',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstatus`
--

DROP TABLE IF EXISTS `userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatus`
--

LOCK TABLES `userstatus` WRITE;
/*!40000 ALTER TABLE `userstatus` DISABLE KEYS */;
INSERT INTO `userstatus` VALUES (1,'Active'),(2,'Inactive');
/*!40000 ALTER TABLE `userstatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-24  1:18:39
