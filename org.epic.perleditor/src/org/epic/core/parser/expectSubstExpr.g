header
{
// This source file was generated by ANTLR. Do not edit manually!
package org.epic.core.parser;
}

class LexExpectSubstExpr extends Lexer("org.epic.core.parser.LexerBase");
options
{
	k = 2;
	charVocabulary = '\0'..'\377' | '\u0080'..'\u00FF' | '\u0100'..'\u017F' | '\u0180'..'\u024F' | '\u20AC';
	importVocab = shared;
}
{
	private boolean expectComment;

	public void setInputState(LexerSharedInputState state)
    {
        super.setInputState(state);
		expectComment = false;
    }
}

OPEN_QUOTE: OPEN_QUOTE1 | OPEN_QUOTE2;
COMMENT: { expectComment }? '#' (NOTNEWLINE)* NEWLINE!;
WS: (' ' | '\t' | NEWLINE)+ { expectComment = true; };

protected OPEN_QUOTE1
	: ('{' | '[' | '(' | '<')
	{
		expectComment = false;
		getParent().pop();
		getParent().expectStringSuffix(); // third
		getParent().expectString(); // second
		getParent().expectStringEnd($getText.charAt(0)); // first
	}
	;

protected OPEN_QUOTE2
	: ~('\t' | ' ' | '\n' | '\r' | '{' | '[' | '(' | '<')
	{
		expectComment = false;
		getParent().pop();
		getParent().expectStringSuffix(); // third
		getParent().expectStringEnd($getText.charAt(0)); // second
		getParent().expectStringEnd($getText.charAt(0)); // first
	}
	;

protected
NEWLINE:
	(
	 '\r' '\n'	|	// DOS
     '\r'		|	// MacOS
     '\n'			// UNIX
    )
    { $setType(Token.SKIP); newline(); }
    ;

protected
NOTNEWLINE:
	~('\r' | '\n')
	;