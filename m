Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6434FD28F
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739190; cv=none; b=QGI8ni1fxnz2IxMrDxKcjz0xO9fWy5vEOsF9Dkv7olRCDnpQ6XEGs4L0uFwORWKVVFihgw3EthCgLptomA4xvthXRZiKvCIpeEcpfz4pWXAps6cuo7CSOkIXY3gUDfOrbg+c6UIS3WJm2vG36ZREtwABi9HfnR7rW6QLiwyyDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739190; c=relaxed/simple;
	bh=2qSOzg4sizQOzLLpcD7UP/ZCzP16AZ3iwLyfpqnq6bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbsxQEnuL+LdC/NXGb/COn9JpukohOUm1GdV35bzUCA83WghC/YiKHRo/Cc4wFa8FRVcWHoycFWzDsDK+/hokAn0rLVuJ/qzAry4uJwsXAba83L7oOGq3eswP2PH5OHkjlU8nk0bpjeVCOGZ6/KwAiUrvNKA0KgtOVjXWPLGoow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8OG1fpB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8OG1fpB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d9004a1ac0so4691735ad.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789739188; x=1790343988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=U8OG1fpBqKzHgxLtAhjjjrutpFfbebKp5c8SDOLwsGXCjqOShWFOviqsbbkxjpTOkZ
         d98v4i8IE4eZ7l1Bo1IXYfGfLyA6Kk65sx68DxRz+keq5H65QOj9HwUxY9UD03D3Im3Q
         fMXbhXFgsASb88ITxc33ozQ4KF1Csl3aTXV+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739188; x=1790343988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEr+Jllj6UvgKGonQFQTN481MqBknHTPJ/e8FyyBLLY=;
        b=bwpTkrXCS7N/MCeI2Y/DHF3zuKDpJOH24lufrqnV0bIY46PO8y1gBV3bAr/Z91+Q5K
         vSrEFD72l/J+nc68H5N2nK+vG9PS9c+yYcDTxnKVmfpRreeMuXw+H8IhLcktXUqVu+gS
         8y+lCbb+fun4jKwz27XNjzoTUaov03yQy/IridYRl1JBkYxkmJK5u2tDwwlgePq5aeid
         RMGn0xz5NuCyxo3PcEPEBvhQ7TzzosLIzuf/yyzKEfH8jDf7H6flw/JmSyqjqMtzTI1L
         Zwipt1dpSIo8rfbdiUskGy6Ij/OaZo/aYnka38LZkl+Lm3UhPm8oGvz3NS/iL2DjFmrI
         XxLA==
X-Forwarded-Encrypted: i=1; AKwUvBzkX9yg9Cptw3kZn5orFGAPNlb6xE0xnPPufe8U3r+TTDQVhck6BchJKfDvLaawOdb2cSFx3MGWbO13iA==@vger.kernel.org
X-Gm-Message-State: AFuF++lTdBtgH+iMsGfTO+zJE+lMdgvlyEs521spOdjYR/VRwpiQPbF9
	HvIrwBUCifZMD/45fooDhZN4nBhJ0BFysKwSDTuXXZXg1H6ZX5e54YYAVnCp2saZpCuw3ly1/4j
	6294bgA==
X-Gm-Gg: AYBFou1JUx390DQZDeuU6LcW+fXh132pqbGwy79u5sv2WN+nG35X9VvMH7X1uZWxcFv
	hWikfb6ycIsm0q1eIvTKY1LzavDaawhs9cBmSM1WYKlmmBtctvH86QrQa5h7KvCwJ88JfDz3dAl
	24xoQKcpJ98FTaKa7geEWIugr/R3sB6cTiJFrNu93iGFvHpnnUGPPRcDhB+FDTSl7gz/1A6B+7I
	sAD+m0a6NAuFfp5kbYaH/eTgbuXZBrGHPufbke4CohVShbWJGMG3X5ilCHrb35N9DPdD/p3jOYT
	x5N8mfkv5ibBFLPIRElv1FJlmj1jVSz+32Hftu+O2AwjQq0xwxjLCsOtKMUu5QvYsi6rZQvPY1N
	Lo7WJ7zD3RqFNZsAIf1JEhoNCr9EjiUr58TN0aiwy4YRauUzjqJyi6qlKznFFwyz8bJd2UDF0N3
	+QDhAJ6luSzrd73A7975jSsiCmy+WKB/k83IquCI5SHPjaJVGJxEBM0wCN6nJejUc9/mGbGgQzO
	jJIoweUuEKr6yHUpQUwtgxb0HBIjQw5hdHK
X-Received: by 2002:a17:902:ce92:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2ddb1b796demr61718935ad.18.1789739188349;
        Fri, 18 Sep 2026 06:46:28 -0700 (PDT)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com. [74.125.228.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7573f4dsm8275225ad.46.2026.09.18.06.46.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso615397b3a.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBjN5xDN1/E3wK2yx/fUYuhwPz/MfjU2jGPIrQF1+7LXif2qF5bqPnqGqLxvRMDkcQCKMeV8EXPeE3ew==@vger.kernel.org
X-Received: by 2002:a05:6a20:c792:b0:3dd:85aa:d269 with SMTP id
 adf61e73a8af0-3dd8c57c8b3mr6488270637.33.1789739185437; Fri, 18 Sep 2026
 06:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
In-Reply-To: <aq06Kq-3n2R79YZL@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Sep 2026 15:46:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
X-Gm-Features: AcwNN1W7JB6JPajEBAwfNwsaOz6EGNg1kBmmMiFsHZqDGyowXMecVDSoVfzZz04
Message-ID: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > Hi Dan
> >
> > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > already doing bound checks:
> >
> > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> >
>
> The problematic caller is uvc_set_le_value().
>
>         value = *(s32 *)v4l2_in;
>
> Smatch thinks that is called from uvc_mapping_set_xctrl_compound().

uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
think we are safe.

>
> drivers/media/usb/uvc/uvc_ctrl.c
>   2772          data = memdup_user(xctrl->ptr, size);
>   2773          if (IS_ERR(data))
>   2774                  return PTR_ERR(data);
>   2775
>   2776          return mapping->set(mapping, size, data,
>   2777                              uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> But maybe that mapping->set can't point to uvc_set_le_value.
>
> > In any case, I think this patch is still worthwhile. It will help us
> > avoiding bugs in the future (have you found this with a new test for
> > smatch?)
> > and if we go that way it is probably a good idea to also "fix"
> > uvc_mapping_get_menu_name()
> >
> >
> > On Fri, 18 Sept 2026 at 14:20, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > Maybe change the commit message as well to avoid stable cherry picking
> > it blindly (sorry seems like I am more picky than usual  :) )
> >
>
> I mean if uvc_set_le_value() turns out not to be a bug then, of course.
>
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > I believe this should be:
> > Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> > or no Fixes at all.
> >
> >
> >
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 3ca108b83f1d..f157ed99be4e 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> > >  static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
> > >                                       u32 idx)
> > >  {
> > > -       if (!test_bit(idx, &mapping->menu_mask))
> > > +       if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
> > >                 return -EINVAL;
> >
> > What about using BITS_PER_TYPE(mapping->menu_mask) to be consistent?
> >
>
> Sure.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
