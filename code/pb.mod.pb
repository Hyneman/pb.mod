﻿; ////
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


#PBM_NAME = "pb.mod"
#PBM_VERSION = "1.0a"
#PBM_FULL_NAME = "pb.mod" + " " + #PBM_VERSION
#PBM_DEVELOPMENT = "Developed by Silent Byte (http://www.silentbyte.com/)."

#PBM_SYSTEM_PTR_SIZE = SizeOf(integer)
#PBM_SYSTEM_PTR_ALIGN = SizeOf(integer)


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


CompilerSelect #PB_Compiler_Processor
		
	CompilerCase #PB_Processor_x86
		#PBM_SYSTEM_X86 = #True
		#PBM_SYSTEM_X64 = #False
		
	CompilerCase #PB_Processor_x64
		#PBM_SYSTEM_X86 = #False
		#PBM_SYSTEM_X64 = #True
		
	CompilerDefault
		#PBM_SYSTEM_X86 = #False
		#PBM_SYSTEM_X64 = #False
		
CompilerEndSelect


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


#PBM_BYTE_MINIMUM = -128
#PBM_BYTE_MAXIMUM = 127
#PBM_BYTE_SIGNED_MINIMUM = #PBM_BYTE_MINIMUM
#PBM_BYTE_SIGNED_MAXIMUM = #PBM_BYTE_MAXIMUM
#PBM_BYTE_UNSIGNED_MINIMUM = 0
#PBM_BYTE_UNSIGNED_MAXIMUM = 255

#PBM_WORD_MINIMUM = -32768
#PBM_WORD_MAXIMUM = 32767
#PBM_WORD_SIGNED_MINIMUM = #PBM_WORD_MINIMUM
#PBM_WORD_SIGNED_MAXIMUM = #PBM_WORD_MAXIMUM
#PBM_WORD_UNSIGNED_MINIMUM = 0
#PBM_WORD_UNSIGNED_MAXIMUM = 65535


CompilerIf #PBM_SYSTEM_X86
	
	#PBM_INTEGER_MINIMUM = -2147483648
	#PBM_INTEGER_MAXIMUM = 2147483647
	#PBM_INTEGER_SIGNED_MINIMUM = #PBM_INTEGER_MINIMUM
	#PBM_INTEGER_SIGNED_MAXIMUM = #PBM_INTEGER_MAXIMUM
	#PBM_INTEGER_UNSIGNED_MINIMUM = 0
	#PBM_INTEGER_UNSIGNED_MAXIMUM = 4294967295

CompilerElseIf #PBM_SYSTEM_X64
	
	#PBM_INTEGER_MINIMUM = -9223372036854775808
	#PBM_INTEGER_MAXIMUM = 9223372036854775807
	#PBM_INTEGER_SIGNED_MINIMUM = #PBM_INTEGER_MINIMUM
	#PBM_INTEGER_SIGNED_MAXIMUM = #PBM_INTEGER_MAXIMUM
	#PBM_INTEGER_UNSIGNED_MINIMUM = 0
	#PBM_INTEGER_UNSIGNED_MAXIMUM = 18446744073709551615
	
CompilerEndIf


; // end region
; // region ...Structures...


; // Provides a convinient way to access character arrays (strings).
; // Do note that the byte values will be treated as unsigned values.
Structure CharArray
	StructureUnion
		value.c
		index.c[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access byte values of an array.
; // Do note, that the actual type is ASCII (.a) to provide unsigned byte support.
Structure ByteArray
	StructureUnion
		value.a
		index.a[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access word values of an array.
Structure WordArray
	StructureUnion
		value.w
		index.w[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access long values of an array.
Structure LongArray
	StructureUnion
		value.l
		index.l[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access integer values of an array.
Structure IntegerArray
	StructureUnion
		value.i
		index.i[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access quad values of an array.
Structure QuadArray
	StructureUnion
		value.q
		index.q[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access floating point values of an array.
Structure FloatArray
	StructureUnion
		value.f
		index.f[0]
	EndStructureUnion
EndStructure

; // Provides a convinient way to access double precision values of an array.
Structure DoubleArray
	StructureUnion
		value.d
		index.d[0]
	EndStructureUnion
EndStructure

; // Provides access to each byte of an integer.
Structure IntegerBuilder
	StructureUnion
		value.i
		byte.a[0]
		
		first.a
		second.a
		third.a
		fourth.a
		
		CompilerIf #PBM_SYSTEM_X64
			fifth.a
			sixth.a
			seventh.a
			eighth.a
		CompilerEndIf
		
	EndStructureUnion
EndStructure


; // endregion
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
; // region ...Definition Macros...


; // Checks if the constant has been defined.
Macro symbol(__constant)
	Defined(__constant, #PB_Constant)
EndMacro

; // Checks if the specified module has been defined.
Macro unit(__module)
	Defined(__module, #PB_Module)
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
	CompilerIf Not Defined(PBM_EXTENSIONS_DEFINED, #PB_Constant)
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

; // Evaluates the specified expression to 'true' or 'false'.
Macro boolean(__expression)
	Bool(__expression)
EndMacro


; // end region
; // region ...Assert Macros...


; // Stores the procedures required for the assert macro.
Macro __PBMEnsureAssertProcedures()
	
	CompilerIf Not Defined(PBM_ASSERT_PROCEDURES_DEFINED, #PB_Constant)
		#PBM_ASSERT_PROCEDURES_DEFINED = #True
		
		CompilerIf #PBM_ENABLE_DEBUGGER Or Defined(PBM_ENABLE_ASSERTS, #PB_Constant)
			CompilerIf #PBM_CONSOLE
				
				; // If the executable format is set to console, an error message will be printed.
				Procedure.i __PBMAssertConsole(timestamp.i, file.s, line.i, function.s, expression.s, message.s)	
					If function = ""
						function = "main()"
					EndIf
					
					PrintN("[ASSERTION FAILED]")
					PrintN("  > " + FormatDate("%yyyy-%mm-%dd %hh:%ii:%ss", timestamp) + " @ " + function + " in file " + file + " on line " + Str(line) + ".")
					PrintN("  >")
					PrintN("  > " + expression + " == false")
					
					If Not message = ""
						PrintN("  >")
						PrintN("  > " + message)
					EndIf
					
					CallDebugger
					End 1
				EndProcedure
				
			CompilerElse
				
				; // In case of a regular window application, a message box will be shown.
				Procedure.i __PBMAssertMessageBox(timestamp.i, file.s, line.i, function.s, expression.s, message.s)
					Protected text.s
					
					If function = ""
						function = "main()"
					EndIf
					
					text = FormatDate("%yyyy-%mm-%dd %hh:%ii:%ss", timestamp) + " @ " + function + " in file " + file + " on line " + Str(line) + "." + #LF$
					text + #LF$
					text + expression + " == false" + #LF$
					
					If Not message = ""
						text + message + #LF$
					EndIf
					
					text + #LF$ + "The application will be terminated."
					
					CompilerIf #PBM_WINDOWS
						MessageRequester("ASSERTION FAILED", text, #MB_ICONERROR)
					CompilerElse
						MessageRequester("ASSERTION FAILED", text)
					CompilerEndIf
					
					CallDebugger
					End 1
				EndProcedure
				
			CompilerEndIf
		CompilerEndIf
	CompilerEndIf
EndMacro

; // Evaluates the expression. If the resulting value is 'false', an error with the specified message
; // will be displayed and the execution of the application will be terminated immediately.
Macro assert(__expression, __message = "")
	__PBMEnsureAssertProcedures()
	CompilerIf #PBM_ENABLE_DEBUGGER Or Defined(PBM_ENABLE_ASSERTS, #PB_Constant)
		If Not boolean(__expression)
			CompilerIf #PB_Compiler_ExecutableFormat = #PB_Compiler_Console
				__PBMAssertConsole(Date(), #PB_Compiler_Filename, #PB_Compiler_Line, #PB_Compiler_Procedure, stringify(__expression), __message)
			CompilerElse
				__PBMAssertMessageBox(Date(), #PB_Compiler_Filename, #PB_Compiler_Line, #PB_Compiler_Procedure, stringify(__expression),__message)
			CompilerEndIf
		EndIf
	CompilerEndIf
EndMacro


; // end region
; // region ...Keyword Substitution Macros...


; // Substitutes the 'ProcedureReturn' keyword.
Macro yield
	ProcedureReturn
EndMacro

; // Substitutes the 'Protected' keyword.
Macro private
	Protected
EndMacro

; // Substitutes the 'StructureUnion' keyword.
Macro union
	StructureUnion
EndMacro
	
; // Substitutes the 'EndStructureUnion' keyword.
Macro endunion
	EndStructureUnion
EndMacro

; // Substitutes the 'End' keyword.
Macro exit
	End
EndMacro


; // end region



; IDE Options = PureBasic 5.20 beta 6 (Windows - x86)
; CursorPosition = 33
; FirstLine = 18
; Folding = ------
; EnableUnicode
; EnableXP