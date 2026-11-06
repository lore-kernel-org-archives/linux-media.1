Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793938114;
	b=PtJIbdPCQHHV9HTWVrMuxUIHvNVDlzFd3DSDXFvK6P7uCMG17L8UV9sIhO3iwgwuT5SF
	 7o9l67B/rVmZDW/ncbW5K3qh4dmMZTqFpmZ7EeXHT1zu9xjN+wRTslPc/GYnt53GPFEmm
	 2psMg9NI/Z4KvlKCKyrWkw+vAEQVwmClGavcpmWoGGxjnYinMsoJL9aVHqJ3r9vBsQmWd
	 aAb7GsbWZiY6uxTIbH5KrwAkeWo+WfOZqn7YMSKFvlPdT2DwDQQMUbgYR6a42HQL0nXxL
	 iVCPO7pTf4q+Q1KA4awDngo7qlIdT6KOwo4jnriLj5AzumBj8k8ar/HagjYz/dfqiKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
	b=acTIFuYXYpc3JnSJ6wVJGBilnIK0NseNAahDOSQ7uIM6a/EfMiU6SBWTp+JtxTXtsqFN
	 tj7CuouFr6aoLPdc0Uorlib3aBG5spJiluOCJzt6ao7YODmVKAaP+vHNdEAk/wcf+gfS8
	 TEL66G3LMvcSoVvDeKm8vfAYdBJcbEIS8AIPOlL4See7lSnLQvhNp5fm1p4EHgLwkOO90
	 gYoE+/9wVrhQvfUzgxfezlSbPSg9oUGYaSNAIhznF54eV/1eAIEgSPTWjT5WjV2VajtM+
	 Beo8PE0KSfXq9vrlA6YOTfXszkDmmHmGnQsV/80Kt9jwLuwk5QglPolM3bZGD7Pf5Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCL5TeV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19506606A32C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 04:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19506606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCL5TeV
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843b6f8e2c7so313107a34.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 20:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793938113; cv=none;
        d=google.com; s=arc-20260327;
        b=h4erHSghQo3VC306wux8uq0d8nlpquyZlmttFWMjjnxO4vRn33iTS/bT9n23Obmgl4
         hupkjCaA5Z/4YlvoBi8pTdRqPPoJAqhXJPj6nmc/a6Z8DDefxNVdgyVcGFynAghXlnRW
         U8tuI0ZjFYKnnpBr1S5T2suDwgz+Ou9fgxef5BJzIUt7Tn1BuuE90I+hfayXEvYoRolX
         ZymXlEUldDvJ+rUQmHwqObZqngZED4RyvA0tsTOw3MB/yKnaFIcYmKRw9Z8tbVRu0vzK
         81Kee9oE3Ef8x+10GTc3rPs2y6/j0Abtls8ju8mNrtbk7lqHN92idi+i7VPmDV7350Tz
         NoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        fh=VBmx1HEnJ0N86Ep2+e4KXvmwmQRxpr15igT6WiiED+0=;
        b=N+rOAwHVMbwmDo4u6MvwwDl92Xazbt8YXF+3577l6S9u9K6TH2DpsaHDONR2HL80Jd
         tqqAWZb6LM3m4iQFXKTJnDU0PDEYvgEJJCdFmKIpJDaUE14yrF0+gpWPH3K3H5rU/53A
         tinoRve78hdRUlaeT7SAUOf3Wv1rxK6ZcfJrViWq+jpivjW9OUzdxgdzfdMItfR5kNIs
         KKZsxwPYNyWNdVBcFofV/+lKnQr8xlieBkWLoZ/2hSERevR4g5X0D5TNoLMpAgdCJWNt
         U34r9T32BcqA6n+3vZdmb4YgdRsak1Qs4e+tzytmvNLoH09Wk2OaMxixrnTAp9ygk/5r
         hJkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793938113; x=1794542913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        b=AaCL5TeVWhCmOWRruX6RQ6uYlbxEmgGW0Fu1FL4Te6OGDFc2+E0dbhTmVykihBcvXc
         qW10F+az4GWUxFwfiqI+9lc4XYVEIwEDIhY4R4GQl+Wt06dOdwqAqbrKFKjIbCSDCFWz
         pYZpH++iT7LvufaCGF9Z1/BAjBZFjjaztq2+Y1vL3wkwrdDuXfW3sQ57A/rzTShVijSe
         ZAoS0eFzO5FsQdT+jdv+jDpQRsSMcmGkQc4UTpwS5svzqAROo8Kpf1MKedp0lW+tMIuY
         bss/LwjkCpG+lqsPeXxivKA3ZOlWwv4t1kExE7+N5n/+/dIHDNJf7GsRmJOWy7EVuft0
         8hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793938113; x=1794542913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        b=ssTYPkcfVEKDB+VZVM3UwL1lA6IPRq36Ve3Y6xQAP3XFeZJo1Yzoehzlu+fm9SEW4M
         mBMzjcrHKj7OLIB88kpjQG8sxn4doJac4d1P6xPRvw7aueS5GfZh3kXizMdIqpgLIPG8
         eEcAx/n9D4jeTShzY9tyD7LWGZspX2+MLLnqSDFyTBfeKS5vB9/hZ75gjtZ8TTcRRv39
         agP9xw6xGncgJHKmAo4aUGGRelOrRnNAe/szL2qJixZlfKd67MMWaZsUOPClAO9EFwFX
         vMpT+8ijEnH5wMyqXlnaJQ5qu9zq36oYzQJKu/RyeeNgGFlQMsVqbJXovXgGkEK2oluC
         auVw==
X-Forwarded-Encrypted: i=1; AKwUvBxB2cdlcFqMjYEaf0PvGdtCaUmhurojyKh/b6/hyaLjvb+2DrOMxRLSjg1kJtzu4tgu5N1Q/m/m81LRrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9aUEr0nP7n4lOqI9X2mqVIhDrJm+eHtwF0EStW38WhM7q2M/f1
	wkM1gtObEAcHwbMZxA2VY1crDlVTZgv75PNSZUykk04cMiZZ2DYbfxhSEOs0SRHz4tDoKxCAy03
	YfXnaMOyozkA6+StfbnayS/7PJg6AUnc=
X-Gm-Gg: AYBFou0Zan+kuM3mRcRlY7WXO4z//FXZauqSftJWFKSMu9eodB8+aQOAuN3EvjfJotr
	q40cbgQ2jB8WIC3/UGkQLlQmyw6gEdHQVYlds5vG3tTTqgWZlnDq6rvXQtAYZv14PcSxvoAiyUM
	G70vc5IDEMrydyeo4I2ThLQx1K907xmNoHdLrM10r5ZR5kzodc5d9UAfG5XvhDcHgsSSMXyyXpH
	T8Joe5XNc1A9lS+heoTJbRGb2rBtaeSxLojZAhTUB+n1vqoGPHrMMg3YZl/VNrH2YV883vtrXjT
	WP8WMALLbT7laPivpQf8O56ipMwPrI0e8eUnMD1c24UmS96Hc09fIrqSMfHyM6ijrx6ne16RFI0
	kAeBENOZwtPR7fxHIpixgk4ZAf90w0wDYxYBOHRg7GZIOqcxjZQxBgAlH48R0Q5RUbhAWMxMJ
X-Received: by 2002:a05:6808:190a:b0:53a:6769:c35b with SMTP id
 5614622812f47-567e14c6645mr1033843b6e.12.1793938112995; Thu, 05 Nov 2026
 20:08:32 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <ausVkYs1-3rJ5Fj0@devuan> <20261105113229.4126d872@pumpkin>
In-Reply-To: <20261105113229.4126d872@pumpkin>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Thu, 5 Nov 2026 20:08:20 -0800
X-Gm-Features: AclHuK9Esb9F2uyydCP0odZv_dxt9WsR5I2SP--qP46odrTEOGmh5Cneq9YrqqY
Message-ID: <CAPDEY+WvnrFgriCyvL6tjY2GiBJ+Dsz0Tz4hJz=n1xW_fywTEQ@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: David Laight <david.laight.linux@gmail.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, 
	morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 12:25:17 +0100
> Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
>
> > Hi Mariia,
> >
> > > Date: 2026-11-04 01:02:39-0800
> > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > >
> > > In preparation for removing the deprecated strlcat() API[1],
> > > replace the strscpy() and strlcat() calls with a single snprintf()
> > > call to construct the IR device path.
> > >
> > > Both the source and destination buffers have the same capacity,
> >
> > The line above seems irrelevant, and potentially confusing.
> > The size of the input is not important, because since we're appending
> > stuff after it, truncation may actually happen.
>
> And gcc's stupid format overflow check is going to complain.

Thanks for pointing this out! I initially tested with Clang, but
reproduced the warning with GCC. I've switched to seq_buf for v3.

>
> David
>

Best,
Mariia

> >
> > > and the return values are unused. This preserves the resulting
> > > string, including truncation behavior.
> > >
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > Except for the small comment above,
> >
> > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> >
> >
> > Cheers,
> > Alex
> >
> > > ---
> > >  drivers/media/common/siano/smsir.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/commo=
n/siano/smsir.c
> > > index 283770d583d5..636ff228108b 100644
> > > --- a/drivers/media/common/siano/smsir.c
> > > +++ b/drivers/media/common/siano/smsir.c
> > > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> > >     snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> > >              "SMS IR (%s)", sms_get_board(board_id)->name);
> > >
> > > -   strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.ph=
ys));
> > > -   strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > > +   snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > > +            "%s/ir0", coredev->devpath);
> > >
> > >     dev->device_name =3D coredev->ir.name;
> > >     dev->input_phys =3D coredev->ir.phys;
> > > --
> > > 2.43.0
> > >
> > >
> >
>
