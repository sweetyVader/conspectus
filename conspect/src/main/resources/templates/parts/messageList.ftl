<#import "pager.ftl" as p>

<@p.pager url page />

<div class="card-columns" id="message-list">
    <#list page.content as message>
    <div class="card my-3" data-id="${message.id}">
        <div class="m-2">
            <h5>${message.title}</h5>
            <span>${message.text}</span><br/>
            <span class = "text-muted">Speciality № ${message.num}</span><br/>
            <i>#${message.tag}</i><br/>

            <#if user??>
                <a href="/file/${message.filename}">File</a>
            <#else>
                <a href="/guest">File</a>
            </#if>
        </div>
        <div class="card-footer text-muted container">

            <div class="row">

                <#if user??>
                    <a class="col align-self-center" href="/user/profile/${message.author.id}">${message.authorName}</a>
                    <a class="col align-self-center" href="/messages/${message.id}/like">

                        <#if message.meLiked>
                            <i class="fas fa-heart"></i>
                        <#else>
                            <i class="far fa-heart"></i>
                        </#if>
                       ${message.likes}
                    </a>
                <#else>
                    <a class="col align-self-center" href="/guest">${message.authorName}</a>
                </#if>
            <#include "security.ftl">
                <#if message.author.id == currentUserId || isAdmin>
                    <a class="btn btn-primary" href="/user/profile/${message.author.id}?message=${message.id}">
                        Edit conspectus
                    </a>
                </#if>
            </div>
        </div>
    </div>
    </#list>
</div>

<@p.pager url page />