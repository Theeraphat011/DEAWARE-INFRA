<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

<#if section = "header">
<#elseif section = "form">

<div class="deaware-container">

  <div class="left">
    <div class="left-content">
      <h1>DEAWARE AI</h1>
      <p class="tagline">Information</p>
    </div>
  </div>

  <div class="right">
    <div class="login-card">

      <div class="card-header">
        <h2>Login Page</h2>
      </div>

      <#if message?has_content>
        <div class="alert alert-info">
          <span>${message.summary}</span>
        </div>
      </#if>

      <#if requiredActions?has_content>
        <div class="required-actions">
          <p style="margin-bottom: 16px; color: #666;">Please complete the following:</p>
          <ul style="margin-left: 20px; color: #333;">
            <#list requiredActions as ra>
              <li style="margin-bottom: 8px;">${ra}</li>
            </#list>
          </ul>
        </div>
      </#if>

      <div class="info-footer" style="margin-top: 24px;">
        <a href="${url.loginUrl}" class="btn-login" style="text-decoration: none; display: inline-block; text-align: center;">
          Continue to Login
        </a>
      </div>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>
