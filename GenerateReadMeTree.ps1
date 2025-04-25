<#
.SYNOPSIS
    Generates a formatted directory tree and updates README.md
.DESCRIPTION
    Creates a professional directory tree visualization similar to 'tree /f'
    and inserts it into README.md after a specified marker, automatically
    handling Markdown formatting with appropriate line breaks.
.NOTES
    Author: Rokawoo
    Version: 1.3
    Last Updated: 2025-04-24
#>

[CmdletBinding()]
param(
    [string]$ReadmePath = "README.md",
    [string]$MarkerText = "Notes Tree",
    [string]$NewLineChar = "<br>",  # Empty by default for cleaner Markdown formatting
    [string[]]$ExcludeFolders = @(".git", "node_modules", ".vscode", "bin", "obj"),
    [string[]]$ExcludeFiles = @(".DS_Store", "thumbs.db"),
    [int]$MaxDepth = 5,
    [switch]$IncludeFileSize
)

# File type indicators - using simple ASCII for maximum compatibility
$FileIcons = @{
    ".md"    = "MD"
    ".json"  = "JSON"
    ".js"    = "JS"
    ".ts"    = "TS"
    ".css"   = "CSS"
    ".html"  = "HTML"
    ".py"    = "PY"
    ".java"  = "JAVA"
    ".cs"    = "CS"
    ".go"    = "GO"
    ".rb"    = "RB"
    ".php"   = "PHP"
    ".ps1"   = "PS1"
    ".sh"    = "SH"
    ".yaml"  = "YAML"
    ".yml"   = "YML"
    ".txt"   = "TXT"
    "default" = "FILE"
}

# Initialize performance counter
$sw = [System.Diagnostics.Stopwatch]::StartNew()

function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Type = "Info"
    )
    
    switch ($Type) {
        "Success" { Write-Host $Message -ForegroundColor Green }
        "Error"   { Write-Host $Message -ForegroundColor Red }
        "Warning" { Write-Host $Message -ForegroundColor Yellow }
        "Info"    { Write-Host $Message -ForegroundColor Cyan }
        default   { Write-Host $Message }
    }
}

function Format-FileSize {
    param([long]$Size)
    
    if ($Size -lt 1KB) {
        return "$Size B"
    }
    elseif ($Size -lt 1MB) {
        return "{0:N1} KB" -f ($Size / 1KB)
    }
    elseif ($Size -lt 1GB) {
        return "{0:N1} MB" -f ($Size / 1MB)
    }
    else {
        return "{0:N1} GB" -f ($Size / 1GB)
    }
}

function Get-FileType {
    param([string]$FileName)
    
    $extension = [System.IO.Path]::GetExtension($FileName)
    
    if ($FileIcons.ContainsKey($extension)) {
        return $FileIcons[$extension]
    }
    
    return $FileIcons["default"]
}

function Test-ExcludePattern {
    param(
        [string]$Name,
        [string[]]$Patterns
    )
    
    foreach ($pattern in $Patterns) {
        if ($pattern.StartsWith("*") -or $pattern.EndsWith("*")) {
            if ($Name -like $pattern) {
                return $true
            }
        }
        elseif ($Name -eq $pattern) {
            return $true
        }
    }
    
    return $false
}

function Get-DirectoryTree {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [string]$Prefix = "",
        
        [int]$CurrentDepth = 0
    )
    
    if ($CurrentDepth -gt $MaxDepth) {
        return @("$Prefix+------- [...] (Max depth reached)")
    }
    
    $output = @()
    
    try {
        # Get directories and files while respecting exclusion patterns
        $items = Get-ChildItem -Path $Path -ErrorAction SilentlyContinue | 
            Where-Object { 
                -not (
                    ($_.PSIsContainer -and (Test-ExcludePattern -Name $_.Name -Patterns $ExcludeFolders)) -or
                    (-not $_.PSIsContainer -and (Test-ExcludePattern -Name $_.Name -Patterns $ExcludeFiles))
                )
            } | Sort-Object { $_.PSIsContainer }, Name -Descending
        
        $itemCount = $items.Count
        
        for ($i = 0; $i -lt $itemCount; $i++) {
            $item = $items[$i]
            $isLastItem = ($i -eq $itemCount - 1)
            
            # Determine connector characters based on position
            $connector = if ($isLastItem) { "\------- " } else { "+------- " }
            $childPrefix = if ($isLastItem) { "$Prefix        " } else { "$Prefix|       " }
            
            if ($item.PSIsContainer) {
                # Add directory entry with better formatting
                $output += "$Prefix$connector[DIR] $($item.Name)"
                
                # Process subdirectories recursively
                $childItems = Get-DirectoryTree -Path $item.FullName -Prefix $childPrefix -CurrentDepth ($CurrentDepth + 1)
                $output += $childItems
            }
            else {
                # Add file entry with type indicator
                $fileType = Get-FileType -FileName $item.Name
                
                # Format the file entry
                $fileInfo = "[$fileType] $($item.Name)"
                
                # Add file size if requested
                if ($IncludeFileSize) {
                    $size = Format-FileSize -Size $item.Length
                    $fileInfo += " ($size)"
                }
                
                $output += "$Prefix$connector$fileInfo"
            }
        }
    }
    catch {
        $output += "$Prefix+------- [ERROR] $($_.Exception.Message)"
    }
    
    return $output
}

function Update-ReadmeWithTree {
    param(
        [string]$ReadmePath,
        [string]$MarkerText,
        [string[]]$TreeLines,
        [string]$NewLineChar
    )
    
    # Check if README exists, create it if not
    if (-not (Test-Path $ReadmePath)) {
        Write-ColorOutput "README.md not found. Creating new file." "Warning"
        "# My Project$([Environment]::NewLine)$([Environment]::NewLine)$MarkerText" | Set-Content -Path $ReadmePath
    }
    
    # Read the entire content of the README file
    $readmeContent = Get-Content -Path $ReadmePath -Raw
    
    if (-not $readmeContent.Contains($MarkerText)) {
        Write-ColorOutput "Marker text '$MarkerText' not found. Adding it to README.md." "Warning"
        $readmeContent += "$([Environment]::NewLine)$([Environment]::NewLine)$MarkerText"
        $readmeContent | Set-Content -Path $ReadmePath -NoNewline
    }
    
    # Re-read content after potential modifications
    $readmeContent = Get-Content -Path $ReadmePath -Raw
    
    # Format the tree as a code block with metadata
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Format tree content for markdown
    # Join all tree lines with line breaks using NewLineChar
    $treeContent = ""
    foreach ($line in $TreeLines) {
        # Add the NewLineChar only if it's not the last line
        if ($line -ne $TreeLines[-1]) {
            $treeContent += "$line$NewLineChar$([Environment]::NewLine)"
        } else {
            $treeContent += "$line"
        }
    }
    
    # Prepare the formatted tree with code block
    $formattedTree = @"

<!-- BEGIN DIRECTORY TREE -->
<!-- Generated on $timestamp -->
$treeContent
<!-- END DIRECTORY TREE -->

"@

    # Find all text starting from marker up to the next non-whitespace line after any existing tree
    $markerPattern = "$MarkerText[\s\S]*?(?:<!-- END DIRECTORY TREE -->[\r\n]+)"
    
    if ($readmeContent -match $markerPattern) {
        # Replace entire section from marker to end of existing tree
        $newContent = $readmeContent -replace $markerPattern, "$MarkerText$formattedTree"
    }
    else {
        # No existing tree, append after marker
        $newContent = $readmeContent -replace "$MarkerText", "$MarkerText$formattedTree"
    }
    
    # Write the updated content back to the README
    $newContent | Set-Content -Path $ReadmePath -NoNewline
    
    return $true
}

# Main script execution
try {
    Write-ColorOutput "Directory Tree Generator" "Info"
    Write-ColorOutput "---------------------------" "Info"
    
    # Generate the tree structure
    Write-ColorOutput "Generating directory tree..." "Info"
    
    $rootDirectory = Get-Location
    $projectName = Split-Path $rootDirectory -Leaf
    
    $treeHeader = "|   $projectName"
    $treeLines = @($treeHeader)
    $treeLines += Get-DirectoryTree -Path $rootDirectory
    
    # Update the README file with proper markdown line breaks
    $updated = Update-ReadmeWithTree -ReadmePath $ReadmePath -MarkerText $MarkerText -TreeLines $treeLines -NewLineChar $NewLineChar
    
    $sw.Stop()
    $elapsedTime = $sw.Elapsed.TotalSeconds.ToString("0.00")
    
    if ($updated) {
        Write-ColorOutput "SUCCESS: Tree structure has been added to README.md after '$MarkerText'." "Success"
        Write-ColorOutput "Process completed in $elapsedTime seconds" "Success"
        if ($NewLineChar) {
            Write-ColorOutput "Line breaks: Using '$NewLineChar' for Markdown compatibility" "Info"
        } else {
            Write-ColorOutput "Line breaks: Using standard line breaks for code block formatting" "Info"
        }
    }
}
catch {
    $sw.Stop()
    Write-ColorOutput "ERROR: $($_.Exception.Message)" "Error"
    exit 1
}