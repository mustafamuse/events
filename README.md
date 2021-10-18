<h1 align="center">
  <img src="https://raw.githubusercontent.com/create-go-app/cli/master/.github/images/cgapp_logo%402x.png" width="224px"/><br/>
  Events API App
</h1>
<p align="center">Create a new Events API hosted project with a <b>backend</b>(Ruby on Rails) and <b>database</b>(Postgres) </p>

<p align="center"><a href="https://github.com/ruby/ruby/releases" target="_blank"><img src="https://img.shields.io/badge/Ruby-2.71-red" alt="ruby version" /></a>&nbsp;<a href="https://github.com/rails/rails/releases" target="_blank"><img src="https://img.shields.io/badge/Rails-6.0.4.1-blue" alt="rails version" /></a>&nbsp;<a href="https://www.postgresql.org/docs/release/" target="_blank"><img src="https://img.shields.io/badge/Postgres-13.2-white" alt="postgres version" /></a></p>

## ⚡️ Events: Post Endpoint

Needed Url: https://eventsapp101.herokuapp.com/

# ⚡️ Must needs for a Post Request
name and event_type are the required key/value pairs

Event type should be one of the following:
```
[submit refer click read login logout share signup subcribe]

```


# ⚡️ Optional/addiotional params for a Post Request

One can include more key/value pairs and those will be considered "additional_data" and according to the requirments of this project, if no additional data exists, the object will be empty.

# ⚡️ Example Post Request with 'additional data'

```
{"event" : {"name" : "subscribe_button", "event_type" : "subscribe", "button_type" : "primary", "button_color" : "blue"  }
```
return a JSON Object that looks like this:

```
{
    "id": 1,
    "name": "subscribe_button",
    "event_type": "subscribe",
    "additional_data": {
        "button_type" : "primary",
        "button_color" : "blue"
    }
}
```

That's all you need to know to start! 🎉

### Testing the Post Request
```
curl -X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "subscribe_button", "event_type" : "subscribe","button_color" : "blue" }}' 'https://eventsapp101.herokuapp.com/'

```

# ⚡️ Ive also included a few tests.

You can run this command:

```
rails test test/models/event_test.rb

```

### Testing the Todays stats (extra credit)

This endpoint takes all the events received today, groups them
by event_type and returns the count for each. The response are in JSON

for example

```
{"todays_stats" :
    [
        {"click" : 34},
        {"view": 54}
    ]
}

````

This can be accessed here https://eventsapp101.herokuapp.com/todaystats

