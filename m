Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76935E1B8
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698018; cv=none; b=sNu7jKLlnlYUa83VJcIcX2UtZmzfCcQT6dcS3hP80V3Dm/KHDVeynKH9WsxKT/cX4I3wZBJgz27Fi8tCjMHEogtl3BeuCvgbDETnxN7pzWrsmIs8XnaPaCqr31ZJOSlJZj8IqF6+SlB1wSi39ryTpxW0mo9yThgJ9GB15Zu8zvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698018; c=relaxed/simple;
	bh=sDWtZ/NnsTwLfnf8R5SJiBl7HxoCwLbTgjyrKEqm5EU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LdDxgS4k5g+8zgWK1iXaK9WB2weZw/Gg/JqiqUAfvE5u92b8ss+EIr40nd2XhackrSqH+acQG3vaDy1dCS2n0KvAouDJ07giuEzbjvMT4XOSpA3BJAULFB8BUd+r7SgbEufDqLmCNnVoshV3Dlzz3jlZOSALNeXul4z8XUnzHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xgdo5/O8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xgdo5/O8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C581F00893;
	Fri,  5 Jun 2026 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698016;
	bh=sl08Apc0ZHFfu7c1F4x437umL1bF/bV9KRv8iqVxsEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xgdo5/O8Al4xv5cp5Ayn7fSfEwi6AZsB0YIbLZ5oH/i8TlhRAsWrCfOgG6S+ha6kj
	 l+rW9/P+HLTMas/DRepuBJ8kBqyA4JqxVrO99TCKVUJo0tvlAqi7U/Q008zt05N3gs
	 NYl/Ug1M2TiQAW9eg61ojoNlJ+YhOSQH6YDSxmPAZzsGyufKDobFAMsZBCAaFE6emf
	 18dsBO+X1brk91NqlcKYyU6eE6jpuI5Uc8XuHEtkKC6R98IFs354Js73J7/ezl/EQg
	 FkvtqMyMGY+j366uS40SByoBG2cWxehsAejiXvqsg9KETxDfZ7NJYdAXRpN2iiOBEC
	 ZTYm/Qbkyjn2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/17] media: rockchip: rga: move core initialization
 from bind to probe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:20:16 +0000
Message-Id: <20260605222016.84C581F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] NULL pointer dereference in `rga_isr()` due to early shared IRQ re=
gistration.
- [Medium] Missing `pm_runtime_disable()` on `component_add()` error path.

Pre-existing issues:
- [High] Unprotected hardware access in shared interrupt handler.
- [High] Missing `synchronize_irq()` in runtime suspend for shared IRQs.
- [High] Use-After-Free when the master device is unbound.
- [High] Missing NULL check for `devm_kzalloc` allocation.
--

commit 8a3476b206ac8426da5cf08410222d4a74238c92
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move core initialization from bind to probe

This commit moves the core initialization from the core binding function to
the core probing function to better match the actual initialization sequenc=
e.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 952377ae467f5..0413b8518dfc8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -740,21 +740,49 @@ static int rga_parse_dt(struct rga_core *core)
> =20
>  static int rga_core_probe(struct platform_device *pdev)
>  {
>  	struct rga_core *core;
>  	const struct rga_hw *hw;
>  	int ret =3D 0;
>  	int irq;
> =20
>  	if (!pdev->dev.of_node)
>  		return -ENODEV;
> =20
> +	hw =3D of_device_get_match_data(&pdev->dev);
> +	if (!hw)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n"=
);
> +
>  	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> -	core->rga =3D rga;
>  	core->dev =3D &pdev->dev;

[Severity: High]
This isn't a bug introduced by this patch, but does this devm_kzalloc()
allocation need a null pointer check?

If the allocation fails under memory pressure, the immediate assignment to
core->dev =3D &pdev->dev will cause a null pointer dereference.

[ ... ]

> @@ -775,7 +803,7 @@ static int rga_core_bind(struct device *dev, struct d=
evice *master, void *data)
>  	}
> =20
>  	ret =3D devm_request_irq(core->dev, irq, rga_isr,
> -			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
> +			       hw->has_internal_iommu ? 0 : IRQF_SHARED,
>  			       dev_name(core->dev), core);

[Severity: High]
Since devm_request_irq() is now called here in rga_core_probe(), could this
trigger an early null pointer dereference in rga_isr()?

When hw->has_internal_iommu is false, the interrupt is registered as
IRQF_SHARED. For shared interrupts, the handler can be invoked immediately =
by
another device sharing the line. However, core->rga is not initialized until
rga_core_bind() runs later.

If the interrupt service routine fires early, it will evaluate
rga->hw->handle_irq(core) and unconditionally dereference the null core->rga
pointer.

[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler safely
access hardware registers?

Because rga_isr() is registered as IRQF_SHARED, it can be invoked by another
device while this device is runtime-suspended and unclocked. The handler
unconditionally calls rga->hw->handle_irq(core), which accesses registers.
Reading powered-off registers typically causes a synchronous external abort.

Should the interrupt service routine use pm_runtime_get_if_active() before
accessing registers?

[Severity: High]
This is another pre-existing issue related to the shared interrupt, but is
there a missing synchronize_irq() in the runtime suspend path?

In rga_runtime_suspend(), clocks are disabled without synchronizing the
interrupt. If an interrupt fires on another CPU just before clocks are
disabled, the handler could actively read registers exactly when the hardwa=
re
is powered down.

[Severity: High]
This is a pre-existing issue, but could tying the shared interrupt to the
core device lifetime cause a use-after-free when the master device is
unbound?

The shared interrupt is requested via devm_request_irq(core->dev, ...). When
the master device is unbound, its rga structure is freed. Since the core
device is not removed during unbind, the devm-managed interrupt is not free=
d,
leaving the shared handler active.

A subsequent interrupt will execute rga_isr(), which dereferences the
freed core->rga pointer.

[ ... ]

> @@ -833,11 +825,20 @@ static int rga_core_probe(struct platform_device *p=
dev)
> =20
>  	ret =3D component_add(&pdev->dev, &rga_core_ops);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to register component: %d", ret);
>  		return ret;
>  	}

[Severity: Medium]
If component_add() fails, does this bypass the pm_runtime_disable() cleanup
at the err_put_clk label?

Returning directly instead of using a goto would leak the device's Runtime
PM usage counter.

>  	return 0;
> +
> +err_put_clk:
> +	pm_runtime_disable(core->dev);
> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D12
