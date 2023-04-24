<?php

// Connect to database
function connect_to_db()
{
    $connection = new mysqli('localhost', 'root', '', 'otdb');
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    return $connection;
}

// Get enum values from a table
function get_enum_values($connection, $table, $field)
{
    $result = $connection->query("SHOW COLUMNS FROM {$table} WHERE Field = '{$field}'");
    $row = $result->fetch_assoc();
    $type = $row['Type'];
    preg_match("/^enum\(\'(.*)\'\)$/", $type, $matches);
    $enum = explode("','", $matches[1]);
    return $enum;
}
