Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393759;
	b=wUKCGSdrRnJxpeGCDzfS4Hk72UXEu883frCC0h5qfp5LbvhP7p5U4M7DmOwHj0CNRBsD
	 JZeJVA4WiedUUL4O7y3Ki2f+YZJHYcpetE1pu3o4eHK6iGi8npJzJVSMNihESiFWRRLkJ
	 kVytzI27Tqt43d2yDj8ty/g9mXDW04Tc5w3xOobYgTk3Db0KgHS4WHONI5wUQ9O1RxF51
	 df92rkI3U/m38QO4OmG7GLcJUj0UmDx9S0HcXi2FGpOM6qjWY8co026RTOPm4VxOdSgx3
	 eGU/th6B5vVh0uLKLox0Ejq2SRhtWhez+YU+wWFEByzlGP4lgyHedwxvG3Qw7eiIfHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393759;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8qFkofrD90yASDKy5S4kDZ5KpDQOlPHLhwNCJy671mM=;
	b=WRk4k1010HxSRNPG8o9VU+kMruW3IDJJEykv+XMJdp3hAiUKuiitBJi2C0utnmxp+sbF
	 0b4BI0wt6rXB2OfRUeC9nuY8msYyV8V+w/0kqFq/nLtvu2J8/Mqr5gl5BMfRBgIhjN/kS
	 z00WvvPVIAfdR8GGoeCRpgArABLRe9ydY2cEWiI20nuiNQ5OZdzVWM+gPZzNAUEZ+CBj6
	 F63ww7ZeQxudzzuRm/hg+cP5Vm/qL50I0t1NCZ2Eyk6H1ckdx15Qs8m3pFVKB89p3whbY
	 rLiQIufwZKLZNT9RMq5/aqtE1LN3FHZrVY5LwNsmYGKYDgw/EB4oOpzlNOdlVEYZJHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLap424D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F0606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLap424D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4CB1F000D3
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393759;
	bh=8qFkofrD90yASDKy5S4kDZ5KpDQOlPHLhwNCJy671mM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DLap424DGHliLRM4qmstNWwoWrM+SMO1GCJ3rDJOEeFhneczrWwCAdU0UjMw5Av7k
	 4BISFt7YtGgXIYfxypp07ZxRnVVxnXC4h9xDLVudllRlLeRYG3Qf0nlU9sQuBGaeHd
	 fhGjCW37H+VBucqnccXHOS+oKbDPGIm55GVeoLPCsWD1Bo5Qq0BOV8anp1cRbp20H6
	 rPUCsDyeONmYlgjjshLUQgaDcuEvE/GV7LpoPwNxjG8znTR6IbO+gKn8lgOpVEx+7B
	 HSPumwPqj3kP81ie4hOU9rRZ0Uyc4PkmhqvAl7W1uZn2ixuXWzNdqZ1fagTk8f8V0Z
	 ZCwwRYwJ7npKw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1479be604so1983271e87.1
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 16:29:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEayW2RFcUi52HNFBgYZCdvSf0EDoxKMWIRG/qW//QG8wYM3ptPyqGFYgj7nWm+p8BuPtkBkQsEteqvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+36aoxbVUmICz2yyPHRhXnuze62urY1+/s0JHusXNzy+FmI7OP
	RYLiQokKgN7Put2LznNu4WFWdqFJORqMuv6APuUeOpryBWe/ovZtNWvsEq79If2TJf4co8VmO/4
	9yA3Xak5c4QchvjdvIlEDPkbTqRjDfZM=
X-Received: by 2002:a05:6512:b9a:b0:5c1:acda:6dc3 with SMTP id
 2adb3069b0e04-5c1bc6f6c92mr2640619e87.3.1795393758361; Sun, 22 Nov 2026
 16:29:18 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-irq-supend-resume-v2-1-759b3f5b2cfd@kernel.org> <avMP-y1B9K0cp4M8@zed>
In-Reply-To: <avMP-y1B9K0cp4M8@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 01:29:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnuS9ZE8mRwkCizsqo3f40s5etqOJAUqLJNsCtE5eEkDg@mail.gmail.com>
X-Gm-Features: Aa3M54oKQ7-pXJhxkVQ6DYf9Srp3nFTxNtaA3h-2YMgZtE6S4BXYHBwJQq80Cf0
Message-ID: <CAD++jLnuS9ZE8mRwkCizsqo3f40s5etqOJAUqLJNsCtE5eEkDg@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: Keep IRQ requested during suspend
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, linux-media@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Tue, Nov 10, 2026 at 1:51=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> >  static const struct dev_pm_ops mali_c55_pm_ops =3D {
> > @@ -825,27 +813,42 @@ static int mali_c55_probe(struct platform_device =
*pdev)
> >       pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >       pm_runtime_use_autosuspend(&pdev->dev);
> >       pm_runtime_set_active(&pdev->dev);
> > +     pm_runtime_get_noresume(dev);
>
> Why is it relevant to hold a PM reference during the installation of
> the IRQ handler ?

Probe enables runtime PM before registering the media devices.
Once those devices are visible, a streaming path can take and drop a
PM reference. The probe reference keeps the ISP active until the IRQ is
installed, so runtime suspend cannot call disable_irq() on an IRQ we
haven=E2=80=99t requested yet. I=E2=80=99ll add a comment.

> > +     /*
> > +      * The driver needs to transfer large amounts of register setting=
s to
> > +      * the ISP each frame, using either a DMA transfer or memcpy. We =
use a
> > +      * threaded IRQ to avoid disabling interrupts the entire time tha=
t's
> > +      * happening.
>
> Does this comment still apply in your opinion ? I mean, thread_irq are
> pretty regular stuff, do we need to justify its usage ?

Nah I'll drop it.

> > +     pm_runtime_disable(&pdev->dev);
>
> It amazes me how, after so many years, I still can't find a clear, firm
> indication of what is the intended call order for pm_runtime_disable()
> and the other pm_runtime calls is during a driver's remove.
>
> Media drivers seem to do different things with some disabling pm
> before setting the state to suspended, other doing the other way
> around.
>
> In the end, I think this doesn't make any difference, but in this
> specific occurance:
>
> 1) Is this re-ordering required to support the new interrupt handling?
> or
> 2) Is it a change that is worth doing anyway ? (and I should say "should
> go in a different patch on its own")
>
> > +     free_irq(mali_c55->irqnum, &pdev->dev);
> >       mali_c55_media_frameworks_deinit(mali_c55);
> > -     if (!pm_runtime_suspended(&pdev->dev)) {
> > +     if (!pm_runtime_status_suspended(&pdev->dev)) {
>
> I guess this is required because you moved pm_runtime_disable() up

The remove ordering is part of the IRQ lifetime change. Both runtime
PM callbacks now assume the IRQ is installed, so we need to drain
them befor free_irq(). Then free_irq() waits for the threaded handler
before we unregister the media entities it uses.

That=E2=80=99s also why I switched to pm_runtime_status_suspended().
It reports the actual status after pm_runtime_disable(), so we only
power off the ISP if it=E2=80=99s still active.

I'll resend a touched-up version.

Yours,
Linus Walleij
