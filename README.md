# Tacobout

Find steamy hot tacos near you.

# Legacy App Challenge

our team inherited this project as part of the legacy app challenge for CS 381
the following is the requirements sheet presented to us by the legacy developers:
```
Current State of Development
 - fixing tests after a series of merges
 - cleaning up factory code
 - Taco image uploading
 - Fixing schemas

What we have so far:
 - A big pile of crap
What is broken:
 - Most everything
 - We don't have much of a frontend
Five tasks:
 - Make DB organization decisions
 - Full switch over to factories
 - Taco image uploading
 - Creating taco shops and adding tacos
 - User reviews a taco shop / tacos

``` 
We managed to complete each of the five tasks, neabulous as they were.
1. "Make DB organization decisions"
this task doesn't imply a linear solution condition. the decision to not change anything technically satisfies this. that said, we did clean up a few properties accross classes to correct relationships, as well as add users and reviews to the relational model to facilitate an intuative interaction with the legacy database schema.

2. "Full switch over to factories"
For this we refactored our tests to use factories for instantiated objects as needed. every model tests instantiates objects using factories now.

3. "Taco image uploading"
When a new taco is created, the user can add a URL from any image hosting site and that image will be displayed alongside the taco in the tacos index

4. "Creating taco shops and adding tacos"
there is now a frontend interface for creating new shops, and new tacos. new tacos are created in the context of being sold by a specific shop, so when creating a new taco, users simply select the shop that vends that taco. that taco will then appear on the menu of that particular shop's page

5. "User reviews a taco shop / tacos"
the legacy app did not implement any sort of User or review code, so to develop the reviews system we first had to implement Users. when a user is looking at their userpage, after either logging in or signing up, or by being reffered to it from the users index, they can write a review. every review for a shop is displayed on that shop's page along with the authors username and 1-5 rating.


## Let's Tacobout it

TacoBout is the new hotness in food-finding near you. Ever hankering for a few savory tacos after a long day or looking for a quick bite for lunch? TacoBout aggregates all places that sell tacos in your area, with ratings and comments by other taco-lovers so you can let the sour cream rise to the top.

TacoBout is a Rails application developed by TDD, so you will have to have a machine and environment capable of supporting Ruby and gemfile installation.

## Environment

You will need Ruby for this project. You can determine the current project version by looking at the top of the `Gemfile` file.

I would highly reccomend you use a Ruby environment manager like [rvm](https://rvm.io/rvm/install).

```shell
rvm use SPECIFIED_RUBY_VERSION_HERE
```

If the speicified version is not yet installed you can set it up with:

```shell
rvm install SPECIFIED_RUBY_VERSION_HERE
```

## Setup

After you have ruby installed you will also need bundler. You can run the following commands to install the project dependencies.

```shell
gem install bundler
bundle
```

## Running Tests

Simply run `rspec` sit back think about relaxing, then stop, because these are lightning fast tests ⚡!

```shell
rspec
```

If you would like to have a watcher rerunning your tests then run:

```shell
guard
```

## Running the Server

```shell
rails s
```

## Rails Console

```shell
rails c
```

## Contributing

If you would like to contribute to this project you will need to:

1. Fork the repositiory on Github.
2. Create a feature branch.
    - If you are working on an issue name the branch like `issueNumber-issue-name`.
    - ie: `01-define-taco-spec`
3. Create tests & impelment your feature.
4. Make sure your tests pass!
5. Create a pull request against the `dev` branch against the main repository.
6. Wait for the code monkeys to groom through your 1337 H4X.
7. Profit. Find tacos & have a beer 🍻

---

_By [Andrew Bell](https://github.com/abell95) and [Cody Swartz](https://github.com/ctsstc) 🍊_