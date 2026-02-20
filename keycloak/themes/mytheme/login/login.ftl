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
        <h2>Sign in to your account</h2>
      </div>

      <#if message?has_content>
        <div class="alert alert-${message.type}">
          <span>${message.summary}</span>
        </div>
      </#if>

      <form id="kc-form-login" action="${url.loginAction}" method="post">

        <div class="form-group">
          <label for="username">Username or Email</label>
          <input 
            type="text" 
            id="username"
            name="username" 
            placeholder="Enter your username" 
            autofocus
            required
            value="${login.username!''}"
          />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input 
            type="password" 
            id="password"
            name="password" 
            placeholder="Enter your password"
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
            <label for="rememberMe">Remember me</label>
          </div>
        </#if>

        <button type="submit" class="btn-login">Sign in</button>

      </form>

      <#if realm.password && realm.registrationAllowed>
        <div class="form-footer">
          <p>Don't have an account? <a href="${url.registrationUrl}">Register here</a></p>
          <#if realm.resetPasswordAllowed>
            <p><a href="${url.loginResetCredentialsUrl}">Forgot your password?</a></p>
          </#if>
        </div>
      </#if>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>