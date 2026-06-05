Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAFE33D51A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698188; cv=none; b=OZww9lMC0Ogf0HAyElS2TAjui7v03eGpJgAcFwiGBgtxj26d/mYANYA0V2qL0pUUudS5cxcj8daSkRlof57uGlSQ6cFm1O1e8SNl5nbECOINAijdpM6UQ4LBFryzFJVytaQRcOGuyCf3WkYuW0qe7B0k5htCY0Jt/7aUZZcc0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698188; c=relaxed/simple;
	bh=iXc8xjwb3BNK8AeAE0FObf/v9N5K4Q1z4tOYpmmf9fc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VyP0qGbfdaL8YW97EOcFJYRhj4LabFGnMwNinay4OLCwRlUCZlD4ToAc0Or7/czLSMay90pRptAuWy45p08+9sgJSF5wEqdL2MKtqB11v40Vg23KzqUfBTJEJpqGKwCtlLp4a8KlP5rIVusoAS1NJL+oD6jPb6IWGH2BdTMQarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbXY/P8/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbXY/P8/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D41F00898;
	Fri,  5 Jun 2026 22:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698186;
	bh=o+QYJSWu2D8aSPH/lpN/8MDQN2QyZVuA0Ek0Ink0PZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EbXY/P8/bTsWm9oHfR8hwnhX1m15MI1VQ81HubgNq99fJh2UCdwmTlsCfVQAgOp1e
	 EO/wz8Qhr6HUWl0kQ+J80IZTL+CyMqsl7vszJ7mKwemGs0gzrz374mxdI/TQgi3c/X
	 377SfeKmAiP48scfsotdXAav+9Xcywt4weibbTYztGkMnWxj7gqY3hsAVTauXw613x
	 ZdK9k8HnIGk+I4x0wBn+mbliM9JUOET8l8qw9YL5cSKOSPojsBwoRt2j8H/jzs69ny
	 +U+KYqjf3kkzJA/zenuavwbd85Ozm6BtwUUHTHnNZGT4yR+/cYqDCCnWpX9V8lZ4b1
	 E40kaFBkzHYjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/17] media: rockchip: rga: bind all cores to the
 master
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:23:06 +0000
Message-Id: <20260605222306.B76D41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unbounded increment of `rga->num_cores` during component re-bindin=
g leads to a heap out-of-bounds write on `rga->cores`.
- [High] Missing `component_unbind_all()` in the error paths of `rga_bind()=
`.
- [Medium] Missing `pm_runtime_disable()` when `component_add()` fails in `=
rga_core_probe()`.

Pre-existing issues:
- [High] Missing protection against shared interrupts while the device is r=
untime-suspended causes invalid hardware accesses.
- [High] Prematurely freeing `m2m_dev` in `rga_unbind` causes a use-after-f=
ree when open file descriptors are subsequently closed or used concurrently.
--

commit 89fd9460c00f5ff4577ab76e9bec7d1677f60844
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: bind all cores to the master

This commit modifies the RGA driver to bind all core components to the
master device instead of only the first one. It ensures all added cores
report the same hardware version before initialization.

> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -750,14 +751,21 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
[ ... ]
>  	pm_runtime_put(core->dev);
> =20
> -	rga->cores[0] =3D core;
> +	rga->cores[rga->num_cores++] =3D core;

[Severity: High]
If the master device is unbound and then re-bound, does this continuously
increment rga->num_cores without bounds checking?

Looking at rga_unbind(), rga->num_cores is never reset to 0. If a re-bind
occurs, could this write the core pointer out-of-bounds into adjacent heap
memory?

[ ... ]

[Severity: High]
If component_bind_all() succeeds in rga_bind(), but a subsequent step like
v4l2_device_register() fails, the function returns the error directly:

rga_bind() {
    ...
    ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
    if (ret)
        return ret;
    ...
}

Does this skip calling component_unbind_all()? If so, could this permanently
leak the component bindings, and if retried, cause rga_core_bind() to execu=
te
again and increment rga->num_cores out-of-bounds?

[Severity: Medium]
In rga_core_probe(), pm_runtime_enable() is called, but if component_add()
fails:

rga_core_probe() {
    ...
    ret =3D component_add(&pdev->dev, &rga_core_ops);
    if (ret < 0) {
        dev_err(&pdev->dev, "failed to register component: %d", ret);
        return ret;
    }
    ...
}

Will returning directly here instead of jumping to the err_put_clk cleanup
label leak the runtime PM enablement state for the device?

[Severity: High]
This is a pre-existing issue, but the driver uses a shared IRQ (IRQF_SHARED)
when lacking an internal IOMMU. The interrupt handler rga_isr() accesses
hardware registers without checking if the device is active:

rga_isr() {
    ...
    if (rga->hw->handle_irq(core)) {
    ...
}

Additionally, rga_runtime_suspend() disables clocks without synchronizing:

rga_runtime_suspend() {
    ...
    clk_bulk_disable_unprepare(core->num_clks, core->clks);
    ...
}

Should rga_isr() use pm_runtime_get_if_active() before access, and should
rga_runtime_suspend() call synchronize_irq() to prevent unclocked hardware
access if a shared interrupt fires while the device is suspended?

[Severity: High]
This isn't a bug introduced by this patch, but rga_unbind() frees the
memory-to-memory device structure prematurely:

rga_unbind() {
    ...
    v4l2_m2m_release(rga->m2m_dev);
    video_unregister_device(rga->vfd);
    ...
}

If userspace applications still hold open file descriptors, closing them
later triggers rga_release() which calls v4l2_m2m_ctx_release(). Can this
lead to a use-after-free when dereferencing the already freed m2m_dev?
Might it be safer to defer the release of m2m_dev until the final V4L2
release callback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D13
