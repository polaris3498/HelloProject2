DROP TABLE FNQ_FILE_ATTACH;
DROP TABLE FNQ;
DROP TABLE NOTICE_FILE_ATTACH;
DROP TABLE NOTICE; 
DROP TABLE RESERVATION;
DROP TABLE SEAT;

DROP TABLE RENT;
DROP TABLE RETURNED;
DROP TABLE OVERDUE;
DROP TABLE BOOK_REPLY;
DROP TABLE BOOK;

DROP TABLE QAA;




DROP TABLE SIGN_OUT_MEMBER;
DROP TABLE MEMBER_LOG;
DROP TABLE MEMBER;
DROP TABLE DORMANT_MEMBER;




-- MEMBER(회원) 테이블 생성
CREATE TABLE MEMBER
(
    MEMBER_NO NUMBER NOT NULL,                              -- 번호
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL UNIQUE,            -- 아이디
    MEMBER_PW VARCHAR2(64 BYTE) NOT NULL,                   -- 비밀번호
    MEMBER_NAME VARCHAR2(100 BYTE),                         -- 이름
    MEMBER_PHONE NUMBER,                                    -- 휴대전화번호
    MEMBER_EMAIL VARCHAR2(100 BYTE) NOT NULL UNIQUE,        -- 이메일
    MEMBER_ADDRESS VARCHAR2(200 BYTE),                      -- 주소
    MEMBER_AGREE_STATE NUMBER,                              -- 동의여부
    MEMBER_SIGN_IN DATE NOT NULL,                           -- 가입일
    MEMBER_PW_MODIFIED DATE,                                -- 비번 수정일
    MEMBER_INFO_MODIFIED DATE,                              -- 회원정보 수정일
    MEMBER_SESSION_ID VARCHAR2(50 BYTE),                    -- 세션 아이디
    MEMBER_SESSION_LIMIT DATE                               -- 세션 만료일
);

-- MEMBER 기본키
ALTER TABLE MEMBER
    ADD CONSTRAINT MEMBER_PK
        PRIMARY KEY(MEMBER_NO);

-- MEMBER_LOG(회원 로그) 테이블 생성
CREATE TABLE MEMBER_LOG
(
    MEMBER_LOG_NO NUMBER NOT NULL,              
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL,       
    MEMBER_LOG_SIGN_UP DATE DEFAULT SYSDATE     
);


-- MEMBER_LOG 기본키
ALTER TABLE MEMBER_LOG
    ADD CONSTRAINT MEMBER_LOG_PK
        PRIMARY KEY(MEMBER_LOG_NO);
-- MEMBER_LOG 외래키
ALTER TABLE MEMBER_LOG
    ADD CONSTRAINT MEMBER_LOG_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE;    -- 멤버의 정보를 삭제하면 해당 멤버의 로그가 함께 삭제된다.       


-- DORMANT_MEMBER(휴면 회원) 테이블 생성
CREATE TABLE DORMANT_MEMBER
(
    DORMANT_NO NUMBER NOT NULL,
    MEMBER_NO NUMBER,                 
    MEMBER_ID VARCHAR2(32 BYTE) UNIQUE,      
    MEMBER_PW VARCHAR2(64 BYTE),         
    MEMBER_NAME VARCHAR2(100 BYTE),
    MEMBER_PHONE NUMBER,
    MEMBER_EMAIL VARCHAR2(100 BYTE),  
    MEMBER_ADDRESS VARCHAR2(200 BYTE),
    MEMBER_AGREE_STATE NUMBER,  
    MEMBER_SIGN_IN DATE NOT NULL,       
    DORMANT_DATE DATE DEFAULT SYSDATE
);           
-- DORMANT_MEMBER 기본키
ALTER TABLE DORMANT_MEMBER
    ADD CONSTRAINT DORMANT_MEMBER_PK
        PRIMARY KEY(DORMANT_NO);
        
-- 시퀀스
DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ NOCACHE;

DROP SEQUENCE MEMBER_LOG_SEQ;
CREATE SEQUENCE MEMBER_LOG_SEQ NOCACHE;

DROP SEQUENCE DORMANT_MEMBER_SEQ;
CREATE SEQUENCE DORMANT_MEMBER_SEQ NOCACHE;



-- 4. 자주하는 질문 테이블
CREATE TABLE FNQ
(
    FNQ_NO NUMBER NOT NULL,
    FNQ_TITLE VARCHAR2(100 BYTE),
    FNQ_CONTENT VARCHAR2(1000 BYTE)
);

-- 자주하는 질문 테이블 기본키
ALTER TABLE FNQ
    ADD CONSTRAINT FNQ_PK
        PRIMARY KEY(FNQ_NO);
            
-- 자주하는 질문 테이블 시퀀스
DROP SEQUENCE FNQ_SEQ;
CREATE SEQUENCE FNQ_SEQ NOCACHE;



-- 5. 자주하는 질문 파일첨부 테이블
CREATE TABLE FNQ_FILE_ATTACH
(
    FNQ_FILE_ATTACH_NO NUMBER NOT NULL,
    FNQ_FILE_ATTACH_PATH VARCHAR2(300 BYTE),
    FNQ_FILE_ATTACH_ORIGIN VARCHAR2(300 BYTE),
    FNQ_FILE_ATTACH_SAVED VARCHAR2(40 BYTE),
    FNQ_NO NUMBER NOT NULL
);

-- 자주하는 질문 파일첨부 테이블 기본키
ALTER TABLE FNQ_FILE_ATTACH
    ADD CONSTRAINT FNQ_FILE_ATTACH_PK
        PRIMARY KEY(FNQ_FILE_ATTACH_NO);
        
-- 자주하는 질문 파일첨부 테이블 외래키
ALTER TABLE FNQ_FILE_ATTACH
    ADD CONSTRAINT FNQ_FILE_ATTACH_FNQ_FK
        FOREIGN KEY(FNQ_NO) REFERENCES FNQ(FNQ_NO)
            ON DELETE CASCADE; 
            
-- 자주하는 질문 파일첨부 테이블 시퀀스
DROP SEQUENCE FNQ_FILE_ATTACH_SEQ;
CREATE SEQUENCE FNQ_FILE_ATTACH_SEQ NOCACHE;


-- 7. 공지사항 테이블
CREATE TABLE NOTICE
(
    NOTICE_NO NUMBER NOT NULL,
    NOTICE_TITLE VARCHAR2(100 BYTE),
    NOTICE_CONTENT VARCHAR2(1000 BYTE),
    NOTICE_CREATED DATE DEFAULT SYSDATE,
    NOTICE_MODIFIED DATE,
    NOTICE_IP VARCHAR2(30 BYTE),
    NOTICE_HIT NUMBER
);

-- 공지사항 테이블 기본키
ALTER TABLE NOTICE
    ADD CONSTRAINT NOTICE_PK
        PRIMARY KEY(NOTICE_NO);
        
-- 8. 공지사항 파일첨부 테이블
CREATE TABLE NOTICE_FILE_ATTACH
(
   NOTICE_FILE_ATTACH_NO NUMBER NOT NULL,
   NOTICE_FILE_ATTACH_PATH VARCHAR2(300 BYTE),
   NOTICE_FILE_ATTACH_ORIGIN VARCHAR2(300 BYTE),
   NOTICE_FILE_ATTACH_SAVED VARCHAR2(40 BYTE),
   NOTICE_NO NUMBER NOT NULL 
);

-- 공지사항 테이블 기본키
ALTER TABLE NOTICE_FILE_ATTACH
    ADD CONSTRAINT NOTICE_FILE_ATTACH_PK
        PRIMARY KEY(NOTICE_FILE_ATTACH_NO);
        
-- 공지사항 테이블 외래키
ALTER TABLE NOTICE_FILE_ATTACH
    ADD CONSTRAINT NOTICE_FILE_ATTACH_NOTICE_FK
        FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO)
            ON DELETE CASCADE;
            
-- 좌석 테이블
CREATE TABLE SEAT(
   SEAT_NO NUMBER PRIMARY KEY,      -- 좌석 번호
   SEAT_STATUS NUMBER,             -- 좌석 예약 여부(1빔 or 2참)
    SEAT_USING_STATE NUMBER         -- 좌석 사용 가능 여부(1가능 or 2불가능)
);


-- 예약 테이블
CREATE TABLE RESERVATION(
   RESERVATION_NO NUMBER PRIMARY KEY,       -- 예약 번호
   MEMBER_NO NUMBER,                      -- FK(MEMBER) / 예약자 번호 
   SEAT_NO NUMBER,                        -- FK(SEAT) / 좌석 번호
   RESERVATION_BEGIN_DATE DATE,         -- 입실 시간
    RESERVATION_END_DATE DATE               -- 퇴실 시간
);
       
-- 외래키(RESERVATION)
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_SEAT_FK FOREIGN KEY(SEAT_NO) REFERENCES SEAT(SEAT_NO);
ALTER TABLE RESERVATION ADD CONSTRAINT RESERVATION_MEMBER_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO);
-- 시퀀스
DROP SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE RESERVATION_SEQ NOCACHE;

DROP SEQUENCE SEAT_SEQ;
CREATE SEQUENCE SEAT_SEQ NOCACHE MAXVALUE 100;


CREATE TABLE BOOK
(   BOOK_NO NUMBER PRIMARY KEY,
    BOOK_ISBN VARCHAR2(30 BYTE) UNIQUE,
    BOOK_TITLE VARCHAR2(50 BYTE),
    BOOK_AUTHOR VARCHAR2(30 BYTE),
    BOOK_PUBLISHER VARCHAR2(30 BYTE),
    BOOK_PUBDATE DATE,
    BOOK_DESCRIPTION VARCHAR2(500 BYTE),
    BOOK_IMAGE VARCHAR2(500 BYTE),
    BOOK_FIELD VARCHAR2(20 BYTE)
);    

DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ NOCACHE;     



CREATE TABLE BOOK_REPLY
(
    BOOK_REPLY_NO NUMBER PRIMARY KEY,
    BOOK_NO NUMBER,
    MEMBER_ID VARCHAR2(32 BYTE),
    BOOK_REPLY_CONTENT VARCHAR2(500 BYTE),
    BOOK_REPLY_CREATED DATE
);    



DROP SEQUENCE BOOK_REPLY_SEQ;
CREATE SEQUENCE BOOK_REPLY_SEQ NOCACHE;

ALTER TABLE BOOK_REPLY ADD CONSTRAINT BOOK_REPLY_BOOK_FK FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO);
ALTER TABLE BOOK_REPLY ADD CONSTRAINT BOOK_REPLY_MEMBER_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID);

-- 1. 대여 테이블 생성
CREATE TABLE RENT
(
    RENT_NO NUMBER NOT NULL,
    BOOK_NO NUMBER,
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL,
    RENT_DATE DATE DEFAULT SYSDATE,
    RENT_EXPIRATION_DATE DATE DEFAULT SYSDATE + 7
);

-- 대여 테이블 기본키
ALTER TABLE RENT
    ADD CONSTRAINT RENT_PK
        PRIMARY KEY(RENT_NO);
        
-- 대여 테이블 외래키
ALTER TABLE RENT
    ADD CONSTRAINT RENT_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE;   
            
ALTER TABLE RENT
    ADD CONSTRAINT RENT_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 

-- 대여 테이블 시퀀스
DROP SEQUENCE RENT_SEQ;
CREATE SEQUENCE RENT_SEQ NOCACHE;


-- 2. 반납 테이블 생성
CREATE TABLE RETURNED
(
    RETURNED_NO NUMBER NOT NULL,
    BOOK_NO NUMBER,
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL,
    RETURNED_DATE DATE DEFAULT SYSDATE
);

-- 반납 테이블 기본키
ALTER TABLE RETURNED
    ADD CONSTRAINT RETURNED_PK
        PRIMARY KEY(RETURNED_NO);
        
-- 반납 테이블 외래키
ALTER TABLE RETURNED
    ADD CONSTRAINT RETURNED_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE; 

ALTER TABLE RETURNED
    ADD CONSTRAINT RETURNED_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 
            
-- 반납 테이블 시퀀스
DROP SEQUENCE RETURNED_SEQ;
CREATE SEQUENCE RETURNED_SEQ NOCACHE;

-- 3. 연체 테이블 생성
CREATE TABLE OVERDUE
(
    OVERDUE_NO NUMBER NOT NULL,
    BOOK_NO NUMBER,
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL,
    RENT_EXPIRATION_DATE DATE
);

-- 연체 테이블 기본키
ALTER TABLE OVERDUE
    ADD CONSTRAINT OVERDUE_PK
        PRIMARY KEY(OVERDUE_NO);
        
-- 연체 테이블 외래키
ALTER TABLE OVERDUE
    ADD CONSTRAINT OVERDUE_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE; 

ALTER TABLE OVERDUE
    ADD CONSTRAINT OVERDUE_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 
            
-- 연체 테이블 시퀀스
DROP SEQUENCE OVERDUE_SEQ;
CREATE SEQUENCE OVERDUE_SEQ NOCACHE;

-- 6. 문의 테이블
CREATE TABLE QAA
(
    QAA_NO NUMBER NOT NULL,
    MEMBER_ID VARCHAR2(32 BYTE) NOT NULL,
    QAA_TITLE VARCHAR2(100 BYTE),
    QAA_CONTENT VARCHAR2(500 BYTE),
    QAA_CREATED DATE DEFAULT SYSDATE,
    QAA_MODIFIED DATE,
    QAA_DEPTH NUMBER,
    QAA_GROUP_NO NUMBER,
    QAA_GROUP_ORD NUMBER
);

-- 문의 테이블 기본키
ALTER TABLE QAA
    ADD CONSTRAINT QAA_PK
        PRIMARY KEY(QAA_NO);
        
-- 문의 테이블 외래키
ALTER TABLE QAA
    ADD CONSTRAINT QAA_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE;
            
-- 트리거 구성

-- 탈퇴자 테이블 생성
CREATE TABLE SIGN_OUT_MEMBER
(
    SIGN_OUT_NO NUMBER NOT NULL,
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(32 BYTE) UNIQUE,
    MEMBER_NAME VARCHAR2(100 BYTE),
    MEMBER_PHONE VARCHAR2(100 BYTE),
    MEMBER_EMAIL VARCHAR2(200 BYTE),
    MEMBER_ADDRESS VARCHAR2(200 BYTE),
    MEMBER_AGREE_STATE NUMBER,
    MEMBER_SIGN_IN DATE NOT NULL,
    SIGN_OUT DATE DEFAULT SYSDATE
   
);
-- 기본키
ALTER TABLE SIGN_OUT_MEMBER
    ADD CONSTRAINT SIGN_OUT_MEMBER_PK
        PRIMARY KEY(SIGN_OUT_NO);
        
        
-- 시퀀스
DROP SEQUENCE SIGN_OUT_MEMBER_SEQ;
CREATE SEQUENCE SIGN_OUT_MEMBER_SEQ NOCACHE;



-- MEMBER 테이블의 정보가 삭제되면 SIGN_OUT_MEMBER 테이블로 해당 정보가 저장되는 트리거
CREATE OR REPLACE TRIGGER SIGN_OUT_TRIGGER
    AFTER DELETE
    ON MEMBER
    FOR EACH ROW
BEGIN
    INSERT INTO SIGN_OUT_MEMBER
        (SIGN_OUT_NO, MEMBER_NO, MEMBER_ID, MEMBER_NAME, MEMBER_PHONE, MEMBER_EMAIL, MEMBER_ADDRESS, MEMBER_AGREE_STATE, MEMBER_SIGN_IN)
    VALUES
        (SIGN_OUT_MEMBER_SEQ.NEXTVAL, :OLD.MEMBER_NO, :OLD.MEMBER_ID, :OLD.MEMBER_NAME, :OLD.MEMBER_PHONE, :OLD.MEMBER_EMAIL, :OLD.MEMBER_ADDRESS, :OLD.MEMBER_AGREE_STATE, :OLD.MEMBER_SIGN_IN);
END SIGN_OUT_TRIGGER;
