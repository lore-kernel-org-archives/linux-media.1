Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2B45FFA3
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142447; cv=none; b=uPfKCN+vcqjMZbVm0Oz8ciSAqfpy0k+UKlSr0H93clgbGh0zgz6MDLtLsgGqRsrlZGJqoaFFyCGOe2er9hALUQdb0x+6TC1NLrbeZDGiIxe80q9vL+aQAg5qXBlaiIa+UlXDZp/KL1bppgln5S5O0XuTQc7n04x9Dcn58DnZDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142447; c=relaxed/simple;
	bh=J2Vo1AKcHKkb4R6FLHf/+bygkCDME8e58AbPfZcmVxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQRqBX1e8n53O2zlExuLpZ8rVqcDmxLpAU6wxE6AfZYFH7FHEvOR99wuMBxqmkLUYVN2ji8bulJBkvNNq6tFfPCP+sQENBdVyCHzmxcGsX0i2M80SbtbzaYYXL1Uw71l0EdmyF478JWwlELhpsUQeXLSZWfXzVJP5u9c8u+q3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MNoOXhyi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MNoOXhyi"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so3499523a12.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792142446; x=1792747246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=MNoOXhyi9slDrIUJCTp532fTwsPcUietzjxggri57ENxzgxV2wjUiK93nUJYNubJnK
         g8lXZtKahlWFAQKDvE52f6lvs8VuKSWK4jnJwmhvhd1y0gCf6yMAQtYKT4U4cbdYdzCb
         V+9CMSCbXwLiKWKesPV+mxkGRUTBf++2R3+wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142446; x=1792747246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZpdtgEyok+9PJ/Ri7Q+NSThTOVxSs62Fi1zlQZD7xQ=;
        b=AHe4G3NLnANtLSGNIpmSdGlk5IeMlRa+4hw5TLiq+dkKQcgm6t9qux7SO/zlELah6z
         2NfFedWbJLN1Hk0mlvCOxxxz4Y3WF0jZz+PaPik8XErNmvGH9ACdtbcjMnTsaiaZNi/m
         ukhYOtcReZGSPdhKGImVS462wIXGouRJsL3hCTLMzDQJzzMdADRQIzJHs2UtY1VXEKul
         HuODO0xMszVRGAitJcXuK1nBaAWhxMe3ylTLkjQOUIiitqu7wuBNN0eiKekTVFiky8oU
         YTj/ry01BvBaiAviNGUvkLGZ+IXIfWh2PUw6RWAYtEi6wsex906YPIWnyHCQKp/aol3k
         n+Sg==
X-Forwarded-Encrypted: i=1; AKwUvBztX3VW/TNo6p0B8gjOvA93DFtfqwKqsfyHeJymKav86rimGYWVgfR9JgqiVGen+qXCuudFWMBSihKrcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNkvMdWqp1gOAB7pfNTn8vr1H5Ti7xSerwT/pgdwYFEWjFnH9V
	W3+0PvIKlKk6yGi1gvKXW6wjhDYYTARQeRredgX/cKZZXu7d6iSLj9L+0mUVoDAeLF+i1QbHn8Y
	FPEl47A==
X-Gm-Gg: AYBFou09x+1Ywort83Yr5+WKaD6OXXUp8ixsmO2hBiW2WzKItj2kyg2+CPgFEBZK+3e
	LA1KzuGkHpAgr4uPzhv2Yokr1CednDZIA42hUDjzrt9qKEzcUXCLDzqjhKwNFA/g7crUJKBM9mq
	hjRB1f3bf5p/t76G/IOvCa9RUy+g/aemyzFhEyJjkjZVxHGXkRuyzA595I5dA0W9mcogvP4u2tr
	BtNeqWsYrYyM2nIuTP7vTjlKGtjN+kIwqTPAfiB1HlDjqPxQ+kItiFW7MyuKqS19CEpWV3uMq8j
	1IFEd9LPZr+w4J8Xk0abQ+rHU3CFoVHE9G7ohHp9Yb/r3rQfXGOfC/hif+Oa7fDGtxx+2I5Abfq
	qu6s6wWFvzhhFiQezt/xOx7aJWoViSbdtFosnmfgfo/M4OopygDhZjd2OpDSiJD6AKvtp8YsBmr
	aaH2Qqk5IGqFkZPX3JeTPhQ4f+66PNLrAlN9dx3HgFBIqwm5JkOVxW4p3ioWcb0u1JGB/y6Qn46
	KMLk7ypw5YER6B4UcgCzeB/1uMQq2Os40BK
X-Received: by 2002:a17:90b:1b0d:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3ac4e182e9dmr10547413a91.7.1792142445952;
        Fri, 16 Oct 2026 02:20:45 -0700 (PDT)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd9c4b4eesm1166110a91.2.2026.10.16.02.20.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:20:43 -0700 (PDT)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-141395927feso11963073c88.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByldmPPEMG0HbYzySRS9WfHGg/KPyY5ZwjxTeZru5pJHjKXI87S2HgltNpAKpQVwq+X+AHOBaBcRoKpKg==@vger.kernel.org
X-Received: by 2002:a05:7023:a47:20b0:169:9f67:a91b with SMTP id
 a92af1059eb24-16a5dbffce8mr26511358c88.12.1792142441528; Fri, 16 Oct 2026
 02:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atHg6s8VaFxNzuR6@stanley.mountain>
In-Reply-To: <atHg6s8VaFxNzuR6@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Oct 2026 17:20:25 +0800
X-Gmail-Original-Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
X-Gm-Features: AclHuK9zy0ivptFpxjfRKqq4APH2lotLQJ8S3ABkRzR92mbjRrsQi_YoPtdcV_I
Message-ID: <CANiDSCvT3KC=LYaQPgvxnFfFfKHwtSZkDoSVPjd-_g5R9iiU1w@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add sanity check to uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

Thanks for v2.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

On Fri, 16 Oct 2026 at 16:31, Dan Carpenter <error27@gmail.com> wrote:
>
> Smatch warned that "idx" could be too large, leading to an out of bounds
> read.  When we reviewed the callers it was a false positive.  However,
> add a sanity check here anyway, just for future proofing and being
> consistent with the rest of the code.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: It's not a real bug but Ricardo asked me to add the sanity check
> anyway.  Use BITS_PER_TYPE() instead of BITS_PER_LONG.
>
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index d2f722bc3459..249c68783474 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,8 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_TYPE(mapping->menu_mask) ||
> +           !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;
>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>


-- 
Ricardo Ribalda
