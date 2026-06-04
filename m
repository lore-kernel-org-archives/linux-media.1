Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAF3DE446
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559224; cv=none; b=oC3r7e0IFeo76NbOYCUDxrJplxUqVBTmPcP50CTahlnTiAv/xtsc2uTVzFJ2zJovGd3prcodtx4MqWruv+nzAm2h+xnsLaQIVOlAao/LkUGNdZt7wjbQXAIMd5GoHHOx8hg7/gh9+Bv3Fznje68J+Tr9Nzc9Cca6i2qgtCV8nhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559224; c=relaxed/simple;
	bh=NIRk0RlhVFEpt+T7Di6QJS/PQ2kWdW1nVnl4faz+98M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MmLfJQRY3kOn7H4K/6NPUrmJ/s+qAbJ5UejEshXJDWD9AnxHKPA9IsMXKw+bVJ8GwyPRqcntDpPiBAs+/IUk4cypKrPVfR73XfRfSwxoR9pBvONiQzqC0sOIg6CePMCIPEZYwfwBNQaxSQ1N0r6yT4c2UJUgGL0fYnCiiN/fUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9/+xcvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9/+xcvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD8F1F00893;
	Thu,  4 Jun 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780559222;
	bh=iqI6xTE//5ZT21TArXJACX2wmdj3DnE9rBO12nYClY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9/+xcvyXnzOPTi+bKjRvNpe4xC2xLl1VfdyIZ0vCQyr4Ynarq8pJmXwesPCYTt21
	 al3WK101NiHfASKifNbxm3xf+aWC1LNP94I9fUXWdhpc0O2NNYlT55RG0w0iV4R8nH
	 gX0RsfKIZbMn7XoaqjQXgS4r8bcXpCT0HP4smVov1iPhj/V2mChqILIJelUOY+mP8I
	 ucNoyZS/jftK0B53lsjBe4ij8XMySLLlCj/IkZ+CMAdS7PuSBmAMBt1LCX5d/EDHVn
	 IiXay1x75yRETX/s9YkkrBDkEXLP7CnyIcHqcEGYidiOeuo24wJiaPA2mv2M6VcW/a
	 fhQrMjCwfl3MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: qcom: iris: guard IRQ handler with runtime PM
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604072824.45448-1-dennylin0707@gmail.com>
References: <20260604072824.45448-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:47:02 +0000
Message-Id: <20260604074702.9DD8F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Unmasking a level-triggered IRQ without clearing the interrupt=
 source when pm_runtime_get_if_active() returns <=3D 0 causes an infinite i=
nterrupt storm and potential system deadlock.
- [High] core->intr_status is read locklessly after dropping the Runtime PM=
 reference, causing a race that leads to unbalanced enable_irq() and potent=
ially missing watchdog errors.

Pre-existing issues:
- [High] Missing cancel_delayed_work_sync() for sys_error_handler in driver=
 removal path leads to Use-After-Free.
--

commit 0c8846847b29684af89fca24c8cacbe7c8cb8ceb
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: guard IRQ handler with runtime PM check

This commit adds a runtime PM check to the threaded IRQ handler using
pm_runtime_get_if_active(). It skips interrupt processing if the device
is not active, preventing hardware access on suspended devices.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers=
/media/platform/qcom/iris/iris_hfi_common.c
> index 621c66593d88d..1c05f83986fe2 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -100,10 +100,17 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
>  irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  {
>  	struct iris_core *core =3D data;
> +	int ret;
> =20
>  	if (!core)
>  		return IRQ_NONE;
> =20
> +	ret =3D pm_runtime_get_if_active(core->dev);
> +	if (ret <=3D 0) {
> +		enable_irq(irq);
> +		return IRQ_NONE;
> +	}
> +

[Severity: Critical]
Is it safe to unmask the IRQ without clearing the hardware source first?

Because the interrupt is level-triggered, if pm_runtime_get_if_active()
bails out (for instance, during RPM_RESUMING transitions or if CONFIG_PM
is disabled), calling enable_irq() without clearing the interrupt via
iris_vpu_clear_interrupt() might trigger an immediate interrupt storm.=20

Would this cause the CPU to lock up in an infinite loop?

>  	mutex_lock(&core->lock);
>  	pm_runtime_mark_last_busy(core->dev);
>  	iris_vpu_clear_interrupt(core);
[ ... ]
> @@ -111,6 +118,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
> =20
>  	core->hfi_response_ops->hfi_response_handler(core);
> =20
> +	pm_runtime_put_autosuspend(core->dev);
> +
>  	if (!iris_vpu_watchdog(core, core->intr_status))
>  		enable_irq(irq);
> =20

[Severity: High]
Does dropping the runtime PM reference before checking core->intr_status
introduce a race condition?

If the device autosuspends immediately after pm_runtime_put_autosuspend()
and is concurrently resumed, the resume path could clear core->intr_status
and call enable_irq() before iris_vpu_watchdog() runs here.=20

If the threaded handler then reads the newly cleared core->intr_status (0),
would it execute an unbalanced enable_irq() and potentially miss watchdog
errors?

> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
[ ... ]
> static void iris_remove(struct platform_device *pdev)
> {
> 	struct iris_core *core;
>=20
> 	core =3D platform_get_drvdata(pdev);
> 	if (!core)
> 		return;
>=20
> 	iris_core_deinit(core);
>=20
> 	video_unregister_device(core->vdev_dec);
> 	video_unregister_device(core->vdev_enc);
>=20
> 	v4l2_device_unregister(&core->v4l2_dev);
>=20
> 	mutex_destroy(&core->lock);
> }

[Severity: High]
This isn't a bug introduced by this patch, but does iris_remove() need to
call cancel_delayed_work_sync() for sys_error_handler before destroying the
lock and returning?

Because the core structure is allocated with devm_kzalloc, devres will free
it after iris_remove() completes. If there is pending sys_error_handler
work, could it execute after the memory is freed or the mutex is destroyed,
leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604072824.4544=
8-1-dennylin0707@gmail.com?part=3D1
