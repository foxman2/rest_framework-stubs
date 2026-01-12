# Django REST Framework Stubs

Type stubs for [Django REST Framework](https://www.django-rest-framework.org/).

这个包为 Django REST Framework 提供类型声明（Type Stubs），让你可以在使用 mypy、pyright 等类型检查器时获得完整的类型提示。

## Installation 安装

从 Git 仓库安装：

```bash
pip install git+https://github.com/foxman2/rest_framework-stubs.git@main
```

或在 `requirements.txt` 中添加：

```
djangorestframework-stubs @ git+https://github.com/foxman2/rest_framework-stubs.git@main
```

或在 `requirements-dev.txt` 中添加：

```
git+https://github.com/foxman2/rest_framework-stubs.git@main#egg=djangorestframework-stubs
```

## Usage 使用

安装后，类型检查器会自动识别 Django REST Framework 的类型。你不需要额外的配置。

### Example 示例

```python
from rest_framework import serializers, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

class UserSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=100)
    email = serializers.EmailField()
    is_active = serializers.BooleanField(default=True)

class UserViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    
    @action(detail=True, methods=['post'])
    def activate(self, request, pk=None):
        # 现在你会得到完整的类型提示
        return Response({'status': 'activated'})
```

### 配置 mypy

在 `mypy.ini` 或 `setup.cfg` 中：

```ini
[mypy]
plugins = mypy_django_plugin.main

[mypy.plugins.django-stubs]
django_settings_module = your_project.settings
```

### 配置 pyright

在 `pyproject.toml` 中：

```toml
[tool.pyright]
typeCheckingMode = "basic"
```

## Requirements 依赖

- Python 3.7+
- Django REST Framework 3.12+

## Development 开发

克隆并安装用于开发：

```bash
git clone https://github.com/foxman2/rest_framework-stubs.git
cd rest_framework-stubs
pip install -e .
```

## Package Structure 包结构

```
rest_framework/
├── __init__.pyi
├── py.typed          # PEP 561 类型标记文件
├── serializers.pyi   # Serializer 类型声明
├── views.pyi         # View 类型声明
├── viewsets.pyi      # ViewSet 类型声明
├── fields.pyi        # Field 类型声明
├── ...               # 其他模块的类型声明
└── ...
```

## License 许可证

MIT License

## Contributing 贡献

欢迎提交 Pull Request 来改进类型声明！
