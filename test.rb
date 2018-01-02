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


p parser.parse('a = <hello a=b/>') && true

p parser.parse('element = (
  <h1>
    Hello, {formatName(user)}!
  </h1>
)') && true

p parser.parse('<div>
  {props.messages.length > 0 &&
    <MessageList messages={props.messages} />
  }
</div>') && true

p parser.parse('
def greeting(user)
  return <h1>Hello, {formatName(user)}!</h1> if user
  return <h1>Hello, Stranger.</h1>
end
') && true

p parser.parse('
element = <div tabIndex="0"></div>;
') && true

p parser.parse('
element = <img src={user.avatarUrl}></img>
') && true

p parser.parse('
element = <img src={user.avatarUrl} />
') && true

p parser.parse('
element = (
  <div>
    <h1>Hello!</h1>
    <h2>Good to see you here.</h2>
  </div>
)
') 


