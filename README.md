# precompiled-exolibs


| exolib | version       | SHA        | note          |
| ------ | ------------- | ---------- | ------------- |
| cub    | `tags/1.11.0` | `618a46c2` | header-only   |
| nvcomp | `tags/v1.1.1` | `64acf24`  | requies `cub` |


# `nvcomp`
## version 1.1 (branch-1.1)

| passed? | CUDA SDK | gcc | cmake | targets         | SHA-256 | _note_               |
| ------- | -------- | --- | ----- | --------------- | ------- | -------------------- |
| :(      | 9.2      | 7.5 | 3.10  | `sm_{60,70}`    |         | docker; not working  |
| yes     | 10.0     | 7.5 | 3.10  | `sm_{60,70}`    |         | docker               |
| yes     | 10.1     | 7.5 | 3.10  | `sm_{60,70}`    |         | docker               |
| yes     | 10.2     | 7.5 | 3.10  | `sm_{60,70}`    |         | docker               |
| yes     | 11.0     | 9.3 | 3.16  | `sm_{60,70,80}` |         | docker               |
| yes     | 11.1     | 9.3 | 3.16  | `sm_{60,70,80}` |         | docker               |
| yes     | 11.2     | 9.3 | 3.16  | `sm_{60,70,80}` |         | docker-img not ready |
