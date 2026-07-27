Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7227400996
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155758; cv=pass; b=ZUHERzEIYRWHoIpdMHrby63ea8E+Zo5YsV/qFpkvEDIMHNXECNhQUbCgkv015hcoczN2iqmdqmIE/rKjk/mDNILCbpej9TT60BJGmsEU4YntDlTd3lKOd2rfsCddG/fAX9S5S1kRpYbzlrIRL/dWQcOg2+QWmM3aDaY4IV2Ohlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155758; c=relaxed/simple;
	bh=d6v/TDDL2m5Vqt9irx24sjsClingIto3xIwkLGU3I+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWYvSm09ih3G9Z5i7bkP07+G1h3LHqmQHPE5LX39ohs4LmNZs31M1RNT2dkK/ku8pZnr3ReH4TNIC7/02L81XvV/ifNdbSRwIy4zxcQox3E3HBob8KxdditbwhMlhhm8pJKqm3L9a28N57VUZ6OFX5wbWOnx9wfxj4Obau1jPGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0XHkp04; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0XHkp04"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1231026a34.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 05:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785155756; cv=none;
        d=google.com; s=arc-20260327;
        b=nxMA4PCOG045tGSis3GnZIziRZdSCxaiMkJzbiGTlfk+kJYzpxDqeC2ILYyAyT4RAU
         +WQITV0IPQwr01xaVhad2XaA2gb7RlvN5t/CqSMb3urVJEh3sABtSS4cOsD6GXHfNdqq
         YNdBQNCyALfZOKHIr2wIYHnDe/5Nwsd7/WS6NPbXd64zkXLtl3j8sBwROszAtpM2gPnS
         RbRCUdElv28iyOFK2yFmvK9V2cgPnsjtuxBqL7G1xToPNOEfG0DetkYup9GHAXso5+He
         /VUU/icLC/ZTm2phCWesLYvdsS6acLdPb3cH1IeVRxuStqny+L8K4Uu2ad0T6GtvsG3o
         czOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWN874R/7h8VNr/p0u9QDvyuwPj1gnF0IHUxQQeBPPI=;
        fh=tnnTZkZ2eDf/FJPxMbXD7iUIB5M0rvzG+AiagqGDBRY=;
        b=f2Kc6K2uYmnUFh0fy5HMK0IvhEm2pRa8KFsOBxQE7KBqJuUSSNA/pnePULImfJGkgJ
         QgsP6Q0BFABc9DeGAcSeyjSGsnwejYp1EEaLFcThx99oNUfEr1g9ZdxIrtX2hWbmFIwL
         zVdRzMrabxov6C1QEHB56JXKUcZLMhai/VEdJxwu1KysFWi5h0LO434BHTdMR9Z9UPK4
         VA3BCbZ7UD/LH3DWezp9mW6FLtKjNLYjZK7HWzqQ2qtz8zSO75V8Z4dvPS46zKv+zl27
         knG83C0XpdZkEx1axwSRAGMqRedU2Vyd1D/wkFvEIeYM41SCK3/sURX4Samgd2Be+ZyY
         uVvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155756; x=1785760556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWN874R/7h8VNr/p0u9QDvyuwPj1gnF0IHUxQQeBPPI=;
        b=Y0XHkp04THp3Tc+4W5D5UUDDDwDCaSwc289GFSSTUJaJt7mistY6F07P2dRqKxKpoP
         BAsysp/FUGmXSS27i67g5xY/AXA4qeLVDjcOI/w9K2Tw0gPe/gQRiL20yu0/TPkPan14
         N4P48F9gG5ZAQeldNbeGOwI9DsDkDCgUdtz49xMx4QaMl26h1HZI+iw0TqQCIT30Jj4+
         UWlkaeBoIHb00iRvMIa3v2YOECvV8oEy2YWquFD3hfjGJH7qTQyhnfuWoigWK7YYEO6V
         k68m1iF5cDfPIWKWDy9IGlA2Wp7606OvW0jT5oAMBNiYmpr2pLjO3mNyfdQo99bV0r5D
         elgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155756; x=1785760556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWN874R/7h8VNr/p0u9QDvyuwPj1gnF0IHUxQQeBPPI=;
        b=tEFXJpv8V6Cwu5NC69egu3HIGgt0E7hGL5qHggVT2YOFAFuc13slqS+cl1SbwrCgfY
         hgc7UTUaPpSVbl1+y5UTujYaVkCknGmI+k4T5Rf/Zqb8EFI2jQwMGCPo1FbCjL5gr2wM
         YbJ2GnfJ3+olyW/39hM1hy+ZPSCJMUpvmr4yXlAbYKFtr8cxvQk+BRN/A5bI6Fxgljwi
         HZC/oKn7wDp0hDFZGi422IxS4javBfJ15kbh/lE9IN3g9Vfo6RiQZRFqxky34ZoUnNjr
         q6uSdo9PYtvAVEH3gG4KLHJFG0Vc1EEL3z6++xWI+sQmS9Okij5AYpsjeqM4Uk4HusAs
         817w==
X-Forwarded-Encrypted: i=1; AHgh+RoD3AYWvjyloiD45Q8ST1TEsUyc2i8NHEjv+k77uGr0ak8vF8Z7dVW2nLPvqps0SNKwxULy7JQeVNq6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWxHBGtKQDfuB27f9ryj+dw0sXvJchm8N6jEs2VskXTnk6snN
	tN4TKYP+lVASDvKgewgKt4Ayhca9RkCA0L6jTUj5vhDqw8h9KhffVPKzxgmMPZiwwW3FAqyle6z
	crIEwxZeOxX24VU+pE27/gWQSqbI1+40=
X-Gm-Gg: AR+sD13klq/ENtT3kF9hp/VMiZL2CJVrJsrVefo8VnZyAJFHOcNxr76PqoOO+zC/WWr
	TDxJwIJ8XOeqjD1Aqc1mybJdiqnjTJxypVKHKYF77JYpHZduM34Z3Nhb8S/txfFQ7uX4g+rtO9q
	qvHDNtSbwgRBhPMgS4gs+qVC27oPe36fbIwCs1yP61UaEzgyG79GHJqoBBUXezjSkzDL5YFpe9Q
	Gl1UDufKVVkX0Lt/NKMUjUQCqN20GvErO+GBB0OCgd/bADbd5Q6h9/AgB1Hz87TbpcXvMUUrZ6j
	IoIev1Azi5lai9r2hp/50ySJcfWwM+siu5DYfCGa8+28b0g=
X-Received: by 2002:a05:6808:2445:b0:495:d0dd:c6eb with SMTP id
 5614622812f47-4ab6a0999d5mr7208019b6e.11.1785155755625; Mon, 27 Jul 2026
 05:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724041417.9921-1-devnexen@gmail.com> <CAEth8oF9zebrEnuTWcVdaSCtYEAtkg7rTgrxJc66GQhcpiDfKg@mail.gmail.com>
In-Reply-To: <CAEth8oF9zebrEnuTWcVdaSCtYEAtkg7rTgrxJc66GQhcpiDfKg@mail.gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 27 Jul 2026 13:35:44 +0100
X-Gm-Features: AUfX_mwKq-I4PUXUT8UWd1ONL3ciaRILdoYDh5TeusMffsBEi6_gcOSren2DhQw
Message-ID: <CA+XhMqyadGhAHW_R3rbZ0WSHy4GkbnzEbwcX9aJgbhwSyd9VRg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()
To: Kate Hsuan <hpa@redhat.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	tarang.raval@siliconsignals.io, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 27 Jul 2026 at 08:01, Kate Hsuan <hpa@redhat.com> wrote:
>
> Hi David,
>
> Thank you for the fix.
>
> On Fri, Jul 24, 2026 at 12:14=E2=80=AFPM David Carlier <devnexen@gmail.co=
m> wrote:
> >
> > The exposure control write passes the address of the local ret variable
> > to cci_write() as its error pointer while ret is still uninitialized.
> > cci_write() returns early without touching the hardware when the error
> > value it is handed is already non-zero, so a non-zero garbage value on
> > the stack silently skips programming the exposure register and makes th=
e
> > control write return a bogus, possibly positive, status.
> >
> > This path runs on every stream start and on every exposure update from
> > userspace. Initialize ret to zero so the exposure register is always
> > written and a correct status is returned.
> >
> > Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor =
driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> >  drivers/media/i2c/imx471.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > index 6d358b11e96d..5aca5f2355d6 100644
> > --- a/drivers/media/i2c/imx471.c
> > +++ b/drivers/media/i2c/imx471.c
> > @@ -306,7 +306,7 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
> >                         v4l2_subdev_get_locked_active_state(&sensor->sd=
);
> >         const struct v4l2_mbus_framefmt *format =3D
> >                         v4l2_subdev_state_get_format(state, 0);
> > -       int ret;
> > +       int ret =3D 0;
>
> Setting ret to 0 can resolve the issue, but the root cause is at lines
> 337 and 342. Since we don't need the previous error state when calling
> cci_write() in imx471_set_ctrl(), the fourth parameter of cci_write()
> should be NULL.
> So the fix for the V4L2_CID_EXPOSURE and V4L2_CID_VBLANK is
>
> case V4L2_CID_EXPOSURE:
>     ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE, ctrl->val, NUL=
L);
>     break;
> case V4L2_CID_VBLANK:
>     /* Update FLL that meets expected vertical blanking */
>     ret =3D cci_write(sensor->regmap, IMX471_REG_FLL, format->height +
> ctrl->val, NULL);
>     break;
>
> This ensures the cci_write() writes the data to the register without
> being influenced by an uninitialized ret value and the ret can be set
> properly.
>
> >
> >         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >                 s64 exposure_max =3D format->height + ctrl->val -
> > --
> > 2.53.0
> >
>
>
> --
> BR,
> Kate
>

Good suggestion, will send v2 tomorrow.

Cheers.
