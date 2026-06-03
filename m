Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0F3A382B
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471377; cv=none; b=qSVgJKf7EVGncQCOPwx8+WRPOST1dMeH2xW17fmhQjysLuAvd7zIAqB7eXKu7rcaH4sY7DsPdlKUlFAZHlUTdIdXAXimtMQAWUTkMXFjw6ulExdHS/hJBP38vTJFFQKBV49j6sU0VPY2PAvUy7Y1dSDAPFmfNEtgcgt7SvxSFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471377; c=relaxed/simple;
	bh=MvvSqnkFdyWUR5ambE4XzUX+MN8NNAFyl42IZQVD7CQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U1OEjNCCHAyNoarN8gko2y+RwmGHctZi3mACkw7PDh1e952eofdoJD+yzvYNfGO0krvMY8jWJgQcjyQQUFZPoKSRhEvCGLFK6cVBHFb2f4X6M/1teuqVEcGUYwWH5FiZMSRr+qorcSh89Kc8AIbVXzdA8LFcdfR4KuMFUlX2D8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTVA94GQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTVA94GQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136481F00893;
	Wed,  3 Jun 2026 07:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471375;
	bh=+73oTgNYFcON+sf2k9Zug8JwqTvNtx994eITOlkln/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GTVA94GQXE1EdGJRuMu8ENecw2r5xJr9+N8Bes5up09lHOcz0d3fGRfKBjh+SrXuh
	 VtyJ1+H1wlEOeq8ygfvOe481UO1oAQyART005wHXegWLfdFx1sF1n+5miproiwc9w0
	 eoZcyXkURzQgdm/kZMYtmYo7ZPJyTxv0hsoASjxuYsig9DP0VFE81bZZSBwf3nFOvX
	 Wtod+gCVXfhQLOZT7wUTp3rABNEwJGJQgsj116WOuQ8yojV67cVH1rVCHKt9JzXHPs
	 mh2i99PgalveksIZmaM4IXy6lvps/EhYv7kL+/VrtgADY9EZ9QiAjVzxQAu7B2ITfE
	 6nfMYkhFG0Jhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/12] media: microchip-isc: fix race condition on
 stream stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-3-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-3-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:22:54 +0000
Message-Id: <20260603072255.136481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-destroy in `isc_async_unbind()` due to incorrect teardow=
n ordering.
- [High] Missing histogram disable and workqueue cancellation in the `isc_s=
tart_streaming` error path leads to a kernel panic.
- [High] Missing IRQ synchronization in `isc_stop_streaming()` leads to a s=
ynchronous external abort.
--

commit 9cf229b57997c74f4db26f1539c0b73c428dd501
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: fix race condition on stream stop

Disable histogram and drain AWB work queue before releasing DMA
buffers to prevent use-after-free if histogram IRQ fires during
stream stop.

Cc: stable@vger.kernel.org

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index 45b94f1e89d86..b19c5a63b4bdc 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -427,6 +427,14 @@ static void isc_stop_streaming(struct vb2_queue *vq)
> =20
>  	mutex_unlock(&isc->awb_mutex);
> =20
> +	/*
> +	 * Disable the histogram so the ISR stops firing HISREQ, then drain
> +	 * any work that was already queued before returning.  This must happen
> +	 * after releasing awb_mutex because isc_awb_work also takes it.
> +	 */
> +	isc_set_histogram(isc, false);
> +	cancel_work_sync(&isc->awb_work);
> +
>  	/* Disable DMA interrupt */
>  	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
> =20
>  	pm_runtime_put_sync(isc->dev);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed that device power =
is
synchronously disabled here without waiting for in-flight IRQs to finish
executing.

Because the interrupt is registered via devm_request_irq() without a call to
synchronize_irq() here, microchip_isc_interrupt() may already be executing =
on
another CPU when the clocks are disabled.

The ISR performs a regmap_read() on ISC_INTSR, which will crash the system
with a bus fault/external abort when attempting to read the unclocked
memory-mapped registers. Could we add a call to synchronize_irq() before
shutting down power?

[ ... ]

While reviewing this file, I noticed a couple of other pre-existing issues:

drivers/media/platform/microchip/microchip-isc-base.c:isc_start_streaming()=
 {
...
	ret =3D isc_configure(isc);
	if (unlikely(ret))
		goto err_configure;
...
err_configure:
	pm_runtime_put_sync(isc->dev);
...
}

[Severity: High]
This is a pre-existing issue, but the error path fails to call
isc_set_histogram(isc, false) and cancel_work_sync(), leaving the hardware
enabled and the workqueue vulnerable to accessing unpowered registers.

If isc_configure() succeeds (enabling the histogram hardware and its
ISC_INT_HISDONE interrupt) but a subsequent step times out, the error path
calls pm_runtime_put_sync() to power down the device clocks. It fails to
disable the histogram interrupt or cancel isc->awb_work.

The hardware can trigger the interrupt before or during shutdown, scheduling
the work. When isc_awb_work() runs, it bypasses the enabled check and calls
isc_hist_count(), which performs a regmap_bulk_read() on unpowered register=
s.
This causes a synchronous external abort (bus fault) and crashes the system.
Should this error path be updated to clean up the histogram state and
workqueue?


drivers/media/platform/microchip/microchip-isc-base.c:isc_async_unbind() {
...
	mutex_destroy(&isc->awb_mutex);
	cancel_work_sync(&isc->awb_work);
...
}

[Severity: High]
This is a pre-existing issue, but the mutex is incorrectly destroyed before
the asynchronous work using it is definitively flushed and cancelled.

The isc_awb_work handler fundamentally relies on isc->awb_mutex to serialize
its execution. If the work is running or scheduled when unbind is triggered,
the worker thread will attempt to lock a destroyed/poisoned mutex. Would it=
 be
safer to call cancel_work_sync() before mutex_destroy()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D3
