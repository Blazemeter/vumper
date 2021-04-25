# vumper

GitHub Action program to handle application version file like auto-increment of version number based on GitHub events. This action program supports "push" and "pull-request" events.

Note: based on helpful action `vinodhraj/Bump-N-Tag-Version`

## Inputs

### `file_name`

**Required** - The name of file contains version information.

### `tag_version`

**Optional** - Value can be 'true' or 'false'. If 'true' will create tag for this version and push the same to repository. By default it is always 'false'

### `Sample **VERSION** file content`

Anything containing three or more dot-separated numbers will have their last segment bumped by `1`

Examples:

```
'1.2'                  ->  1.2
'v1.2'                 ->  v1.2
'1.2.3'                ->  '1.2.4'
'v1.2.3'               ->  'v1.2.4'
'v.1.2.3'              ->  'v.1.2.4'
'1.2.3.4'              ->  '1.2.3.5'
'v.1.2.3.4'            ->  'v.1.2.3.5'
'1.2.3.4-5'            ->  '1.2.3.5-5'
'v.1.2.3.4-5'          ->  'v.1.2.3.5-5'
'VERSION=1.2'          ->  VERSION=1.2
'VERSION=v1.2'         ->  VERSION=v1.2
'VERSION=1.2.3'        ->  'VERSION=1.2.4'
'VERSION=v1.2.3'       ->  'VERSION=v1.2.4'
'VERSION=v.1.2.3'      ->  'VERSION=v.1.2.4'
'VERSION=1.2.3.4'      ->  'VERSION=1.2.3.5'
'VERSION=v.1.2.3.4'    ->  'VERSION=v.1.2.3.5'
'VERSION=1.2.3.4-5'    ->  'VERSION=1.2.3.5-5'
'VERSION=v.1.2.3.4-5'  ->  'VERSION=v.1.2.3.5-5'
'VERSION/1.2'          ->  VERSION/1.2
'VERSION/v1.2'         ->  VERSION/v1.2
'VERSION/1.2.3'        ->  'VERSION/1.2.4'
'VERSION/v1.2.3'       ->  'VERSION/v1.2.4'
'VERSION/v.1.2.3'      ->  'VERSION/v.1.2.4'
'VERSION/1.2.3.4'      ->  'VERSION/1.2.3.5'
'VERSION/v.1.2.3.4'    ->  'VERSION/v.1.2.3.5'
'VERSION/1.2.3.4-5'    ->  'VERSION/1.2.3.5-5'
'VERSION/v.1.2.3.4-5'  ->  'VERSION/v.1.2.3.5-5'
'VERSION1.2'           ->  VERSION1.2
'VERSIONv1.2'          ->  VERSIONv1.2
'VERSION1.2.3'         ->  'VERSION1.2.4'
'VERSIONv1.2.3'        ->  'VERSIONv1.2.4'
'VERSIONv.1.2.3'       ->  'VERSIONv.1.2.4'
'VERSION1.2.3.4'       ->  'VERSION1.2.3.5'
'VERSIONv.1.2.3.4'     ->  'VERSIONv.1.2.3.5'
'VERSION1.2.3.4-5'     ->  'VERSION1.2.3.5-5'
'VERSIONv.1.2.3.4-5'   ->  'VERSIONv.1.2.3.5-5'
```

## Example usage

```
name: App Version Actions
on: [push, pull_request]  # Recommended to use either of one event

jobs:
  Version-check:
    runs-on: ubuntu-latest
    name: Vumper
    steps:
    - uses: actions/checkout@master
    - name: Increment version
      id: version
      uses: Blazemeter/vumper@v2
      with:
        file_name: './VERSION'
        tag_version: "true"
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
