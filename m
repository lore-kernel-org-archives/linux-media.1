Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E1B39FCBC
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780135723; cv=none; b=L4cbVF+TNkqtMZLLedxk1lVrsKMy7rBMdp5wOUuT1rlWpuDd9Pwma3WC6qiExcUg6BHqMijuoD5dxczX6eectneX9rxviLxzxAsOeuYKp/8+B9kuMU8ZY/W976jUgKs9uj5y7+DUK1LkQxyukluHpKDYNQJ7OczqR3AIiRgyMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780135723; c=relaxed/simple;
	bh=L7nXl/jLMJ4TR4Gt1FvYER++wotIdHEXyHX++Ek0frY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uSc7SjsF2pMg26jzrONir9Tdqgb/SY38fj6Wih8PkJDb5WrUaAI7LGVbrs8kyVwxlHEl8SUYLLU8lV8tUxlCTHoI3SVTavNrK9RGFeRAsPYiYV4oJZq/wbYIffa4ukZAdiLDTS5X8KSeSZEmvo5iBbUEsepdXGlBSMeRkzpO1Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6ZNjcPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6ZNjcPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEBA1F00893;
	Sat, 30 May 2026 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780135721;
	bh=DdZxvQ1J2j1ZQD+RC8+xMTWpjiq1Cv5iA9azp4IKyc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B6ZNjcPYum7VyxvMIfVBCHjIMFPeXmFkBTShfta51OFXQsp3OS/FAJ3a+fecX0BbX
	 N6CgHcTOPOGri43CQW/A1WAaUapZOkMkN1Nq6cghh19YxyTxDEI4xenQf0BEoa+YMe
	 BXgY/eWNdFu+i2oYpORn+F/NSjGGIDu8Z5kcXyYM1bgm4iGGiMpdeQYMhtAIcTa+Qb
	 XO2mSwOSt+SGuxv4d8YeGtFaTXg54wtfcaq3B+ebFtjSvMBHJpx4qkwpjqV187OlQb
	 bXsoxKEFmlv0v8S1xLYZJwEpmuykmpwxAfg7jOixOpsNtv9pO+9fLB4wsvlZMXP9bC
	 7NsvkCa91RL3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/8] media: meson: vdec: Fix concurrent STREAMON /
 STREAMOFF race conditions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-media@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-3-linux.amoon@gmail.com>
References: <20260530094326.11892-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 10:08:41 +0000
Message-Id: <20260530100841.9CEBA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Premature clearing of `core->cur_sess` causes concurrent hardware =
accesses.
- [High] Unconditionally setting `sess->status =3D STATUS_STOPPED` during `=
STREAMOFF` breaks dynamic resolution changes (DRC).
--

commit bb4b11ce2f674461952a82e3ffa257bb828dacb8
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race conditions

The Meson VDEC driver=E2=80=99s start/stop streaming paths previously
updated core->cur_sess and sess->status without synchronization,
leaving a race window between concurrent STREAMON/STREAMOFF calls.
This patch introduces proper locking discipline to prevent TOCTOU races
and ensure consistent session lifecycle management.

Closes: https://lore.kernel.org/all/20260525104345.C8D501F00A3C@smtp.kernel=
.org/

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 4ffebba2341d4..7233000e22323 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c

[ ... ]

> @@ -399,10 +418,23 @@ static void vdec_stop_streaming(struct vb2_queue *q)
>  	struct amvdec_codec_ops *codec_ops =3D sess->fmt_out->codec_ops;
>  	struct amvdec_core *core =3D sess->core;
>  	struct vb2_v4l2_buffer *buf;
> +	enum amvdec_status old_status;
> =20
> -	if (sess->status =3D=3D STATUS_RUNNING ||
> -	    sess->status =3D=3D STATUS_INIT ||
> -	    (sess->status =3D=3D STATUS_NEEDS_RESUME &&
> +	/*
> +	 * Safely snapshot the status and clear the hardware owner inside
> +	 * the mutex to prevent data races with concurrent STREAMON requests.
> +	 */
> +	mutex_lock(&core->lock);
> +	old_status =3D sess->status;
> +	if (core->cur_sess =3D=3D sess)
> +		core->cur_sess =3D NULL;

[Severity: High]
Does prematurely clearing core->cur_sess here open a race window for concur=
rent
hardware accesses?

Since the lock is dropped immediately after this block, another session can
call vdec_start_streaming(), acquire the lock, claim core->cur_sess, and ca=
ll
vdec_poweron().

Meanwhile, the old session continues executing vdec_stop_streaming() and
reaches vdec_poweroff(sess), which calls vdec_wait_inactive(sess) and can
sleep for up to 50ms while the hardware shuts down.

Does this result in vdec_poweron() and vdec_poweroff() executing
concurrently on the same hardware without synchronization?

(Note: A later commit in this series, "media: meson: vdec: Fix NULL pointer
dereference in ISR handlers", addresses an ISR dereference during this
window, but it does not appear to resolve this underlying concurrent
initialization and teardown race.)

> +	sess->status =3D STATUS_STOPPED;

[Severity: High]
Does unconditionally setting sess->status =3D STATUS_STOPPED break dynamic
resolution changes (DRC)?

During DRC, the hardware sets sess->status =3D STATUS_NEEDS_RESUME, and
userspace responds by stopping the capture queue (STREAMOFF). If we overwri=
te
sess->status to STATUS_STOPPED here, the subsequent STREAMON from userspace
will check this in vdec_start_streaming():

    if (sess->status =3D=3D STATUS_NEEDS_RESUME &&
        q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
        sess->changed_format) {
        codec_ops->resume(sess);
        sess->status =3D STATUS_RUNNING;
        return 0;
    }

Because the status is now STATUS_STOPPED, does this bypass the fast resume
path and fall through to a full re-initialization?

This appears to cause the reallocation of the 16MB vififo DMA buffer (leaki=
ng
the original 16MB allocation which was never freed) and spawn a duplicate
recycle_thread (leaking the running thread).

> +	mutex_unlock(&core->lock);
> +
> +	/* Evaluate the hardware state using our snapshot */
> +	if (old_status =3D=3D STATUS_RUNNING ||
> +	    old_status =3D=3D STATUS_INIT ||
> +	    (old_status =3D=3D STATUS_NEEDS_RESUME &&
>  	     (!sess->streamon_out || !sess->streamon_cap))) {
>  		if (vdec_codec_needs_recycle(sess))
>  			kthread_stop(sess->recycle_thread);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D2
