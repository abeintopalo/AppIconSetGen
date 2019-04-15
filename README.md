
<p align="center">
     <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" />
     <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
</p>

## What is AppIconSetGen?

_**AppIconSetGen** is a command line tool that makes it easy to generate an App Icon set from a provided image asset (e.g. appIcon.pdf) for iOS, macOS, and watchOS platforms_

Benefits:

- Only a single vector source image is needed for the app icon 
- App Icon set generation can be added to project build phase.
- All required app icon sizes are generated for a given platform

## Installing

Using Make:
```
$ git clone git@github.com:abeintopalo/AppIconSetGen.git
$ cd AppIconSetGen
$ make
```

Using the Swift Package Manager:
```
$ git clone git@github.com:abeintopalo/AppIconSetGen.git
$ cd AppIconSetGen
$ swift build -c release
$ cp -f .build/release/AppIconSetGen /usr/local/bin/appiconsetgen
```

## Requirements

AppIconSetGen requires the following to be installed on your system:

- Xcode 10.2 or later to provide Swift 5.0 tool chain
- Swift 5.0 runtime (bundled with macOS 10.14.4 or if you use earlier version of macOS install [Swift 5 runtime](https://support.apple.com/kb/DL1998?locale=en_US)
- Git

## Usage

AppIconSetGen is a command line tool `appiconsetgen`, you can either run it manually or in a custom build phase using following command:

```
$ appiconsetgen <input file> [--output <output path>] [--iOS] [--watchOS] [--macOS] [--appIconSetName]
```

### Command line options

- `input file` - Path to an image file (.pdf, .png, etc).
- `--iOS` - Generates app icons for iOS
- `--watchOS` - Generates app icons for watchOS
- `--macOS` - Generates app icons for macOS
- `--output` - Output folder for the generated App Icon set
- `--appIconSetName` - App icon set name

## License

AppIconSetGen is available under the MIT license. See [LICENSE](LICENSE) for more information.

## Attributions

This tool is powered by

- [Commander](https://github.com/kylef/Commander) and few other libs by [Kyle Fuller](https://github.com/kylef)
