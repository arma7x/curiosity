<?php

interface CredentialInterface{}

class TestCredential implements CredentialInterface
{
  public $credential = 'mysql://root:password@localhost:3306/TestDB';
}

class ProdCredential implements CredentialInterface
{
  public $credential = 'mysql://root:password@localhost:3306/ProdDB';
}

interface DatabaseInterface
{
  public function getCredential(): string;
}

class MySQL implements DatabaseInterface
{

  private $credential;
  private $credential_from_constructor;

  public function __construct(CredentialInterface $credential)
  {
    $this->credential = 'mysql://root:password@localhost:3306/MySQL';
    $this->credential_from_constructor = $credential;
  }

  public function getCredential(): string
  {
    return $this->credential;
  }

  public function getCredentialFromConstructor(): CredentialInterface
  {
    return $this->credential_from_constructor;
  }
}

class PostgreSQL implements DatabaseInterface
{

  private $credential;
  private $credential_from_constructor;

  public function __construct(CredentialInterface $credential)
  {
    $this->credential = 'mysql://root:password@localhost:3306/PostgreSQL';
    $this->credential_from_constructor = $credential;
  }

  public function getCredential(): string
  {
    return $this->credential;
  }

  public function getCredentialFromConstructor(): CredentialInterface
  {
    return $this->credential_from_constructor;
  }
}

$repository = [
  DatabaseInterface::class => MySQL::class, // or PostgreSQL::class
  CredentialInterface::class => TestCredential::class // or ProdCredential::class
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
echo $instance->getDB()->getCredentialFromConstructor()->credential . PHP_EOL;
