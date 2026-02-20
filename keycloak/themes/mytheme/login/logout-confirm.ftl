<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

<#if section = "header">
<#elseif section = "form">

<div class="deaware-container">

  <div class="left">
    <div class="left-content">
      <h1>DEAWARE AI</h1>
      <p class="tagline">See you soon!</p>
    </div>
  </div>

  <div class="right">
    <div class="login-card">

      <div class="card-header">
        <h2>Confirm Logout</h2>
      </div>

      <p class="logout-message">Are you sure you want to log out?</p>

      <form action="${url.logoutConfirmAction}" method="post" class="logout-form">
        <button type="submit" class="btn-logout">Yes, Logout</button>
        <a href="${url.loginUrl}" class="btn-cancel">Cancel</a>
      </form>

    </div>
  </div>

</div>

</#if>

</@layout.registrationLayout>
