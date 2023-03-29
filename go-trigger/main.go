package main

import (
    "fmt"
    "io/ioutil"
	"log"
    "gopkg.in/yaml.v2"
)

type Config struct {
    Name string `yaml:"name"`
}

func main() {
    // Read YAML file
    data, err := ioutil.ReadFile("go-trigger.yaml")
    if err != nil {
        log.Fatal("Error reading config file go-trigger.yaml", err)
    }

    // Parse YAML data
    var config Config
    err = yaml.Unmarshal(data, &config)
    if err != nil {
        log.Fatal("Error unmarshalling configuration file data", err)
    }

    // Print greeting
    fmt.Printf("Hello %s!\n", config.Name)
}
