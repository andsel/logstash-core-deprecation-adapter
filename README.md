#Deprecation Logger adapter for LogStash < 8

With LogStash 7.6 it's going to provide a deprecation logger to write notices on deprecated stuff, usable also from plugin.
To smooth the adoption of such feature, this gem is introduced to make the plugins using it also with LogStash < 7.6; it simply provide a default implementation that fallback to normal log if the deprecation logger in not available, else use it.

## Need Help?

Need help? Try #logstash on freenode IRC or the https://discuss.elastic.co/c/logstash discussion forum.

## Developing

### 1. Plugin Development and Testing

#### Code

To install in a local Logstash, add
```sh
gem "logstash-core-deprecation-adapter", :path => "/path/to/logstash-core-deprecation-adapter"
```
in Logstash's Gemfile, and update the gems with:
```sh
./gradlew installDefaultGems
```
from your local Logstash

To verify it works, install the deprecation logegr test gem: logstash-input-deplogger-test
Define in local Gemfile:
```sh
gem "logstash-input-deplogger-test", :path => "/path/to/logstash-input-deplogger-test"
```
and update the installed plugins with:
```sh
bin/logstash-plugin install --no-verify
```

The final step is run Logstash pipeline with the deplogger plugin, example:
```
-e "input { deplogger-test {}} filter { sleep { time => 1}} output { stdout { codec => rubydebug } }"
```

In the log file if Logstash is < 7.6 then should be present something like:
```
[WARN ][logstash.inputs.deploggertest][main] DEPRECATED: `Wonderful` feature is deprecated
```

while for Logstash >= 7.6 the file logs/logstash-deprecation.log contains:
```sh
[WARN ][deprecation.logstash.inputs.deploggertest][main] `Wonderful` feature is deprecated
```
