Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554773;
	b=g9eg41gekcRKVW5iZ9Zl3uSrqrY5SlaE4JFPV04b5i1MM46g+2gLig/p/mpCHF7p4gy0
	 AG6TqAZ6l7KiDo4BUKwW/qeN7xsHDz9cxSkpxSRgvkaoVrL1PXuXeSdlsg/4Zkjzpqpyf
	 mf70Fbl/Ijdrj1fn2hd+CsOShIzy6+5sej0kLDNbDacRIWbOc/0FGx8r9RZYV/pNDkLiv
	 LHaJW9KbEUren5l1kFHOgegiJxlQgrDOJ5GEa8cnPdkbxg1LTLchpKmuhIKvV+Odn6m4+
	 h7+pQCH9sy/7Tj7zd3Y6KN2DS1MZ4Nb2zSNfjd42pobRpjj4OrhcUmkKSlLuBv+KSuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=;
	b=BCDaUSAs/cXUOyEGFCV6FfqYuuGmFQY9KOZR7rTA3aDNcrfV1AgfT/XHkGjRTqJp8vBd
	 Jex589pRDW6rwArWC73XGyIKyQnAJm6GNlsKNIInZoHaFXmwFbPODvFcQEx7gDyqaHzIa
	 SByuK861alhI7xQi89YchPpqTDcSJk4W/wiylOyP2QeDW7ughrSY0e9yFVAI67lbKBhfY
	 NU8xZdikXsfuvdXxy7acDjunLhsnMWDGVG4+k+VCydwnwcqljk6QtYcVxaCK1Ttip350m
	 At3omuTFSRSLKqM641WZNeqC0q6WgAhLnk/DXHzc317HdxT9ucOXZBxePOXMslJwAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="B/XbRGDP";
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA859606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA859606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B/XbRGDP
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so524965785a.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554772; x=1796159572; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=;
        b=B/XbRGDPh5EqCzgru/wo8XUu1p18wW7qQft6tluFrk2QIA0eSAjeUyp3dhfmV2wx/o
         Y79IPVuD05vohcuTOQI2BOLXLDqbI3Rb6FAvVWfsr3LvNjebcOKh2yZufsYSzEU3ylcn
         6FxrS0SRal3BuzbQwYOHqe4KGpnj1ASKxNXkNrA5KSCAm779nPINimbOh5+xjTWmdfgR
         65uI292UiiQ0WGLu7m/XI5mdHpg9CHIt+TY1RhwTQ4ClISRtJYCT32ztyZMCSZCRZ8MB
         Lomn7SQKDlu8Tr8z2j10cTRuNvwVlCG2dVls3f8bsIXf8Ph3CHNXE/HnGMKZ9Sz2T6IZ
         uJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554772; x=1796159572;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58e55Dq73HKDPI7jbSEGjDb83KloozrgTme0p4JRxec=;
        b=M1pjyePIieR30mXfzevqs3FSCl8PAGbedqGGcDC3ZN+dQqbKjTvNQ5me52MKYwJW7+
         RI138skaeOlpGYiO8G7jupewZas7CZVUpHmfTqYGuWcAgY9jfwqgF/KRwufwV/KQcZ8g
         HTdvhu2XlZtQBCJTaNc9fQ+E0Nl4TgaMBcfxVoEgIiZL55G2lI5ZRL1rZ8zdvRpLVQ2/
         AEf5LR6DkuV1HDPDV20amXI+9R2QR+5KT82dVfae55ZxsejHZu0ubxvz+yXIlyTF82oa
         A+TjAN77bU5ylwr9BJhIbi+PNJz1bSLJxPsJZ1KfRJom8CEk4QSqQd7z7XBbejEBJEcX
         parQ==
X-Gm-Message-State: APuU4Z/X7aYoQcJOVDwYjlbmo62sWLIbhmhg42IH0nzhEEfgayRX+QFB
	oNVNTnK8LFXocBQ3dqo8WAeWm/lkt3UV6WwWPhi4OVFvQOKrqpxnh8hSEiIGP8+DdUA=
X-Gm-Gg: AZFdTZd0AKA0HGXwCplu7RiiVH7fs+1dUNPhfl85CcPpyLmimsPW8N1GjcSu+ZvHSmt
	FUBeyonQ4AjrZtfFtG5sPDa9QMPf7/AMTquuE9qevS2X3FFOACyhBrMNMRfGhNJv2glN+yEm9Ei
	Q4SCVlhEYvtVR7VL4e16wYNxejm5BC9ibN0iMIF5i4YdRBh7MiQwzEpTg26xcaXnpEFvUEd150e
	RtXyzGqmTcNM9kKajy86d87WeRIIn23mkASEcJoii1UbziUsN+UuBScJ6zByeHsuRmnTlQCFdti
	WmX+QGWOdeQxE9/gusAW1PqC0um5EDp51GHs1ZvpmikWO1ETsDKd5HiagarVUST0W4pJywqkvCE
	Z9aF4s/0XaGl0G+w6IXryYN6pqaKR9OmGdFuWGyLDsKhHK2J1jb4o9jMtpzm8hH6LPaFY1DMMD3
	DJ3AtuHc4HRnWVZ3nR7wnub2RxTxh77B2rJfFVQv9NXbqSyYj7OhSpPFn2yH3LKHtogoH1bu1/R
	NTqItgst+VLeRu5VPFTOm76oWv6QqGtZPGjeA25F2ZaczuNRHJkfhSbtOEj+R525yTVL7jVpjXF
	y5c8takjTwttoAWcoibd/jdX0VwaX6YvZrfAJZ+tICwlTm3bWIUzHb4=
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr3182280585a.26.1795554771717;
        Tue, 24 Nov 2026 13:12:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm1131851185a.3.2026.11.24.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:12:51 -0800 (PST)
Message-ID: <332bab94048c257f816b616cede22dbde20a0d9e.camel@ndufresne.ca>
Subject: Re: [PATCH v2 07/17] media: v4l2-mem2mem: support running multiple
 jobs in parallel
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:12:49 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-7-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-7-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BgQ9A5uHRmZ+BgHmEpOW"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-BgQ9A5uHRmZ+BgHmEpOW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Add support for running multiple jobs in parallel for SoCs containing
> multiple identical devices. An example is the Rockchip RK3588 SoC,
> which contains two identical RGA3 devices. Therefore it is desirable to
> have the kernel schedule the work across all available devices and only
> expose one video device to the userspace.
>=20
> To avoid queueing too many parallel jobs, the
> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> to set the number of parallel jobs and avoids calling device_run when
> the given number of jobs is already running. This is set to 1 by default
> to prevent parallel job runs. Drivers with the need and support for
> scheduling jobs can adjust this value accordingly.
>=20
> Note that this change doesn't allow a context to be used multiple times
> in parallel. So a single stream won't be able to utilize multiple devices
> at once, but N streams can utilize up to N devices. This is caused by the
> fact that a context is not added multiple times to the job_list and also
> holds the job_flags to distinguish if it's currently running.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - split out the removal of the curr_ctx member
> - add EXPORT_SYMBOL to v4l2_m2m_set_max_parallel_jobs
>   (indirectly pointed out by Detlev)
> - document v4l2_m2m_get_curr_priv being incompatible with parallel jobs
> - add documentation comment for the added function
> - rework v4l2_m2m_suspend to avoid potential errors due to looping
>   outside of a spinlock over the list
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D5)
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 51 ++++++++++++++++++++++++++--=
------
>  include/media/v4l2-mem2mem.h           | 18 ++++++++++++
>  2 files changed, 58 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index 60cca94195166..f1b6255984087 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -88,6 +88,7 @@ static const char * const m2m_entity_name[] =3D {
>   * @job_spinlock:=09protects job_queue
>   * @job_work:=09=09worker to run queued jobs.
>   * @job_queue_flags:=09flags of the queue status, %QUEUE_PAUSED.
> + * @max_parallel_jobs:=09max job_queue instances number marked as runnin=
g
>   * @m2m_ops:=09=09driver callbacks
>   * @kref:=09=09device reference count
>   */
> @@ -106,6 +107,7 @@ struct v4l2_m2m_dev {
>  =09spinlock_t=09=09job_spinlock;
>  =09struct work_struct=09job_work;
>  =09unsigned long=09=09job_queue_flags;
> +=09u32=09=09=09max_parallel_jobs;
> =20
>  =09const struct v4l2_m2m_ops *m2m_ops;
> =20
> @@ -121,6 +123,13 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(stru=
ct v4l2_m2m_ctx *m2m_ctx,
>  =09=09return &m2m_ctx->cap_q_ctx;
>  }
> =20
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +=09=09=09=09    u32 max_parallel_jobs)
> +{
> +=09m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> +}
> +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> +
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>  =09=09=09=09       enum v4l2_buf_type type)
>  {
> @@ -256,7 +265,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> -=09struct v4l2_m2m_ctx *chosen_ctx;
> +=09struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> +=09struct v4l2_m2m_ctx *ctx;
> +=09u32 running_jobs =3D 0;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);

Here sashiko seems right, you want o loop back over this locking block unti=
l you
reached the maximum of jobs, or there is no more pending context. Right now=
, we
risk starvation.

Nicolas

>  =09if (list_empty(&m2m_dev->job_queue)) {
> @@ -271,10 +282,22 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m=
2m_dev)
>  =09=09return;
>  =09}
> =20
> -=09chosen_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_=
ctx, queue);
> -=09if (chosen_ctx->job_flags & TRANS_RUNNING) {
> +=09list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> +=09=09if (!(ctx->job_flags & TRANS_RUNNING)) {
> +=09=09=09chosen_ctx =3D ctx;
> +=09=09=09break;
> +=09=09}
> +
> +=09=09running_jobs++;
> +=09}
> +=09if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09dprintk("Another instance is running, won't run now\n");
> +=09=09dprintk("Maximum number of parallel jobs reached\n");
> +=09=09return;
> +=09}
> +=09if (!chosen_ctx) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09dprintk("All jobs already running\n");
>  =09=09return;
>  =09}
> =20
> @@ -549,19 +572,24 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
>  void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> -=09struct v4l2_m2m_ctx *curr_ctx;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -=09if (list_empty(&m2m_dev->job_queue)) {
> +
> +=09while (!list_empty(&m2m_dev->job_queue)) {
> +=09=09/* Running jobs are always at the start of the queue */
> +=09=09struct v4l2_m2m_ctx *first_ctx =3D
> +=09=09=09list_first_entry(&m2m_dev->job_queue,
> +=09=09=09=09=09 struct v4l2_m2m_ctx, queue);
> +
> +=09=09if (!(first_ctx->job_flags & TRANS_RUNNING))
> +=09=09=09break;
> +
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09return;
> +=09=09wait_event(first_ctx->finished, !(first_ctx->job_flags & TRANS_RUN=
NING));
> +=09=09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09}
> -
> -=09curr_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ct=
x, queue);
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -
> -=09wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING)=
);
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);
> =20
> @@ -1205,6 +1233,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l=
2_m2m_ops *m2m_ops)
>  =09spin_lock_init(&m2m_dev->job_spinlock);
>  =09INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
>  =09kref_init(&m2m_dev->kref);
> +=09m2m_dev->max_parallel_jobs =3D 1;
> =20
>  =09return m2m_dev;
>  }
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 31de25d792b98..37ffd33b653f2 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -144,6 +144,10 @@ struct v4l2_m2m_buffer {
>   * v4l2_m2m_get_curr_priv() - return driver private data for the current=
ly
>   * running instance or NULL if no instance is running
>   *
> + * It is incompatible with using parallel instances enabled by calling
> + * v4l2_m2m_set_max_parallel_jobs(), as it is undefined which private da=
ta of
> + * the parallel running instances is returned.
> + *
>   * @m2m_dev: opaque pointer to the internal data to handle M2M context
>   */
>  void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev);
> @@ -594,6 +598,20 @@ static inline void v4l2_m2m_set_dst_buffered(struct =
v4l2_m2m_ctx *m2m_ctx,
>  =09m2m_ctx->cap_q_ctx.buffered =3D buffered;
>  }
> =20
> +/**
> + * v4l2_m2m_set_max_parallel_jobs() - adjust the limit of the maximum nu=
mber of
> + * jobs being run in parallel.
> + *
> + * By default only one job is allowed to be run at any time. A driver wi=
th
> + * multiple cores can call this function to (dynamically) adjust this li=
mit
> + * based on the underlying hardware capabilities.
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + * @max_parallel_jobs: maximum number of jobs to queue in parallel
> + */
> +void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
> +=09=09=09=09    u32 max_parallel_jobs);
> +
>  /**
>   * v4l2_m2m_ctx_release() - release m2m context
>   *

--=-BgQ9A5uHRmZ+BgHmEpOW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX90QAKCRDZQZRRKWBy
9IPZAP43AmMPiX21oO0Gu+MatDhXA80g92HvFv70p0QcgSsjTwEA96BLtiIAzKie
Pw4t5V8CQ31Qy/RwTTLccjd4pKQIowc=
=RgJF
-----END PGP SIGNATURE-----

--=-BgQ9A5uHRmZ+BgHmEpOW--
