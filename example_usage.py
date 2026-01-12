"""
测试示例：如何使用 djangorestframework-stubs

安装后，你可以在项目中直接 import Django REST Framework，
类型检查器会自动使用这些类型声明。
"""

# 示例 1: Serializer 类型提示
from rest_framework import serializers

class UserSerializer(serializers.Serializer):
    """用户序列化器"""
    username = serializers.CharField(max_length=100)
    email = serializers.EmailField()
    age = serializers.IntegerField(min_value=0, max_value=150)
    is_active = serializers.BooleanField(default=True)
    
    def validate_username(self, value: str) -> str:
        # 现在你会得到完整的类型提示
        if len(value) < 3:
            raise serializers.ValidationError("Username too short")
        return value


# 示例 2: ViewSet 类型提示
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.request import Request

class UserViewSet(viewsets.ModelViewSet):
    """用户视图集"""
    serializer_class = UserSerializer
    
    def list(self, request: Request) -> Response:
        # request 和 Response 都有完整的类型提示
        queryset = self.get_queryset()
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    
    @action(detail=True, methods=['post'])
    def activate(self, request: Request, pk=None) -> Response:
        # 自定义 action 也有类型支持
        user = self.get_object()
        return Response({'status': 'activated'})


# 示例 3: APIView 类型提示
from rest_framework.views import APIView
from rest_framework import status

class UserDetailView(APIView):
    """用户详情视图"""
    
    def get(self, request: Request, pk: int) -> Response:
        # GET 请求处理
        return Response({'id': pk}, status=status.HTTP_200_OK)
    
    def post(self, request: Request, pk: int) -> Response:
        # POST 请求处理
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# 示例 4: 权限和认证类型提示
from rest_framework.permissions import BasePermission, IsAuthenticated
from rest_framework.authentication import TokenAuthentication

class CustomPermission(BasePermission):
    """自定义权限"""
    
    def has_permission(self, request: Request, view) -> bool:
        # 权限检查逻辑
        return request.user and request.user.is_authenticated


# 示例 5: 分页类型提示
from rest_framework.pagination import PageNumberPagination

class CustomPagination(PageNumberPagination):
    """自定义分页"""
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 100


print("所有类型提示都已经生效！")
print("使用 mypy 或 pyright 检查你的代码可以发现类型错误。")
