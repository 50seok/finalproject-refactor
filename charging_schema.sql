-- =============================================
-- charging DB 스키마 (Mapper XML + VO 역추적)
-- =============================================

-- ---------------------------------------------
-- 1. 회원 테이블
--    m_class: 0=일반회원, 1=사업자, 2=관리자
--    m_status: 0=활성, 1=탈퇴
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS member_t (
    m_idx     INT AUTO_INCREMENT PRIMARY KEY,
    m_email   VARCHAR(100) NOT NULL UNIQUE,
    m_pw      VARCHAR(255) NOT NULL,
    m_name    VARCHAR(50)  NOT NULL,
    m_phone   VARCHAR(20),
    m_address VARCHAR(200),
    m_class   TINYINT      NOT NULL DEFAULT 0,
    m_status  TINYINT      NOT NULL DEFAULT 0,
    m_atoken  VARCHAR(500),
    m_rtoken  VARCHAR(500),
    m_payment VARCHAR(100),
    m_date    DATETIME     NOT NULL DEFAULT NOW(),
    m_val2    VARCHAR(255),
    m_val3    VARCHAR(255),
    m_val4    VARCHAR(255),
    m_val5    VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 2. 차량 모델 테이블
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS model_t (
    mo_idx           INT AUTO_INCREMENT PRIMARY KEY,
    mo_name          VARCHAR(100) NOT NULL,
    mo_bet           VARCHAR(50),
    mo_type          VARCHAR(20),
    mo_chargetype_ac VARCHAR(50),
    mo_chargetype_dc VARCHAR(50),
    mo_val1          VARCHAR(255),
    mo_val2          VARCHAR(255),
    mo_val3          VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 3. 차량 테이블
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS car_t (
    c_idx           INT AUTO_INCREMENT PRIMARY KEY,
    c_num           VARCHAR(20),
    c_name          VARCHAR(100),
    c_state         VARCHAR(50),
    c_city          VARCHAR(50),
    c_addr1         VARCHAR(200),
    c_type          VARCHAR(20),
    c_chargetype_ac VARCHAR(50),
    c_chargetype_dc VARCHAR(50),
    mo_idx          INT,
    c_val1          VARCHAR(255),
    c_val2          VARCHAR(255),
    c_val3          VARCHAR(255),
    c_val4          VARCHAR(255),
    c_val5          VARCHAR(255),
    FOREIGN KEY (mo_idx) REFERENCES model_t(mo_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 4. 차량 소유 이력 테이블
--    cw_type:  0=등록, 1=삭제
--    cw_state: 0=활성, 1=삭제
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS car_write (
    cw_idx   INT AUTO_INCREMENT PRIMARY KEY,
    cw_type  TINYINT  NOT NULL DEFAULT 0,
    m_idx    INT      NOT NULL,
    c_idx    INT      NOT NULL,
    cw_date  DATETIME NOT NULL DEFAULT NOW(),
    cw_state TINYINT  NOT NULL DEFAULT 0,
    cw_val1  VARCHAR(255),
    cw_val2  VARCHAR(255),
    cw_val3  VARCHAR(255),
    cw_val4  VARCHAR(255),
    cw_val5  VARCHAR(255),
    FOREIGN KEY (m_idx) REFERENCES member_t(m_idx),
    FOREIGN KEY (c_idx) REFERENCES car_t(c_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 5. 게시판 테이블 (공지/QnA/리뷰 통합)
--    b_type:   0=공지사항, 1=리뷰, 2=QnA
--    b_status: 0=활성, 1=삭제
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS bbs_t (
    b_idx      INT AUTO_INCREMENT PRIMARY KEY,
    b_title    VARCHAR(300),
    b_content  TEXT,
    b_score    VARCHAR(10),
    b_target   VARCHAR(100),
    b_type     TINYINT      NOT NULL DEFAULT 0,
    b_status   TINYINT      NOT NULL DEFAULT 0,
    b_to       VARCHAR(100),
    b_hit      INT          NOT NULL DEFAULT 0,
    b_ip       VARCHAR(50),
    b_oriname  VARCHAR(300),
    b_filename VARCHAR(300),
    b_date     DATETIME     NOT NULL DEFAULT NOW(),
    m_idx      INT,
    b_val1     VARCHAR(255),
    b_val2     VARCHAR(255),
    b_val3     VARCHAR(255),
    b_val4     VARCHAR(255),
    b_val5     VARCHAR(255),
    FOREIGN KEY (m_idx) REFERENCES member_t(m_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 6. 게시판 활동 로그 (리뷰 작성/수정 이력)
--    bl_type: 0=작성, 1=수정
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS bbslog (
    bl_idx  INT AUTO_INCREMENT PRIMARY KEY,
    m_idx   INT      NOT NULL,
    b_idx   INT      NOT NULL,
    bl_date DATETIME NOT NULL DEFAULT NOW(),
    bl_type TINYINT  NOT NULL DEFAULT 0,
    bl_val1 VARCHAR(255),
    bl_val2 VARCHAR(255),
    bl_val3 VARCHAR(255),
    bl_val4 VARCHAR(255),
    bl_val5 VARCHAR(255),
    FOREIGN KEY (m_idx) REFERENCES member_t(m_idx),
    FOREIGN KEY (b_idx) REFERENCES bbs_t(b_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 7. 서비스 테이블 (탁송/이동식 충전 업체)
--    s_type:   0=탁송, 1=이동식 충전
--    s_status: 0=활성, 1=비활성
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS service_t (
    s_idx    INT AUTO_INCREMENT PRIMARY KEY,
    s_type   TINYINT      NOT NULL DEFAULT 0,
    s_radius VARCHAR(20),
    s_status TINYINT      NOT NULL DEFAULT 0,
    s_mapx   VARCHAR(50),
    s_mapy   VARCHAR(50),
    s_code   VARCHAR(20),
    s_state  VARCHAR(50),
    s_city   VARCHAR(50),
    s_addr1  VARCHAR(200),
    s_val1   VARCHAR(255),
    s_val2   VARCHAR(255),
    s_val3   VARCHAR(255),
    s_val4   VARCHAR(255),
    s_val5   VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 8. 서비스 등록 테이블 (사업자 서비스 신청)
--    sw_type:   0=탁송, 1=이동식
--    sw_status: 0=대기, 1=승인, 2=거절
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS service_write (
    sw_idx    INT AUTO_INCREMENT PRIMARY KEY,
    m_idx     INT      NOT NULL,
    s_idx     INT,
    c_idx     INT,
    sw_date   DATETIME NOT NULL DEFAULT NOW(),
    sw_status TINYINT  NOT NULL DEFAULT 0,
    sw_type   TINYINT  NOT NULL DEFAULT 0,
    sw_val1   VARCHAR(255),
    sw_val2   VARCHAR(255),
    sw_val3   VARCHAR(255),
    sw_val4   VARCHAR(255),
    sw_val5   VARCHAR(255),
    FOREIGN KEY (m_idx) REFERENCES member_t(m_idx),
    FOREIGN KEY (s_idx) REFERENCES service_t(s_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 9. 서비스 이용 내역 테이블
--    su_type:   0=탁송, 1=이동식 충전
--    su_status: 0=대기, 1=진행중, 2=완료, 3=취소
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS service_use (
    su_idx     INT AUTO_INCREMENT PRIMARY KEY,
    s_idx      INT      NOT NULL,
    c_idx      INT      NOT NULL,
    su_date    DATETIME NOT NULL DEFAULT NOW(),
    su_status  TINYINT  NOT NULL DEFAULT 0,
    su_type    TINYINT  NOT NULL DEFAULT 0,
    su_percent VARCHAR(10),
    su_payment VARCHAR(50),
    su_payinfo VARCHAR(300),
    su_sprice  VARCHAR(50),
    su_cprice  VARCHAR(50),
    su_val1    VARCHAR(255),
    su_val2    VARCHAR(255),
    su_val3    VARCHAR(255),
    su_val4    VARCHAR(255),
    su_val5    VARCHAR(255),
    FOREIGN KEY (s_idx) REFERENCES service_t(s_idx),
    FOREIGN KEY (c_idx) REFERENCES car_t(c_idx)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 초기 데이터
-- =============================================

-- 전기차 모델 기본 데이터
INSERT INTO model_t (mo_name, mo_bet, mo_type, mo_chargetype_ac, mo_chargetype_dc) VALUES
('현대 아이오닉5',  '72.6kWh',  '0', '11kW',  '350kW'),
('현대 아이오닉6',  '77.4kWh',  '0', '11kW',  '350kW'),
('기아 EV6',        '77.4kWh',  '0', '11kW',  '350kW'),
('기아 EV9',        '99.8kWh',  '0', '11kW',  '350kW'),
('테슬라 모델3',    '75kWh',    '0', '11kW',  '250kW'),
('테슬라 모델Y',    '75kWh',    '0', '11kW',  '250kW'),
('BMW iX',          '111kWh',   '0', '11kW',  '200kW'),
('벤츠 EQS',        '107.8kWh', '0', '22kW',  '200kW'),
('폭스바겐 ID.4',   '82kWh',    '0', '11kW',  '135kW'),
('쉐보레 볼트EV',   '65kWh',    '0', '11kW',  '50kW');

-- 관리자 계정 (비밀번호: admin1234)
-- BCrypt 해시 — 운영 환경에서는 반드시 교체하세요
INSERT INTO member_t (m_email, m_pw, m_name, m_class, m_status)
VALUES ('admin@ramgi.com',
        '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LPVJWgKGS',
        '관리자', 2, 0);
