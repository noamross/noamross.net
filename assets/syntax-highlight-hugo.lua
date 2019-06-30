-- Wrap code bocks in Hugo highlighting shortcodes
function CodeBlock(elem)
  if #elem.classes == 0 then
    return elem
  else
    return pandoc.RawBlock("html",
      "{{< highlight " .. elem.classes[1] .. " >}}\n" ..
      elem.text ..
      "\n{{< /highlight >}}")
  end
end
