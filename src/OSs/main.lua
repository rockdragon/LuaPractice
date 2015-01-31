local Sleep = require("OSs.sleep")

print("now :" .. os.date(), "sleep 10 seconds...")
Sleep.sleep(10)
print("I'm awake. now:" .. os.date())