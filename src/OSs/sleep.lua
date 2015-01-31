Sleep = {}

function Sleep.sleep(seconds)
  local start = os.time()
  while true do
    if os.difftime(os.time(), start) >= seconds then break end
  end
end

return Sleep