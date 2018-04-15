# README
Method:
GET Path: /peerstreet/zip
Query parameter: code

## Examples

*Note: the following is presented for readability, not as expected API output*

```yaml
Zip: 90266
CBSA: 31084
MSA: Los Angeles-Long Beach-Anaheim, CA
Pop2015: 13,340,068
Pop2014: 13,254,397
```

```yaml
Zip: 32003
CBSA: 27260
MSA: Jacksonville, FL
Pop2015: 1,449,481
Pop2014: 1,421,004
```

```yaml
Zip: 88340
CBSA: 10460
MSA: N/A
Pop2015: N/A
Pop2014: N/A
```

```yaml
Zip: 88338
CBSA: 99999
MSA: N/A
Pop2015: N/A
Pop2014: N/A
```

##Instruction

-clone the repository
-bundle install
-run rails server
example input: http://localhost:3000/peerstreet/zip?code=90504
example output: {:Zip=>"90504", :MSA=>"Los Angeles-Long Beach-Anaheim, CA", :Pop2015=>"13340068", :Pop2014=>"13254397", :CBSA=>"31084"}
