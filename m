Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792450907;
	b=vTAa1u4C+ccRbHoPk4KERchdvvNzwlJFQSeejJeUnoMd6gvmvzz4AuuoaFI0iGh7Ic5s
	 WYMRA3UWJp+5oAHvxEYV9pc0+NriDUlfS6qI+IUh7MdFIxrXBY5LGGQyRZp0ZlS2q9IiK
	 t17eELJnRnQptX8RIwXXEEL1iiw+Enjxq0s7Z/NduhLF01A+zOo63Uo+jo9WccZtAgof1
	 ExtFV+KJsUpgKaCtacmt9aNbN3VduwsjUyhwXeHdXfgSoIs2K+IlWdlC/ClKZTGIqHoFn
	 MOwsnLYumiL4IE7kjhOuH0jHmpS/G/YMm2EneA3dOP1gkUngkKOZnSH9txTwINWsxqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
	b=f2X0ZDit7Nokaa1uZY0h09sUl9Toz94QCI13T7bMLviFC0fR6vNdmKHqG3py18n7ZdN5
	 yHjT/duA462bd9PIar5EmJ0ueNW0YAkX51Hf70lRXmoUh2OG0zKH2XCSSurbt0p+TRg6C
	 uxTxgVckszi64akpM6Jya7d1EjPSc1ZRA4KbCNrdbJdN5M4sR/FINQLbhq7Tbyx8LfG4T
	 7HcYLIpHbCSUcD2DXZa7bkI1rbHLKTKChjkox+lHAiC7/iqI3qfGwREI2S5A30gpXR57v
	 ppboBxkQ/DqKWUQvyg8jNoJICXWeB8ddO+nO0VAepa0HTeB3Nn0OO34ICg2ut7i62yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9968606A319
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9968606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSWMQ+mA
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3fd91337baso350236366b.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 16:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450905; cv=none;
        d=google.com; s=arc-20260327;
        b=nYCPgENgNmeALunRrc1ov9FeqsOjKsAXM+QOzMPX+kFJu9ydIID11No2/yl/aZoeyB
         y+oB0+cpB+6i9UnwVRifEU/NhRVJPLj4cfrM921pBPB7+KBLtGVWxrTBq4I3xoP/18ly
         J7qNQsLaYkip5N+QDKFmJ99sQ1Jha/Ec98SZpO2Jvw6EM8vOqZfP4KZhwjgn1k1cGWsX
         7G3ptqjlFWSC+MvjbVjP5u3esucLRfBz7v4dWm5sbP2FdbJd48dr5Kv79AEJrqMB3p1Z
         aS0yxjl//MzYdV15ihzetCx/haviDvuiDGr/iBSZ29t+DXGbkza2+St0mlxL+hweLvzv
         lvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        fh=QFw142yiSPWsf25t4C6xSo0ZPHwg3SpLHWH4Hnt11CE=;
        b=jpkiUqSx5o2nR+rLXQ94R84DLEfI6laHV5Dscw0iOCdayoUiYXOGsuMg2H0rqQW8hJ
         tHqmxV7pef2bb8H1wNSHOdySCR8tqJzOq9hqT71lVpfUkcMAOkTfck26p6OTbHldPMqn
         KqhGj6xZMZktRiLIWkGQLXUMWw2Gzd9Imo7LX5aUsPKB7FqHtrIUdC5VhrZMnlzjiI4o
         trm6asHc+JPHDUHXL/l5wFya5icINYu+tOvM52tDGuYHIX9Bb1od4F8N7FcrJRu97O+3
         cAgB/h66IVBNoVovqRn78M8VXYp9D005VKBYuKwnM0D9jxAYl8CquTvLmW2rp8D+hynj
         TEeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450905; x=1793055705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=lSWMQ+mARUpGBrwe6Y3hefSsBmuR4/334vChRM6PJWGzi6Cnj7mG0Nqh93HjiDkK93
         V829decEkWb3A79Y6/oVT3aWoGQj14dQZIKnJsFMD7AYZM0x0ajcyoycKwDKPULrf5jL
         ztWiRFvDywJh7rhrplIiOLkJucdhPmxK45AbrB6jv04TsiMCutIWTaxyl+Srgn70Wybe
         9SpgW+KJbY32gVdBrahn9ZvRcpef18bnAxpJZgPFqf1pajoNZo35GHDQclqKeXePnMP8
         vG7UK0TZunBJnV/rrD81aK+Lk9bcs+KgG6tZ/qowAQZK8Zv/14lbOC8WNJdptiCOL1Eg
         p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450905; x=1793055705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0vEaLu+DC0I1E6m16+4V7ipgHwAyo1JO101zy/TgUk=;
        b=0eWFrPXkjDNG3UW5vQHVywiLPfd+CS+xoaLy8sOVRlwjNltwt1n22ULqKrZryg/iMp
         FGGpayHFOLvF0C53etDNX/pcCYLMpl21Wxp++ftFl4KvGiSeNioVjlHQM8SC+fW9tIf5
         Cq+Z92VO7IwhHR1/hxtgGT5ZDP3PaJ18T1viDMTvqU74eiYLtiD16ZgESEnEGvMQG/gN
         7Q0iIU84PtoASfMmmuz/ub2mVCElT8/ie5mBiaVL2Tvs9Xsk9hlcA/IoeGX5KP+Jy6wg
         HrK4hSnYqcPGlop24i4dkfarjYZv6qH3zYnV1M1Q+Mm8GlJ5fG/mmE+t8ItpdFN56dKK
         M2JA==
X-Forwarded-Encrypted: i=1; AKwUvBy/SBrxoaldVqPoQ+MUg0jYjHCNLnjSsEk/e1veg3a5b0yNQG89pOxR98L0DYfxPkXg7THkpXgGl3XwLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUzl3OxfluyTtqohF9y4NaIQ+L0xVzDoA63OhOIGon72uh69iC
	+fwxWivvqmAJnJlntKrgVzxetmsJymU2wWYEKgkQT2gSO+hTwJm4o6zz+LfLJhZq+KTPQS3MipN
	yWzPbU6ND78INe4QWcIwuj6Xi43e/sg==
X-Gm-Gg: AYBFou2itD6hNYQs1xARuuspRVMSdC5U4eXXLYjGCjD8SGtNy8Qr2PPRFxWRYgcVcEO
	g2spGI5MjRZaFUY7ZP46ZGofQBVr+8sFR7ZolLjMfSnNgwLursBZ9HVT/gqODoRIZKUH6kuOyj8
	ob0v+1KE5Uyf+AeDsKC/5OMgFjbjrZT72Tx0om+RX8x79TkQ+PvasvIEAohJpRnrhZuqz7lELoo
	ZF0mn2pHU3wqSVEnRjw+M13YOlJfYIRVA7+z8sFDb1ZR5V03HilYmwkdKq0liSiXDbUz9F/RRRA
	DiHd9QIY1AaY/aYo4+gv5z9k9RGgWYd6hXzhn/ZloO5PXsprHZZG/9oADboUbPn0FKAvl2w0NsP
	laTKa0jPNLXRT2Vx0v5MQLBuWYZ1akTbuP8au63Gv1ry1MSg6OYkyE9jUuf8mj76SSNKK1g==
X-Received: by 2002:a17:907:7282:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c419ef274e4mr640187066b.31.1792450904944; Mon, 19 Oct 2026
 16:01:44 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018024654.3913088-1-mhun512@gmail.com> <20261018024654.3913088-2-mhun512@gmail.com>
 <20261018065442.GC3577260@ragnatech.se>
In-Reply-To: <20261018065442.GC3577260@ragnatech.se>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:01:33 -0400
X-Gm-Features: AclHuK81kf5sGjsveLlYf_EvL3ALaDVS59y4IbiqZrlq6hPfPGs6TazFFH6ntZQ
Message-ID: <CAGEsz8Fa3Hhve3hmKEcWdGENtToKxztHPqaOxkoU-rai-NPV4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from
 registration failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

You're right. I missed the resource-probe error handling.
Sorry for the incomplete revision.

I'll review the code and error paths carefully, then fix and
validate the series before resending.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 2:54, =
Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2026-10-17 22:46:53 -0400, Myeonghun Pak wrote:
> > risp_probe() interprets -ENODEV from risp_core_probe() as an absent
> > optional core and continues with the channel selector. Keep that result
> > for the existing resource-setup fallback, but distinguish it from a
> > failure after core resources have been initialized.
> >
> > The following patch moves the core IRQ request after RPPX1 and the
> > registration state have been initialized.
>
> No it doesn't.
>
> > If that request returns
> > -ENODEV, its error path releases RPPX1 and the VSPX device reference.
> > Passing -ENODEV back unchanged would make the parent continue probing,
> > although core->base still indicates a core whose resources have already
> > been released.
> >
> > Translate -ENODEV to -ENXIO at the registration error exit, after the
> > existing cleanup. The parent can then handle the failure using only the
> > return value, without inspecting core->base. Leave all resource-setup
> > results unchanged, including the existing fallback when VSPX informatio=
n
> > is absent.
> >
> > This prepares the error handling for the IRQ lifetime fix in the next
> > patch; it does not depend on an existing -ENODEV return from the V4L2
> > registration helpers.
> >
> > This issue was identified during our ongoing research while reviewing
> > kernel code.
> >
> > Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v3:
> > - Express the distinction in the return value, as suggested by Niklas,
> >   instead of checking core->base in the caller.
> > - Translate -ENODEV only after resource setup has succeeded, keeping
> >   existing resource-setup and channel-selector fallback behavior.
> > - Describe this patch as a prerequisite for the IRQ registration move.
> >
> > Changes in v2:
> > - Split the error-handling change out of the IRQ lifetime fix.
> >
> > v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.co=
m
> > v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.co=
m
> >
> > Compile-tested with Clang 22.1.2, W=3D1 (arm64). No runtime testing.
> >
> >  drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/m=
edia/platform/renesas/rcar-isp/core.c
> > index 586a5adbedfa8..373d9ca9374fe 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > @@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, str=
uct platform_device *pdev,
> >  err_destroy_rpp:
> >       rppx1_destroy(core->rpp);
> >       put_device(core->vspx.dev);
> > -     return ret;
> > +     /* Do not report a registration failure as an absent core. */
> > +     return ret =3D=3D -ENODEV ? -ENXIO : ret;
>
> This completely misses the error code from risp_core_probe_resources()
> which, as I understand it, is the one you initially wanted to
> differentiate on? This change still propagates the return code from it
> and just chnages -ENODEV to -ENXIO if it happens to be returned from
> v4l2_device_register() or risp_core_create_subdev().
>
> Please stop using an LLM to throw spaghetti at the wall and if you want
> to have this change read, understand and change the code by hand.
>
> Nacked-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> >  }
> >
> >  void risp_core_remove(struct rcar_isp_core *core)
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund
