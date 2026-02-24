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
        <h2>เข้าสู่ระบบ</h2>
      </div>

      <#if message?has_content>
        <div class="alert alert-${message.type}">
          <span>${message.summary}</span>
        </div>
      </#if>

      <form id="kc-form-login" action="${url.loginAction}" method="post">

        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />

        <div class="form-group">
          <label for="username">ชื่อผู้ใช้หรืออีเมล</label>
          <input 
            type="text" 
            id="username"
            name="username" 
            placeholder="ป้อนชื่อผู้ใช้ของคุณ" 
            autofocus
            required
            value="${login.username!''}"
          />
        </div>

        <div class="form-group">
          <label for="password">รหัสผ่าน</label>
          <input 
            type="password" 
            id="password"
            name="password" 
            placeholder="ป้อนรหัสผ่านของคุณ"
            required
          />
        </div>

        <#if realm.rememberMe>
          <div class="form-check">
            <input 
              type="checkbox" 
              id="rememberMe" 
              name="rememberMe"
              <#if login.rememberMe??>checked</#if>
            >
            <label for="rememberMe">จดจำฉัน</label>
          </div>
        </#if>

        <button type="submit" class="btn-login">เข้าสู่ระบบ</button>

        <input type="hidden" name="client_id" value="${client.clientId}">

      </form>

      <#if realm.password && realm.registrationAllowed>
        <div class="form-footer">
          <p>ยังไม่มีบัญชี? <a href="${url.registrationUrl}">ลงทะเบียนที่นี่</a></p>
          <#if realm.resetPasswordAllowed>
            <p><a href="${url.loginResetCredentialsUrl}">ลืมรหัสผ่านของคุณหรือ</a></p>
          </#if>
        </div>
      </#if>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>