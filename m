Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D85F23A9BD
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550501; cv=none; b=si1ZPr635gHlhF4yAEkt2XRR9/6h7e0QzEiDWUFz2LkNarH5Qa6y8kXI8eDXcy5mynp0F3Za2z4ZAGBU/k/ZoC8kdHQtqSbwl5yrOImW8hRgOAPnYpLx7V1zK1uvMlJPwBkmEg83z68U2KiTnBC1VNCSRJOcD8Q0zSOsiKuc7h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550501; c=relaxed/simple;
	bh=dZ0CDO9Hb3H4d4UBBFtGubsD02QxucWVNK7geN88om0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XooyzPa20pbodWO4IUZTyiR7KShgdCBDe8kGBDXMJgKZ0R21uGcMpq75EohAysa812/yQvGUQ3T1qLZpWiS5TFfDnAQ2cV4JRBKFQVVhhSK+DE7eqsGbTkOBq+8quGeT1JrNwT8p9Z6HaX+qg590wbkRCXhmgXy5G2NN8yCZl5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNDo//H7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNDo//H7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1E31F00893;
	Thu,  4 Jun 2026 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780550500;
	bh=F7Ri6rA8QHCzCTMC+3YlgJ/CWLiNgMvItfHHyacnax8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNDo//H7iIoQ8BdYJz/dtihRlhVMSb4CWjvDs0XiiR4n3D+iQ8rksZD6zFbdvYLku
	 kqeC/OiydS8fNc1mwhajcWk1u6jlIHiEa9z4jFbYdL7MvSdhFoklPu+u4dCAQrCc9i
	 Z1meqKQ93sCFrxD2JjNhFLdQUUbofiv0G53fgftOwYJ1OlPEP6FF6NSeJwifQYDzNX
	 W1dIH5SX1jTtwLOrHz7+T7YWiPZy6wfgn67gLEjfF/kArRrcvxlNs5hSAVvY3bm/DF
	 myD3FbXDRbtURz3p/qXADrF7jXWOt52ys3wOYhMjySI2ZXOncG0/efEgzZlZxac/eS
	 hEqYqU8Dhsehg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: qcom: iris: handle runtime PM resume failure
 in core deinit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604050451.41583-1-dennylin0707@gmail.com>
References: <20260604050451.41583-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 05:21:39 +0000
Message-Id: <20260604052140.0A1E31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] V4L2 file descriptors outlive the devm-allocated `iris_core`, =
leading to a Use-After-Free and use of a destroyed mutex during device unbi=
nd.
- [High] The delayed work `core->sys_error_handler` is not cancelled before=
 the driver is removed and its memory is freed, leading to a Use-After-Free.
- [High] The threaded IRQ handler accesses hardware registers without verif=
ying the device's PM runtime state, causing a synchronous external abort.
- [High] Manual hardware power-on bypasses the PM runtime framework, leadin=
g to state desynchronization and a double-enable bug.
--

commit c7ce3ea6452bd787828d7a9a38e6b47c68475a5e
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: handle runtime PM resume failure in core deinit

This commit checks the return value of pm_runtime_resume_and_get() in
iris_core_deinit(). If runtime PM resume fails, it skips hardware power-off
operations but still performs software teardown. It also skips the
corresponding pm_runtime_put_sync() call to avoid unbalanced references.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index e6141012cd3dd..68d697638a262 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -12,18 +12,24 @@
> =20
>  void iris_core_deinit(struct iris_core *core)
>  {
> -	pm_runtime_resume_and_get(core->dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(core->dev);
> =20
>  	mutex_lock(&core->lock);
>  	if (core->state !=3D IRIS_CORE_DEINIT) {
>  		iris_fw_unload(core);
> -		iris_vpu_power_off(core);
> +
> +		if (!ret)
> +			iris_vpu_power_off(core);
> +
>  		iris_hfi_queues_deinit(core);
>  		core->state =3D IRIS_CORE_DEINIT;
>  	}
>  	mutex_unlock(&core->lock);
> =20
> -	pm_runtime_put_sync(core->dev);
> +	if (!ret)
> +		pm_runtime_put_sync(core->dev);
>  }
> =20
>  static int iris_wait_for_system_response(struct iris_core *core)

[Severity: High]
This is a pre-existing issue, but is the delayed work core->sys_error_handl=
er
cancelled before the driver is removed?

In iris_probe(), core->sys_error_handler is initialized as a delayed work
item. During driver teardown in iris_remove(), there appears to be no call =
to
cancel_delayed_work_sync(&core->sys_error_handler):

iris_remove() {
    ...
    struct iris_core *core;
    ...
}

Because core is allocated using devm_kzalloc, the memory will be automatica=
lly
freed by devres immediately after iris_remove() returns.

If the delayed work is pending or executing concurrently, could it access
freed memory?

[Severity: Critical]
This is a pre-existing issue, but are V4L2 file descriptors outliving the
devm-allocated iris_core?

In iris_remove(), video_unregister_device() is called:

iris_remove() {
    ...
    video_unregister_device(core->vdev_dec);
    video_unregister_device(core->vdev_enc);
    ...
}

This removes the device node but leaves existing open file descriptors vali=
d.
Devres frees core when iris_remove() returns.

When userspace later closes a lingering open file descriptor, iris_close()
invokes iris_remove_session(), which accesses the freed inst->core pointer
and attempts to acquire the destroyed mutex:

iris_remove_session() {
    ...
    mutex_lock(&core->lock);
    ...
}

Could this lead to a use-after-free and use of a destroyed mutex during dev=
ice
unbind? Also, does the teardown order in iris_remove() introduce a race whe=
re
an open() call can pass the registration check just before the core structu=
re
is freed?

[Severity: High]
This is a pre-existing issue, but might the threaded IRQ handler access
hardware registers without verifying the device PM runtime state?

In iris_hfi_isr_handler(), the threaded IRQ handler accesses VPU registers
without calling pm_runtime_get_if_active():

iris_hfi_isr_handler() {
    ...
    mutex_lock(&core->lock);
    pm_runtime_mark_last_busy(core->dev);
    iris_vpu_clear_interrupt(core);
    mutex_unlock(&core->lock);
    ...
}

Concurrently, iris_pm_suspend() acquires core->lock, powers off the VPU,
disables the IRQ using disable_irq_nosync(), and then unlocks the mutex.

Because disable_irq_nosync() does not wait for a currently executing thread=
ed
handler to finish, the handler (which was blocked waiting for core->lock)
might resume execution immediately after PM suspend releases the lock.

Could the handler then access the registers of a powered-down device and
cause a synchronous external abort?

[Severity: High]
This is a pre-existing issue, but does manual hardware power-on bypass the =
PM
runtime framework?

When iris_sys_error_handler() runs asynchronously, it calls iris_core_deini=
t()
and then iris_core_init(). iris_core_init() manually invokes
iris_vpu_power_on() without acquiring a PM runtime reference:

iris_core_init() {
    ...
    ret =3D iris_vpu_power_on(core);
    if (ret)
        goto error_queue_deinit;
    ...
}

The PM framework therefore still considers the device suspended. Later, when
the PM framework transitions the device state, it triggers iris_pm_resume(),
which calls iris_vpu_power_on() a second time:

iris_hfi_pm_resume() {
    ...
    ret =3D iris_vpu_power_on(core);
    if (ret)
        goto error;
    ...
}

Could this double power-on leak clock and regulator reference counts and
trigger an unbalanced enable warning for the IRQ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604050451.4158=
3-1-dennylin0707@gmail.com?part=3D1
