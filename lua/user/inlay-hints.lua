local status_ok, inlay_hints = pcall(require, "inlay_hints")
if not status_ok then
  return
end

inlay_hints.setup()
