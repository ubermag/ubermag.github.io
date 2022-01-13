{{ fullname | escape | underline}}

.. automodule:: {{ fullname }}

   {% block attributes %}
   {%- if attributes -%}
   .. rubric:: Module attributes

   .. autosummary::
      :toctree:
   {% for item in attributes %}
      {{ item }}
   {%- endfor -%}
   {%- endif -%}
   {%- endblock %}

   {% block classes %}
   {%- if classes and classes != excluded_classes -%}
   .. rubric:: {{ ('Classes') }}

   .. autosummary::
      :toctree:
      :template: class-template.rst
      :nosignatures:
   {% for item in classes %}
      {% if item not in excluded_classes -%}
         {{ item }}
      {%- endif %}
   {%- endfor %}
   {%- endif -%}
   {%- endblock %}

   {% block functions %}
   {%- if functions -%}
   .. rubric:: {{ ('Functions') }}

   .. autosummary::
      :toctree:
      :nosignatures:
   {% for item in functions %}
      {{ item }}
   {%- endfor %}
   {%- endif -%}
   {%- endblock %}

   {% block exceptions %}
   {%- if exceptions -%}
   .. rubric:: {{ ('Exceptions') }}

   .. autosummary::
      :toctree:
   {% for item in exceptions %}
      {{ item }}
   {%- endfor %}
   {%- endif -%}
   {%- endblock %}

{% block modules %}
{%- if modules -%}
{%- set ns = namespace(submodules=false) -%}
{%- for item in modules -%}
{%- if item in included_submodules -%}
{%- set ns.submodules = true -%}
{%- endif -%}
{%- endfor -%}
{%- if ns.submodules -%}

.. rubric:: {{ ('Submodules') }}

.. autosummary::
    :toctree:
    :template: module-template.rst
    :recursive:
{% for item in modules %}
{%- if item in included_submodules %}
    {{ item|replace(fullname, "", 1)|replace(".", "", 1) }}{# only submodule part of module.submodule; full name fails for micromagneticmodel, micromagnetictests and oommfc #}
{%- endif -%}
{%- endfor %}
{%- endif -%}
{%- endif -%}
{% endblock %}
