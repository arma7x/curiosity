<?php

interface CredentialInterface {
  public function getCredential(): string;
}

class TestCredential implements CredentialInterface {

  public function getCredential(): string {
    return 'mysql://root:password@localhost:3306/TestDB';
  }

}

class ProdCredential implements CredentialInterface {

  public function getCredential(): string {
    return 'mysql://root:password@localhost:3306/ProdDB';
  }

}

interface DatabaseInterface {
  public function getCredential(): string;
  public function getCredentialConstructor(): CredentialInterface;
}

class MySQL implements DatabaseInterface {

  private CredentialInterface $credentialConstructor;

  public function __construct(CredentialInterface $credential) {
    $this->credentialConstructor = $credential;
  }

  public function getCredential(): string {
    return $this->credentialConstructor->getCredential();
  }

  public function getCredentialConstructor(): CredentialInterface
  {
    return $this->credentialConstructor;
  }
}

class PostgreSQL implements DatabaseInterface {

  private CredentialInterface $credentialConstructor;

  public function __construct(CredentialInterface $credential) {
    $this->credentialConstructor = $credential;
  }

  public function getCredential(): string {
    return $this->credentialConstructor->getCredential();
  }

  public function getCredentialConstructor(): CredentialInterface {
    return $this->credentialConstructor;
  }
}

$repository = [
  DatabaseInterface::class => MySQL::class, // or PostgreSQL::class
  CredentialInterface::class => TestCredential::class // or ProdCredential::class
];

class DatabaseHandler {
  private DatabaseInterface $db;

  public function __construct(DatabaseInterface $db) {
    $this->db = $db;
  }

  public function getDB(): DatabaseInterface {
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
echo $instance->getDB()->getCredentialConstructor()->getCredential() . PHP_EOL;
