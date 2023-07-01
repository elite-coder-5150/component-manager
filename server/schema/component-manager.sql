CREATE TABLE `component`
(
    `component_id`      INT(11)      NOT NULL,
    `author`            VARCHAR(255) NOT NULL,
    `version`           VARCHAR(10)  NOT NULL,
    `description`       VARCHAR(255) NOT NULL,
    `type`              ENUM ('html', 'scss', 'python',
        'javascript', 'c++', 'php',
        'typescript', 'c')           NOT NULL,
    `has_documentation` TINYINT(1)   NOT NULL DEFAULT 0,
    `has_tests`         TINYINT(1)   NOT NULL DEFAULT 0,
    `styles`            INT          NOT NULL DEFAULT 0,
    `logic`             INT          NOT NULL DEFAULT 0,
    `template`          INT                   DEFAULT 0,
    `created`           DATETIME     NOT NULL,
    `updated`           DATETIME     NOT NULL,
    `shares` int not null,
    PRIMARY KEY (`component_id`)
);

create table `component_dependency`
(
    `component_id`  int(11) not null,
    `dependency_id` int(11) not null,
    primary key ('component_id', 'dependency_id')
);

create table `component_documentation`
(
    `component_id`     int(11) not null,
    `documentation_id` int(11) not null,
    primary key ('component_id', 'documentation_id')
);

-- query for getting the share count for each component
SELECT c.component_id,
       c.name,
       c.author,
       c.version,
       f.follower_id,
       l.like_id,
       n.notification_id
FROM component c
         LEFT JOIN
     followers f ON c.component_id = f.follower_id
         LEFT JOIN
     likes l ON c.component_id = l.component_id
         LEFT JOIN
     notifications n ON c.component_id = n.notification_id;

-- query for getting the share count for each component
SELECT
      component_id,
      COUNT(*) AS share_count
    FROM
      shares
    WHERE
      component_id = ?
    GROUP BY
      component_id;

-- or this could be a possible solution
select shares from component where component_id = ?;

-- query for getting the share count for each component
SELECT
      c.component_id,
      c.name,
      COUNT(*) AS share_count
    FROM
      component c
    JOIN
      shares s ON c.component_id = s.share_id
    WHERE
      c.component_id = s.share_id
    GROUP BY
      c.component_id, c.name;

create table `shares`
(
    `component_id` int(11) not null,
    `share_id`     int(11) not null,
    primary key ('component_id', 'share_id')
);

create table `likes`
(
    `component_id` int(11) not null,
    `like_id`      int(11) not null,
    `number_of_likes` int(11) not null,
    primary key ('component_id', 'like_id')
);
