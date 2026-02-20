<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

<#if section = "header">
<#elseif section = "form">

<div class="deaware-container">

  <div class="left">
    <div class="left-content">
      <h1>DEAWARE AI</h1>
      <p class="tagline">Security Update</p>
    </div>
  </div>

  <div class="right">
    <div class="login-card">

      <div class="card-header">
        <h2>Update Your Password</h2>
        <p>Please enter a new password to continue</p>
      </div>

      <#if message?has_content>
        <div class="alert alert-${message.type}">
          <span>${message.summary}</span>
        </div>
      </#if>

      <form action="${url.loginAction}" method="post">

        <div class="form-group">
          <label for="password-new">New Password</label>
          <input 
            type="password" 
            id="password-new"
            name="password-new" 
            placeholder="Enter new password"
            autofocus
            required
          />
        </div>

        <div class="form-group">
          <label for="password-confirm">Confirm Password</label>
          <input 
            type="password" 
            id="password-confirm"
            name="password-confirm" 
            placeholder="Confirm new password"
            required
          />
        </div>

        <button type="submit" class="btn-login">Update Password</button>

      </form>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>