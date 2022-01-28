/**
 * @name AutoUpdate
 * @author Netfloex
 * @version 1
 * @description Auto Update
 * */
class AutoUpdate {
	start() {
		const interval = setInterval(() => {
			document.querySelector("button.all-iF7Saa")?.click();
			document.querySelector("#outdatedPlugins span")?.click();
			document
				.querySelector("[aria-labelledby][aria-modal]")
				?.querySelector("button[type=button]")
				?.click();
			console.log("AutoUpdate", "done");
		}, 500);

		setTimeout(() => {
			clearInterval(interval);
			console.log("AutoUpdate", "clearInterval");
		}, 10000);
	}
	stop() {}
}
