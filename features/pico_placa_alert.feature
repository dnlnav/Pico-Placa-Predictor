Feature: Pico y Placa Alert

As a driver in Quito
I want to check when I can drive or not
So I don't get fined

Scenario Outline: check pico y placa
    Given I'm in the page
    When I enter "<license_plate>", "<date>" and "<time>"
    Then I should see "<result_message>"

    Scenarios: I don't have pico y placa today nor at this time
        | license_plate | date       | time  | result_message |
        | PSA-0123      | 2018-06-18 | 23:00 | Go Ahead!      |
        | PFO-712       | 2018-04-10 | 05:00 | Go Ahead!      |
        | GMO-1234      | 2018-02-14 | 20:00 | Go Ahead!      |
        | TAC-5432      | 2018-06-07 | 14:00 | Go Ahead!      |
        | ICB-7123      | 2011-05-11 | 14:00 | Go Ahead!      |

    Scenarios: I have pico y placa today but not at this time
        | license_plate | date       | time  | result_message |
        | PSA-0121      | 2018-06-18 | 23:30 | Go Ahead!      |
        | PFO-713       | 2018-04-10 | 05:55 | Go Ahead!      |
        | GMO-1236      | 2018-02-14 | 21:10 | Go Ahead!      |
        | TAC-5438      | 2018-06-07 | 15:00 | Go Ahead!      |
        | ICB-7120      | 2011-05-11 | 14:00 | Go Ahead!      |

    Scenarios: I have pico y placa at this time but not today
        | license_plate | date       | time  | result_message |
        | PSA-0123      | 2018-06-18 | 07:00 | Go Ahead!      |
        | PFO-712       | 2018-04-10 | 09:00 | Go Ahead!      |
        | GMO-1234      | 2018-02-14 | 16:00 | Go Ahead!      |
        | TAC-5432      | 2018-06-07 | 19:00 | Go Ahead!      |
        | ICB-7123      | 2011-05-11 | 08:00 | Go Ahead!      |

    Scenarios: I have pico y placa right now
        | license_plate | date       | time  | result_message |
        | PSA-0121      | 2018-06-18 | 07:00 | Stay Home!     |
        | PFO-713       | 2018-04-10 | 09:00 | Stay Home!     |
        | GMO-1236      | 2018-02-14 | 16:00 | Stay Home!     |
        | TAC-5438      | 2018-06-07 | 19:00 | Stay Home!     |
        | ICB-7120      | 2011-05-11 | 09:10 | Stay Home!     |
