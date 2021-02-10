CREATE SCHEMA `online_skill_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
CREATE TABLE `online_skill_system`.`student`
(
    `id`             INT          NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(120) NOT NULL,
    `telephone`      VARCHAR(50)  NULL,
    `dateOfBirthday` DATE         NULL,
    `email`          VARCHAR(120) NULL,

    PRIMARY KEY (`id`)
);
CREATE TABLE `online_skill_system`.`course`
(
    `id`      INT           NOT NULL AUTO_INCREMENT,
    `name`    VARCHAR(120)  NOT NULL,
    `price`   DECIMAL(6, 2) NULL,
    `teacher` INT           NULL,

    PRIMARY KEY (`id`)
);
CREATE TABLE `online_skill_system`.`teacher`
(
    `id`        INT          NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(120) NOT NULL,
    `telephone` VARCHAR(120) NULL,
    `email`     VARCHAR(120) NULL,

    PRIMARY KEY (`id`)
);
CREATE TABLE `online_skill_system`.`skills`
(
    `id`    INT          NOT NULL AUTO_INCREMENT,
    `name`  VARCHAR(120) NOT NULL,
    `level` VARCHAR(120) NULL,

    PRIMARY KEY (`id`)
);
CREATE TABLE `online_skill_system`.`student_course`
(
    `student_id` INT NULL,
    `course_id`  INT NULL,

    CONSTRAINT `fk_students`
        FOREIGN KEY (`student_id`)
            REFERENCES `online_skill_system`.`student` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT `fk_course`
        FOREIGN KEY (`course_id`)
            REFERENCES `online_skill_system`.`course` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
CREATE TABLE `online_skill_system`.`teacher_archive`
(
    `teacher_id` INT NULL,
    `skills_id`  INT NULL,

    CONSTRAINT `fk_teacher`
        FOREIGN KEY (`teacher_id`)
            REFERENCES `online_skill_system`.`teacher` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,

    CONSTRAINT `fk_skills`
        FOREIGN KEY (`skills_id`)
            REFERENCES `online_skill_system`.`skills` (`id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);