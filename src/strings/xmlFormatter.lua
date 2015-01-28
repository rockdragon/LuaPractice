XMLFormatter = {}

function XMLFormatter.format(command, text)
  return string.format("<%s>%s</%s>", command, text, command)
end

print(XMLFormatter.format("send", "say", "it"))

return XMLFormatter