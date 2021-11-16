<?php

interface DatabaseCredentialInterface{}

class TestDB implements DatabaseCredentialInterface
{
  public $credential = 'mysql://root:password@localhost:3306/test_db_class';
}

class ProductionDB implements DatabaseCredentialInterface
{
  public $credential = 'mysql://root:password@localhost:3306/production_db_class';
  public function __construct() {}
}

interface DatabaseInterface
{
  public function getCredential(): string;
}

class MySQL implements DatabaseInterface
{

  private $credential;
  private $credential_from_class;

  public function __construct(DatabaseCredentialInterface $credential)
  {
    $this->credential = 'mysql://root:password@localhost:3306/test_db';
    $this->credential_from_class = $credential;
  }

  public function getCredential(): string
  {
    return $this->credential;
  }

  public function getCredentialFromClass(): DatabaseCredentialInterface
  {
    return $this->credential_from_class;
  }
}

$repository = [
  DatabaseInterface::class => MySQL::class,
  DatabaseCredentialInterface::class => TestDB::class // ProductionDB
];

class DatabaseHandler
{
  private $db;

  public function __construct(DatabaseInterface $db) {
    $this->db = $db;
  }

  public function getDB(): DatabaseInterface
  {
    return $this->db;
  }
}

function resolve($class, $repository) {
  // echo 'CLASS ' . $class . PHP_EOL;
  $reflector = new ReflectionClass($class);
  $constructor = $reflector->getConstructor();
  $parameters = [];
  if (!is_null($constructor)) {
    foreach ($constructor->getParameters() as $dependency) {
      if ($repository[$dependency->getClass()->name]) {
        // echo 'FOUND ' . $dependency->getClass()->name . PHP_EOL;
        $parameters[] = resolve($repository[$dependency->getClass()->name], $repository);
      }
    }
  }
  return $reflector->newInstanceArgs($parameters);
}

$instance = resolve(DatabaseHandler::class, $repository);
echo $instance->getDB()->getCredential() . PHP_EOL;
echo $instance->getDB()->getCredentialFromClass()->credential . PHP_EOL;
