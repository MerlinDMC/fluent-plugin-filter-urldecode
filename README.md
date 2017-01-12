# fluent-plugin-filter-urldecode

[![Build Status](https://travis-ci.org/MerlinDMC/fluent-plugin-filter-urldecode.svg?branch=master)](https://travis-ci.org/MerlinDMC/fluent-plugin-filter-urldecode)
[![Gem Version](https://badge.fury.io/rb/fluent-plugin-filter-urldecode.svg)](http://badge.fury.io/rb/fluent-plugin-filter-urldecode)

## Overview

A percent decode filter for [Fluentd](http://www.fluentd.org/).

### Configuration

Decode percent encoded fields

```
<source>
  @type dummy
  tag example
  dummy {"message": "1%202%203"}
</source>

<filter example>
  @type urldecode
  fields message
</filter>

<match **>
  @type stdout
</match>
```
