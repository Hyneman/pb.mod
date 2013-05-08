; ////
; //////
; //////      P B . M O D   F O R   P U R E B A S I C
; ////// ===========================
; //////
; ////// SILENTBYTE LICENSE NOTICE
; //////
; ////// THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED OR IMPLIED
; ////// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
; ////// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
; ////// EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; ////// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
; ////// PROCUREMENT OF SUBSTITUTEGOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
; ////// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
; ////// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ////// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; ////// POSSIBILITY OF SUCH DAMAGE.
; ////// 
; ////// THE CODE OF PB.MOD FOUND IN THIS FILE IS PUBLIC DOMAIN AND MIGHT BE USED BY
; ////// ANYONE FOR ANY PROJECTS, FREE, COMMERCIAL OR OTHERWISE WITHOUT RESTRICTION.
; ////



EnableExplicit


; // region ...Compiler Constants...


CompilerIf #PB_Compiler_ExecutableFormat = #PB_Compiler_Console
	#PBM_CONSOLE = #True
	#PBM_DLL = #False
	#PBM_EXECUTABLE = #False
CompilerEndIf

CompilerIf #PB_Compiler_ExecutableFormat = #PB_Compiler_DLL
	#PBM_CONSOLE = #False
	#PBM_DLL = #True
	#PBM_EXECUTABLE = #False
CompilerEndIf

CompilerIf #PB_Compiler_ExecutableFormat = #PB_Compiler_Executable
	#PBM_CONSOLE = #False
	#PBM_DLL = #False
	#PBM_EXECUTABLE = #True
CompilerEndIf


CompilerIf #PB_Compiler_Debugger
	#PBM_ENABLE_DEBUGGER = #True
CompilerElse
	#PBM_ENABLE_DEBUGGER = #False
CompilerEndIf


CompilerSelect #PB_Compiler_OS
		
	CompilerCase #PB_OS_Windows
		#PBM_WINDOWS = #True
		#PBM_LINUX = #False
		#PBM_MACOS = #False
		
	CompilerCase #PB_OS_Linux
		#PBM_WINDOWS = #False
		#PBM_LINUX = #True
		#PBM_MACOS = #False
		
	CompilerCase #PB_OS_MacOS
		#PBM_WINDOWS = #False
		#PBM_LINUX = #False
		#PBM_MACOS = #True
		
CompilerEndSelect


; // end region
; // region ...String Macros...


; // Inserts a double quote caracter used to stringify identifiers.
Macro __PBM_DQ__
	"
EndMacro

; // Turns the specified expression into a string.
Macro stringify(__expression)
	__PBM_DQ__#__expression#__PBM_DQ__
EndMacro


; // end region
; // region ...Symbol Definition Macros...


; // Checks if the constant has been defined.
Macro symbol(__constant)
	Defined(__constant, #PB_Constant)
EndMacro


; // end region
; // region ...Value Macros...


; // Defines the 'true' keyword.
Macro true
	#True
EndMacro

; // Defines the 'false' keyword.
Macro false
	#False
EndMacro

; // Defines the 'null' keyword.
Macro null
	#Null
EndMacro


; // end region
; // region ...Option Macros...


; // Empty macro just used for aesthetic reasons.
Macro option
	;
EndMacro

; // Enables variable declaration checks.
Macro explicit
	EnableExplicit
EndMacro

; // Enables the debugger.
Macro debugger
	EnableDebugger
EndMacro

; // Enables more specific language extensions. Because procedures can't be
; // compiled into resident files means,  that they need to be stored inside a macro.
; // This macro only needs to be called once, however it is adviced to call it at the
; // top of every file together with 'option explicit' and 'option debugger'.
Macro extensions
	CompilerIf Not symbol(PBM_EXTENSIONS_DEFINED)
		#PBM_EXTENSIONS_DEFINED = #True
		
		Procedure.b __PBMCastByte(value.b)
			ProcedureReturn value
		EndProcedure
		
		Procedure.w __PBMCastWord(value.w)
			ProcedureReturn value
		EndProcedure
		
		Procedure.l __PBMCastLong(value.l)
			ProcedureReturn value
		EndProcedure
		
		Procedure.q __PBMCastQuad(value.q)
			ProcedureReturn value
		EndProcedure
		
		Procedure.f __PBMCastFloat(value.f)
			ProcedureReturn value
		EndProcedure
	
		Procedure.d __PBMCastDouble(value.d)
			ProcedureReturn value
		EndProcedure
		
		Procedure.a __PBMCastAscii(value.a)
			ProcedureReturn value
		EndProcedure
		
		Procedure.u __PBMCastUnicode(value.u)
			ProcedureReturn value
		EndProcedure
		
	CompilerEndIf
EndMacro


; // end region
; // region ...Module Macros...


; // Includes the specified file relatively to the current file's path.
Macro using
	XIncludeFile #PB_Compiler_FilePath +
EndMacro	

; // Includes the specified file relatively to the main file's path.
Macro include
	XIncludeFile
EndMacro


; // end region
; // region ...Type Casting Macros...


; // Treats the expression as a boolean value.
Macro __PBMCastBoolean(__expression)
	Bool(__expression)
EndMacro

; // Casts the expression into an integer value.
Macro __PBMCastInteger(__expression)
	Int(__expression)
EndMacro

; // Casts the expression into the specified type using a function call.
Macro cast(__type, __expression)
	__PBMCast#__type(__expression)
EndMacro


; // end region




; IDE Options = PureBasic 5.11 (Windows - x86)
; CursorPosition = 195
; FirstLine = 173
; Folding = ----
; EnableXP