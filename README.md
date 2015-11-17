# BitfinexSwiftAPI
Swift library for Bitfinex API

Why? Just dive into swift development. 

For now, implemented only rest api methods, websockets in progress. The main problem is AWFUL designed API. 
"Yes"/"No", 0/1, "0"/"1", true/false - that's several variants of boolean value, presented in json rest api of bitfinex.

Parsing websocket responses starts with figuring out is that's a dictionary or array, after that we have to figure out what kind of dictionary or array it is, and so on. 
Bitfinex API is the example of how you shouldn't design your API. 

## Roadmap
- Refactoring of existing REST API an API routers
- Websocket clien (In progress)
- Foundation free and linux ready library. 

PS: used apikey and apisecret are from account without any money, and after library will finished, it will be voided. 
