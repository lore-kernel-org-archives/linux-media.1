Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE983D9DB9
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562177; cv=none; b=Mskek7HDq3kBiGQDJ9L0b1cH1f79hiJs78DHkHkCUsXbCzOoYRv9HEqU3pDNPX0hSva1c8gz0fHSeTWSBr1S5JhwFgta6V5JQgfO4EcgmvF0+drFiuFhf8fpmZnQnDWhTjDgxu0oaSc8Z2olrUCMwpxXPPS1bjHzXXVObzvc58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562177; c=relaxed/simple;
	bh=88u3hU2dZrdqDnW2V+y06PzrbgJRcD2awlyMZkrZm7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQGWC97dMxFvuR0ZlkYN1bidKGLyeQOlLNWGcPrVpYbgAgKU/ZXjr7be43Tp5Hv5Z6JAF96/pWJpCTsx73bSocRGyBLxi3owkW+ia+AkNtvKlwmQMXukd7QXm5ByDaggk0VlToRMyNdcTdxB44xGgJaNIiMHdNRvLE8bU1v1BeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRzxMCFD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRzxMCFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600CD1F00893;
	Thu,  4 Jun 2026 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562174;
	bh=FXIiBjxDO6rPaOX3Jo4Ms63CMVeTQmBgLBYLv/lqgDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRzxMCFDqNBml4CzAzNoh4iYBCPJXnUhzQIlECxZ+0+oKyjDeARerw/hXqrPwZE9+
	 3T7B6dnxliqvVo3cYk3vqx651fiSEwiuVlK6D1+9Kb+j6WBqigUkgAyiYeKlcX33Nj
	 qAZ5HZHug1psHwoLZXtK8i3p/KCmSZGCSgcLFlxJSeZYxOzrv7BfKVEZddMdgKtASf
	 kd8GQBqt842pE6aTVFi/XWrg8JVokwxn9TeBX+fSA5DKVmN5kxCGndWJjuhdkMTbTB
	 379Nv8kqnk58504tUvkbItrBo/evf+Ka+D8XbpI8BN2rO3t6hqmQhzl/1kKH2SYVC6
	 mq+NopBTdu9fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604082510.45733-1-dennylin0707@gmail.com>
References: <20260604082510.45733-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:36:13 +0000
Message-Id: <20260604083614.600CD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Early return from threaded IRQ handler skips enable_irq(), per=
manently masking the interrupt and completely breaking CONFIG_PM=3Dn builds.

Pre-existing issues:
- [High] Tearing down shared queues and destroying locks in iris_remove() w=
ithout synchronizing the threaded IRQ leads to Use-After-Free.
--

commit 21ac80fbe9eb1a25413cc6f4a32a9f240d73c9b7
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: guard IRQ handler with runtime PM check

This commit adds a runtime PM check to the threaded IRQ handler using
pm_runtime_get_if_active(). It skips interrupt processing if the device
is not active and autosuspends the device after processing.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers=
/media/platform/qcom/iris/iris_hfi_common.c
> index 621c66593d88d..59040cce8cf16 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -100,10 +100,15 @@ irqreturn_t iris_hfi_isr(int irq, void *data)
>  irqreturn_t iris_hfi_isr_handler(int irq, void *data)
>  {
>  	struct iris_core *core =3D data;
> +	int ret;
> =20
>  	if (!core)
>  		return IRQ_NONE;
> =20
> +	ret =3D pm_runtime_get_if_active(core->dev);
> +	if (ret <=3D 0)
> +		return IRQ_NONE;
> +

[Severity: Critical]
Does this early return permanently mask the interrupt?

The top-half handler iris_hfi_isr() calls disable_irq_nosync() before
waking this threaded handler. By returning early here in
iris_hfi_isr_handler(), does the code skip the enable_irq() call at the end
of the handler and leave the interrupt permanently disabled?

Additionally, on builds without CONFIG_PM, pm_runtime_get_if_active()
always returns -EINVAL. Will this cause the handler to unconditionally
return early on the first interrupt?

>  	mutex_lock(&core->lock);
>  	pm_runtime_mark_last_busy(core->dev);
>  	iris_vpu_clear_interrupt(core);
> @@ -111,6 +116,8 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
> =20
>  	core->hfi_response_ops->hfi_response_handler(core);
> =20
> +	pm_runtime_put_autosuspend(core->dev);
> +
>  	if (!iris_vpu_watchdog(core, core->intr_status))
>  		enable_irq(irq);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for this
threaded handler to execute after the queues and locks are destroyed during
device removal?

During device removal, iris_remove() calls iris_core_deinit() which disables
the IRQ via disable_irq_nosync() and frees the queues using
iris_hfi_queues_deinit(). Since disable_irq_nosync() does not wait for an
executing threaded handler to complete, could iris_hfi_isr_handler() run
concurrently and attempt to access the freed queues or the destroyed lock?

Would calling synchronize_irq() before tearing down these software structur=
es
prevent this use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604082510.4573=
3-1-dennylin0707@gmail.com?part=3D1
