/* ** 요구 사항 **
1. 사용자가 게시판에 질문을 입력할 수 있는 기능을 구현하십시오.
2. 입력된 질문을 분석하여, 관련된 FAQ 정보를 데이터베이스에서 찾아 자동으로 답변을 제공하십시오.
3. 사용자가 입력한 질문과 시스템이 제공한 답변을 게시판에 명확하게 표시하십시오.
4. 모든 상호작용은 사용자가 쉽게 이해할 수 있도록 UI에 적절하게 통합되어야 합니다.
*/

DROP DATABASE IF EXISTS 25_06_spring;
CREATE DATABASE 25_06_spring;
USE 25_06_spring;

DROP TABLE IF EXISTS article;
CREATE TABLE article (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	memberId INT NOT NULL,
	boardId INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	`body` TEXT NOT NULL
);

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 3,
title = '아이디 비밀번호 변경 실패 할 시',
`body` = '만약 아이디 비밀번호 변경을 못할 시에는 관리자에게 문의 하시기 바랍니다.';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 3,
title = '글 수정 실패',
`body` = '글 수정 실패 할 경우 다시 접속 하거나 관리자에게 문의 바랍니다.';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 3,
title = '글 작성 실패',
`body` = '글 작성 실패 시 로그인을 다시 해주거나 관리자에게 문의 바랍니다.';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 3,
title = '회원가입 실패 할 시',
`body` = '회원가입 실패 할 시 다시 접속 해주시기 바랍니다.';

SELECT * FROM article
ORDER BY id DESC;

SELECT * FROM article
WHERE id = 1;

SELECT
LAST_INSERT_ID();

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	loginId VARCHAR(30) NOT NULL,
	loginPw VARCHAR(40) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	nickName VARCHAR(30) NOT NULL,
	email VARCHAR(40) NOT NULL
);

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = 'admin',
nickName = '관리자',
email = 'admin@gmail.com';

SELECT * FROM `member`
ORDER BY id DESC;

SELECT * FROM `member`
WHERE loginId = 'admin';


SELECT A.*, M.nickName AS extra__write
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = 1;

# 게시판(board) 테이블 생성
DROP TABLE IF EXISTS board;
CREATE TABLE board (
	id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	`code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항) free(자유) QnA(질의응답)...',
	`name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
	delDate DATETIME COMMENT '삭제 날짜'
);

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'notice',
`name`= "공지사항";

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'free',
`name`= "자유게시판";

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name`= "질문게시판";

SELECT * FROM board
WHERE id = 3 AND delStatus = 0;

SELECT A.*, M.nickName AS extra__write, B.name AS boardName
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
INNER JOIN board AS B
ON A.boardId = B.id
WHERE A.id = 1;