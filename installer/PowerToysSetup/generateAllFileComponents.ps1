[CmdletBinding()]
Param(
    [Parameter(Mandatory = $True, Position = 1)]
    [string]$platform,
    [Parameter(Mandatory = $False, Position = 2)]
    [string]$installscopeperuser = "false"
)

if ($platform -ceq "arm64") {
    $platform = "ARM64"
}

if ($installscopeperuser -eq "true") {
    $registryroot = "HKCU"
} else {
    $registryroot = "HKLM"
}

#BaseApplications
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName BaseApplicationsFiles -wxsFilePath $PSScriptRoot\BaseApplications.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""BaseApplicationsFiles"" -wxsFilePath $PSScriptRoot\BaseApplications.wxs -regroot $registryroot"

#WinUI3Applications
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WinUI3ApplicationsFiles -wxsFilePath $PSScriptRoot\WinUI3Applications.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\WinUI3Apps"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinUI3ApplicationsFiles"" -wxsFilePath $PSScriptRoot\WinUI3Applications.wxs -regroot $registryroot"

#ColorPicker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ColorPickerResourcesFiles -wxsFilePath $PSScriptRoot\ColorPicker.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Resources"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ColorPickerResourcesFiles"" -wxsFilePath $PSScriptRoot\ColorPicker.wxs -regroot $registryroot"

#FileExplorerAdd-ons
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName MonacoPreviewHandlerMonacoAssetsFiles -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Assets\Monaco"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName MonacoPreviewHandlerCustomLanguagesFiles -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Assets\Monaco\customLanguages"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MonacoPreviewHandlerMonacoAssetsFiles"" -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""MonacoPreviewHandlerCustomLanguagesFiles"" -wxsFilePath $PSScriptRoot\FileExplorerPreview.wxs -regroot $registryroot"

#FileLocksmith
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName FileLocksmithAssetsFiles -wxsFilePath $PSScriptRoot\FileLocksmith.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\WinUI3Apps\Assets\FileLocksmith"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FileLocksmithAssetsFiles"" -wxsFilePath $PSScriptRoot\FileLocksmith.wxs -regroot $registryroot"

#Hosts
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName HostsAssetsFiles -wxsFilePath $PSScriptRoot\Hosts.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\WinUI3Apps\Assets\Hosts"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HostsAssetsFiles"" -wxsFilePath $PSScriptRoot\Hosts.wxs -regroot $registryroot"

#ImageResizer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ImageResizerAssetsFiles -wxsFilePath $PSScriptRoot\ImageResizer.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Assets\ImageResizer"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ImageResizerAssetsFiles"" -wxsFilePath $PSScriptRoot\ImageResizer.wxs -regroot $registryroot"

#Run
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName launcherImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""launcherImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
## Plugins
###Calculator
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Calculator\Microsoft.PowerToys.Run.Plugin.Calculator.deps.json"" -fileListName calcComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName calcImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Calculator\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""calcComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""calcImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Folder
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Folder\Microsoft.Plugin.Folder.deps.json"" -fileListName FolderComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName FolderImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Folder\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""FolderImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Program
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Program\Microsoft.Plugin.Program.deps.json"" -fileListName ProgramComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ProgramImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Program\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ProgramImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Shell
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Shell\Microsoft.Plugin.Shell.deps.json"" -fileListName ShellComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ShellImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Shell\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShellImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Indexer
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Indexer\Microsoft.Plugin.Indexer.deps.json"" -fileListName IndexerComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName IndexerImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Indexer\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""IndexerImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###UnitConverter
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\UnitConverter\Community.PowerToys.Run.Plugin.UnitConverter.deps.json"" -fileListName UnitConvCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName UnitConvImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\UnitConverter\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UnitConvCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UnitConvImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###WebSearch
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WebSearch\Community.PowerToys.Run.Plugin.WebSearch.deps.json"" -fileListName WebSrchCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WebSrchImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WebSearch\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WebSrchCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WebSrchImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###History
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\History\Microsoft.PowerToys.Run.Plugin.History.deps.json"" -fileListName HistoryPluginComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName HistoryPluginImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\History\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HistoryPluginComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""HistoryPluginImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Uri
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Uri\Microsoft.Plugin.Uri.deps.json"" -fileListName UriComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName UriImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Uri\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UriComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""UriImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###VSCodeWorkspaces
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\VSCodeWorkspaces\Community.PowerToys.Run.Plugin.VSCodeWorkspaces.deps.json"" -fileListName VSCWrkCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName VSCWrkImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\VSCodeWorkspaces\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""VSCWrkCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""VSCWrkImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###WindowWalker
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowWalker\Microsoft.Plugin.WindowWalker.deps.json"" -fileListName WindowWlkrCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WindowWlkrImagesCompFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowWalker\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WindowWlkrImagesCompFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###OneNote
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\OneNote\Microsoft.PowerToys.Run.Plugin.OneNote.deps.json"" -fileListName OneNoteComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName OneNoteImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\OneNote\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""OneNoteComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""OneNoteImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Registry
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Registry\Microsoft.PowerToys.Run.Plugin.Registry.deps.json"" -fileListName RegistryComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName RegistryImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Registry\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###Service
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Service\Microsoft.PowerToys.Run.Plugin.Service.deps.json"" -fileListName ServiceComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ServiceImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\Service\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ServiceComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ServiceImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###System
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\System\Microsoft.PowerToys.Run.Plugin.System.deps.json"" -fileListName SystemComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SystemImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\System\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SystemImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###TimeDate
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\TimeDate\Microsoft.PowerToys.Run.Plugin.TimeDate.deps.json"" -fileListName TimeDateComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName TimeDateImagesComponentFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\TimeDate\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""TimeDateImagesComponentFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###WindowsSettings
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowsSettings\Microsoft.PowerToys.Run.Plugin.WindowsSettings.deps.json"" -fileListName WinSetCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WinSetImagesCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowsSettings\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinSetCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinSetImagesCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###WindowsTerminal
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowsTerminal\Microsoft.PowerToys.Run.Plugin.WindowsTerminal.deps.json"" -fileListName WinTermCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName WinTermImagesCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\WindowsTerminal\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinTermCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinTermImagesCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
###PowerToys
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Plugins\PowerToys\Microsoft.PowerToys.Run.Plugin.PowerToys.deps.json"" -fileListName PowerToysCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -isLauncherPlugin 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerToysImagesCmpFiles -wxsFilePath $PSScriptRoot\Run.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Plugins\PowerToys\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerToysCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerToysImagesCmpFiles"" -wxsFilePath $PSScriptRoot\Run.wxs -regroot $registryroot"
## Plugins

<#
#AwakeFiles
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\modules\Awake\PowerToys.Awake.deps.json"" -fileListName AwakeFiles -wxsFilePath $PSScriptRoot\Awake.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName AwakeImagesFiles -wxsFilePath $PSScriptRoot\Awake.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\Awake\Images"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AwakeFiles"" -wxsFilePath $PSScriptRoot\Awake.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""AwakeImagesFiles"" -wxsFilePath $PSScriptRoot\Awake.wxs -regroot $registryroot"

#Peek
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\modules\Peek\PowerToys.Peek.UI.deps.json"" -fileListName PeekFiles -wxsFilePath $PSScriptRoot\Peek.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PeekAssetsFiles -wxsFilePath $PSScriptRoot\Peek.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\Peek\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PeekFiles"" -wxsFilePath $PSScriptRoot\Peek.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PeekAssetsFiles"" -wxsFilePath $PSScriptRoot\Peek.wxs -regroot $registryroot"

#PowerRename
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerRenameFiles -wxsFilePath $PSScriptRoot\PowerRename.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\PowerRename\"" -isWinAppSdkProj 1"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName PowerRenameAssetsFiles -wxsFilePath $PSScriptRoot\PowerRename.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\PowerRename\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerRenameFiles"" -wxsFilePath $PSScriptRoot\PowerRename.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""PowerRenameAssetsFiles"" -wxsFilePath $PSScriptRoot\PowerRename.wxs -regroot $registryroot"

#RegistryPreview
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\modules\RegistryPreview\PowerToys.RegistryPreview.deps.json"" -fileListName RegistryPreviewFiles -wxsFilePath $PSScriptRoot\RegistryPreview.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName RegistryPreviewAssetsFiles -wxsFilePath $PSScriptRoot\RegistryPreview.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\RegistryPreview\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryPreviewFiles"" -wxsFilePath $PSScriptRoot\RegistryPreview.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""RegistryPreviewAssetsFiles"" -wxsFilePath $PSScriptRoot\RegistryPreview.wxs -regroot $registryroot"

#ShortcutGuide
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName ShortcutGuideSvgFiles -wxsFilePath $PSScriptRoot\ShortcutGuide.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\modules\ShortcutGuide\ShortcutGuide\svgs\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""ShortcutGuideSvgFiles"" -wxsFilePath $PSScriptRoot\ShortcutGuide.wxs -regroot $registryroot"

#Settings
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson ""$PSScriptRoot..\..\..\$platform\Release\Settings\PowerToys.Settings.deps.json"" -fileListName SettingsV2Files -wxsFilePath $PSScriptRoot\Settings.wxs"
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2AssetsFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Settings\Assets\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2AssetsModulesFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Settings\Assets\Modules\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2OOBEAssetsModulesFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Settings\Assets\Modules\OOBE\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileList.ps1 -fileDepsJson """" -fileListName SettingsV2OOBEAssetsFluentIconsFiles -wxsFilePath $PSScriptRoot\Settings.wxs -depsPath ""$PSScriptRoot..\..\..\$platform\Release\Settings\Assets\FluentIcons\"""
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2Files"" -wxsFilePath $PSScriptRoot\Settings.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2AssetsFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2AssetsModulesFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2OOBEAssetsModulesFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs -regroot $registryroot"
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""SettingsV2OOBEAssetsFluentIconsFiles"" -wxsFilePath $PSScriptRoot\Settings.wxs -regroot $registryroot"

#WinAppSdk
Invoke-Expression -Command "$PSScriptRoot\generateFileComponents.ps1 -fileListName ""WinAppSDKFiles"" -wxsFilePath $PSScriptRoot\WinAppSDK.wxs -regroot $registryroot"
#>