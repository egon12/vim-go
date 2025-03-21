" -- gorename
command! -nargs=? -complete=customlist,go#rename#Complete GoRename call go#rename#Rename(<bang>0, <f-args>)

" -- guru
" do not configure commands that _require_ guru when not in GOPATH mode.
"if go#package#InGOPATH()
  command! -nargs=* -complete=customlist,go#package#Complete GoGuruScope call go#guru#Scope(<f-args>)
  command! -range=% GoPointsTo call go#guru#PointsTo(<count>)
  command! -range=% GoWhicherrs call go#guru#Whicherrs(<count>)
  command! -range=% GoCallees call go#guru#Callees(<count>)
  command! -range=% GoDescribe call go#guru#Describe(<count>)
  command! -range=% GoCallstack call go#guru#Callstack(<count>)
  command! -range=% GoFreevars call go#guru#Freevars(<count>)
  command! -range=% GoChannelPeers call go#guru#ChannelPeers(<count>)
"endif

command! -range=% GoImplements call go#implements#Implements(<count>)
command! -range=% GoReferrers call go#referrers#Referrers(<count>)
command! -range=0 GoSameIds call go#guru#SameIds(1)
command! -range=0 GoSameIdsClear call go#guru#ClearSameIds()
command! -range=0 GoSameIdsToggle call go#guru#ToggleSameIds()
command! -range=0 GoSameIdsAutoToggle call go#guru#AutoToggleSameIds()

" -- calls
command! -nargs=0 GoCallers call go#calls#Callers()

" -- tags
command! -nargs=* -range GoAddTags call go#tags#Add(<line1>, <line2>, <count>, <f-args>)
command! -nargs=* -range GoRemoveTags call go#tags#Remove(<line1>, <line2>, <count>, <f-args>)

" -- mod
command! -nargs=0 -range GoModFmt call go#mod#Format()

" -- tool
command! -nargs=* -complete=customlist,go#tool#ValidFiles GoFiles echo go#tool#Files(<f-args>)
command! -nargs=0 GoDeps echo go#tool#Deps()
command! -nargs=0 GoInfo call go#tool#Info(1)
command! -nargs=0 GoAutoTypeInfoToggle call go#complete#ToggleAutoTypeInfo()

" -- cmd
command! -nargs=* -bang GoBuild call go#cmd#Build(<bang>0,<f-args>)
command! -nargs=? -bang GoBuildTags call go#cmd#BuildTags(<bang>0, <f-args>)
command! -nargs=* -bang GoGenerate call go#cmd#Generate(<bang>0,<f-args>)
command! -nargs=* -bang -complete=file GoRun call go#cmd#Run(<bang>0,<f-args>)
command! -nargs=* -bang GoInstall call go#cmd#Install(<bang>0, <f-args>)

" -- test
command! -nargs=* -bang GoTest call go#test#Test(<bang>0, 0, <f-args>)
command! -nargs=* -bang GoTestFunc call go#test#Func(<bang>0, <f-args>)
command! -nargs=* -bang GoTestCompile call go#test#Test(<bang>0, 1, <f-args>)
command! -nargs=* -bang GoTestLast call go#test#Last(<bang>0, 1, <f-args>)

" -- cover
command! -nargs=* -bang GoCoverage call go#coverage#Buffer(<bang>0, <f-args>)
command! -nargs=* -bang GoCoverageClear call go#coverage#Clear()
command! -nargs=* -bang GoCoverageToggle call go#coverage#BufferToggle(<bang>0, <f-args>)
command! -nargs=* -bang GoCoverageBrowser call go#coverage#Browser(<bang>0, <f-args>)

" -- play
command! -nargs=0 -range=% GoPlay call go#play#Share(<count>, <line1>, <line2>)

" -- def
command! -nargs=* -range GoDef :call go#def#Jump('', 0)
command! -nargs=* -range GoDefType :call go#def#Jump('', 1)
command! -nargs=? GoDefPop :call go#def#StackPop(<f-args>)
command! -nargs=? GoDefStack :call go#def#Stack(<f-args>)
command! -nargs=? GoDefStackClear :call go#def#StackClear(<f-args>)

" -- doc
command! -nargs=* -range -complete=customlist,go#package#Complete GoDoc call go#doc#Open('new', 'split', <f-args>)
command! -nargs=* -range -complete=customlist,go#package#Complete GoDocBrowser call go#doc#OpenBrowser(<f-args>)

" -- fmt
command! -nargs=0 GoFmt call go#fmt#Format(0)
command! -nargs=0 GoFmtAutoSaveToggle call go#fmt#ToggleFmtAutoSave()
command! -nargs=0 GoImports call go#fmt#Format(1)

" -- asmfmt
command! -nargs=0 GoAsmFmtAutoSaveToggle call go#asmfmt#ToggleAsmFmtAutoSave()

" -- import
command! -nargs=? -complete=customlist,go#package#Complete GoDrop call go#import#SwitchImport(0, '', <f-args>, '')
command! -nargs=1 -bang -complete=customlist,go#package#Complete GoImport call go#import#SwitchImport(1, '', <f-args>, '<bang>')
command! -nargs=* -bang -complete=customlist,go#package#Complete GoImportAs call go#import#SwitchImport(1, <f-args>, '<bang>')

" -- linters
command! -nargs=* -bang GoMetaLinter call go#lint#Gometa(<bang>0, 0, <f-args>)
command! -nargs=0 GoMetaLinterAutoSaveToggle call go#lint#ToggleMetaLinterAutoSave()
command! -nargs=* -bang GoLint call go#lint#Golint(<bang>0, <f-args>)
command! -nargs=* -bang GoVet call go#lint#Vet(<bang>0, <f-args>)
command! -nargs=* -bang -complete=customlist,go#package#Complete GoErrCheck call go#lint#Errcheck(<bang>0, <f-args>)

" -- alternate
command! -bang GoAlternate call go#alternate#Switch(<bang>0, '')

" -- decls
command! -nargs=? -complete=file GoDecls call go#decls#Decls(0, <q-args>)
command! -nargs=? -complete=dir GoDeclsDir call go#decls#Decls(1, <q-args>)

" -- impl
command! -nargs=* -complete=customlist,go#impl#Complete GoImpl call go#impl#Impl(<f-args>)

" -- template
command! -nargs=0 GoTemplateAutoCreateToggle call go#template#ToggleAutoCreate()

" -- keyify
if go#package#InGOPATH()
  command! -nargs=0 GoKeyify call go#keyify#Keyify()
endif

" -- fillstruct
command! -nargs=0 GoFillStruct call go#fillstruct#FillStruct()

" -- debug
if !exists(':GoDebugStart')
  command! -nargs=* -complete=customlist,go#package#Complete GoDebugStart call go#debug#Start('debug', <f-args>)
  command! -nargs=* -complete=customlist,go#package#Complete GoDebugTest  call go#debug#Start('test', <f-args>)
  command! -nargs=* GoDebugTestFunc  call go#debug#TestFunc(<f-args>)
  command! -nargs=1 GoDebugAttach call go#debug#Start('attach', <f-args>)
  command! -nargs=? GoDebugConnect call go#debug#Start('connect', <f-args>)
  command! -nargs=? GoDebugBreakpoint call go#debug#Breakpoint(<f-args>)
endif

" -- issue
command! -nargs=0 GoReportGitHubIssue call go#issue#New()

" -- iferr
command! -nargs=0 GoIfErr call go#iferr#Generate()

" -- lsp
command! -nargs=+ -complete=dir GoAddWorkspace call go#lsp#AddWorkspaceDirectory(<f-args>)
command! -nargs=0 GoLSPDebugBrowser call go#lsp#DebugBrowser()
command! -nargs=* -bang GoDiagnostics call go#lint#Diagnostics(<bang>0, <f-args>)
command! -nargs=? GoModReload call go#lsp#ModReload()

" -- term
command! GoToggleTermCloseOnExit call go#term#ToggleCloseOnExit()

" vim: sw=2 ts=2 et
