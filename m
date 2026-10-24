Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792809241;
	b=HytlURYbII/AZqdhNAJ9miJ8VeF1dzcLIP0zN3sWfEQXrBS5VTjncm76daRA4eeNhR/8
	 c/MIBfK+rlifKra6wicxJgwkh/kpRlceqM8nCARWyZ99hD5cIcQYvaBxi2eODyRi0jPQ9
	 uVTD1RsAeQXDohaShCOtO9vf1Qe7tRG8MqhqT7p1rbPMWT887vFp8xNtJV1RQf7PI99cv
	 uROtTHEJUQFvG8sHQPPzys6k1KmDN9jy9ZJRfHKDxwfc7Uas0qodor4fqXBwHnGPRFsje
	 5R4Z1MPhirnq1xBogODdD2+pdmVIsp+WHdbh25+0vPIzjdF4nVaebqmpvXLzvHMdMmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
	b=23mkQlR5ciwgG6A3fHO6DAIT3qANAKR2ekoQHxBwsg0dfA+a5u8jjitOdmg+tLONspWm
	 4zVRf3csITMjKr5Mmund57cINmzRLtJTnGJhqHyodIQVeZznBKWe4PO2i+tWP9xmeFr8k
	 cU+ASjWTFFnU4+M40Wzg5V4SMjIfs2yDde/Z7Wru5wqvHSxLJHgieyinWPMsl3Vvl3Vns
	 2mcwJrpvRHbCypmZJxuF9swfXIiAtZMvPSdf0neA2NebF6kcjtCtBIsHmvPWyBbt4sPzZ
	 18nDNnYK0gxkjaFsfIrUuWks4B7QvpMhhCo3cXoiIjkfIq8s3sknzYksCM/2Owl+SAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40868606A31B
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40868606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so1727009a12.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809240; cv=none;
        d=google.com; s=arc-20260327;
        b=RKX+AFRS0O1HI9DUd7NfP0osFD913LoKLZSOFK8m3OWXuAVzP1vetJTbZNHWijd4s2
         cwuM4q9/s1CXVFjnQv0vFHMTp4QbVZVwr9oMfcX5F1G3JWL5eIo+TIrHtbw6XPkSUIg6
         EjJgWORAFbJsb8OjTDZ6D78UX4s8Z6KdAO2rd0n80NBG+BSWP0qlsZbduh+ZSEpI8i0b
         93hA9B3A++64jiUf43kcceHWhYZAjWFER1bKKymrymgC4iUgUGuedLG3GQdfaTdJNXQj
         OE6OQmUvCyYDkVmzBdr6ISkwTmgV9GH2xNDQzkuJskIGYyx42doy2P7Mmjb62iYrdNDN
         90Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        fh=s6IlXp1Ve4Eeo0eTQ9BHatVZ4sjfDkWrESUmsqqsBw4=;
        b=FgXAEOdob9FO7TKl1LPU140YC6ksr4m+ea1M4Qs/7XyJHD8KPdFIBiigsx1WAPbvzH
         M9STesfwcLePD1TQVHbrfJq9FPqy6ElPxdMwL3EQqTx0L52WA3MMdBvhSCCqOEqhXg3/
         Kbuerow60lL16gRGf0njQGdxQOx1ouFgWvKkdWwU9CJt9EpFb/g5ybaFv+edtU9FJYO7
         SCflyAIinY+/LNlccOKrr8X+gBQfKZv3jZMn7jdyBfrzG56JwI0KSCad3p9nlq2cewU5
         G5NyWSeVt44uugDYFADHAepKwNPlUBdmyD1Tw4ymSKyS41o6l4NaHwA+CKdApNgGhokO
         MvDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809240; x=1793414040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=ZNWvplRjO+I1horpBlo8J9/L7pCEpW8hMtQMPU2a+8lZ7X5bNp9yChxqm96Bshw9Dg
         dkhaYKv3i9l7YjPCad/Jw6ERfjTUYxjj2YQqO9wxme4wu6YIRvXoZpdJQwdRuBuXDPp0
         9uEwpFDlzZvSs9XluYQZYAQz4+t+F8VROOpmmmPmYDe5ujIlriUsiCyQ2ihN1yaKKR32
         0knsUYy+dDxJdbiRNHxVg0IC1VCtOKkJWC1YulNBpanU4lgoESJHLOra/rAyZnDzQMJz
         YmCYdyLj6MIIGINi6YYvfiwtqm41sJjRz2BxfiIIsv1hVGFod6tJf6QmppsY8DZpm2C2
         jWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809240; x=1793414040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=bLr1XGTkGQi4/2D6Z87p/DNH9bp2K7BRwdw66tiOv38BO1eMz9/GYXEmc1PBRiJ3oS
         cPRTVGoz01/V4s5yc5RkdQxdDi3S5X7CIzOvkc4j8x5iVvIbL9q7C23B5Rjh6iVTlvcR
         LLCZITZgWntE9pegxXxtkHuMIV9lfHSjJZC0KXMgDTVfIH19VnDCliqQOYjYEeyNxMKG
         tyygbtF4p1JhFMJ12y0mTR5sBTOmcXZwOZwXJ1LMD++ECedOx8bkDQmaZ37tuyA5OIkx
         IoADmCK5PBfUZPRWNRZjaIgNw3gmxqB+JSqRVuzoBCcihZLzqjTXs4p5awcRsgYc58MU
         nglA==
X-Forwarded-Encrypted: i=1; AKwUvByyT+17NmFRrp8bhOyxlY86EvNvfB7dJ5QSjjyMyzFLwpjc7omTnBF1JUj6z5v0vXeSlUx42K39/lkKgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIF0vqIrb2xkk4Rb0EKfp6QxWoZYnez4QWGz7+ehFLDHW+7f97N
	o3dNecSbBnGMA+LKBHL8YwkyCRVDbWTHLGDsFqSXRmXXgqT4QFZ7vdcvKAPmBvAGZJWV/HI33HP
	JizBjXrsYgiiV5jiPasPAmoBbUUREVg==
X-Gm-Gg: AYBFou0uquhFITzAL6xeJ7CKnTqNJ1eT2icr7g7UtZC3lsDEWrLEH7yiVh7fBEqdnZ2
	xinuPqrhkbI0Fm2/PPhCZaf89IlelIaZvG2PAMPewccA0caRzhRwYvwwvpiZwePhNBMYree0Vyt
	N212KgaYeg31SVj0rpn+bCsWJGDzwqpXXUdJ6Xx9YVP5fQl86HyiezSV3kYlpwdkz0ld1vIy09Z
	rb5g4X3Mu6eFvdJxnUTRo3HhMkFiJ4KJGw41pHxEhvC7Gsnlexy4ml5EHe5zf8dtSIJuQeLAaK7
	giU2qAYb5JR0Xx5206KVKE1L0RFmzA7B6o+vBf9egT18FtfnTekVw7NJ3Evl/H7HgM4OBSLNYuF
	4M3Cpdakc6Fq28/DI1xCTHiHuCzws6FKGZ39zhVGklnuZKhalg7QZls178wpybiAPCGMO26sTHK
	UpT/GxCg8pAb+NSnkh8PQEkWl5PKD8cu/eh9YNX4CEMuV1bb8A3g==
X-Received: by 2002:a05:6402:2491:b0:6ac:934e:a9ca with SMTP id
 4fb4d7f45d1cf-6b4429ff463mr1127240a12.0.1792809239498; Fri, 23 Oct 2026
 19:33:59 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925191653.3144006-1-mhun512@gmail.com> <20261001175502.4045853-1-mhun512@gmail.com>
 <IUKxO70u7tuzfobwy7veeNHbvyK5WtlYFOliAToGsdPncgmwXfbd95-SoyBBUj0AUENfcYLnsh4qaFj4AEkeKA==@protonmail.internalid>
 <20261001175502.4045853-3-mhun512@gmail.com> <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
In-Reply-To: <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:33:47 -0400
X-Gm-Features: AclHuK_Cs1i4iiemFtAKcWSfw5YUpemoD4SHO0r3M9ta6g3IG7c7Sepq9ogxnl8
Message-ID: <CAGEsz8GZ9QR=L9skNierVog8_=o-vBObqin=+dJZTDcpOa1TYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Thanks for the review.

In v5, I removed the disable_delayed_work_sync() call from
venus_hfi_destroy() and kept it only at the start of venus_remove().
The work is now disabled exactly once during removal.

Thanks,
Myeonghun

2026=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 4:10, B=
ryan O'Donoghue <bod@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> On 01/10/2026 18:55, Myeonghun Pak wrote:
> > venus_remove() cancels core->work before the IRQ is disabled. An IRQ
> > thread can queue the work again after cancellation. The work can then
> > access HFI state after venus_hfi_destroy() frees it. The work also
> > requeues itself when recovery fails, so cancelling an already running
> > instance alone does not close the race.
> >
> > Disable and drain the work at the start of remove, before other resourc=
es
> > are dismantled. Do the same in venus_hfi_destroy() for paths that bypas=
s
> > remove, including probe unwind. Disabling the work prevents both IRQ
> > handlers and the work itself from requeuing it. Drain the work before
> > disabling the IRQ so an active recovery can finish any IRQ based
> > completion waits. Then synchronize the IRQ before freeing HFI state.
> >
> > Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper=
 functions")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kern=
el.org/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/media/platform/qcom/venus/core.c      | 2 +-
> >   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/p=
latform/qcom/venus/core.c
> > index 7087af32060f..6e495bc04691 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pd=
ev)
> >       struct device *dev =3D core->dev;
> >       int ret;
> >
> > -     cancel_delayed_work_sync(&core->work);
> > +     disable_delayed_work_sync(&core->work);
> >       ret =3D pm_runtime_get_sync(dev);
> >       WARN_ON(ret < 0);
> >
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/me=
dia/platform/qcom/venus/hfi_venus.c
> > index e7e4e78a186a..20b8ba1e62f1 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >   {
> >       struct venus_hfi_device *hdev =3D to_hfi_priv(core);
> >
> > +     disable_delayed_work_sync(&core->work);
> >       disable_irq(core->irq);
> >       core->priv =3D NULL;
> >       venus_interface_queues_release(hdev);
> > --
> > 2.53.0
> >
>
> You shouldn't have to disable the work queue twice.
>
> Does a path actually exist where hfi_destroy() runs but venus_remove()
> does not ?
>
> The commit text is vague about that - sure hfi_destroy() may be callable
> from the error path of probe() but is any work scheduled in that case ?
>
> I mean lets just look at venus_hfi_destroy()
>
>
> static void venus_remove(struct platform_device *pdev)
> {
>          struct venus_core *core =3D platform_get_drvdata(pdev);
>          const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>          struct device *dev =3D core->dev;
>          int ret;
>
>          cancel_delayed_work_sync(&core->work);
>          ret =3D pm_runtime_get_sync(dev);
>          WARN_ON(ret < 0);
>
>          ret =3D hfi_core_deinit(core, true);
>          WARN_ON(ret);
>
>          venus_shutdown(core);
>          of_platform_depopulate(dev);
>
>          venus_firmware_deinit(core);
>
>          venus_remove_dynamic_nodes(core);
>
>          pm_runtime_put_sync(dev);
>          pm_runtime_disable(dev);
>
>          if (pm_ops->core_put)
>                  pm_ops->core_put(core);
>
>          v4l2_device_unregister(&core->v4l2_dev);
>
>          hfi_destroy(core);
>
>          mutex_destroy(&core->pm_lock);
>          mutex_destroy(&core->lock);
>          venus_dbgfs_deinit(core);
> }
>
> Your patch will call disable_delayed_work_sync() twice on this path once
> in venus_remove() per your patch and then again in hfi_destroy()...
>
> NAK - can't be right.
>
> ---
> bod
