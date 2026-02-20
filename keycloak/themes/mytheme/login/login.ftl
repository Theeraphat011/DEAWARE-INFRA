<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>

<#if section = "form">
<div class="deaware-container">

  <div class="left">
    <h1>DEAWARE AI</h1>
    <p class="tagline">
    </p>
  </div>

  <div class="right">

    <div class="login-card">
      <h2>Sign in</h2>

      <form id="kc-form-login" action="${url.loginAction}" method="post">

        <input
          type="text"
          name="username"
          placeholder="Username"
          autofocus
        />

        <input
          type="password"
          name="password"
          placeholder="Password"
        />

        <button type="submit">Login</button>

      </form>
    </div>

  </div>

</div>
</#if>

</@layout.registrationLayout>
