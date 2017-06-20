let Main = require('../src/Main.purs');
Main.main(true)();

if (module.hot) {
  module.hot.accept('../src/Main.purs', function() {
    var appNode = document.getElementById("app");
    while (appNode.firstChild)
      appNode.removeChild(appNode.firstChild);

    let MainR = require('../src/Main.purs');
    MainR.main(false)();
  });
}
