import java.util.List;
import java.util.ArrayList;

//user-generated imports

	import java.util.*;


public class Parser
{
	//start of user-generated global code

	static class Node
	{
		Node op1;
		Node op2;
		String operator;
		String operand;
		Node()
		{
		}
		void print()
		{
			if(op1==null&&op2==null)System.out.print(operand);
			else if(op2==null)
			{
				System.out.print(operator);
				System.out.print("(");
				op1.print();
				System.out.print(")");
			}
			else
			{
				System.out.print("(");
				op1.print();
				System.out.print(")");
				System.out.print(operator);
				System.out.print("(");
            	op2.print();
            	System.out.print(")");
			}
		}
	}
	static Node root;
	public static void main(String[] args)
	{
		String input = "";
		Scanner sc = new Scanner(System.in);
		input = sc.nextLine();
		Parser p = new Parser(input);
		if(p._parse())
		{
			System.out.println("Valid formula");
			root.print();
			System.out.println("\n----");
			remove_WM(root);
			clear_FG(root);
			Node t = new Node();
			t.op1 = root;
			migrate_negation(root,t,true);
			t.op1.print();
		}
		else
		{
			System.out.println("INValid formula");
		}
	}
	public static void migrate_negation(Node n, Node p, boolean is_left) // p is parent, n is current node
	{
		if(n==null)return;
		if(n.operator=="NOT"&&n.op1.operator!=null)
		{
			Node child = n.op1;
			if(child.operator=="NOT")
            {
            	Node q = child.op1;
                  if(is_left)p.op1=q;
                  else p.op2=q;
                  migrate_negation(q,p,is_left);
                  return;
            }
            else
            {
            if(is_left)p.op1=child;
            else p.op2=child;
            if(child.operator=="AND")child.operator="OR";
            else if(child.operator=="OR")child.operator="AND";
            else if(child.operator=="U")child.operator="R";
            else if(child.operator=="R")child.operator="U";
            Node q = child.op1;
            Node r = child.op2;
            if(q!=null)
            {
            System.out.println("Callllll");
            	Node t = new Node();
            	t.operator = "NOT";
            	t.op1 = q;
            	child.op1 = t;
            	migrate_negation(t,child,true);
            }
            if(r!=null)
            {
            	Node t = new Node();
                t.operator = "NOT";
                t.op1 = r;
                child.op2 = t;
                migrate_negation(t,child,false);
            }
            return;
            }
		}
		migrate_negation(n.op1,n,true);
		migrate_negation(n.op2,n,false);
	}
	public static void clear_FG(Node n)
	{
		if(n==null)return;
		if(n.operator==("F") || n.operator==("G"))
		{
			n.operator = "U";
			n.op2 = n.op1;
			n.op1 = new Node();
			n.op1.operand=n.operator==("F")?"true":"false";
		}
		clear_FG(n.op1);
		clear_FG(n.op2);
	}
	public static void remove_WM(Node n)
	{
		if(n==null)return;
		if(n.operator==("M"))
		{
			Node left = new Node();
			left.op1 = n.op1;
			left.op2 = n.op2;
			left.operator = "R";

			Node right = new Node();
			right.op1 = n.op2;
			right.operator = "F";

			n.operator="AND";
			n.op1=left;
			n.op2=right;
		}
		else if(n.operator==("W"))
		{
			Node left = new Node();
            			left.op1 = n.op1;
            			left.op2 = n.op2;
            			left.operator = "U";

            			Node right = new Node();
            			right.op1 = n.op2;
            			right.operator = "G";

            			n.operator="OR";
            			n.op1=left;
            			n.op2=right;
		}
		remove_WM(n.op1);
		remove_WM(n.op2);
	}
	//end of user-generated global code
static class _Node
	{
		@FunctionalInterface
		interface Executable
		{
			void execute();
		}
		Executable code;
		String symbol;
		List<_Node> children;
		Object $$;
		void add(_Node x)
		{
			this.children.add(x);
		}
		Object get_$(int i)
		{
			return this.children.get(i).$$;
		}
		void set_$(int i, Object o)
		{
			this.children.get(i).$$ = o;
		}
		public _Node(String symbol)
		{
			this.$$ = null;
			this.symbol = symbol;
			this.children = new ArrayList<>();
			this.code=null;
		}
		public void set_code(Executable e)
		{
			this.code = e;
		}
		public void execute()
		{
			if(code!=null)code.execute();
		}
	}
	String _DELIMITER = "";
	String _SPACE = "  ";
	String _OPEN = "{";
	String _CLOSE = "}";
	_Node _parse_tree;
	String _input;
	int _pt;
	public Parser(String in)
	{
		this._input = in;
		this._pt = 0;
		this._parse_tree = null;
	}
	String _parse_tree()
	{
		return _parse_tree_util(_parse_tree,0);
	}
	String _parse_tree_util(_Node x, int spaces)
	{
		StringBuilder s = new StringBuilder();
		if(x==null)return s.toString();
		String t = _SPACE.repeat(spaces);
		s.append(t).append(x.symbol).append("\n");
		if(x.children.size()==0)return s.toString();
		s.append(t).append(_OPEN).append("\n");
		spaces++;
		for(_Node k : x.children)s.append(_parse_tree_util(k,spaces));
		s.append(t).append(_CLOSE).append("\n");
		return s.toString();
	}
	String _derivation(boolean rightmost)
	{
		StringBuilder s = new StringBuilder();
		List<_Node> l = new ArrayList<>();
		l.add(_parse_tree);
		while(true)
		{
			s.append(_DELIMITER);
			for(_Node n : l)s.append(n.symbol).append(_DELIMITER);
			_Node e = null;
			int id=-1;
			int start = rightmost?0:l.size()-1;
			int end = l.size()-1-start;
			int update = rightmost?1:-1;
			for(int i=start;(start-i)*(i-end)>=0;i+=update)
			{
				if(l.get(i).children.size()!=0){e=l.get(i);id=i;}
			}
			if(e==null)break;
			s.append(" ->\n");
			l.remove(id);
			for(int i=e.children.size()-1;i>=0;i--)l.add(id,e.children.get(i));
		}
		return s.toString();
	}
	boolean _search(String terminal)
	{
		for(int i=0;i<terminal.length();i++)
		{
			if(_pt+i>=_input.length())return false;
			if(_input.charAt(_pt+i)!=terminal.charAt(i))return false;
		}
		_pt+=terminal.length();
		_parse_tree.add(new _Node(terminal));
		return true;
	}
	void _execute_code(_Node x)
	{
		if(x==null)return;
		for(_Node t : x.children)_execute_code(t);
		_parse_tree = x;
		x.execute();
	}
	//autogenerated parsing logic
	boolean _parse()
	{
		_parse_tree = new _Node("_START");
		boolean x = _P();
		if(_parse_tree.children.size()!=0)_parse_tree = _parse_tree.children.get(0);
		if(x&&(_pt==_input.length()))
		{
			_execute_code(_parse_tree);
			return true;
		}
		return false;
	}
	boolean _P()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("P");
		if(_S()){_parse_tree.set_code(this::_P0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _P0()
	{
		Object $$ = (Object)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
{root=$1;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
	}

	boolean _S()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("S");
		if(_A())if(_OR())if(_S()){_parse_tree.set_code(this::_S0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("S");
		if(_A()){_parse_tree.set_code(this::_S1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _S0()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
		Object $2 = (Object)_parse_tree.get_$(1);
		Node $3 = (Node)_parse_tree.get_$(2);
{$$=new Node(); $$.operator="OR"; $$.op1 = $1; $$.op2 = $3;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
		_parse_tree.set_$(2,$3);
	}
	void _S1()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
{$$=$1;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
	}

	boolean _OR()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("OR");
		if(_search("\\/")){/*null code*/x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}

	boolean _A()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("A");
		if(_B())if(_AND())if(_A()){_parse_tree.set_code(this::_A0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("A");
		if(_B()){_parse_tree.set_code(this::_A1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _A0()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
		Object $2 = (Object)_parse_tree.get_$(1);
		Node $3 = (Node)_parse_tree.get_$(2);
{$$=new Node(); $$.operator="AND"; $$.op1 = $1; $$.op2 = $3;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
		_parse_tree.set_$(2,$3);
	}
	void _A1()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
{$$=$1;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
	}

	boolean _AND()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("AND");
		if(_search("/\\")){/*null code*/x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}

	boolean _B()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("B");
		if(_C())if(_TO2())if(_B()){_parse_tree.set_code(this::_B0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("B");
		if(_C()){_parse_tree.set_code(this::_B1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _B0()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
		String $2 = (String)_parse_tree.get_$(1);
		Node $3 = (Node)_parse_tree.get_$(2);
{$$=new Node(); $$.operator=$2; $$.op1 = $1; $$.op2 = $3;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
		_parse_tree.set_$(2,$3);
	}
	void _B1()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $1 = (Node)_parse_tree.get_$(0);
{$$=$1;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
	}

	boolean _C()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("C");
		if(_NOT())if(_C()){_parse_tree.set_code(this::_C0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("C");
		if(_TO1())if(_C()){_parse_tree.set_code(this::_C1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("C");
		if(_search("("))if(_S())if(_search(")")){_parse_tree.set_code(this::_C2);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("C");
		if(_search("p"))if(_Num()){_parse_tree.set_code(this::_C3);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _C0()
	{
		Node $$ = (Node)_parse_tree.$$;
		Object $1 = (Object)_parse_tree.get_$(0);
		Node $2 = (Node)_parse_tree.get_$(1);
{$$=new Node(); $$.operator="NOT"; $$.op1 = $2;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
	}
	void _C1()
	{
		Node $$ = (Node)_parse_tree.$$;
		String $1 = (String)_parse_tree.get_$(0);
		Node $2 = (Node)_parse_tree.get_$(1);
{$$=new Node(); $$.operator=$1; $$.op1 = $2;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
	}
	void _C2()
	{
		Node $$ = (Node)_parse_tree.$$;
		Node $2 = (Node)_parse_tree.get_$(1);
{$$=$2;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(1,$2);
	}
	void _C3()
	{
		Node $$ = (Node)_parse_tree.$$;
		String $2 = (String)_parse_tree.get_$(1);
{$$=new Node(); $$.operand="p"+$2;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(1,$2);
	}

	boolean _NOT()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("NOT");
		if(_search("~")){/*null code*/x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}

	boolean _TO1()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("TO1");
		if(_search("X")){_parse_tree.set_code(this::_TO10);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("TO1");
		if(_search("G")){_parse_tree.set_code(this::_TO11);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("TO1");
		if(_search("F")){_parse_tree.set_code(this::_TO12);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _TO10()
	{
		String $$ = (String)_parse_tree.$$;
{$$="X";}
		_parse_tree.$$ = $$;
	}
	void _TO11()
	{
		String $$ = (String)_parse_tree.$$;
{$$="G";}
		_parse_tree.$$ = $$;
	}
	void _TO12()
	{
		String $$ = (String)_parse_tree.$$;
{$$="F";}
		_parse_tree.$$ = $$;
	}

	boolean _TO2()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("TO2");
		if(_search("U")){_parse_tree.set_code(this::_TO20);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("TO2");
		if(_search("W")){_parse_tree.set_code(this::_TO21);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("TO2");
		if(_search("R")){_parse_tree.set_code(this::_TO22);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("TO2");
		if(_search("M")){_parse_tree.set_code(this::_TO23);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _TO20()
	{
		String $$ = (String)_parse_tree.$$;
{$$="U";}
		_parse_tree.$$ = $$;
	}
	void _TO21()
	{
		String $$ = (String)_parse_tree.$$;
{$$="W";}
		_parse_tree.$$ = $$;
	}
	void _TO22()
	{
		String $$ = (String)_parse_tree.$$;
{$$="R";}
		_parse_tree.$$ = $$;
	}
	void _TO23()
	{
		String $$ = (String)_parse_tree.$$;
{$$="M";}
		_parse_tree.$$ = $$;
	}

	boolean _N()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("1")){_parse_tree.set_code(this::_N0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("2")){_parse_tree.set_code(this::_N1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("3")){_parse_tree.set_code(this::_N2);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("4")){_parse_tree.set_code(this::_N3);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("5")){_parse_tree.set_code(this::_N4);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("6")){_parse_tree.set_code(this::_N5);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("7")){_parse_tree.set_code(this::_N6);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("8")){_parse_tree.set_code(this::_N7);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("9")){_parse_tree.set_code(this::_N8);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("N");
		if(_search("0")){_parse_tree.set_code(this::_N9);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _N0()
	{
		String $$ = (String)_parse_tree.$$;
{$$="1";}
		_parse_tree.$$ = $$;
	}
	void _N1()
	{
		String $$ = (String)_parse_tree.$$;
{$$="2";}
		_parse_tree.$$ = $$;
	}
	void _N2()
	{
		String $$ = (String)_parse_tree.$$;
{$$="3";}
		_parse_tree.$$ = $$;
	}
	void _N3()
	{
		String $$ = (String)_parse_tree.$$;
{$$="4";}
		_parse_tree.$$ = $$;
	}
	void _N4()
	{
		String $$ = (String)_parse_tree.$$;
{$$="5";}
		_parse_tree.$$ = $$;
	}
	void _N5()
	{
		String $$ = (String)_parse_tree.$$;
{$$="6";}
		_parse_tree.$$ = $$;
	}
	void _N6()
	{
		String $$ = (String)_parse_tree.$$;
{$$="7";}
		_parse_tree.$$ = $$;
	}
	void _N7()
	{
		String $$ = (String)_parse_tree.$$;
{$$="8";}
		_parse_tree.$$ = $$;
	}
	void _N8()
	{
		String $$ = (String)_parse_tree.$$;
{$$="9";}
		_parse_tree.$$ = $$;
	}
	void _N9()
	{
		String $$ = (String)_parse_tree.$$;
{$$="0";}
		_parse_tree.$$ = $$;
	}

	boolean _Num()
	{
		int k = _pt;
		_Node x = _parse_tree;
		_pt = k;
		_parse_tree = new _Node("Num");
		if(_N())if(_Num()){_parse_tree.set_code(this::_Num0);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = new _Node("Num");
		if(_N()){_parse_tree.set_code(this::_Num1);x.add(_parse_tree);_parse_tree=x;return true;}
		_pt = k;
		_parse_tree = x;
		return false;
	}
	void _Num0()
	{
		String $$ = (String)_parse_tree.$$;
		String $1 = (String)_parse_tree.get_$(0);
		String $2 = (String)_parse_tree.get_$(1);
{$$=$1+$2;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
		_parse_tree.set_$(1,$2);
	}
	void _Num1()
	{
		String $$ = (String)_parse_tree.$$;
		String $1 = (String)_parse_tree.get_$(0);
{$$=$1;}
		_parse_tree.$$ = $$;
		_parse_tree.set_$(0,$1);
	}

}