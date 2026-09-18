Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FD49739D
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736388; cv=none; b=UOu0FPXGYxGqTrxcwJxOV+mofSqnssQes9xe6UcGGrNGIFLP6SAYq3XcX0OwhiHtpxlBrA/DE1OB/aEOXLff5WtNgJLf+Jaone53vkLa9B8vKM7sataUbIfMjsUFKi5S1mYdj9VXbnyOLHeU70EL5oAq0IKnVh9NDSpO1jHkg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736388; c=relaxed/simple;
	bh=s8+to8b6/VG7HeoYZ/5GPm0QwBM8JYFg2rpjNk6m82E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTqkuXZm0t31eErlOyTpsbnx79E4P2dpI5ierfQRJqn9e5/wG82cF4RZJkZPLUQ3KbMxFrZRnortqAAnKuMQQXBmb1ekyYKMCOyyD1sqU9tlMjfUtZe9zFjz3LrUHQ+azTOPlTGUQiz1sqLk2cu+HP+ErDnzbv7G+5sYMZZ1riw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TsLYfHnj; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TsLYfHnj"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so4271935ad.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789736386; x=1790341186; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=TsLYfHnj5zvWerid6UaatO/MVaB99tzwOoM14tmWmxFpUtTOkK5adhX+fFiHrCtAiV
         pb48UqqjLw6HhJnmQifkNrc0tasRFrltV/wkL721iNdNC7WukUO1aV+UqGpGPkcIptf1
         bZey7nfMhvpOZKIPeEbsGfsOGtYlmUStPgbE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736386; x=1790341186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxzpoScGk5dDKPya4LxeNVRbV4selBUM8DEhCYq8QJg=;
        b=Da8g7ZDWsoq4PPXp0zBBmZOqJiotVeNTDzHFodjlWk8T17XsRzhh8gDkdW0cun7A+i
         wmg6N81TQerVz+PQGdMFe1ESL19ujJIb0xSrh7XYJneN4Lreuskbi/H/I5lf7LPWkNrK
         8Dloyi1lFg+H62uYHKun9P1g9RKonW8WXYslsE7LH9sCgC+NJendHzWtWDTYjTVIqHeF
         DVCcQetbSInFP7Vd9tQ/erFQgnxlGQRAecnp+6aKbj8y2wXzV+nOrNTk5lxUv5/SIQ9n
         KVDWevJy3LDRvJwPwTmqrWKqar9wdroCCOnHaOXqMjiAXdjtLJmdnUIKEqjGtFODUIRU
         D9Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwVTIHjmGMyVwf/q4gCuyJBRdXq8yfRAD9KZRsMLS0Q5neJ2SetNRII+K5GCifHh045n4+sart5qvACEA==@vger.kernel.org
X-Gm-Message-State: AFuF++mRmTnLs4fbkQFfRQlRKjrNLscrI6N3MF4ydfEzHZxHNytCC+hR
	8kc0jbsdJYclwlY/9Q18UZjd0HrPVJka/1kqLXGoYL8IJ+B/2K8aTkLrc2TI3p7Kd/lVbcOXHD2
	C75+2Sg==
X-Gm-Gg: AYBFou1oC7SzPdgI7pB2NtPfFLecfas8sbfSa+dbzktCi751Sxd9xV4JgRA40O1QXOq
	Z933LgFtf3GVGFasAYoyK/C0+9VQ0EJqwrZKObeN3ozbT4cBCWfO8fxzxNFo9EhS6DeNkFLamG4
	19XJw7ilibgFWJyQhvGLTgCxrp3gW6FkxL43XUFlyH3aaldnpSS7htaXdt68GBFJZ2as8+wvW5g
	1Cdj31gSHX8ZTfF+igEMOo1GUfBqLPuhwIFoDt5nfD7eTr3lS52LeWQaWmIZ4JQm37wCqd7vGpI
	e7KowowT8ANo5gBiHbzQFHLh6vMZOgF/S61mOQ9BLEf51jyWmvnODCESHWYycodX9Z/JUpmtBzC
	tKwv5cQ+Y64cbJ+mez4vNZ7gH1QTHL8a+uabyUI/MyVi7/hlVHfaVwZ4Q/Ng7jzbi0ypKJzrn86
	ZKF53sK4J7NGoMfigRzprDMNN8bcLsnKufAA7cGgKsXK5KqH8UYxzu+djbgv1UeDS97EEA0H3y2
	JnR5AVBkDwvUs3WYMym3LbbuaxXEMBT2rhhWA==
X-Received: by 2002:a17:903:1a85:b0:2dd:ad73:c987 with SMTP id d9443c01a7336-2ddb1bbc1bamr47618615ad.31.1789736385940;
        Fri, 18 Sep 2026 05:59:45 -0700 (PDT)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com. [74.125.228.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm7360875ad.19.2026.09.18.05.59.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 05:59:45 -0700 (PDT)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so370191a12.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 05:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMFGUeIYAVJhpqrPj9wVBOor953drCS8DlDaKcjka9s/fjWnaS0Wyy0r/PkRU/YndBwQsEDl6AqivIzg==@vger.kernel.org
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id
 adf61e73a8af0-3dd8c41a46cmr4668333637.23.1789736383919; Fri, 18 Sep 2026
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain>
In-Reply-To: <aq0siVcghDe6x9cs@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 14:59:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
X-Gm-Features: AcwNN1VZ_6ZbCrR1Mp4y7JmQBXOuD4YG-BKylmDeJzSZ3dkgiXG_e6jgcK3ZpuQ
Message-ID: <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

I believe that for all the uses of uvc_mapping_get_menu_value we are
already doing bound checks:

index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()

In any case, I think this patch is still worthwhile. It will help us
avoiding bugs in the future (have you found this with a new test for
smatch?)
and if we go that way it is probably a good idea to also "fix"
uvc_mapping_get_menu_name()


On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
>
> The "idx" value is a user controlled u32 so we have to bounds check it
> before calling test_bit() to avoid reading beyond the end of the bitmap.
Maybe change the commit message as well to avoid stable cherry picking
it blindly (sorry seems like I am more picky than usual  :) )

>
> Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
I believe this should be:
Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
or no Fixes at all.



> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3ca108b83f1d..f157ed99be4e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
>  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
>                                       u32 idx)
>  {
> -       if (!test_bit(idx, &mapping->menu_mask))
> +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
>                 return -EINVAL;

What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?

>
>         if (mapping->menu_mapping)
> --
> 2.53.0
>

with those changes:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
-- 
Ricardo Ribalda
