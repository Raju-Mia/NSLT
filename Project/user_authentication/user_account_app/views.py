from django.shortcuts import render


# Create your views here.
def Home(request):
    return render(request, 'home.html')

def register(request):
    context = {}
    return render(request, 'user/register.html', context)