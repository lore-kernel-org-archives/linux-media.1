Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BB1F94F
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796993; cv=pass; b=ZS1CPId6PZ8yCj68VNBSWtgL7vEYeluaeG7FuORT4v33EYrDbWqmNms5JHvVAUi1bt0ziYw/qu0hku2/lr1rwa0zSJ75F908XniypZc3WKagmeT2xHkW7J87fVt7havLQ7AigWVmF+ovCTcxWY1PiofVNdZfwcrrkBF9Hao1Tlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796993; c=relaxed/simple;
	bh=ll0F4+vG9+cFqrbPEv9fSbXH66s1+84h5qNxoLkrJMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IniDO4Z49XKoUXNpyUXURWqpDgUN07qN1TzpgqZev8JGkb96ntlwbRvR10AN1v0vSxEPHVCWDZ2fvjRT3nqKWU6COxEN7AXKk2bEMKJKR8fmQCKbLQpO+3IAMaXF1jeBYP6t4ms2v5jcHtJBc2ZJc9l/NX7M4AVMd1L5jneURBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqwNlNjU; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqwNlNjU"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a7754c2471so14256281fa.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 02:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796990; cv=none;
        d=google.com; s=arc-20260327;
        b=UISWDms2QWwKQLrQyzdQTwCcr9z4yqATYSEyBp/aRL4z8tC+s7OTXyWNoLkK3rtPie
         EuCZcv/vEkFs6nmoB696cPNava0tf1Wfj1Jun30g4w7B987EmO1OIMbhGv0nszLH3vN1
         ljyw2xTciz4UUT+MSgn3dP3VEy3JH3KHMI7y5+D2xZaIIFh/Xbse5wczpqFAEq6jDtLP
         HocC8a786P0l7IqH7eWDKI0Df+gLkSEe6lwuwzxcqQnWR1kjFxvUZSw1oJD6nUXE5GU3
         3MdAgMqxgrCnp0FlS5wKZjExtisME04MFqlc617mX/mwNDImAAcoTLvvXOqExbu/BoK6
         SWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        fh=nzrQPXB+Ut/XcVTgJnXX41Do9DfDEpZ5dXY/P/HtPIM=;
        b=l847QoSjU+TgPgROBeXMy6kBCkDoTL1Lyt/payMiy1YQL9Do0+I4QcVVH/hrp8WxFX
         iWrnqMfA3JHp3kbcSdjv1z0GVzEEu9OpakWjTzNAVhg7Rk/ItWOoUj8tgyk/XL8mDNQW
         qsBTcGFoEIyPVoGihWRlwyrxsuMsYZRiOuC0H7wRKYn5mQf9LFVPqJhBV6+EreM5quNI
         WNdIVWvMxWPacrZAFkhPfv5O6Wgh/732sOdzxWHeQb3zoFzFXeEoj6cVWoROonJMgqf6
         u/XwBedVK0P5dW45yDj2P265m2MTNLnC4+mygAysxQmfuzVlxYa/8yUGJwdLD9/OYshK
         htyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796990; x=1792401790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=EqwNlNjU7RB2xdPdWA/AnpA4UvV17uy+EdMlAzKO/PZPrMPNqSPlSI85yTJwzaP9Pr
         96KpdkNgFe8giqc5U04Ozbnovk52gX/ZF3eQIXbjCGiQix81SpvDQHlrDAv0Z54H7JEn
         4VCU80SIGOcr3ovd3tFr2/wZ1dtL7wxVrMQJEt0OqQkiBaVNV8Uz6NYHa7emVVPwm4l3
         UhcRyYvChDslLuC0u5J3EtgSgZoHoyn7xAGM7bTmhO96Lc7nM0ZvmhtRGmxE0qm5Gwo/
         K4WZEOfQbI5x4MrEuAvJ7a5hdQ6qsUU+UrEkA4j+ERyptGWryyOWfjazT90zmXgleS21
         QUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796990; x=1792401790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaBwRiwcU4T784679Mndr/YJsrU0LmmpEnBwPuOqAqk=;
        b=NpVtgsv2F6aivqMpSDYbw25H4aAgYSJJH6zhGIyaK2DXW+KEiMK8QOTnNFtl+1cfQ7
         zB+eKw71kVOPqDIIYHx743kimS0doUICoybpNIPmn75+InNucDtCsMjHBXyYcGI7rJIU
         +Kn9npDS1sQMcOhlUDrKjxLuzyPGR2ObTvjcJhU4Tc04nQ5IMSLReR4qi6UDrqrFyQvn
         AJsngfDx9Cu5Nk/8SU4abnDdVaix0OeIyIe7VaBP99n6kz6QGsBBVRruLxRZrUC67AMO
         kNrlsbOCeJ5VylGDVKalYPykV3+gpPcWdUkRvucB5hxn1yjzPkmpVUKPD0C6O7DLBojg
         uz9w==
X-Forwarded-Encrypted: i=1; AKwUvBzUq3383tPlYTOHLPLm5u3VhYjgxmyTlz9W7+Ckm/tFOoK2PIvRKoHwEK9+V1yhxqv8CIwvrf6F1SQT7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLczdE19aJJiIKqKf/ALk/MxKj85B9r9HuMWHp7RpvUQ95RPLUP
	I+O5j0lsBRYkyzqHaDBLZLM13oMC1ysph7ierv61/9jNbXrS/BO4nzsmVsD/+QgAITwDiwD6DBp
	xKetbcWo0yb4XcsQINBTiWwKNXvYcSJtPP6JP
X-Gm-Gg: AYBFou26Z8JNBmwWR8btZTFCbFHlIyPGvKRt2ATG0epCeNI3MQRh0WWhFmCwB2e4zM8
	OyIbzME8CtDbQJl2FFrZTizK8XFQEheweFrjymGCTyGUA0xujfWAFGOlTW7CzliGXR4l9AWFf5v
	dyPql2Hes2flyaSHkpTvDyGnZDvUzpBnn0pdWYhzg5Mrxbto2O2V2wTudo+pxTsYV5MvVSWkXUw
	rBF/BAWBQm8kWDNRb9QUrVf31R4KcFwjnTfT1Debzsb7nYO4VpQ4Iyi5y2Hl3a5tOB+pT9Hokfj
	vJ2uWvm2dtiVqbV6jmrO8M7qZxkgqpw3W9cYpqMCJ2TVFlp3TlnyHlEzcKVGkCqb5drLXk4OhDs
	ryr4jgWYs32Eg91L40oBFUabYX2geTc3zXyNAF/UZmughDWaCOMnUe5ot8RsBtM5Em60w++fARS
	yKSUCfbsA08kLGjQa0oXOD/PFADNuoz/5bYpKYUyBIU9oempkds+k=
X-Received: by 2002:a2e:a99e:0:b0:3a6:5b2b:c50e with SMTP id
 38308e7fff4ca-3a9c539af0cmr21768881fa.4.1791796990083; Mon, 12 Oct 2026
 02:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com> <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
In-Reply-To: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:22:33 +0300
X-Gm-Features: AclHuK8GqFu8wnVI0Mxk9MM920njTXHSZpz9wCgu1uvRmpNlSfdJXJ1wA6pAW-o
Message-ID: <CAHp75VfJu3mWgfBrKiiw59mVCCJOGEHZ-CCjtORV_CvfS4PjRQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com>=
 wrote:
> >
> > The threaded IRQ queues assert_recovery_work, which can stop, reset and
> > restart CSS. Removal currently tears down CSS and the CPU latency QoS
> > request while recovery can still be running.
> >
> > Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> > available until recovery finishes. Then release the IRQ before CSS and
> > firmware teardown. Apply the same ordering on probe failure, and skip
> > the uninitialized recovery work in PM-only mode.
> >
> > This issue was found by static analysis.
>
> Nice, have you read the code that you sent?

Next time, please also test this on real HW.

...

> >  error_unload_firmware:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         atomisp_pm_uninit(isp);
> > +       devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >         ia_css_unload_firmware();
> > +       goto error_unregister_entities;
> >  error_free_irq:
> > +       disable_work_sync(&isp->assert_recovery_work);
> >         devm_free_irq(&pdev->dev, pdev->irq, isp);
>
> ^^^
>
> >  error_unregister_entities:
> >         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
