# README

## Course enrollment

This application is based on the following acceptance criteria:
- As a teacher, I should be able to create new courses.
- As a teacher, I should be able to enroll in several courses created by other teachers.
- As a teacher, I should be able to see a list of enrollments.
- As a teacher, I should be able to vote for another teacher once.
- As a teacher, I should be able to vote for a course once.
- As a teacher, I should be able to see the votes in the enrollment list.

## Tech/framework used

- Ruby version: 2.7.1
- Rails version: 6.0.3.4
- Database: Sqlite 3.28.0

## Installation

1. Install [Ruby on Rails](https://edgeguides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails)
2. Clone this repository.
3. Database set up:
- Create the database `rails db:create`
- Run migrations `rails db:migrate`

## Test

`bundle exec rspec`