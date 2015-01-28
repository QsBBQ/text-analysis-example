# Analyzing Text in Ruby

An example implementation of the [text-analysis][text-analysis] project.

## Files In This Repository

1. `textalyze.rb` is the source code for this project
1. `textalyze_test.rb` contains tests for the code in `textalyze.rb`
1. `sample_data` is a directory containing sample text files to analyze, mostly from [Project Gutenberg](http://www.gutenberg.org/).

[text-analysis]:https://github.com/codeunion/text-analysis

## Usage

```shell-session
$ ruby textalyze.rb <text file>
```

Where `<text file>` is the filename of a plain-text file to be analyzed.

Displays a histogram chart of frequencies for each alphanumeric character in the text provided.

#### Example

```shell-session
$ ruby textalyze.rb ./sample_data/moby-dick.txt
The counts for ./sample_data/moby-dick.txt are...
a [ 8.26%] ############################################
b [ 1.43%] #######
c [ 2.29%] ############
# ...
```

#### Tests

Tests are in the `textalyze_test.rb` file.

```shell-session
$ ruby textalyze_test.rb

Running tests for frequencies()...
true
true
# ...
```
