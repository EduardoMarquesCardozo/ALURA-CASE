CREATE TABLE Course (
    id                  bigint(20)  NOT NULL AUTO_INCREMENT,
    createdAt           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    name                varchar(50) NOT NULL,
    code                varchar(10) NOT NULL UNIQUE,
    instructorId        bigint(20)  NOT NULL,
    categoryId          bigint(20)  NOT NULL,
    description         varchar(250) NOT NULL,
    status              enum('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE',
    deactivationDate    datetime DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_course_category FOREIGN KEY (categoryId)
        REFERENCES Category(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_course_user FOREIGN KEY (instructorId)
        REFERENCES User(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_code CHECK (code REGEXP '^[a-z]+(-[a-z]+)*$')
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;