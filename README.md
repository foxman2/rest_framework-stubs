# Django REST Framework Stubs

Type stubs for [Django REST Framework](https://www.django-rest-framework.org/).

## Installation

You can install this package from PyPI:

```bash
pip install djangorestframework-stubs
```

## Usage

This package provides type stubs for Django REST Framework. Once installed, type checkers like mypy will automatically use these stubs when analyzing code that uses Django REST Framework.

### Example

```python
from rest_framework import serializers

class MySerializer(serializers.Serializer):
    name = serializers.CharField(max_length=100)
    email = serializers.EmailField()
```

## Requirements

- Python 3.7+
- Django 3.2+
- Django REST Framework 3.12+

## Development

To install for development:

```bash
git clone https://github.com/yourusername/rest_framework-stubs.git
cd rest_framework-stubs
pip install -e .
```

## Building and Publishing

To build the package:

```bash
python -m build
```

To publish to PyPI:

```bash
python -m twine upload dist/*
```

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
