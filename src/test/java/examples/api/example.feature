Feature: sample karate api testing

  Background:
    * url 'https://reqres.in'

  Scenario: should return all users
    Given path '/api/users'
    When method get
    Then status 200
    And match $.data[*].first_name contains "George","Janet","Emma","Eve"

  Scenario: should return a single users
    Given path '/api/users/1'
    When method get
    Then status 200
    And match $.data.first_name == "George"

  Scenario: should create a new user
    Given path '/api/users'
    And request { "name": "zotho", "job": "qa engineer" }
    When method post
    Then status 201
    And match $ contains {name:"zotho", job:"qa engineer"}

  Scenario: should update a user
    Given path '/api/users'
    And request { "name": "zethe", "job": "sdet" }
    When method put
    Then status 200
    And match $ contains {name:"zethe", job:"sdet"}

  Scenario: should return all users
    Given path '/api/users/1'
    When method delete
    Then status 204