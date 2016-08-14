# nbreport

This is a very simple custom exporter for jupyter notebooks. I was mostly
looking for an easy way to distribte custom templates across different
computers that I run jupyter on. A python package seemed to be the best option,
but could only find directions to make a custom exporter and not packaging
templates.

You can add a title block by editing a notebooks metadata and adding:

```
"report": {
    "date": '2016-00-10'
    "title": 'Title of the document'
    "author": 'Justin Fear'
    "author_email": "justin.m.fear@gmail.com"
}
```
