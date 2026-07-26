Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDF246770
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785104155; cv=none; b=gzn7Lx1i0thstAiKT+DUvorUFq8UVObQWbSTKipRkhBxheDNpWeFsMV8Cq1iehNfzLfQqSjBPyubftAeTGV4q+qNs9YAY7JA7FVKJPi0V8iftvpEVclOyofOAzQZLlUBVr3tGmmWlxG9kHE65DSxL5kLc1qkB2hHkVPAQg9WVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785104155; c=relaxed/simple;
	bh=R8j6eBV+UdD1g7eXVCfMDbakYZoNCDVSJKVtPfAu39c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXqe0AftQoH3pAmuwLlyQOWzvhuOxStkvRWXqgfDL4pi93WirDB1AC0r4OZJq8om8gxmZMuBJQmScbP5NlRgh+69npM0/jPs/3r0RBWuzWvyIl+R1pIyNu7oXmgfaYGWLbOK49IVCQ5QRtAkrsZ4sNf64d/Ah6RI9P460sbO2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YPaLTA/a; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YPaLTA/a"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1600d040e4so292168966b.1
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 15:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785104152; x=1785708952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Havq3+W8NHvvrT9IGeQuks/YcxvMGuQejowI96vAV+8=;
        b=YPaLTA/aSWzm7QzV9edA/KlqcxYFxiWCnrbyMnr9LFLtdkukHxQXtahdDHu6hUE4Is
         6e32d6jg03ibcdPxuJBPqKTPTVHxHqyQ1p6T5rqop0jhzJqUZLpDhCARrqSUaW9+T5t6
         NUa6h71EFpBM2ztWd/yWcsov9QlHFGW8HUB6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104152; x=1785708952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Havq3+W8NHvvrT9IGeQuks/YcxvMGuQejowI96vAV+8=;
        b=R0PqGAHQLgc7LhEwfzXN/j5uqTRKr+a36QOSCUS1rUKNMjxg3sG/rieilns5SthBZJ
         9KVmvmzkPHW7PCHqIeGpK+/wF1qejmxQK43HjwlJsFwJwG8vfcS0tvcUffC/N9csnWJM
         HQKHxRrqHymvecyyANDyw8poyOBuHXUIx9/Fpn+NlyHolHfYIWRybsLa9Sq7+Q9x0IsX
         MsXkEIRY8izOZut+akCcup5qbNa4+kH9+xKIsvRMC72FlrwSBg/2ZjQQJamp4PwF4R47
         oWrHefi7SCnXffRc+/3cWd0VtZOjnPqXn9w2zD8nfQ8jIxbgwNdtqj9akGmUYq0WvCxE
         Uz9g==
X-Forwarded-Encrypted: i=1; AHgh+RqulxtU+IH2+yHKYOwb7Kdj4iVP1wCXfXPBjWcXb5R7igFkvWogHNiTyg7Cuy9VeCFI0f+rp2XNUDVxbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSa1vsCvuRZZ/nsoW5He11pGfsXUCPYJR81JvRh6ui6kZsZHhP
	oa84KKNVuMytsCfvkkQ8cJNpS5HVNMabbpT4eviY0TbpTlBC86/ItP11pCSpj2EHsPB+Ckgfvqu
	eiWo=
X-Gm-Gg: AR+sD11Nx5nW/P2AbfuDL8dK8RSyNJLAVNYif2uDqJcl/mgkeBMrshis6dNhmF1hWAP
	ZTr8QS2VP9N8jxyW1Jn8/fZOCxfWwAlkbZ2E1fK3ip00AyMsJB1z2b3cLpYCZ68rIAFeDdnLHj2
	V0W6dP/4A6yEjIc8OsMumIdj5bsKiLwGgu4nB3Hyz6Ra30yb3kv85sl05HtUZLcVF0BuWgt5CAA
	j78yn0Y8SuT4zLv9XM5KdFHzNaLSHkIh7798aqLXixgFO9xxhXRuaJBOfNpl8NSVxfeeJp6dunE
	Z/61Pr7zggOXPD8eBHAE86MiGsekFOKH0QdaOOaIi4lDanonNmhlaQsOiD9NWNUw4e1p3Ot+6Fn
	As+959XFCqz/Jt6pUyCxMr1WhWJD8fSBrsfvT9q8hHfQM+bsbWeuGegT4k+3gLhsHIc1AdmhHAv
	PHicDpGI0Tr1YFJ5Mydh8PruNU4OlqqBw91aY9xGo=
X-Received: by 2002:a17:907:72c5:b0:c16:6be0:77d4 with SMTP id a640c23a62f3a-c1f1fcaf96amr306106666b.14.1785104152251;
        Sun, 26 Jul 2026 15:15:52 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fecsm561402966b.8.2026.07.26.15.15.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:15:50 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso4447713a12.0
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 15:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqY0KDMCQiU2K+Z1ZD4901MFM/FiSa86MoXJwLnNtuoOVvpP/7OvpIuXYTSJ7/2le2dJvsNiUtGRFbkhw==@vger.kernel.org
X-Received: by 2002:a17:907:6d02:b0:c12:6280:33c9 with SMTP id
 a640c23a62f3a-c1f1fe12aadmr259561466b.28.1785104147414; Sun, 26 Jul 2026
 15:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org> <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
In-Reply-To: <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 Jul 2026 00:15:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
X-Gm-Features: AUfX_myD67rv6_r1pKzI_bPb2NSRPK4fvnxMW17kw_fG6idlmXoKI8O_nXVfpxA
Message-ID: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
To: Faizel K B <faizel.kb@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Sultan Alsawaf <sultan@kerneltoast.com>, 
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Abylay Ospan <aospan@amazon.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Faizel

I was not on cc on
https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
so I was unaware of that proposal

I agree, something like this looks cleaner and removes the sanity check.

My patch has already landed in media-committers/next so you need to
send a patch on top of it.

Regards!




 diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c
b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 83dcc9d61ee0..7cb544fdfddb 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -97,18 +97,14 @@ static void vimc_sensor_update_frame_timing(struct
v4l2_subdev *sd,
 {
        struct vimc_sensor_device *vsensor =
                container_of(sd, struct vimc_sensor_device, sd);
-       u64 pixel_rate = vsensor->pixel_rate->val;
+       u32 pixel_rate = vsensor->pixel_rate->val;
        u32 hts = width + vsensor->hblank->val;
        u32 vts = height + vsensor->vblank->val;
        u64 total_pixels = (u64)hts * vts;
        u64 frame_interval_ns;

-       /* Sanity check, pixel rate is fixed and fits in 32 bits. */
-       if (WARN_ON(pixel_rate >= 0x100000000))
-               return;
-
        frame_interval_ns = total_pixels * NSEC_PER_SEC;
-       do_div(frame_interval_ns, (u32)pixel_rate);
+       do_div(frame_interval_ns, pixel_rate);
        vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
        if (vsensor->hw.fps_jiffies == 0)
                vsensor->hw.fps_jiffies = 1;

On Sat, 25 Jul 2026 at 06:23, Faizel K B <faizel.kb@gmail.com> wrote:
>
> On Mon, Jun 29, 2026 at 11:30:45AM +0000, Ricardo Ribalda wrote:
> >pixel_rate is set to VIMC_PIXEL_RATE_FIXED, which the code expects to
> >fit in 32 bits. Make that constraint into a WARN_ON, so if we ever break
> >that constraint a kernel warning will be triggered.
> >
> >It also fixes the following cocci warning:
> >./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >
> >Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >---
> > drivers/media/test-drivers/vimc/vimc-sensor.c | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >index d125a79fec8c..83dcc9d61ee0 100644
> >--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> >+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >@@ -103,8 +103,12 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
> >       u64 total_pixels = (u64)hts * vts;
> >       u64 frame_interval_ns;
> >
> >+      /* Sanity check, pixel rate is fixed and fits in 32 bits. */
> >+      if (WARN_ON(pixel_rate >= 0x100000000))
> >+              return;
> >+
> >       frame_interval_ns = total_pixels * NSEC_PER_SEC;
> >-      do_div(frame_interval_ns, pixel_rate);
> >+      do_div(frame_interval_ns, (u32)pixel_rate);
>
> There was an error in the data type of pixel_rate. Actually it is u32 instead
> of u64. There are two changes suggested by Geert in reply to the original
> report. v4l2_ctrl.val is s32, not u64 and using mul_u32_u32() for total_pixels
> calculation. We can avoid the sanity check also. Would you be able to consider
> these two changes which avoid the warning?
>
> -       u64 pixel_rate = vsensor->pixel_rate->val;
> +       u32 pixel_rate = vsensor->pixel_rate->val;
>          u32 hts = width + vsensor->hblank->val;
>          u32 vts = height + vsensor->vblank->val;
> -       u64 total_pixels = (u64)hts * vts;
> +       u64 total_pixels = mul_u32_u32(hts, vts);
>          u64 frame_interval_ns;
>
> Link for the suggested changes
> https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
>
>
>


-- 
Ricardo Ribalda
