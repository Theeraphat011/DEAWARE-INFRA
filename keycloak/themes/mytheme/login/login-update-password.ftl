<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

<#if section = "header">
<#elseif section = "form">

<div class="deaware-container">

  <div class="left">
    <div class="left-content">
      <h1>DEAWARE AI</h1>
      <p class="tagline">อัปเดตความปลอดภัย</p>
    </div>
  </div>

  <div class="right">
    <div class="login-card">

      <div class="card-header">
        <h2>อัพเดทรหัสผ่าน</h2>
        <p>โปรดใส่รหัสผ่านแบบใหม่</p>
      </div>

      <#if message?has_content>
        <div class="alert alert-${message.type}">
          <span>${message.summary}</span>
        </div>
      </#if>

      <form action="${url.loginAction}" method="post">

        <div class="form-group">
          <label for="password-new">รหัสผ่านใหม่</label>
          <input 
            type="password" 
            id="password-new"
            name="password-new" 
            placeholder="ป้อนรหัสผ่านใหม่"
            autofocus
            required
          />
        </div>

        <div class="form-group">
          <label for="password-confirm">ยืนยันรหัสผ่าน</label>
          <input 
            type="password" 
            id="password-confirm"
            name="password-confirm" 
            placeholder="ยืนยันรหัสผ่านใหม่"
            required
          />
        </div>

        <button type="submit" class="btn-login">อัปเดตรหัสผ่าน</button>

      </form>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>