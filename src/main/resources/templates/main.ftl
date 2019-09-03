<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
   <div class="form-group col-md-6">
    <form method="get" action="main" class="form-inline">
        <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
     <button type="submit" class="btn btn-primary ml-2">Search</button>
    </form>
   </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" name="text" placeholder="Enter message" />
            <input type="text" class="form-control" name="tag" placeholder="Tag">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary">Add</button>
    </form>
    </div>
</div>

<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}">
        </#if>
    </div>
</div>
<#else>
No message
</#list>
</@c.page>