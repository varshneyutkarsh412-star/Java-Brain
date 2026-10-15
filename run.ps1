<#
.SYNOPSIS
    Self-contained runner script for the Java Online Quiz Platform.
    Handles checking Java, obtaining Maven if missing, and starting the Spring Boot app.
#>

$ErrorActionPreference = "Stop"
$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Starting Java-Based Online Quiz Platform               " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Check Java Installation
Write-Host "`n[1/3] Verifying Java Installation..." -ForegroundColor Yellow
$javaCmd = Get-Command "java" -ErrorAction SilentlyContinue

if (-not $javaCmd) {
    if ($env:JAVA_HOME -and (Test-Path "$env:JAVA_HOME\bin\java.exe")) {
        $env:PATH = "$env:JAVA_HOME\bin;" + $env:PATH
        $javaCmd = "$env:JAVA_HOME\bin\java.exe"
    } else {
        Write-Host "ERROR: Java (JDK 17 or higher) is not found in your PATH or JAVA_HOME." -ForegroundColor Red
        Write-Host "Please install Java JDK 17+ from https://adoptium.net/ and ensure it is added to your environment PATH." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

$javaVersionOutput = & java -version 2>&1 | Out-String
Write-Host "Detected Java: $javaVersionOutput" -ForegroundColor Green

# 2. Check Maven (Global or Portable)
Write-Host "[2/3] Checking Maven Build Tool..." -ForegroundColor Yellow
$mvnExecutable = $null

$globalMvn = Get-Command "mvn" -ErrorAction SilentlyContinue
if ($globalMvn) {
    Write-Host "Found installed Maven: $($globalMvn.Source)" -ForegroundColor Green
    $mvnExecutable = "mvn"
} else {
    $toolsDir = Join-Path $ProjectDir ".tools"
    $mavenHome = Join-Path $toolsDir "apache-maven-3.9.6"
    $localMvnCmd = Join-Path $mavenHome "bin\mvn.cmd"

    if (Test-Path $localMvnCmd) {
        Write-Host "Using bundled local Maven at: $localMvnCmd" -ForegroundColor Green
        $mvnExecutable = $localMvnCmd
    } else {
        Write-Host "Maven not found on system. Automatically downloading portable Apache Maven 3.9.6..." -ForegroundColor Cyan
        if (-not (Test-Path $toolsDir)) {
            New-Item -ItemType Directory -Path $toolsDir -Force | Out-Null
        }
        $zipPath = Join-Path $toolsDir "maven.zip"
        $downloadUrl = "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
        
        try {
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath -UseBasicParsing
            Write-Host "Extracting portable Maven..." -ForegroundColor Cyan
            Expand-Archive -Path $zipPath -DestinationPath $toolsDir -Force
            Remove-Item $zipPath -Force
            $mvnExecutable = $localMvnCmd
            Write-Host "Portable Maven setup complete!" -ForegroundColor Green
        } catch {
            Write-Host "WARNING: Failed to auto-download Maven: $_" -ForegroundColor Yellow
            Write-Host "Please ensure Maven is installed or check your internet connection." -ForegroundColor Yellow
            Read-Host "Press Enter to exit"
            exit 1
        }
    }
}

# 3. Launch Spring Boot Application
Write-Host "`n[3/3] Launching Spring Boot Application..." -ForegroundColor Yellow
Write-Host "Once started, open your browser at: http://localhost:8080`n" -ForegroundColor Cyan

Set-Location $ProjectDir
& $mvnExecutable spring-boot:run
