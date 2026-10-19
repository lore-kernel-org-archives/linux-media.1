Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450999;
	b=sFGpWEe0iWCz3awHfCYijIBJj6CDel2lgG3FukaVHneQvfF3cSbUU+jNctbRvH8yEwg9
	 LTEfGN3RnrufsIb7TzzXBZ3pmJNDNwcNVqt1Tn4tThaxOPi9Y0OUYFwj/z8Y8HLALU9F7
	 JlEapD9k90BZ3GRn1YzksqYEGD90vaO9UmezI0Rq2m+XMCx7/8Y0xDkYQ+8+gkBhv4M9x
	 DuNfNHb9jMwH3NZercZViB+IwCRVDAvRCNza4O0nxP53UO4xchYLSX1R8ETXZkxr7B9fG
	 T+K5Rbn2S+NL5fyYsqe+JC/0b3pOMBKXBv0Uj5IStd1fPEr1fml85WSYhcvb9D33C+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
	b=sC7undmmPVb7lfGnoB+3ESkbNVsMTO8eDN4wgqrfwliwrG+ao3B8MuKr1cqdF4Ue8C8o
	 XrFZObtx0oKcvlBhQ4El+zsnhSRTbSqeHSlxvcbH5UnqI+MTreRL514PtKd1WGVvknTa2
	 sOyQg9YCdEa9PiS/o4s6KCFvnAao5dJvDuSE8pKAjSHSfuyy8kKBm4BHRG/G1V4Cl6OxA
	 hVyU/fyyloy29iDiP/oE+RsgOmI46/z+ouEL237/O7nz/jfWiB+OukT7LNWP6d2lI7iM2
	 GlBIDMZPiE2aXk2GxtH0ckqDEsssnmnI/hUrElt6/Z2Y5O7ynOgJfQRKZY15eAtueSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D792606A31A
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D792606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2a4e013a44so339621066b.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 16:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450998; cv=none;
        d=google.com; s=arc-20260327;
        b=oewztit+dlu+R4LxBxJEhqP+LemxBr80Dkoi7ur/LIIfowmlOwjPgJ3SYFagttdmI7
         2rHH4mlzEy9C2IMlx16gBwJ4PEfbTgVJVYMPs7EJSC30Lslhguk5yXkyvefZ1r8lloTw
         lxePLCSaf7Lx5DzUnEH50VnvZpGLNvhN2ra92A0zeWeS9mmqbRr9Qu6dVpNcqchCp5P6
         1a3aL9XVTgXHutbMeM3AY8duCkQ/7aaz/QCqszpyLVivB6xIPiMA9tYJXkwPEev9KGyR
         dthbrXBY3RDCLjIPkZ628TM3ouyPF+0uR+TrBC/jAJqWejZhU1Tj6hmr6mSKoB+7zuJi
         gSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        fh=5RyCg3mj9q2Nb3An77Da5OG3eGu7N57NRt2+RRi0DaQ=;
        b=NE1y88QHr6X3OSbgm8XNiftod8ciU5W6DdceSoP50sLeGdb9q4DAEFU/Mc4JcQ7pDf
         R8p8KjaIKKIs8QUSQOl/otCjAIYsa+xvCaBDYIwWOqEewiuSaT2Z/CJpbNZ4lUyKnQ84
         cdZg9GpfOuv07+J0c7FVIm/1gKOlDdMvh6VT9t+d9Tnw6QItCvcWja24jz2swg4PeJRb
         FoaOqeu+9mDVsKEH5SKheRQdRoCE8yPsd1T4hLM/qaO/Igg/OIHW0teLrVMEvYoEk3vc
         K0c2owXavhQ+0ng88IeQFkXIqwW5/Ht+cyPpsBTh9H6ZovuOFSArUynJzrxxamSJU8td
         a/yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450998; x=1793055798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=XzzBROxD32IdPg7PQj7Aj7TxdQnBcaRSj9035mBKfquTQx0kSnzkZMS1VhWweBSMB0
         Sfh2J+MBxVbQK73iQuJ+L1ZmHVS8+3aMnan493N9WGr8rLM8keCy5k68bvczfivpbs2E
         d24bsKReA/QrVBny9x68brCZh2uT/pj05oiV1qHcg9yELvChGFq6wcndflpIJ/fO23WT
         E0uVQPyCryvPMrfKPYXecICvOblfMvqSZ13fElkWkrqo/+azdNVCNASt6xEYaglEVCqL
         MZMXj/0At/h/fbycqLgYfcyffnLxBgrjuJV8XpQGLweVC8IFVekAu+tDbBL0V1C36tvA
         x0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450998; x=1793055798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=eWVOGcbCo6qmS4nMfxCukmqgJJ9Ki2bEUpR3hdc+ypqTjPc+KzV7Gy45uvDRtkki38
         hHsT+Z/r91O2gXmAfswFkj1YNboRNmzc5KigheLzZrEbR6P0nWC3V6Cyb2t1DftSdM7B
         OB29pthHBEMNLtY0o/nz/SQl2fKJeCq2kBlKNlh0R/KRgFCjhLpNvHibqNfmJlzivfpA
         BwfSZsQgsyUT4RLbadfWfOWYJYmx926osY7BvQ0SCPDXeam1L3dVe2m6MZU79Gbre2en
         riPDewNRzjuclq9GRy14DJdMirfjM5yoN+U6yMt7uaqXaXsuItkWTfQBSY3BpNLe2C1U
         T7Hw==
X-Forwarded-Encrypted: i=1; AKwUvBziYrhvZD7F2dWmfWNqbtoGUf3Hnx90YhrAutN7cO35kjqkHyZ10YPYlrKezYKIaE+gYd01DC9V4Rh2IA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLlh3n6jEKqz+pjPK2WicHa/EYSJ+OJfRjJPodhO6WVXUg9dGCK
	ZsJH177Y2O9M/w8cxO1i/dMgh/3ZKhtQjZ0cXzzwDziKwPwpeWDOsqc4+bp7x4CtXqE+Dn3o+Tl
	ZJZlJPwUvp52r090ou//A//P5q+7g2Q==
X-Gm-Gg: AYBFou0xLnDRw9LK0WhgBBWPL8yR9ZDNqb3/Gy4PZ3L5+/Zw6zR+AOtdmHRNBf9/rkc
	IAWBA/0PADz/Y8MUbojTqeN3fLBtk92p1aGeFBoYvVaXN4dVaf4gWQJiLLR2C0Aiz8vpVOVFFdo
	skG1RNPD9SFVQkM7tCrI381SngPgfScOm3Y41C1WxC/SG2jMn/JcQODMy6kw5aFekxDIKTcuB5e
	BQltGB4yabWER/XgCYjLItP7vdHwuN+YO4WRCRZ17Do4NPPUyYYDpgeFwi68f4gw8nQ+hriUP4v
	Z08OT1e/qOtG7PsASL4ebkWFLyUFbc37I9iGrd5Mvn/fGeXGr1JclcHVrWM2ZMbzCcTIZw98nFa
	XtuTzQABQ1oDv3C1KoGKaDMULgweqyi0rBhaeLQcjqcei5QxOKvyw1TVBYjO339EnvLeb
X-Received: by 2002:a17:907:2da9:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c450b99f2famr243449866b.7.1792450997629; Mon, 19 Oct 2026
 16:03:17 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39@eucas1p2.samsung.com>
 <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com> <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
In-Reply-To: <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:03:03 -0400
X-Gm-Features: AclHuK-b8j1-fi2uZSAQdYkd1yB7zxeS2EFL02Kkr6JbCillyjdAs-mauMrGRkc
Message-ID: <CAGEsz8G1k9O2CpA23vKmUFghfN-HTFhVUtx693A0whq-mSbxYA@mail.gmail.com>
Subject: Re: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Agreed. I'll switch to request_threaded_irq() and free_irq() in v2.

Thanks for the review.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:54, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 18.10.2026 05:51, Myeonghun Pak wrote:
> > The threaded IRQ handler reports transmit and receive events through
> > cec->adap. Adapter unregistration masks the hardware interrupts but doe=
s
> > not wait for this handler. With no open device-node references, it can
> > free the adapter while an already queued IRQ thread still uses it.
> > Devres also unmaps the registers before releasing the IRQ, since the
> > mapping was acquired after the IRQ.
> >
> > Free the managed IRQ before unregistering the adapter and disabling
> > runtime PM. Request it only after the register mapping and adapter have
> > been initialized, and free it on adapter registration failure before
> > deleting the adapter. This also makes IRQ release precede MMIO release
> > on probe unwind.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> > Compile-tested with Clang, W=3D1. No hardware runtime testing.
> >
> > Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.
> >
> > diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/c=
ec/platform/s5p/s5p_cec.c
> > index 4a92d32..e83705f 100644
> > --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> > +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> > @@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *p=
dev)
> >       if (cec->irq < 0)
> >               return cec->irq;
> >
> > -     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > -             s5p_cec_irq_handler_thread, 0, pdev->name, cec);
> > -     if (ret)
> > -             return ret;
> > -
> >       cec->clk =3D devm_clk_get(dev, "hdmicec");
> >       if (IS_ERR(cec->clk))
> >               return PTR_ERR(cec->clk);
> > @@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *=
pdev)
> >               goto err_delete_adapter;
> >       }
> >
> > -     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > +                                     s5p_cec_irq_handler_thread, 0, pd=
ev->name, cec);
> >       if (ret)
> >               goto err_notifier;
> >
> > +     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     if (ret)
> > +             goto err_free_irq;
> > +
> >       platform_set_drvdata(pdev, cec);
> >       pm_runtime_enable(dev);
> >
> >       dev_dbg(dev, "successfully probed\n");
> >       return 0;
> >
> > +err_free_irq:
> > +     devm_free_irq(dev, cec->irq, cec);
> There is no point in using devm_* API if one needs to manually free the
> resource for whatever reason.
>
>
> > +
> >  err_notifier:
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >
> > @@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *=
pdev)
> >  {
> >       struct s5p_cec_dev *cec =3D platform_get_drvdata(pdev);
> >
> > +     devm_free_irq(&pdev->dev, cec->irq, cec);
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >       cec_unregister_adapter(cec->adap);
> >       pm_runtime_disable(&pdev->dev);
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
