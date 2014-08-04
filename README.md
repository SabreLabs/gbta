GBTA2014
=======

### Script order
1. Replace Windows line termination from Raw Redis output with Unix EOL
```shell
$ awk -f scripts/win2unixeol.awk /path/to/raw/redis.dump > /path/to/unix'd/eol/output.dump
```
2. Strip out all non-JSON valid lines (we don't try to fix partial transciption errors)
```shell
$ ruby scripts/strip_blanks.rb /path/to/unix'd/eol.output /path/to/valid/tweet/per/line.txt
```
3. Create valid Tre-View capable JSON
```shell
$ ruby scripts/tre_view_raw_tweets.rb /path/to/valid/tweet/per/line.output /path/to/tre_viewed/tweets.json
```
4. (Optional, tar it up)
```shell
$ tar -jvcf [search_term].tar.bz2 /path/to/valid/tweet/per/line.txt /path/to/tre_viewed/tweets.json
```

Once step #2 is completed, the data is technically ready for a full batch load - each line is a valid
Tweet encoded via JSON.  Step 3 is simply for tre-viewed purposes, and is completely optional. Step
4 is also optional, but recommended do to overall size.
