# MajorTom

[![Version](https://img.shields.io/cocoapods/v/MajorTom.svg?style=flat)](http://cocoapods.org/pods/MajorTom)
[![License](https://img.shields.io/cocoapods/l/MajorTom.svg?style=flat)](http://cocoapods.org/pods/MajorTom)
[![Platform](https://img.shields.io/cocoapods/p/MajorTom.svg?style=flat)](http://cocoapods.org/pods/MajorTom)

**Remote configuration for iOS**

Many developers don't realize that they are allowed to remotely control the behavior of their app (provided that the application isn't downloading any new code).

MajorTom gives you a dead-simple way to remotely configure your app, allowing you to add things like [feature flags](http://code.flickr.com/blog/2009/12/02/flipping-out/), impromptu [A/B tests](http://en.wikipedia.org/wiki/A/B_testing), or a simple ["message of the day"](http://en.wikipedia.org/wiki/Motd_%28Unix%29).

It's inpsired by [GroundControl](https://github.com/mattt/GroundControl), and provides a single category on `NSUserDefaults`.

## Client Code

```swift
UserDefaults().registerDefaultsWithURL(url: URL(string:"https://theprogressapp.com/wtw/defaults.plist")!)```
```

...or if you need callbacks for success/failure, and prefer not to listen for a `NSUserDefaultsDidChangeNotification`:

```swift
UserDefaults().registerDefaultsWithURL(url: URL(string:"https://theprogressapp.com/wtw/defaults.plist")!, success: { (response, dictionary) in
    print(response.debugDescription)
    print(dictionary.debugDescription)
}) { (response) in
    print(response.debugDescription)
}
```

## Server Code

MajorTom asynchronously downloads and reads a remote plist file. This could be a static file or generated dynamically, like in the following examples:

### Ruby

```ruby
require 'sinatra'
require 'plist'

get '/defaults.plist' do
  content_type 'application/x-plist'

  {
    'Greeting' => "Hello, World",
    'Price' => 4.20,
    'FeatureXIsLaunched' => true
  }.to_plist
end
```

### Python

```python
from django.http import HttpResponse
import plistlib

def property_list(request):
plist = {
    'Greeting': "Hello, World",
    'Price': 4.20,
    'FeatureXIsLaunched': True,
    'Status': 1
}

return HttpResponse(plistlib.writePlistToString(plist))
```

### Node.js

```javascript
var plist = require('plist'),
express = require('express')

var host = "127.0.0.1"
var port = 8080

var app = express()

app.get("/", function(request, response) {
response.send(plist.build(
{
    'Greeting': "Hello, World",
    'Price': 4.20,
    'FeatureXIsLaunched': true,
    'Status': 1
}
).toString())
})

app.listen(port, host)
```
### Static File
Or, simply create a plist file in Xcode and upload it to your webserver :)

## Contact

Lewis Smith

- http://github.com/lewis-smith
- http://twitter.com/itinerantDev

## License

MajorTom is available under the MIT license. See the LICENSE file for more info.

## Apps
[World Time Widget](https://itunes.apple.com/us/app/world-clock-time-widget-for-timezones/id912698955?mt=8)
