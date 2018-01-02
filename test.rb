require 'polyglot'
require 'treetop'

Treetop.load "xrb"

parser = XRBParser.new

p parser.parse('<hello/>') && true
p parser.parse('<hello />') && true
p parser.parse('<hello a=b/>') && true
p parser.parse('<hello a=b />') && true
p parser.parse('<hello a = b/>') && true
p parser.parse('<hello a="b"/>') && true
p parser.parse("<hello a='b'/>") && true
p parser.parse("<hello a={b}/>") && true
p parser.parse('<hello a="b" />') && true
p parser.parse("<hello a='b' />") && true
p parser.parse("<hello a={b} />") && true
p parser.parse("<hello a='b' b='c'/>") && true
p parser.parse('<hello a="b" b="c"/>') && true
p parser.parse('<hello a={b} b={c}/>') && true

p parser.parse('<hello></hello>') && true
p parser.parse('<hello a="b"></hello>') && true

p parser.parse('<hello a={b}>{ 1 + 2 }</hello>') && true
p parser.parse('<hello a={b}><world/></hello>') && true
p parser.parse('<hello a={b}><world a=b/></hello>') && true
p parser.parse('<hello a={b}><world></world></hello>') && true
p parser.parse('<hello a={b}><world>{1 + 2}</world></hello>') && true
p parser.parse('<hello a={b}><world a={b}>{1 + 2}</world></hello>') && true

p parser.parse('<div>
  {props.messages.length > 0 &&
    <MessageList messages={props.messages} />
  }
</div>') && true

