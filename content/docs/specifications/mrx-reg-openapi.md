---
title:       mrx-register api v1.0.0-oas3.1
linkTitle:   mrx-reg-api
date:        2025-02-19
description: metarex register api specification
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2
---

<!-- Generator: Widdershins v4.0.1 -->

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

# mrx-reg-svr

The OpenAPI Schema for [the MetaRex register](https://metarex.media/ui/reg/)
To find out more about MetaRex and our mission, visit the [website](https://metarex.media).

This handles creating and getting of simple register entries, as well as admin areas
and finding out whats currently in the register.

## Developer Design Choices

Here is the list of choices we have made in the design of the register, that may not be noticeable from reading the specification.

### 1. Handling a Trailing /

The trailing / is not explicitly declared in the path OpenAPI specification,
mainly to reduce bloating the schema with duplicated fields and to reduce errors for autogenerating server code based on the specification.
For the ease of integration into different proxies such as NGINX
then a design decision has been taken to allow the register to handle them.

For example `/reg` and `/reg/` are expected to give the same response, as are
`/reg?limit=20` and `/reg/?limit=20`. In the [demo server](https://github.com/metarex-media/), this is achieved by stripping the trailing / from
the URL of any requests.

Email: <a href="mailto:info@metarex.media">Support</a> 
License: <a href="https://opensource.org/license/bsd-3-clause/">BSD 3 Clause</a>

# Authentication

- oAuth2 authentication. 

    - Flow: authorizationCode
    - Authorization URL = [https://example.com/oauth/authorize](https://example.com/oauth/authorize)
    - Token URL = [https://example.com/oauth/token](https://example.com/oauth/token)

|Scope|Scope Description|
|---|---|
|read|Grants read access|
|write|Grants write access|
|admin|Grants access to admin operations|

<h1 id="mrx-register-api-default">Default</h1>

## get__test

> Code samples

```shell
# You can also use wget
curl -X GET /test \
  -H 'Accept: text/plain'

```

```http
GET /test HTTP/1.1

Accept: text/plain

```

```javascript

const headers = {
  'Accept':'text/plain'
};

fetch('/test',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'text/plain'
}

result = RestClient.get '/test',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Accept': 'text/plain'
}

r = requests.get('/test', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'text/plain',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','/test', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/test");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"text/plain"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "/test", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`GET /test`

> Example responses

> 200 Response

```
"string"
```

<h3 id="get__test-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|self test pass|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|test failed|None|

<aside class="success">
This operation does not require authentication
</aside>

<h1 id="mrx-register-api-public">public</h1>

Public access operations - unsecured

## searchRegisterEntries

<a id="opIdsearchRegisterEntries"></a>

> Code samples

```shell
# You can also use wget
curl -X GET /reg \
  -H 'Accept: application/json'

```

```http
GET /reg HTTP/1.1

Accept: application/json

```

```javascript

const headers = {
  'Accept':'application/json'
};

fetch('/reg',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get '/reg',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('/reg', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','/reg', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/reg");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"application/json"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "/reg", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`GET /reg`

*search local register*

## Query the local MetaRex register
Defaults to returning the most recently added entries based on the configuration of `limit`.
**Query parameter summary** (see definitions for defaults):
* 'skip=N' skips the first N entries of the returned results * 'limit=L' return only `L` results. * 'sort=ASC|DESC,CREATE|MODIFIED|ALPHABETICAL' sorting. * 'format=MrxIds|EntriesList'

<h3 id="searchregisterentries-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|skip|query|[skipParamSchema](#schemaskipparamschema)|false|Number of records to skip before returning list.|
|limit|query|[limitValueSchema](#schemalimitvalueschema)|false|Maxiumum number of records to return.|
|sort|query|[sortParamElementSchema](#schemasortparamelementschema)|false|Sorting of returned records.|

#### Enumerated Values

|Parameter|Value|
|---|---|
|sort|ASC|
|sort|DESC|
|sort|CREATE|
|sort|MODIFIED|
|sort|ALPHABETICAL|

> Example responses

> 200 Response

```json
[
  {
    "apiVersion": "v0.5.1",
    "entries": [
      "string"
    ],
    "format": "MrxIds",
    "limit": 20,
    "queryId": "d290f1ee-6c54-4b01-90e6-d701748f0851",
    "start": 7321,
    "serverInfo": {
      "name": "mrx-reg-server",
      "homePage": "https://metarex.media",
      "supportUrl": "https://github.com/metarex-media/mrx-reg-server/issues",
      "version": "v0.5.1"
    }
  }
]
```

<h3 id="searchregisterentries-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|search results matching criteria|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|bad input parameter|None|

<h3 id="searchregisterentries-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[EntriesResponseSchema](#schemaentriesresponseschema)]|false|none|[A list of Entry objects for presentation on a UI]|
|» apiVersion|[semVerSchema](#schemasemverschema)|true|none|a valid semantic version as defined by semver.org|
|» entries|any|true|none|none|

*oneOf*

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|»» *anonymous*|[string]|false|none|none|

*xor*

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|»» *anonymous*|[object]|false|none|none|
|»»» mrxId|string|true|none|none|
|»»» name|string|true|none|none|

*continued*

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» format|string|true|none|The format of the elements of the list|
|» limit|integer|true|none|The value of the limit query param (if specified) or the default value of limit (if unspecified in the query) or the maximum value that can be used in this system if the specified value was too big.|
|» queryId|string(uuid)|true|none|The id of the query that generated this list|
|» start|integer|true|none|The number of records skipped before returning this list|
|» serverInfo|[serverInfoSchema](#schemaserverinfoschema)|false|none|information about the server providing results|
|»» name|string|false|none|name of the server software|
|»» homePage|string(url)|false|none|none|
|»» supportUrl|string(url)|true|none|none|
|»» version|string|true|none|a valid semantic version for the running server as defined by semver.org|

#### Enumerated Values

|Property|Value|
|---|---|
|format|MrxIds|
|format|EntriesList|

<aside class="success">
This operation does not require authentication
</aside>

<h1 id="mrx-register-api-owner">owner</h1>

## addRegisterEntryGenID

<a id="opIdaddRegisterEntryGenID"></a>

> Code samples

```shell
# You can also use wget
curl -X POST /reg \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/plain' \
  -H 'Authorization: Bearer {access-token}'

```

```http
POST /reg HTTP/1.1

Content-Type: application/json
Accept: text/plain

```

```javascript
const inputBody = '{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'text/plain',
  'Authorization':'Bearer {access-token}'
};

fetch('/reg',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'text/plain',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post '/reg',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'text/plain',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('/reg', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'text/plain',
    'Authorization' => 'Bearer {access-token}',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','/reg', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/reg");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Content-Type": []string{"application/json"},
        "Accept": []string{"text/plain"},
        "Authorization": []string{"Bearer {access-token}"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("POST", "/reg", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`POST /reg`

*adds an inventory item*

gets a new entry to the MetaRex register

> Body parameter

```json
{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}
```

<h3 id="addregisterentrygenid-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[MRXDefinition](#schemamrxdefinition)|false|The Metarex register definition|

> Example responses

> 201 Response

```
"string"
```

> 400 Response

```json
{
  "ErrorMessage": "string"
}
```

<h3 id="addregisterentrygenid-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|item uploaded|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|error posting the entry|[ErrorMessage](#schemaerrormessage)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|No post permissions|[ErrorMessage](#schemaerrormessage)|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|invalid id, register entry already exists|[ErrorMessage](#schemaerrormessage)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
OAuth2 ( Scopes: write admin )
</aside>

## getRegisterEntry

<a id="opIdgetRegisterEntry"></a>

> Code samples

```shell
# You can also use wget
curl -X GET /reg/{id} \
  -H 'Accept: application/json'

```

```http
GET /reg/{id} HTTP/1.1

Accept: application/json

```

```javascript

const headers = {
  'Accept':'application/json'
};

fetch('/reg/{id}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get '/reg/{id}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('/reg/{id}', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','/reg/{id}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/reg/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"application/json"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "/reg/{id}", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`GET /reg/{id}`

*gets an inventory item*

gets a new entry to the MetaRex register

<h3 id="getregisterentry-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|[MrxIdSchema](#schemamrxidschema)|true|none|

> Example responses

> 200 Response

```json
{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}
```

<h3 id="getregisterentry-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|item found|[MRXDefinition](#schemamrxdefinition)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|invalid id, no register entry found|[ErrorMessage](#schemaerrormessage)|

<aside class="success">
This operation does not require authentication
</aside>

## addRegisterEntry

<a id="opIdaddRegisterEntry"></a>

> Code samples

```shell
# You can also use wget
curl -X POST /reg/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/plain' \
  -H 'Authorization: Bearer {access-token}'

```

```http
POST /reg/{id} HTTP/1.1

Content-Type: application/json
Accept: text/plain

```

```javascript
const inputBody = '{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'text/plain',
  'Authorization':'Bearer {access-token}'
};

fetch('/reg/{id}',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'text/plain',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post '/reg/{id}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'text/plain',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('/reg/{id}', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Content-Type' => 'application/json',
    'Accept' => 'text/plain',
    'Authorization' => 'Bearer {access-token}',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('POST','/reg/{id}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/reg/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Content-Type": []string{"application/json"},
        "Accept": []string{"text/plain"},
        "Authorization": []string{"Bearer {access-token}"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("POST", "/reg/{id}", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`POST /reg/{id}`

*adds an inventory item*

gets a new entry to the MetaRex register

> Body parameter

```json
{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}
```

<h3 id="addregisterentry-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|[MrxIdPostSchema](#schemamrxidpostschema)|true|none|
|body|body|[MRXDefinition](#schemamrxdefinition)|false|The Metarex register definition|

> Example responses

> 201 Response

```
"string"
```

> 400 Response

```json
{
  "ErrorMessage": "string"
}
```

<h3 id="addregisterentry-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|item uploaded|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|error posting the entry|[ErrorMessage](#schemaerrormessage)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|No post permissions|[ErrorMessage](#schemaerrormessage)|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|invalid id, register entry already exists|[ErrorMessage](#schemaerrormessage)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
OAuth2 ( Scopes: write admin )
</aside>

## getRegisterEntryAdmin

<a id="opIdgetRegisterEntryAdmin"></a>

> Code samples

```shell
# You can also use wget
curl -X GET /regadmin/reg/{id} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access-token}'

```

```http
GET /regadmin/reg/{id} HTTP/1.1

Accept: application/json

```

```javascript

const headers = {
  'Accept':'application/json',
  'Authorization':'Bearer {access-token}'
};

fetch('/regadmin/reg/{id}',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get '/regadmin/reg/{id}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('/regadmin/reg/{id}', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'application/json',
    'Authorization' => 'Bearer {access-token}',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','/regadmin/reg/{id}', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/regadmin/reg/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"application/json"},
        "Authorization": []string{"Bearer {access-token}"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "/regadmin/reg/{id}", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`GET /regadmin/reg/{id}`

*gets an inventory item*

gets a new entry to the MetaRex register

<h3 id="getregisterentryadmin-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|[MrxIdSchema](#schemamrxidschema)|true|none|

> Example responses

> 200 Response

```json
{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}
```

<h3 id="getregisterentryadmin-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|item found|[MRXDefinition](#schemamrxdefinition)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|invalid id, no register entry found|[ErrorMessage](#schemaerrormessage)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|No admin permissions|[ErrorMessage](#schemaerrormessage)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
OAuth2 ( Scopes: admin )
</aside>

## getHelpRegisterEntryAdmin

<a id="opIdgetHelpRegisterEntryAdmin"></a>

> Code samples

```shell
# You can also use wget
curl -X GET /regadmin/reg/{id}/help \
  -H 'Accept: text/markdown' \
  -H 'Authorization: Bearer {access-token}'

```

```http
GET /regadmin/reg/{id}/help HTTP/1.1

Accept: text/markdown

```

```javascript

const headers = {
  'Accept':'text/markdown',
  'Authorization':'Bearer {access-token}'
};

fetch('/regadmin/reg/{id}/help',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'text/markdown',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get '/regadmin/reg/{id}/help',
  params: {
  }, headers: headers

p JSON.parse(result)

```

```python
import requests
headers = {
  'Accept': 'text/markdown',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('/regadmin/reg/{id}/help', headers = headers)

print(r.json())

```

```php
<?php

require 'vendor/autoload.php';

$headers = array(
    'Accept' => 'text/markdown',
    'Authorization' => 'Bearer {access-token}',
);

$client = new \GuzzleHttp\Client();

// Define array of request body.
$request_body = array();

try {
    $response = $client->request('GET','/regadmin/reg/{id}/help', array(
        'headers' => $headers,
        'json' => $request_body,
       )
    );
    print_r($response->getBody()->getContents());
 }
 catch (\GuzzleHttp\Exception\BadResponseException $e) {
    // handle exception or api errors.
    print_r($e->getMessage());
 }

 // ...

```

```java
URL obj = new URL("/regadmin/reg/{id}/help");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());

```

```go
package main

import (
       "bytes"
       "net/http"
)

func main() {

    headers := map[string][]string{
        "Accept": []string{"text/markdown"},
        "Authorization": []string{"Bearer {access-token}"},
    }

    data := bytes.NewBuffer([]byte{jsonReq})
    req, err := http.NewRequest("GET", "/regadmin/reg/{id}/help", data)
    req.Header = headers

    client := &http.Client{}
    resp, err := client.Do(req)
    // ...
}

```

`GET /regadmin/reg/{id}/help`

*gets an inventory item*

gets a new entry to the MetaRex register

<h3 id="gethelpregisterentryadmin-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|[MrxIdSchema](#schemamrxidschema)|true|none|

> Example responses

> 200 Response

> 400 Response

```json
{
  "ErrorMessage": "string"
}
```

<h3 id="gethelpregisterentryadmin-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|item found|[Message](#schemamessage)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|invalid id, no register entry found|[ErrorMessage](#schemaerrormessage)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|No admin permissions|[ErrorMessage](#schemaerrormessage)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
OAuth2 ( Scopes: admin )
</aside>

# Schemas

<h2 id="tocS_ErrorMessage">ErrorMessage</h2>
<!-- backwards compatibility -->
<a id="schemaerrormessage"></a>
<a id="schema_ErrorMessage"></a>
<a id="tocSerrormessage"></a>
<a id="tocserrormessage"></a>

```json
{
  "ErrorMessage": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|ErrorMessage|string|false|none|none|

<h2 id="tocS_Message">Message</h2>
<!-- backwards compatibility -->
<a id="schemamessage"></a>
<a id="schema_Message"></a>
<a id="tocSmessage"></a>
<a id="tocsmessage"></a>

```json
{
  "Message": "string",
  "MrxId": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|Message|string|false|none|none|
|MrxId|string|false|none|none|

<h2 id="tocS_MRXDefinition">MRXDefinition</h2>
<!-- backwards compatibility -->
<a id="schemamrxdefinition"></a>
<a id="schema_MRXDefinition"></a>
<a id="tocSmrxdefinition"></a>
<a id="tocsmrxdefinition"></a>

```json
{
  "metarexId": "string",
  "replacedBy": "string",
  "name": "string",
  "description": "string",
  "mediaType": "string",
  "timingIs": "string",
  "treatAs": "string",
  "expires": "string",
  "mrx": {
    "specification": "string",
    "services": [
      {
        "API": "string",
        "method": "string",
        "metarexId": "string",
        "APISchema": "string",
        "output": "string",
        "description": "string",
        "serviceID": "string"
      }
    ],
    "mapping": {
      "convertTypes": true,
      "MissedFieldsKey": "string",
      "mappingDefinitions": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  },
  "extra": {}
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|metarexId|[MrxIdSchema](#schemamrxidschema)|true|none|an MRX generated ID matching the pattern or a uuid type 1 | type 4|
|replacedBy|[MrxIdSchema](#schemamrxidschema)|false|none|a Metarex ID superseding this entry|
|name|string|true|none|A short human readable UTF-8 name for the metadata payload in the language of its intended use.|
|description|string|true|none|A short human readable UTF-8 description of the type of metadata with this is ID in the language of its intended use.|
|mediaType|string|true|none|a valid media type for the unwrapped metadata payload when sent using a POST request to a web service (https://www.iana.org/assignments/media-types/)|
|timingIs|string|false|none|clocked when there is one document per frame (MXF frame wrapping). embedded when the timing is inside the metadata document | blob|
|treatAs|string|false|none|text when the metadata is treated like text (JSON, YAML, XML etc), binary when the document is treated as a blob by some application (machine data, word docs, pdf docs and the like)|
|expires|string|false|none|The UTC date+time when this entry may be removed from the register. If the property is missing then the entry never expires.|
|mrx|object|false|none|mrx controlled properties that enhance the metadata definition|
|» specification|string|false|none|none|
|» services|[object]|false|none|none|
|»» API|string|false|none|none|
|»» method|string|false|none|none|
|»» metarexId|string|false|none|none|
|»» APISchema|string|false|none|none|
|»» output|string|false|none|none|
|»» description|string|false|none|none|
|»» serviceID|string|false|none|none|
|» mapping|object|false|none|none|
|»» convertTypes|boolean|false|none|none|
|»» MissedFieldsKey|string|false|none|none|
|»» mappingDefinitions|object|false|none|none|
|»»» **additionalProperties**|[string]|false|none|none|
|extra|object|false|none|registrant controlled properties that enhance the metadata definition|

<h2 id="tocS_EntriesArraySchema">EntriesArraySchema</h2>
<!-- backwards compatibility -->
<a id="schemaentriesarrayschema"></a>
<a id="schema_EntriesArraySchema"></a>
<a id="tocSentriesarrayschema"></a>
<a id="tocsentriesarrayschema"></a>

```json
[
  "string"
]

```

### Properties

oneOf

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[MrxIdsArraySchema](#schemamrxidsarrayschema)|false|none|none|

xor

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[EntryArraySchema](#schemaentryarrayschema)|false|none|none|

<h2 id="tocS_EntryArraySchema">EntryArraySchema</h2>
<!-- backwards compatibility -->
<a id="schemaentryarrayschema"></a>
<a id="schema_EntryArraySchema"></a>
<a id="tocSentryarrayschema"></a>
<a id="tocsentryarrayschema"></a>

```json
[
  {
    "mrxId": "string",
    "name": "string"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|mrxId|string|true|none|none|
|name|string|true|none|none|

<h2 id="tocS_MrxIdsArraySchema">MrxIdsArraySchema</h2>
<!-- backwards compatibility -->
<a id="schemamrxidsarrayschema"></a>
<a id="schema_MrxIdsArraySchema"></a>
<a id="tocSmrxidsarrayschema"></a>
<a id="tocsmrxidsarrayschema"></a>

```json
[
  "string"
]

```

### Properties

*None*

<h2 id="tocS_MrxIdSchema">MrxIdSchema</h2>
<!-- backwards compatibility -->
<a id="schemamrxidschema"></a>
<a id="schema_MrxIdSchema"></a>
<a id="tocSmrxidschema"></a>
<a id="tocsmrxidschema"></a>

```json
"string"

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

<h2 id="tocS_MrxIdPostSchema">MrxIdPostSchema</h2>
<!-- backwards compatibility -->
<a id="schemamrxidpostschema"></a>
<a id="schema_MrxIdPostSchema"></a>
<a id="tocSmrxidpostschema"></a>
<a id="tocsmrxidpostschema"></a>

```json
"string"

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

<h2 id="tocS_EntriesResponseSchema">EntriesResponseSchema</h2>
<!-- backwards compatibility -->
<a id="schemaentriesresponseschema"></a>
<a id="schema_EntriesResponseSchema"></a>
<a id="tocSentriesresponseschema"></a>
<a id="tocsentriesresponseschema"></a>

```json
{
  "apiVersion": "v0.5.1",
  "entries": [
    "string"
  ],
  "format": "MrxIds",
  "limit": 20,
  "queryId": "d290f1ee-6c54-4b01-90e6-d701748f0851",
  "start": 7321,
  "serverInfo": {
    "name": "mrx-reg-server",
    "homePage": "https://metarex.media",
    "supportUrl": "https://github.com/metarex-media/mrx-reg-server/issues",
    "version": "v0.5.1"
  }
}

```

A list of Entry objects for presentation on a UI

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|apiVersion|[semVerSchema](#schemasemverschema)|true|none|a valid semantic version as defined by semver.org|
|entries|[EntriesArraySchema](#schemaentriesarrayschema)|true|none|none|
|format|string|true|none|The format of the elements of the list|
|limit|integer|true|none|The value of the limit query param (if specified) or the default value of limit (if unspecified in the query) or the maximum value that can be used in this system if the specified value was too big.|
|queryId|string(uuid)|true|none|The id of the query that generated this list|
|start|integer|true|none|The number of records skipped before returning this list|
|serverInfo|[serverInfoSchema](#schemaserverinfoschema)|false|none|information about the server providing results|

#### Enumerated Values

|Property|Value|
|---|---|
|format|MrxIds|
|format|EntriesList|

<h2 id="tocS_MrxEntryPostSchema">MrxEntryPostSchema</h2>
<!-- backwards compatibility -->
<a id="schemamrxentrypostschema"></a>
<a id="schema_MrxEntryPostSchema"></a>
<a id="tocSmrxentrypostschema"></a>
<a id="tocsmrxentrypostschema"></a>

```json
null

```

this API is an implementation of the document specified at https://metarex.media/reg/MXF.123.456.769.abc

### Properties

*None*

<h2 id="tocS_serverInfoSchema">serverInfoSchema</h2>
<!-- backwards compatibility -->
<a id="schemaserverinfoschema"></a>
<a id="schema_serverInfoSchema"></a>
<a id="tocSserverinfoschema"></a>
<a id="tocsserverinfoschema"></a>

```json
{
  "name": "mrx-reg-server",
  "homePage": "https://metarex.media",
  "supportUrl": "https://github.com/metarex-media/mrx-reg-server/issues",
  "version": "v0.5.1"
}

```

information about the server providing results

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|false|none|name of the server software|
|homePage|string(url)|false|none|none|
|supportUrl|string(url)|true|none|none|
|version|string|true|none|a valid semantic version for the running server as defined by semver.org|

<h2 id="tocS_limitAllSchema">limitAllSchema</h2>
<!-- backwards compatibility -->
<a id="schemalimitallschema"></a>
<a id="schema_limitAllSchema"></a>
<a id="tocSlimitallschema"></a>
<a id="tocslimitallschema"></a>

```json
"ALL"

```

A value of ALL for limit will result in the maximum number of entries allowed by the system (max limit)

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|A value of ALL for limit will result in the maximum number of entries allowed by the system (max limit)|

#### Enumerated Values

|Property|Value|
|---|---|
|*anonymous*|ALL|

<h2 id="tocS_limitSchema">limitSchema</h2>
<!-- backwards compatibility -->
<a id="schemalimitschema"></a>
<a id="schema_limitSchema"></a>
<a id="tocSlimitschema"></a>
<a id="tocslimitschema"></a>

```json
20

```

### Properties

*None*

<h2 id="tocS_limitValueSchema">limitValueSchema</h2>
<!-- backwards compatibility -->
<a id="schemalimitvalueschema"></a>
<a id="schema_limitValueSchema"></a>
<a id="tocSlimitvalueschema"></a>
<a id="tocslimitvalueschema"></a>

```json
20

```

A limit can be an integer value indicating the maximum number of entries to return in a query. A limit value set greater than the system's internal max limit value will be clamped to the max limit value number.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|integer|false|none|A limit can be an integer value indicating the maximum number of entries to return in a query. A limit value set greater than the system's internal max limit value will be clamped to the max limit value number.|

<h2 id="tocS_skipParamSchema">skipParamSchema</h2>
<!-- backwards compatibility -->
<a id="schemaskipparamschema"></a>
<a id="schema_skipParamSchema"></a>
<a id="tocSskipparamschema"></a>
<a id="tocsskipparamschema"></a>

```json
0

```

an integer of the number of items to skip in responses

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|integer|false|none|an integer of the number of items to skip in responses|

<h2 id="tocS_semVerSchema">semVerSchema</h2>
<!-- backwards compatibility -->
<a id="schemasemverschema"></a>
<a id="schema_semVerSchema"></a>
<a id="tocSsemverschema"></a>
<a id="tocssemverschema"></a>

```json
"v0.5.1"

```

a valid semantic version as defined by semver.org

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|a valid semantic version as defined by semver.org|

<h2 id="tocS_sortParamSchema">sortParamSchema</h2>
<!-- backwards compatibility -->
<a id="schemasortparamschema"></a>
<a id="schema_sortParamSchema"></a>
<a id="tocSsortparamschema"></a>
<a id="tocssortparamschema"></a>

```json
"ASC"

```

A comma separated list of `sortParamElementSchema` values presented as an array to the server.

### Properties

*None*

<h2 id="tocS_sortParamElementSchema">sortParamElementSchema</h2>
<!-- backwards compatibility -->
<a id="schemasortparamelementschema"></a>
<a id="schema_sortParamElementSchema"></a>
<a id="tocSsortparamelementschema"></a>
<a id="tocssortparamelementschema"></a>

```json
"ASC"

```

Valid keywords are described here - how the logic is applied is application specific. Recommended behaviour is that precedence is highest at the start of the query string and lowest at the end.
`sort=ASC,MODIFIED,DESC,ALPHABETICAL`
would result in sorting by `ASC` first, then `MODIFIED`. `DESC` and `ALPHABETICAL` are ignored because of mutual exclusivity rules.

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|Valid keywords are described here - how the logic is applied is application specific. Recommended behaviour is that precedence is highest at the start of the query string and lowest at the end.<br>`sort=ASC,MODIFIED,DESC,ALPHABETICAL`<br>would result in sorting by `ASC` first, then `MODIFIED`. `DESC` and `ALPHABETICAL` are ignored because of mutual exclusivity rules.|

#### Enumerated Values

|Property|Value|
|---|---|
|*anonymous*|ASC|
|*anonymous*|DESC|
|*anonymous*|CREATE|
|*anonymous*|MODIFIED|
|*anonymous*|ALPHABETICAL|

