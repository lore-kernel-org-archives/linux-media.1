Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B1376475
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317756; cv=none; b=IfnNt+tEqyfgbUXBW6RqV1YDiCCBrLdUkudnYDQauYJ4y52VXTXaAp0cfhUzpHUXFDQP4FJQB9sxODZIfn7b4kX8jJg58njVnAS1nR+XJgWJoinqiGOFN6KzTENO9nK3XndBygfwdXJvNucQq03ckd1hvnUraWNg7Ut6080IUlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317756; c=relaxed/simple;
	bh=IvkgtxQ7+PbfrfoOIbEdPZVhBBEbjZfA1Dx2gvNgz84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CHWPg66ZQxSqOgQVTSCaj6HLZSg1d/NhAcLxFQ/81vpRU2o3OZIl7SMAgCzG2CXMq1/Y3DbJ6ehnWVA/jpOrR7GQYL8FvsZ0pyVoPZqwb2JKFNwc/2V5OQTvspapacRw0Xl1jH9EGuqXrIOCbRcOG2Eit6DyRfHUcMqGjjyT0Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izel4IX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izel4IX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A04C1F00893;
	Mon,  1 Jun 2026 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780317755;
	bh=qWz+k/HyawiYYlvM7cwLwFl6FkVRIxKivYsLq6O08o0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izel4IX6b+vpsvUSoF20XmRXo3E9W18bVtX1x7xpH+4q5Y+3g1lvk+L2PKHht3YaS
	 0k3aauqOV05r5EmvCU714AIWZ0Lfm+G5vDffYsDbmyAc0qv1OQrojQzlue6BAcsj2c
	 zmqfcmPO7LkB5oVxn/9GCqZGwFkmyyB0Bt/SslH2CYMOCcthmNbeJsl+X4vmkXoI1n
	 h1/B62ymNmfm/Eg7+SlfMuiK6XfvDryzIT/k1z3uUEu7EV0UUXey409nuOCBfzlryH
	 REggRB/rL4jHG1w3IEkV5dWv4lccr4dtNvoHGZto7VEh1vOKuLAPLjoqUgTnYhzI9E
	 tB8AWSnZ5IfKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: as102: fix memory leak on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601122215.1330897-1-lgs201920130244@gmail.com>
References: <20260601122215.1330897-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 12:42:34 +0000
Message-Id: <20260601124235.1A04C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting Use-After-Free of `as102_dev` due to concurrent DVB fr=
ontend operations and USB device disconnection.
- [High] Mutexes are used before they are initialized, causing a potential =
crash when DVB devices are opened immediately after registration.
- [Medium] Missing `dvb_frontend_detach()` on `dvb_register_frontend()` fai=
lure leads to memory leak of the frontend structure.
--

commit d8c0092bf722801bd5c98a890b9cfff26add7e94
Author: Guangshuo Li <lgs201920130244@gmail.com>

media: as102: fix memory leak on probe failure

This commit fixes a memory leak in as102_usb_probe() that occurs when
usb_register_dev() succeeds but subsequent stream buffer allocation or
DVB registration fails. It drops the initial reference with kref_put()
in the error paths instead of leaving the device leaked.

> diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/=
as102/as102_usb_drv.c
> index a11024451cebd..dfe5a6b3f97b3 100644
> --- a/drivers/media/usb/as102/as102_usb_drv.c
> +++ b/drivers/media/usb/as102/as102_usb_drv.c
> @@ -405,11 +405,11 @@ static int as102_usb_probe(struct usb_interface *in=
tf,
>  failed_stream:
>  	usb_set_intfdata(intf, NULL);
>  	usb_deregister_dev(intf, &as102_usb_class_driver);
> +	kref_put(&as102_dev->kref, as102_usb_release);
>  	return ret;
>  failed:
> -	usb_put_dev(as102_dev->bus_adap.usb_dev);
>  	usb_set_intfdata(intf, NULL);
> -	kfree(as102_dev);
> +	kref_put(&as102_dev->kref, as102_usb_release);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but there appears to be a use-after-free
when the USB device is disconnected during active DVB frontend operations.

The as102 driver increments the kref when the USB character device is
opened, but the DVB subsystem doesn't increment it when userspace opens
DVB device nodes. When physically disconnected:

drivers/media/usb/as102/as102_usb_drv.c:as102_usb_disconnect() {
    ...
    dvb_unregister_frontend();
    ...
	/* decrement usage counter */
	kref_put(&as102_dev->kref, as102_usb_release);
}

Since dvb_unregister_frontend() does not block waiting for active frontend
file descriptors to close, the final kref is dropped and as102_dev is freed.

If an ioctl like FE_SET_FRONTEND is currently executing:

drivers/media/usb/as102/as102_drv.c:as102_set_tune() {
    ...
	/* Set frontend arguments */
	if (mutex_lock_interruptible(&bus_adap->lock))
		return -EBUSY;
    ...
}

Does this concurrent access to bus_adap->lock and bus_adap->usb_dev from a
freed structure allow memory corruption or a panic?

[Severity: Medium]
This isn't a bug introduced by this patch, but there seems to be a memory
leak in the frontend registration error path.

In as102_dvb_register(), if dvb_register_frontend() fails, the error
path cleans up the demux and adapter:

drivers/media/usb/as102/as102_drv.c:as102_dvb_register() {
    ...
efereg:
	dvb_dmxdev_release(&as102_dev->dvb_dmxdev);
edmxdinit:
    ...
}

This misses calling dvb_frontend_detach(as102_dev->dvb_fe). Does this
cause the dynamically allocated frontend state to leak and fail to
decrement the frontend module reference count?

[Severity: High]
This is a pre-existing issue, but the mutexes in the DVB registration
path appear to be initialized too late.

In as102_dvb_register(), the device nodes are exposed to userspace before
the mutexes are initialized:

drivers/media/usb/as102/as102_drv.c:as102_dvb_register() {
    ...
    dvb_dmxdev_init();
    dvb_register_frontend();
    ...
	/* init bus mutex for token locking */
	mutex_init(&as102_dev->bus_adap.lock);

	/* init start / stop stream mutex */
	mutex_init(&as102_dev->sem);
    ...
}

If a user program or udev script immediately opens the demux node and
triggers a callback:

drivers/media/usb/as102/as102_drv.c:as102_dvb_dmx_start_feed() {
    ...
	if (mutex_lock_interruptible(&as102_dev->sem))
		return -ERESTARTSYS;
    ...
}

Will this attempt to lock an uninitialized, zero-filled mutex,
potentially triggering a kernel panic under contention or with lock
debugging enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601122215.1330=
897-1-lgs201920130244@gmail.com?part=3D1
