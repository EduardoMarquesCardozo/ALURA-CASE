CREATE TABLE registration (
    id                  bigint(20) NOT NULL AUTO_INCREMENT,
    studentId           bigint(20)  NOT NULL,
    courseId            bigint(20)  NOT NULL,
    registration_date   datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_registration_user FOREIGN KEY (studentId) REFERENCES User(id),
    CONSTRAINT fk_registration_course FOREIGN KEY (courseId) REFERENCES Course(id),
    CONSTRAINT uq_registration_user_course UNIQUE (studentId, courseId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
