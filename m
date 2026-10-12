Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA791471244
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796919; cv=pass; b=AsnK5jtfxX51DFgmVQ4urce/pPEBHMpZuY+k0/Bx0EjDAtvmWiiEflEe5/dvWaOIO2C2MLC8xh7cqRZzWQS+TDZBNSVyXsmbDiZhbnR+hLpjmQKAaTlccZvHCrFxYg3Sl6WZUlzufZ2VyOM2WEKlCwRYotUPYH9IsGmZaYb5w68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796919; c=relaxed/simple;
	bh=HMgUswHA9/JW7E20urE69ecFRmmPCiIt6XwvKa2U4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hbvb4t1QZc3KWQhWfz4eMo6t5guaKnXdzAXwExhAuJNHHri/BbdNsnn1P29+QsCVhy6BnFhB14liZZPyFBRQsjH0yrdeewVkqIH7h3qsKZkuUMNZ3zYu1LS9T5quukNHr6IFdyEp3h/L6Bk7THaap6OKdU8dgCbDXFOr4k4cx+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+pySmuR; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+pySmuR"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2533d83e3bso260553366b.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796916; cv=none;
        d=google.com; s=arc-20260327;
        b=oSyfOEuV5iZaYC2/P022U/rXgY3uGm8oO8E2Swkn3zZsV3xDqCppgYMluIAxjgnA5v
         lVh18o79J0MhG4rlMo2JX3TZlENJVBomEa/PB1dLpRBQzm7lhqoSl4IOPyQCayyyVOiq
         2zu+qCbKU5fNtZAvdGp1wxbVAu1hB1PdcKbbG01bTpir3qeWAeAHweNjgcu1mFmCY+6y
         WY4Poc6P1AVYIACcoXifvLutuRFpkZtC+KebXJ8g3KqDqagwdU27kvXY8/FJGmGrRb8/
         1NCwfndjPPX8kw1f2bsaafUnKlzXeQrcK0LTNX4v2zV/GJuC4Sp8IFwvAAAhiNbV0zqv
         px1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        fh=LdHAYfMTmT0pmFH0Wif2gbNJG0uUm+ewKzEIlOoc8Mo=;
        b=IlpkIDmWlmYN+OjSxauT41nXwkGl7dKt/TSwCcI0zKUeaQa0O/VHJZ9N6FCH56rvp1
         ej1H8xYMudgM3wpL/cUirKeYjjjE1NGivoqdaJbyP5BobtGTRTwuxSm4yeOrh0a426jM
         A+Vs4BgTpikdWGq6TTy65ZyG3M/nDssbx+ZzQJntlDqG+/VyE8YQRMQLuYOPcDIySsIG
         aCKDaj46fyM1OKA5lwwMPx1aTxUO7GSAhz9aMv8qj/QOHHtEWQMv99TRtBHluml+/Q0Z
         t5vvsZfuBLVQ+w55ah3Xd/rIfK7RI2i/Ot4wZDKey7WXmPyoPa/EM2gy2vEReBlUJot1
         RuWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796916; x=1792401716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=n+pySmuRoWj3EdZu8a0WLkYYnm/urNB1fQn2a2TEt8nurHb+HpyPyTkqZ1rK9E/f+O
         AU6QLh6Esq/7qd2EjhfWnTmFcc5Ld8n/NFNfNgB/O2n5KEef6zzMK2aypxLoKT2CYejU
         zMpuAYXaTtaPgfXmLmf+bNtF8VmDIfICQunqW05IVIp6pihM48cUF7+MVbk8QZzrC4wq
         Ti4TPJF7np2OngOTcw9nz7vzj0jIdwfYBX2araz33JfG/gseAbu0BwUUTywxdpVRFydY
         zudlLmD+kOkTaStP8kKclpZZAvmJrL0wiZHJTQIszrzKtObwybyDF5NpiaI/PqwjTTQh
         H77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796916; x=1792401716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d00/PGVzqnOO3exQ/y/1tCNwmAX0u9uxnCPXmaeqvTE=;
        b=1wjzrlI79PfNfiX+SojEPsRlB+nesQuGXOBeG+x+C//GnyHZ5NGghsEfrqHcTo5fEV
         R4rVvcHCZnV/89dB1Es8gVCULpwZO1xCWtC7ENRmdFzY2apPeWU18+j1sY4//NBgkgvI
         UQFl6S1+AXNtsbllxj6SpaekCZdtyyArVHspiew50fBXDgRgSy9t1FkpK2iXRudEhex/
         Pc9HiFuW8gEXMncpA8+0TD+5OlniYon3GggJpB3PbmNHg1twY7GiIJrzhfgBXghnkTKW
         WmMH79zIkSpj1a6UCStCykdeyHggf2++wg5opAkD411TsTAqnlCjxqV/mGpYijf2SJy4
         igkg==
X-Forwarded-Encrypted: i=1; AKwUvBzh+cpzka5tIa95UfZf6yEar0JhQvl0thqH4eNZFelE7X+2N48UTHR47Hv+AQ5UonWu/JzqcyfGs1Btyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIWN+sGz0Hy50muWXnzq0yQp3ZWIVT93YYRGG4lZztoiROpXhl
	NveDxfbu5AN/Gu92q+esxH6pbJyamTpHBU4xdTBfD6bEmGAx3AjYi1MwbYG7jxg6BDBDymoxEEl
	u4D3JlVJAt8pScF30FgQRtFBPe+Q1SFM=
X-Gm-Gg: AYBFou3vtrKf8xNnd33C7ch3PWmamHf8hiWdxgGJZsWL3tW/3M4N9n8+NcxXiq7B+D7
	fPu3ierGJfDvIDDYFuobBCj8WawB+ytHINfqBGTkKRX8+LxJR0pbB9P6xRqdQKr/T9Q/HIFbh26
	BD479jqqaJP6JOyrVIz/ihA6ZhDaUYSC/o+XSI/46t7iSRF4lUCBnQwZv/NUAjLY46aTVmNzNDW
	9rehUoZSlsqUhAmBGlwY/lY4KB5w4YQe/rT9Yz5+UqNVbxN9AC3PUAmOmQbtI2d1zJa58dConcZ
	QjDfd0rWZtfRPgLn7EVMhX6yw59FWq3xXu5vMwUY3xJMW6YeEXRFBAPw+awBINySZm+5usw0R10
	2o6Vr2wvT5X5O4J5a0v7HhCS9Jk4xeQrBOgLA8H5bV1qOKTpD7PG6/5PLKUiur58Ya7Xm3iXjMx
	cp2ZQIdW3NdLo/Bmv8tqraBc+eVVaOI9FwqeKd+hDC
X-Received: by 2002:a17:907:3d09:b0:c31:8cfe:9a25 with SMTP id
 a640c23a62f3a-c31a9fd33dcmr927229366b.9.1791796915831; Mon, 12 Oct 2026
 02:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012044724.160902-1-mhun512@gmail.com>
In-Reply-To: <20261012044724.160902-1-mhun512@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:21:17 +0300
X-Gm-Features: AclHuK8b6tUYO5p5GU84erIeD1vnrAS30oFKa_UyF3wbpOcD8fRDiFjk41OAN6Q
Message-ID: <CAHp75VcEZ0RiCYKde7aiw7tK=J1LEfSeA=91GOHdPK6479V=mA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: drain assert recovery before tearing down resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:47=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> The threaded IRQ queues assert_recovery_work, which can stop, reset and
> restart CSS. Removal currently tears down CSS and the CPU latency QoS
> request while recovery can still be running.
>
> Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
> available until recovery finishes. Then release the IRQ before CSS and
> firmware teardown. Apply the same ordering on probe failure, and skip
> the uninitialized recovery work in PM-only mode.
>
> This issue was found by static analysis.

Nice, have you read the code that you sent?

...

>  error_unload_firmware:
> +       disable_work_sync(&isp->assert_recovery_work);
>         atomisp_pm_uninit(isp);
> +       devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>         ia_css_unload_firmware();
> +       goto error_unregister_entities;
>  error_free_irq:
> +       disable_work_sync(&isp->assert_recovery_work);
>         devm_free_irq(&pdev->dev, pdev->irq, isp);

^^^

>  error_unregister_entities:
>         hmm_cleanup();

--=20
With Best Regards,
Andy Shevchenko
