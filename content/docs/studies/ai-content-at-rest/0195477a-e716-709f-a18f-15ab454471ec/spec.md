# AI content at rest demo
  
A simple JSON to define the resolutions in the content stored for the demo.

Sample document:

```javascript
[
   {"w":3840, "h":2160, "name":"4k"},
   {"w":1920, "h":1080, "name":"HD"},
   {"w":960,  "h":540,  "name":"qHD"},
   {"w":480,  "h":270,  "name":"q2D"},
   {"w":240,  "h":135,  "name":"q3D"}
]
```

| property | meaning                   | type    | example    |
| :------: | ------------------------- | ------- | ---------- |
| root     | ordered array of objects  |         | (see above)|
|    w     | width                     | integer | 3840       |
|    h     | height                    | integer | 2160       |
|  name    | resolution display name   | string  | UHD        |

The resolution objects shall be in order:

* `object[0]` has the highest resolution / compute load
* `object[len(array)]` has the lowest resolution / compute load
