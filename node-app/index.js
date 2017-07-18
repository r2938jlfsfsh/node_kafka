var kafka = require('kafka-node');

var opts = {
   kafkaHost: 'localhost:29092',
   groupId: 'testConsGroup',
   sessionTimeout: 15000,
   protocol: ['roundrobin'],
   fromOffset: 'latest'
};

var consumer = new kafka.ConsumerGroup(opts, 'node_test');
var val = '';

consumer.on('message', function(message) {
   console.log("Full msg: ", message);
   console.log("msg only:", message.value);
   val = JSON.parse(message.value);
   console.log("upd only:", val.upd);
});

consumer.on('error', function(err) {
   console.log("ERROR: ", err);
});

