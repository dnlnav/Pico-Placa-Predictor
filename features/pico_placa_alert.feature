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
        | PSA-0123      | 18/06/2018 | 23:00 | Go Ahead!      |
        | PFO-712       | 10/04/2018 | 05:00 | Go Ahead!      |
        | GMO-1234      | 14/02/2018 | 20:00 | Go Ahead!      |
        | TAC-5432      | 07/06/2018 | 14:00 | Go Ahead!      |
        | ICB-7123      | 11/05/2011 | 14:00 | Go Ahead!      |

    Scenarios: I have pico y placa today but not at this time
        | license_plate | date       | time  | result_message |
        | PSA-0121      | 18/06/2018 | 23:30 | Go Ahead!      |
        | PFO-713       | 10/04/2018 | 05:55 | Go Ahead!      |
        | GMO-1236      | 14/02/2018 | 21:10 | Go Ahead!      |
        | TAC-5438      | 07/06/2018 | 15:00 | Go Ahead!      |
        | ICB-7120      | 11/05/2011 | 14:00 | Go Ahead!      |

    Scenarios: I have pico y placa at this time but not today
        | license_plate | date       | time  | result_message |
        | PSA-0123      | 18/06/2018 | 7:00  | Go Ahead!      |
        | PFO-712       | 10/04/2018 | 09:00 | Go Ahead!      |
        | GMO-1234      | 14/02/2018 | 16:00 | Go Ahead!      |
        | TAC-5432      | 07/06/2018 | 19:00 | Go Ahead!      |
        | ICB-7123      | 11/05/2011 | 08:00 | Go Ahead!      |

    Scenarios: I have pico y placa right now
        | license_plate | date       | time  | result_message |
        | PSA-0121      | 18/06/2018 | 7:00  | Stay Home!     |
        | PFO-713       | 10/04/2018 | 09:00 | Stay Home!     |
        | GMO-1236      | 14/02/2018 | 16:00 | Stay Home!     |
        | TAC-5438      | 07/06/2018 | 19:00 | Stay Home!     |
        | ICB-7120      | 11/05/2011 | 9:10  | Stay Home!     |
