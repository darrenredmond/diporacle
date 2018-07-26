SET ECHO OFF
INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Willie and Christmas Too',
'All of Willie''s friends make a Christmas list for
Santa, but Willie has yet to add his own wish list.',
'G', 'CHILD', TO_DATE('05-OCT-1995','DD-MON-YYYY'));

INSERT INTO title(title_id , title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Alien Again', 'Yet another
installment of science fiction history. Can the
heroine save the planet from the alien life form?',
'R', 'SCIFI', TO_DATE( '19-MAY-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'The Glob', 'A meteor crashes
near a small American town and unleashes carnivorous
goo in this classic.', 'NR', 'SCIFI',
TO_DATE( '12-AUG-1995','DD-MON-YYYY'));

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'My Day Off', 'With a little
luck and a lot ingenuity, a teenager skips school for
a day in New York.', 'PG', 'COMEDY',
TO_DATE( '12-JUL-1995','DD-MON-YYYY'));


INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Miracles on Ice',
'A six-year-old has doubts about Santa Claus, but she discovers that miracles really do exist.',
'PG', 'DRAMA', '12-SEP-1995');

INSERT INTO title(title_id, title, description, rating,
category, release_date)
VALUES (title_id_seq.NEXTVAL, 'Soda Gang',
'After discovering a cache of drugs, a young couple find themselves pitted against a vicious gang.',
'NR', 'ACTION', '01-JUN-1995');

INSERT INTO title_copy(copy_id, title_id, status) VALUES (1, 92, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id, status) VALUES (1, 93, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id, status) VALUES (2, 93, 'RENTED');
INSERT INTO title_copy(copy_id, title_id, status) VALUES (1, 94, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id, status) VALUES (1, 95, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id,status) VALUES (2, 95, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id,status) VALUES (3, 95, 'RENTED');
INSERT INTO title_copy(copy_id, title_id,status) VALUES (1, 96, 'AVAILABLE');
INSERT INTO title_copy(copy_id, title_id,status) VALUES (1, 97, 'AVAILABLE');
