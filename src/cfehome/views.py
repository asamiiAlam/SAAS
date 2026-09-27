from django.shortcuts import render
from django.http import HttpResponse
from visits.models import PageVisit

def home_page_view(request):
    PageVisit.objects.create()
    queryset=PageVisit.objects.all()
    context={
        'queryset':queryset,
        'page_visit_count': queryset.count(),
    }
    return render(request, 'home.html', context)
