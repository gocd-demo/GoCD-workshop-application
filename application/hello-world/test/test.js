var request = require("request");
var assert = require("assert");
var helloWorld = require("../hello_world.js");

var base_url = "http://localhost:3000/"

describe("Hello World Server", function() {
  describe("GET /", function() {
    it("returns status code 200", function(done) {

      request.get(base_url, function(error, response, body) {
        assert.equal(200, response.statusCode);
        helloWorld.closeServer();
        done();
      });

    });
  });
});
