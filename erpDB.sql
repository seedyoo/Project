CREATE TABLE users (
     users_num      NUMBER          NOT NULL
    ,users_id       VARCHAR2(20)    NOT NULL
    ,users_pw     CHAR(14)        NOT NULL
    ,users_authority NUMBER         NOT NULL
    ,users_      VARCHAR2(100)   NOT NULL
    ,users_    VARCHAR2(1000)  NULL
    ,users_    NUMBER          NOT NULL
    ,users_      NUMBER          NOT NULL
    ,users_   DATE    DEFAULT sysdate NOT NULL
    ,users_   DATE    DEFAULT sysdate NOT NULL
    ,users_        VARCHAR2(1000)  DEFAULT '없음' NULL,
    CONSTRAINT MS_STUDENT_PK PRIMARY KEY(users_num) ENABLE
);