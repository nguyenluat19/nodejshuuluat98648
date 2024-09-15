import os from "node:os";
import fs from "node:fs";
import { EventEmitter } from "node:events";

const emitter = new EventEmitter();

export function getSystemInfo() {
  return {
    platform: os.platform(),
    cpuArch: os.arch(),
    totalMemory: os.totalmem(),
    freeMemory: os.freemem(),
    uptime: os.uptime(),
    hostname: os.hostname(),
    cpus: os.cpus(),
  };
}

export function saveSystemInfoToFile(filename) {
  const systemInfo = getSystemInfo();

  fs.writeFile(filename, JSON.stringify(systemInfo, null, 2), (err) => {
    if (err) {
      console.error("Error saving system info to file:", err);
      return;
    }

    emitter.emit("taskCompleted");
  });
}

emitter.on("taskCompleted", () => {
  console.log("Completed task!");
});
