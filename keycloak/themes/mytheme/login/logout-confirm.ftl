<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

<#if section = "header">

<#elseif section = "form">
<div class="deaware-container">

  <div class="left">
    <div class="left-content">
      <h1>DEAWARE AI</h1>
        <p class="tagline">Attendance & Face<br/>Recognition System</p>
    </div>
  </div>

  <div class="right">
    <div class="login-card">

      <div class="card-header">
        <h2>ออกจากระบบ</h2>
      </div>

      <p class="logout-message">ต้องการออกจากระบบหรือไม่?</p>

<form action="${url.logoutConfirmAction}" method="post" class="logout-form" onsubmit="confirmLogout.disabled = true; return true;">
  <input type="hidden" name="session_code" value="${logoutConfirm.code}">

  <button type="submit" name="confirmLogout" id="kc-logout" class="btn-logout">ยืนยัน</button>
  <#if client?? && client.baseUrl?has_content>
  <button type="button" class="btn-cancel" onclick="location.href='${client.baseUrl}'">ยกเลิก</button>
  <#else>
  <button type="button" class="btn-cancel" onclick="history.back()">ยกเลิก</button>
  </#if>

</form>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>