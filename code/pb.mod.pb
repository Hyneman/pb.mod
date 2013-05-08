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






; IDE Options = PureBasic 5.11 (Windows - x86)
; CursorPosition = 76
; FirstLine = 29
; EnableXP