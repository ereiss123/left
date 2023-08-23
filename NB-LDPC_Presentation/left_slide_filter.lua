return {
  {
    Str = function (elem)
      if elem.text == "||*" then
        return pandoc.RawInline('html','<div class="row"><div class="column">')
      elseif elem.text == "||+" then
        return pandoc.RawInline('html','</div><div class="column">')
      elseif elem.text == "*||" then
        return pandoc.RawInline('html','</div></div>')
      else
        return elem
      end
    end,
  }
}