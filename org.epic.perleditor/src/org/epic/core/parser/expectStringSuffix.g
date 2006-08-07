header
{
// This source file was generated by ANTLR. Do not edit manually!
package org.epic.core.parser;
}

class LexExpectStringSuffix extends Lexer("org.epic.core.parser.LexerBase");
options
{
	k = 2;
	charVocabulary = '\0'..'\377' | '\u0080'..'\u00FF' | '\u0100'..'\u017F' | '\u0180'..'\u024F' | '\u20AC';
	importVocab = shared;
}

STRING_SUFFIX:
	('g'|'i'|'m'|'o'|'s'|'x')*
	{
		getParent().pop();
		if ($getText.length() == 0) getParent().retry();
	}
	;
