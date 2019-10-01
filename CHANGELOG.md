# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.1.0

### Added

*   A basic soundboard that can play two sounds (`:zug_zug` and `:work_complete`), from two 
    different sets (one for the Horde, one for the Alliance).
*   A basic dispatcher (`QuarterMaster`) that uses the soundboard when triggered.
*   A CLI that generates git hook scripts ; these scripts make use of the dispatcher.

