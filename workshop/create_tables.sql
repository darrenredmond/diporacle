
CREATE TABLE member(
  member_id NUMBER(10)
    CONSTRAINT member_member_id_pk PRIMARY KEY,
  last_name VARCHAR2(25)
    CONSTRAINT member_last_name_nn NOT NULL,
  first_name VARCHAR2(25),
  address VARCHAR2(100),
  city VARCHAR2(30),
  phone VARCHAR2(15),
  join_date DATE DEFAULT SYSDATE
    CONSTRAINT member_join_date_nn NOT NULL
);

-- the title is the video that is released and can be rented
CREATE TABLE title(
  title_id NUMBER(10)
    CONSTRAINT title_title_id_pk PRIMARY KEY,
  title VARCHAR2(60)
    CONSTRAINT title_title_nn NOT NULL,
  description VARCHAR2(400)
    CONSTRAINT title_description_nn NOT NULL,
  rating VARCHAR2(4)
    CONSTRAINT title_rating_ck CHECK
      (rating IN ('G', 'PG', 'R', 'NC17', 'NR')),
  category VARCHAR2(20),
    CONSTRAINT title_category_ck CHECK
      (category IN ('DRAMA', 'COMEDY', 'ACTION', 'CHILD',
        'SCIFI', 'DOCUMENTARY')),
  release_date DATE
);

CREATE TABLE title_copy(
  copy_id NUMBER(10),
  title_id NUMBER(10)
    CONSTRAINT title_copy_title_id_fk REFERENCES title(title_id),
  status VARCHAR2(15)
    CONSTRAINT title_copy_status_nn NOT NULL
    CONSTRAINT title_copy_status_ck CHECK (status IN
     ('AVAILABLE', 'DESTROYED','RENTED', 'RESERVED')),
  CONSTRAINT title_copy_copy_id_title_id_pk PRIMARY KEY (copy_id, title_id)
);

CREATE TABLE rental(
  book_date DATE DEFAULT SYSDATE,
  member_id NUMBER(10)
    CONSTRAINT rental_member_id_fk REFERENCES member(member_id),
  copy_id NUMBER(10),
  act_ret_date DATE,
  exp_ret_date DATE DEFAULT SYSDATE + 2,
  title_id NUMBER(10),
  CONSTRAINT rental_book_date_copy_title_pk
    PRIMARY KEY (book_date, member_id, copy_id,title_id),
  CONSTRAINT rental_copy_id_title_id_fk
    FOREIGN KEY (copy_id, title_id) REFERENCES title_copy(copy_id, title_id));

CREATE TABLE reservation(
  res_date DATE,
  member_id NUMBER(10) NOT NULL
    CONSTRAINT reservation_member_id
      REFERENCES member(member_id),
  title_id NUMBER(10) NOT NULL
    CONSTRAINT reservation_title_id
      REFERENCES title(title_id),
  CONSTRAINT reservation_resdate_mem_tit_pk PRIMARY KEY
    (res_date, member_id, title_id)
);
