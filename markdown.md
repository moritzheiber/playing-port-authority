class: middle, left, backgroundblue
layout: true
count: false

---
class: center

# Infrastructure Testing with serverspec

???


---

# Testing production code

```ruby
describe "fizzbuzz" do
  it 'returns "Fizz" when the number is divisible by 3' do
    fizz_3 = fizzbuzz(3)

    expect(fizz_3).to eq("Fizz")
  end
end
```

???

- Test first
- Red/Green/Refactor

---

## And testing infrastructure?

???

- What if you could test a container in the same way
- serverspec
- - based on rspec
- - lightweight
- Could even do Test first

--

[embedmd]:# (spec/example1/example_spec.rb ruby)

???

- Complete test that checks whether ruby package is installed
- Lets look at some parts in more detail
---
## Some details

[embedmd]:# (spec/example1/example_spec.rb ruby /image =/ /\)/)

???
- build the image using docker-api
--

[embedmd]:# (spec/example1/example_spec.rb ruby /.*set :docker.*/)

???

- tell serverspec which image to start
--

[embedmd]:# (spec/example1/example_spec.rb ruby /.*it .*/ /end/)

???

- the actual test

---
## Execute it!

```bash
$ bundle install --path vendor/bundle

$ bundle exec rspec spec/example1/example_spec.rb
```

???

- ruby bundler
- Run like any other rspec test

---

## Make it green!

[embedmd]:# (Dockerfile.brown_bag_example_1 Dockerfile)

---

# Project structure

```verbatim
├── Dockerfile.brown_bag_example_1
├── Gemfile
├── Gemfile.lock
├── Rakefile
└── spec
    ├── example1
    │   └── example_spec.rb
    └── spec_helper.rb
```

---

## Gemfile

[embedmd]:# (Gemfile ruby /.*/ /.*docker-api.*/)

???
- typical Gemfile
-- 

## spec_helper.rb

[embedmd]:# (spec/spec_helper.rb ruby)

???
- require gems
- Tell serverspec about docker backend
- Tell serverspec the os
---

## Step 2 - Simple Web Service

--

[embedmd]:# (sinatra_example.rb ruby)

---

## Test service in container

[embedmd]:# (spec/example2/example2_spec.rb ruby /.*image2.*/ $)

---

## Again, make the test green

[embedmd]:# (Dockerfile.brown_bag_example_2 Dockerfile)
---

## Compose it!

--
### Web Service needs consul

[embedmd]:# (sinatra_example3.rb ruby)

???

- What if: testing in concert
- Assume sinatra web service consul
- - Get welcome message
---

### docker-compose.yml

[embedmd]:# (docker-compose.yml yml)

---

### Test it

--

[embedmd]:# (spec/example3/example3_spec.rb ruby /before.*/ /end/)

???

- setup code
- start all services

--

[embedmd]:# (spec/example3/example3_spec.rb ruby /after.*/ /end/)

???

- teardown
- and bring them down afterwards

--

[embedmd]:# (spec/example3/example3_spec.rb ruby /.*docker_container.*/)

???

- tell serverspec to use the container

---

### The complete test

[embedmd]:# (spec/example3/example3_spec.rb ruby /.*/ /Consul Connection/)

---

### continued

[embedmd]:# (spec/example3/example3_spec.rb ruby /describe.*Consul Connection/ /end\nend/)

---
## Resource Types

```ruby
  describe file('/some/file') do
    it { should exist }
    its(:content) { should match(/something/) }
  end
```
--
- user
- process
- cron
- group
- ...
---
## Backends

- docker
- ssh
- shell script

???

- Many different backends
---
# Links

- [https://github.com/fbernitt/infrastructure-testing](https://github.com/fbernitt/infrastructure-testing)

- [serverspec](http://serverspec.org/)
- [specinfra](https://github.com/mizzy/specinfra)
- [rspec-wait](https://github.com/laserlemon/rspec-wait)

---
class: center

# THANKS
