Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C00313E10
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552837; cv=none; b=QCM30tt6oT6gijeRFoQgIHiV7i1/6lf6xQti2STx8wV6FHvmzqIGX6g2AqT0R9alQq0YRAo0O+l/Rlo5yeyOPCMoZU4++/oA54kDrTrObgLyPhDCLsAhdi5HzfiZGJUdYvbPPUyJJj8tCopgCoAWN2I7v//926jc/3n9De7Q61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552837; c=relaxed/simple;
	bh=K93OLnCsYP3NZz/D/CVsvBlUK6+bhtJ+oDDockI3QqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OxnLfuq2rqute4NsCcumqLMFDx+tWmPmUVclBDsiVTAWiSk2nFc7z33MPemcN2udn3TySfpv0iZmvRGQk03afJd+m+DBqWbm61FFeGenp1oOOR3ngr4ooGZDVfwBC8eRO5o2EjsEzoheaKvIOMCvwXvEWHaIvAa9s90x/lVm8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh/DnUzf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh/DnUzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E301F00893;
	Thu,  4 Jun 2026 06:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780552833;
	bh=YphTXpbN9L47dauY5sBmD3HhMTRAv+CpPI1wGqD5WHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wh/DnUzfvyC7SLAot78JEX/Jv2urdQJ14F32ty+0yVebw6WAjOVsRSqvhkps2BtQz
	 uMv+CmpTgYf0Alx55vG/YOYN3sepBj224DncL74TfpaP+d0cGvQLVrhlK0Gv7JYN/L
	 j0k9GqeFtK+wMFSPtPNBcNl5i3ekrmkQtud+0J5fLgbwsbOtilJrbrTY4BEcpcqMpo
	 c+Qkowh4wJ0if+39u0rHnC0BH7EaWa36VCwl7HTQ/bvMYKteF5MCj/NqQOpJycgKX8
	 UJAL678QeB4Us9nT6Is5cx3N8s2YR36dKYdI3SUdclaVcILJDfRvsfcmJJKLk7egnr
	 1EBCDhPYBT/jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: cancel sys error work on driver
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604054708.42426-1-dennylin0707@gmail.com>
References: <20260604054708.42426-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:00:32 +0000
Message-Id: <20260604060033.68E301F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lifecycle mismatch between devres-managed `core` structure and=
 V4L2 character devices leads to Use-After-Free.
- [High] Race condition between delayed work cancellation and threaded IRQ =
handler leading to Use-After-Free.
- [High] Asynchronous hardware teardown leads to fatal hardware access and =
Use-After-Destroy on mutexes.
- [High] Missing cancellation of `sys_error_handler` in the `iris_probe` er=
ror path leads to a Use-After-Free.
- [High] Immediate interrupt enablement in `iris_probe` causes a NULL point=
er dereference.
--

commit 42e74ceb2479f2e26f7d5aeeeb17dd1f6458aa28
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: cancel sys error work on driver removal

Cancel sys_error_handler before tearing down the driver.

The delayed work may still be pending when iris_remove()
runs. Since iris_core is allocated with devm_kzalloc(),
allowing the work to execute after driver removal could
result in accessing freed memory.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index d36f0c0e785b7..61c9d45b97f5b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -200,6 +200,8 @@ static void iris_remove(struct platform_device *pdev)
>  	if (!core)
>  		return;
> =20
> +	cancel_delayed_work_sync(&core->sys_error_handler);
> +

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
here if the hardware interrupts are not disabled before cancelling the
delayed work?

If a hardware interrupt fires during driver removal, the threaded IRQ
handler can execute concurrently and reschedule the work:

iris_hfi_gen2_handle_system_error() {
    schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
}

Because the cancellation has already returned in iris_remove(), the work
gets requeued. When the devres framework automatically frees the core
structure, the newly scheduled delayed work remains pending and could
access freed memory when the timer expires.

Should the IRQ be synchronized (e.g., via disable_irq()) before
cancelling the work?

[Severity: High]
This isn't a bug introduced by this patch, but does the iris_probe() error
path also need to cancel this delayed work?

Userspace could open the device and trigger iris_core_init() before
iris_probe() finishes, which enables hardware interrupts. If a system
error interrupt schedules the sys_error_handler, and a subsequent step in
iris_probe() fails, devres will free the core structure while the delayed
work remains pending.

Should cancel_delayed_work_sync() be added to the probe error path as well?

[Severity: High]
This isn't a bug introduced by this patch, but is the IRQ enabled too early
in iris_probe()?

The interrupt is requested using devm_request_threaded_irq() without
passing the IRQF_NO_AUTOEN flag. This implicitly enables the interrupt
line before core->hfi_sys_ops is fully initialized via init_hfi_ops().

A pending hardware interrupt could immediately trigger
iris_hfi_isr_handler(), which blindly dereferences
core->hfi_sys_ops->sys_hfi_response_handler. Does this result in a
NULL pointer dereference during probe?

>  	iris_core_deinit(core);

[Severity: High]
This isn't a bug introduced by this patch, but does the asynchronous
hardware teardown in iris_core_deinit() lead to a potential crash?

Inside iris_core_deinit(), the VPU is powered off via iris_vpu_power_off()
and disable_irq_nosync() is called. Because disable_irq_nosync() does not
wait for executing threaded handlers to finish, the threaded handler
(iris_hfi_isr_handler) may be blocked waiting on mutex_lock(&core->lock).

Once the lock is released by iris_core_deinit(), the handler wakes up and
calls iris_vpu_clear_interrupt(), which reads from the WRAPPER_INTR_STATUS
hardware register. Since the VPU hardware is powered off, could this
trigger a synchronous external abort?

> =20
>  	video_unregister_device(core->vdev_dec);
>  	video_unregister_device(core->vdev_enc);
> =20
>  	v4l2_device_unregister(&core->v4l2_dev);
> =20
>  	mutex_destroy(&core->lock);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is there a lifecycle
mismatch between the devres-managed core structure and the V4L2 character
devices?

The driver allocates the core structure using devm_kzalloc(), meaning
devres frees it automatically when iris_remove() returns. However, V4L2
video devices are exposed to userspace, which can hold file descriptors
open past the driver unbind event.

If userspace holds a file descriptor open and closes it after unbind,
iris_close() executes and accesses inst->core and inst->core->dev, which
have already been freed. Should the core structure be refcounted in the
vdev->release callback instead of relying strictly on devres?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604054708.4242=
6-1-dennylin0707@gmail.com?part=3D1
