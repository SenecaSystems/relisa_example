import {Socket} from "phoenix"

const counterNode = document.getElementById("counter");
const versionNode = document.getElementById("version");
const socket = new Socket("/ws");
socket.connect();
const chan = socket.chan("counter", {});
chan.join().receive("ok", chan => {
  console.log("Welcome to Phoenix Chat!")
});
chan.on("increment", msg => {
  const currentValue = parseInt(counterNode.innerHTML, 10);
  counterNode.innerHTML = currentValue + 1;
});
chan.on("version", msg => {
  versionNode.innerHTML = msg.version;
});

let App = {
}

export default App
