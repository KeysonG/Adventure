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
  `adventure_id` int(11),
  `question_text` varchar(150),
  PRIMARY KEY  (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO question_table (question_id, question_text, adventure_id) VALUES
(1,'You come across a monster',1),
(2,'A local theif came across your bravery and approached you. What do you do?',1),
(3,'A troll wants to completely destroy you. Do you...?',1),
(4,'You come across a mysterious box, do you...?',1),
(5,'Your bravery is recognized and the village gentry want to knight you. Do you...?',1),
(6,'You come across another monster',1);

DROP TABLE IF EXISTS options_table;
CREATE TABLE options_table (
  `option_id` int(11) auto_increment,
  `option_text` varchar(150),
  `life` int(11),
  `coins` int(11),
  `next_question` int(11),
  `question_id` int(11),
  PRIMARY KEY  (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO options_table (option_text, life, coins, next_question, question_id) VALUES
('cry', -5, -5, 2, 1),
('fight',-10,-20, 2, 1),
('run away', -15, -1, 3, 1),
('give him food', -10, -1, 3, 1),
('high-five him', -5, -1 ,4, 2),
('rob him', -50, -3, 4, 2),
('ask him for money', -20, -20, 4, 2),
('give him money', -5, -5, 4, 2),
('hide', -10, -5, 4, 3),
('cry', -10, -10, 4, 3),
('fight', -10, -5, 4, 3),
('cry and then fight', -20, -10, 4, 3),
('Open it', -4, -10, 5, 4),
('Run away', -3, -5, 6, 4),
('Kick it', -5, -2, 6, 4),
('Take it with you and open it later', -10, -15, 7, 4),
('Kill them, trust no one', +25, -1, 7, 5),
('Accept this offer', +25, -5, 7, 5),
('Give them coins as a gift', -5, -20, 7, 5),
('Run away', -3, -2, 7, 5),
('fight for your life', -5, -5, 7, 6),
('go away silently',-10,-20, 7, 6),
('give it about 50%', -15, -1, 7, 6),
('try to calm the creature', -2, -7, 7, 6);