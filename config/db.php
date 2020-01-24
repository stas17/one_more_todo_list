<?php

return [
    'class'    => '\yii\db\Connection',
    'dsn'      => sprintf(
        'pgsql:host=%s;port=%s;dbname=%s',
        getenv("DATABASE_HOST"),
        getenv("DATABASE_PORT"),
        getenv("DATABASE_DB")
    ),
    'username' => getenv("DATABASE_USER"),
    'password' => getenv("DATABASE_PASSWORD"),
    'charset'  => 'utf8',
];
