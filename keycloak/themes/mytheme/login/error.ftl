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
        <h2>Error</h2>
      </div>

      <#if message?has_content>
        <div class="alert alert-error">
          <span>${message.summary}</span>
          <#if message.detail?has_content>
            <p style="margin-top: 8px; font-size: 12px;">${message.detail}</p>
          </#if>
        </div>
      </#if>

      <div class="error-content">
        <p class="error-message">We encountered an unexpected error. Please try again or contact support if the problem persists.</p>
        
        <a href="${url.loginUrl}" class="btn-login" style="text-decoration: none; display: inline-block; text-align: center;">
          Return to Login
        </a>
      </div>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>
