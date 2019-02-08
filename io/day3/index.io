// this adds : operator that will invoke atPutNumber message
OperatorTable addAssignOperator(":", "atPutNumber")

// this method is invoked when brackets are encountered
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    // for `"Jon Smith": "1234567"` it will evaluate to `r atPutNumber("Jon Smith", "123456")`
    r doMessage(arg)
  )

  r
) 

Map atPutNumber := method(
  // calls Map atPut method, removes ""
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

// doString evaluates a string of numbers
phoneNumbers := doString("{
  \"Ron Swanson\": \"5172389345\",
  \"Ross Geller\": \"12309645234\"
}")

phoneNumbers keys println
phoneNumbers values println

// io makes it easy to build DSLs!
// Example LispML lang

Builder := Object clone
Builder forward := method(
  // override passing not-found method to prototype parent
  // and use it's name to create a markup tag
  writeln("<", call message name, ">")
  call message arguments foreach(
    arg,
    content := self doMessage(arg) // recursion
    if (content type == "Sequence", writeln(content)) // build string content
  )
  writeln("</", call message name, ">") // add closing tag
)

Builder html(
  head(
    title("looks interesting")
  ),
  body(
    ul(
      li("one item"),
      li("second item")
    )
  )
)