Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430320;
	b=zP2PcbSQH/e+ZMn//scQq53gmopx6yRyDt+y9HeN0a7Rj0pdXe0p28YEJ/9wgsMARdEB
	 CfmOcEVbJ9TPB4yZPvI1uujRnlbhUoSY/epIMAoplHqiM95iHR3Ly+KpTG7y/jnORfA7/
	 Hlo02Y5eFj7FS3jSVrahI1FhaiWNmARrFQqMhn9xtuL7s4jXioiE5LraeouUvE7TKAEqk
	 SI4d+xsH5u2iaYobl6GOQLtSX62S12eLDUjt82gHfcLhMZX+wIcgL60Q7f4XvX0lW4S4p
	 PbLAoai/V4eWTWlK6kKc3i5i55truq4e9Y5i/4lBiZWu7KIDZYTdtS5MgbEYEfmoeDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430320;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4uMBHgBjHPr5TrgiVfTBcQRGxAuQekn3tbU+m3Rem5w=;
	b=b3NpZzXgxePskhj+FDTpF5pPYnJbAhb6jIznVjy21FvI4vTZlhDfcv+lQiYATd+MFP7X
	 YJBybNz6GYzirgH+NgwzTJ+kydCtJWjZqQrl3woBg8xV0g/fjj2n/NKS3biC9xu8mx3yE
	 xbaX1sy6//Gn/HtQKKlS9MgUHKEWlIufZ4RsZwPVVWGAqfhj+BHXKuJmwTyieI4Qs7NbE
	 msTs4zbnasZ5fI7Q9UHbae2S/lOcy8/yaLAWMCCMFuPo3CJMJG8fyocoNUpb3Vj4UJs7r
	 JG1mcUcMDvZwHdva/xWhlCnSkrto6O3gx6RWiq0dD3sUu6xS4qCpsm7J5U3kCnnByQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6kZQUpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF4606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6kZQUpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6521F000E0
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430319;
	bh=4uMBHgBjHPr5TrgiVfTBcQRGxAuQekn3tbU+m3Rem5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X6kZQUpKCnlcvvx8/m22zj3JYZNRBppgl38bJfin75SRiOdZZW07QMJFmI+UhTZm/
	 BVsfSJ+SX5RDGQNhYyI5OgDvRFpHWyX/7d5sIpFvBWLdsGJ68Mec3EJoTKvYdePozL
	 lrokFRgdsVl2avYPb6cABUK8smsfvmChhgOalWDVT91z9kFkU64csOXhORVjotIPHy
	 yRBYfgLDzu7uYm7c2IUH6/ZpaQ2i6goFZi9RXP3ye8+fuXeln9/jpRQvJ5hKJSUmrx
	 kTrPsuGdfvfOhXU4bZ6zkDpdLQXJ4LEh3hqORHN8FeB9woNaUzsCmgFrAQNo9BwGCm
	 gU+Bq3MiyWkQw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso1887942e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 02:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG6BdYjgzm+wTMc1ECdILxMD8rRnL2POpckE2xsEQaaWgSABQYy0Oe/pimcr3HFWaIyCDt2hgcGJWeEig==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hc6ADBYNzy2+dNyA6xmncM8InU3akX6fYlf1+KKwxtZCT2sYk
	18EG7765yb4NsXawJQzjuORTD4xCvm4ikuwopEEmyqMCczYZSP7Pf4xvxTPz53L5VqW6BiO+PB2
	OGOkS0fy0pKSpyKNJuCWVPMPa6LGyAx4=
X-Received: by 2002:a05:6512:2301:b0:5bf:d000:bca3 with SMTP id
 2adb3069b0e04-5c1bc80af80mr2599775e87.49.1795430318053; Mon, 23 Nov 2026
 02:38:38 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-irq-supend-resume-v2-1-759b3f5b2cfd@kernel.org>
 <avMP-y1B9K0cp4M8@zed> <CAD++jLnuS9ZE8mRwkCizsqo3f40s5etqOJAUqLJNsCtE5eEkDg@mail.gmail.com>
 <awP0mKeNtrJj8zh6@zed>
In-Reply-To: <awP0mKeNtrJj8zh6@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 11:38:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLnTCEPKG5hNtfQ8rbijxF8nsk3H_K+R4H+f1HJak3Dhvw@mail.gmail.com>
X-Gm-Features: Aa3M54rRKaj8R3sfZW-3iO4iridVTVI6IfP5ufKPSkuf_T5v6hl73pARMuoD_pk
Message-ID: <CAD++jLnTCEPKG5hNtfQ8rbijxF8nsk3H_K+R4H+f1HJak3Dhvw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: Keep IRQ requested during suspend
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, linux-media@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Mon, Nov 23, 2026 at 9:28=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> So yeah, maybe Sashiko would tell you this is possible but I hardly
> believe it is.
> Anyway, there is a remote possibility for a window here, so let's
> increase the pm runtime counter.

I'm honestly not sure. The framework should ideally stop this
from ever happening but I'm not good enough with the media
framework to have even a vaguest idea of how to fix this.

What happened is that I asked an LLM to review the code
using the Sashiko scripts and it complains about this risk.

> > PM reference. The probe reference keeps the ISP active until the IRQ is
> > installed, so runtime suspend cannot call disable_irq() on an IRQ we
> > haven=E2=80=99t requested yet. I=E2=80=99ll add a comment.
>
> A suspend will always follow a resume, and if a resume tries to enable
> an irq before it is installed we'll have problems as well.
>
> If that's a real concern to you, shouldn't we install the irq handler
> before enabling pm runtime and powering the device up ?

Often that is not a good idea, because the IRQ line can
be in an undefined state and give rise to interrupt storms
if you do that. As soon as the irq handler is installed it gets
unmasked by enable_irq().

Also right now the device is powered up
by directly calling __mali_c55_power_on() in probe() maybe
we should just let the PM runtime resume power it up
for clarity?

It's quite common to power up a device (enable clocks
and de-assert resets) before enabling
runtime PM though, that's what I usually do.

Remove problems:

> > > > +     pm_runtime_disable(&pdev->dev);
> > > > +     free_irq(mali_c55->irqnum, &pdev->dev);

Note: here we disable runtime PM and free the IRQ and this will
make sure no further IRQs appear from this point.

But clocks can still be running and resets can still be
de-asserted because there is no guarantee that runtime
suspend has executed just because we disable pm_runtime.

> > > >       mali_c55_media_frameworks_deinit(mali_c55);
> > > > -     if (!pm_runtime_suspended(&pdev->dev)) {
> > > > +     if (!pm_runtime_status_suspended(&pdev->dev)) {
> > >
> > > I guess this is required because you moved pm_runtime_disable() up
> >
> > The remove ordering is part of the IRQ lifetime change. Both runtime
> > PM callbacks now assume the IRQ is installed, so we need to drain
> > them befor free_irq(). Then free_irq() waits for the threaded handler
> > before we unregister the media entities it uses.
>
> I'm sorry, this is certainly me missing some pm_runtime internals,
> but where is this happening ?

It's not a pm runtime thing more of a free_irq() thing,
it will wait for outstanding threaded handlers to complete.

When we get here we know no further IRQs can happen, but we
have no guarantee that runtime suspend has been called,
so we check just like the old code did to make sure it
gets de-clocked and resets are asserted.

Compare with the old code:

static void mali_c55_remove(struct platform_device *pdev)
{
        struct mali_c55 *mali_c55 =3D platform_get_drvdata(pdev);

        mali_c55_media_frameworks_deinit(mali_c55);
        if (!pm_runtime_suspended(&pdev->dev)) {
                __mali_c55_power_off(mali_c55);
                pm_runtime_set_suspended(&pdev->dev);
        }
        pm_runtime_disable(&pdev->dev);
        kfree(mali_c55->context.registers);
}

Since IRQs are unregistered in the runtime suspend callback,
this is not a problem here.

> > That=E2=80=99s also why I switched to pm_runtime_status_suspended().
> > It reports the actual status after pm_runtime_disable(), so we only
> > power off the ISP if it=E2=80=99s still active.
>
> It seems to me pm_runtime_status_suspended() ignores the runtime
> counter and is only there because you pm_runtime_disable() earlier ?

Kind of, I guess it's a bad idea to free_irq() before disabling
runtime PM?

An alternative is to call pm_runtime_force_suspend() before
free_irq() so you know for sure the device is powered off,
I can try this if you like it better.

Hm actually that would probably be better... shall I try that?

Yours,
Linus Walleij
