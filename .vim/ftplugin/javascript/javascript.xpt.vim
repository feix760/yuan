XPTemplate priority=lang

let s:f = g:XPTfuncs()


XPTvar $TRUE          true
XPTvar $FALSE         false
XPTvar $NULL          null
XPTvar $UNDEFINED     undefined

XPTvar $BRif     ' '
XPTvar $BRel   \n
XPTvar $BRloop    ' '
XPTvar $BRstc ' '
XPTvar $BRfun   ' '

XPTvar $VOID_LINE  /* void */;
XPTvar $CURSOR_PH      /* cursor */


XPTvar $CL  /*
XPTvar $CM   *
XPTvar $CR   */

XPTinclude
      \ _common/common
      \ _comment/doubleSign
      \ _condition/ecma


XPTvar $VAR_PRE
XPTvar $FOR_SCOPE 'var '
XPTinclude
      \ _loops/for

XPTinclude
      \ javascript/jquery

" ========================= Function and Variables =============================


" ================================= Snippets ===================================

XPT define " define
define(function (require, exports, module) {
   `cursor^ 
});

XPT cmt " /** @auth... */
/**
 * `cursor^
 */

XPT param " @param
@param {`Object^} `name^ `desc^


" file comment
" 4 back slash represent 1 after rendering.
XPT fcmt " full doxygen comment
/**
 * @file `^
 * @author: `$author^(`$email^)
 * @date: `date()^ 
 */
`cursor^


XPT fun " function ..( .. ) {..}
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
function` `name^ (`arg*^) {
    `cursor^
}


XPT forin " for (var .. in ..) {..}
for ( var `i^ in `array^ )`$BRloop^{
    var `e^ = `array^[`i^];
    `cursor^
}

XPT proto " ...prototype... = function\(..) { .. }
XSET arg*|post=ExpandIfNotEmpty(', ', 'arg*')
`Class^.prototype.`method^ = function(`arg*^)`$BRfun^{
    `cursor^
}


XPT try wrap=job " try {..} catch {..} finally
XSET dealError=/* error handling */
XSET job=$VOID_LINE
try`$BRif^{
    `job^
}
catch (`err^)`$BRif^{
    `dealError^
}`...^
catch (`err^)`$BRif^{
    `dealError^
}`...^`
`finally...{{^
finally`$BRif^{
    `cursor^
}`}}^


