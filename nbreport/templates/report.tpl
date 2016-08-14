{%- extends 'report_basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

{%- block header -%}
    <!DOCTYPE html>
    <html>
    <head>
        {%- block html_head -%}
        <meta charset="utf-8" />
        <title>{{resources['metadata']['name']}}</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

        {% for css in resources.inlining.css -%}
            <style type="text/css">
            {{ css }}
            </style>
        {% endfor %}

        <style type="text/css">
        /* Overrides of notebook CSS for static HTML export */
        body {
          overflow: visible;
          padding: 8px;
        }

        div#notebook {
          overflow: visible;
          border-top: none;
        }

        @media print {
          div.cell {
            display: block;
            page-break-inside: avoid;
          } 
          div.output_wrapper { 
            display: block;
            page-break-inside: avoid; 
          }
          div.output { 
            display: block;
            page-break-inside: avoid; 
          }
        }
          nav[data-toggle='toc'] {
            margin-top: 30px;
          }

          @media (max-width: 768px) {
            nav.affix[data-toggle='toc'] {
              position: static;
            }

            nav[data-toggle='toc'] .nav .nav {
              display: block;
            }
          }
        div.title {
            font-size: 1.9em;
            font-weight: bold;
            text-align: center;
        }
        div.author div.date {
            font-size: 1.2em;
        }
        </style>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- add after bootstrap.min.css -->
        <link rel="stylesheet" href="https://cdn.rawgit.com/afeld/bootstrap-toc/v0.4.1/dist/bootstrap-toc.min.css">


        <!-- Custom stylesheet, it must be in the same directory as the html file -->
        <link rel="stylesheet" href="custom.css">

        <!-- Loading mathjax macro -->
        {{ mathjax() }}
        {%- endblock html_head -%}
    </head>
{%- endblock header -%}

{% block body %}
<body data-spy="scroll" data-target="#toc">
    <div tabindex="-1" id="notebook" class="border-box-sizing">
        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-2">
                    <nav id="toc" data-spy="affix" data-toggle="toc"></nav>
                </div>
                <div class="col-sm-10">
                    <div class="report_header">
                        {% if nb['metadata'].get('report', {}).get('title', '') %}
                        <div class="title">
                            {{ nb['metadata']['report']['title'] }}
                        </div>
                        {% endif %}
                        {% if nb['metadata'].get('report', {}).get('author', '') %}
                        <div class="author">
                            <strong>Author: </strong>{{ nb['metadata']['report']['author'] }}
                        </div>
                        {% endif %}
                        {% if nb['metadata'].get('report', {}).get('date', '') %}
                        <div class="date">
                            <strong>Date: </strong>{{ nb['metadata']['report']['date'] }}
                        </div>
                        {% endif %}
                    </div>
                    <hr>
                    {{ super() }}
                </div>
            </div>
        </div>
    </div>
</body>
{%- endblock body %}

{% block footer %}
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- add after bootstrap.min.js -->
    <script src="https://cdn.rawgit.com/afeld/bootstrap-toc/v0.4.1/dist/bootstrap-toc.min.js"></script>
</html>
{% endblock footer %}
