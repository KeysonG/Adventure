DROP TABLE IF EXISTS user_table;
CREATE TABLE user_table (
  `user_id` int(11) auto_increment,
  `user_name` varchar(25),
  `adventure_id` int(11),
   PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS question_table;
CREATE TABLE question_table (
  `question_id` int(11),
  `option_id` varchar(150),
  `question_text` varchar(150),
  `option_text` varchar(150),
  `life` int(11),
  `coins` int(11),
  `next_question` int(11),
  PRIMARY KEY  (`question_id`, `option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO question_table (question_id, option_id, question_text, option_text, life, coins, next_question) VALUES
(1,'a','You come across a monster','cry', -5, -5, 2),
(1,'b','You come across a monster','fight',-10,-20, 2),
(1,'c','You come across a monster','runaway', -15, -1, 3),
(1,'d','You come across a monster','give him food', -10, -1, 3),
(2,'a','A local theif came across your bravery and approached you. What do you do?','high-five him', -5, -1 ,4),
(2,'b','A local theif came across your bravery and approached you. What do you do?','rob him', -50, -3, 4),
(2,'c','A local theif came across your bravery and approached you. What do you do?','ask him for money', -20, -20, 4),
(2,'d','A local theif came across your bravery and approached you. What do you do?','give him money', -5, -5, 4),
(3,'a','A troll wants to completely destroy you. Do you...?','hide', -10, -5, 4),
(3,'b','A troll wants to completely destroy you. Do you...?','cry', -10, -10, 4),
(3,'c','A troll wants to completely destroy you. Do you...?','fight', -10, -5, 4),
(3,'d','A troll wants to completely destroy you. Do you...?','cry and then fight', -20, -10, 4),
(4,'a','You come across a mysterious box, do you...?','Open it', -4, -10, 5),
(4,'b','You come across a mysterious box, do you...?','Run away', -3, -5, 6),
(4,'c','You come across a mysterious box, do you...?','Kick it', -5, -2, 6),
(4,'d','You come across a mysterious box, do you...?','Take it with you and open it later', -10, -15, 7),
(5,'a','Your bravery is recognized and the village gentry want to knight you. Do you...?','Kill them, trust no one', +25, -1, 7),
(5,'b','Your bravery is recognized and the village gentry want to knight you. Do you...?','Accept this offer', +25, -5, 7),
(5,'c','Your bravery is recognized and the village gentry want to knight you. Do you...?','Give them coins as a gift', -5, -20, 7),
(5,'d','Your bravery is recognized and the village gentry want to knight you. Do you...?','Run away', -3, -2, 7),
(6,'a','You come across another monster','fight for your life', -5, -5, 7),
(6,'b','You come across another monster','go away silently',-10,-20, 7),
(6,'c','You come across another monster','give it about 50%', -15, -1, 7),
(6,'d','You come across another monster','try to calm the creature', -2, -7, 7)