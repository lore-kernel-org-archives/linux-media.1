Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FE1352004;
	Mon, 10 Aug 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376689; cv=pass; b=Ce1eqEyePRWUBo7wiyj6R4lFrGfqCu/P1LL6pPV6cCTrXQIfATRdChXuGq1LGl4I2tcuncJRVRXGglDTfniAlphYNCouZZwdg+9E+tsbEZ4U7NivB6ECS2cp6Q0aN6EYuhbEi3rVh8y8WAkOXoEOrDgiUjmBybETXR3Z8sylr+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376689; c=relaxed/simple;
	bh=nHoOwGC7q05qjKsIiCfC0xIJgRcOvbKnM9XASv3XP8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNoLWi3+qeumWZOlQGnbBknNLUXCuzZogzRq59yBJ59Q32J/Qo8Zwgi9aRiYobOoufnOael8QPMR1twjDthMk4Vq+3Q8fL2F5F4V90ri9h8ZLZCOW6NDbBcd4eXpcJIaAD3MllYP+wrBEdybRKNzxsnrsKOjtgCF1mL8wTFrYs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=aet+qKDQ; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="aet+qKDQ"
ARC-Seal: i=1; a=rsa-sha256; t=1786376666; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CscjNlq/BKgjPe7Sz9lY+/RR6NXKh2CCzcLiIGK23F/dpwFKoLmXCT30pInAWbXoXMfB36NG5CdPMXwYKRrTVPKxbL2YEI2y7khEcMzG2Iwi+K7wQjm6oLcPywl9Vt4+Bxdk/AAv1sn9jrqawHbojPR7CrZMqNZINxMj49mbyW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786376666; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RkhB3+AqHD6hq7soKa9MSZzBETaPzXgr+VrQ6xLrM1E=; 
	b=c7IrCbqC9gMsR0MqQRipDLCFm/x6/d1QSjqLYnWLnRFM1dPyDcJUAvUU7T097pMwRfUhZvt2yoC66llnMh9EqOOCzQo9xf6iJRrUdW1+3boZUtpH29Ttc5MwkN70frJM5DYZyV7Anj5bho33azPmFP2ji40cishPp7dpj+jx+nA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786376666;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=RkhB3+AqHD6hq7soKa9MSZzBETaPzXgr+VrQ6xLrM1E=;
	b=aet+qKDQBVHkM1k7PNMI6ssbHHjWAvotgIWYHuLyDSTUIiCwipE7PH74foZx1B62
	XjbSQnpsy5mcz7j241tLT6S7Jv2/rfBck5O/2pZRIETdIiopQod7LuVUz7hcIG5c4Ar
	prNL/zlLiyFFql/u4inP7tkIt5WQf5FDuVgvXJmg=
Received: by mx.zohomail.com with SMTPS id 178637666404673.2559698969792;
	Mon, 10 Aug 2026 08:44:24 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>,
 Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>
Subject:
 Re: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs in
 parallel
Date: Mon, 10 Aug 2026 11:44:22 -0400
Message-ID: <PVRr3KXgTkGh0rDVqPDYgg@collabora.com>
In-Reply-To: <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
References:
 <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
 <aae16dbfb26c8ee7e54247ca4d123b15748d623f.camel@ndufresne.ca>
 <e89fd487-ea3f-42fd-8647-6fa74ac991e8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi,

On Wednesday, 15 July 2026 05:44:01 EDT Sven P=C3=BCschel wrote:
> Hi,
>=20
> On 7/10/26 11:18 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le samedi 06 juin 2026 =C3=A0 00:06 +0200, Sven P=C3=BCschel a =C3=A9cr=
it :
> >> Add support for running multiple jobs in parallel for SoCs containing
> >> multiple identical devices. An example is the Rockchip RK3588 SoC,
> >> which contains two identical RGA3 devices. Therefore it is desirable to
> >> have the kernel schedule the work across all available devices and only
> >> expose one video device to the userspace.
> >>=20
> >> Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
> >> currently running context. But the currently running context will alwa=
ys
> >> be at the top of the job_queue. As the TRANS_RUNNING flag can be used =
to
> >> check if the queue head is already running, the curr_ctx member can be
> >> completely dropped
> >>=20
> >> To avoid queueing too many parallel jobs, the
> >> v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
> >> to set the number of parallel jobs and avoids calling device_run when
> >> the given number of jobs is already running. This is set to 1 by defau=
lt
> >> to prevent parallel job runs. Drivers with the need and support for
> >> scheduling jobs can adjust this value accordingly.
> >>=20
> >> Note that this change doesn't allow a context to be used multiple times
> >> in parallel. So a single stream won't be able to utilize multiple devi=
ces
> >> at once, but N streams can utilize up to N devices. This is caused by =
the
> >> fact that a context is not added multiple times to the job_list and al=
so
> >> holds the job_flags to distinguish if it's currently running.
> >=20
> > I do prefer this over Detlev proposal, so let's move toward this. Would=
 be
> > it cleaner though to first remove curr_ctx and then add
> > max_parallel_jobs ?
>=20
> Nice idea. I could move the max_parallel_jobs variable and the new
> function to a new small commit.
>=20
> I could also move the whole looping and counting of running jobs over
> the jobs to the new commit. But this would cause replacing the curr_ctx
> variable with a `list_first_entry(...)->job_flags & TRANS_RUNNING` and
> drop it in the commit afterwards to replace it with loops.
>=20
> While the commits would look a bit nicer in the latter example (as the
> removal of curr_ctx wouldn't also prepare for parallel jobs), I think
> the addition and direct removal style is frowned upon and therefore I
> tend towards the first option. On the other side I'm unsure if a 10 line
> patch to just add max_parallel_jobs variable and function with
> everything done in a (removal) patch provides benefit or harms to get to
> the related changes.

I rebased the rkvdec multicore support on this, and also used the same=20
components approcah for cores probing ([1]).

All works well, I'll make sure to rebase on these changes when they happen.

Thanks for your work !

[1]: https://lore.kernel.org/all/20260810-rkvdec-multicore-v2-0-986f89d22cd=
c@collabora.com/

> >> @@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
> >>=20
> >>   static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> >>   {
> >>   	unsigned long flags;
> >>=20
> >> +	struct v4l2_m2m_ctx *ctx;
> >> +	struct v4l2_m2m_ctx *chosen_ctx =3D NULL;
> >> +	u32 running_jobs =3D 0;
> >>=20
> >>   	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> >>=20
> >> -	if (NULL !=3D m2m_dev->curr_ctx) {
> >> -		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> -		dprintk("Another instance is running, won't run=20
now\n");
> >> -		return;
> >> -	}
> >>=20
> >>   	if (list_empty(&m2m_dev->job_queue)) {
> >>   		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >>=20
> >> @@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev
> >> *m2m_dev)
> >>=20
> >>   		return;
> >>   	}
> >>=20
> >> -	m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> >> -				   struct v4l2_m2m_ctx, queue);
> >> -	m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> >> +	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
> >> +		if (!(ctx->job_flags & TRANS_RUNNING)) {
> >> +			chosen_ctx =3D ctx;
> >> +			break;
> >> +		}
> >> +
> >> +		running_jobs++;
> >> +	}
> >> +	if (running_jobs >=3D m2m_dev->max_parallel_jobs) {
> >> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +		dprintk("Maximum number of parallel jobs reached\n");
> >> +		return;
> >> +	}
> >> +	if (!chosen_ctx) {
> >> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +		dprintk("All jobs already running\n");
> >> +		return;
> >> +	}
> >> +
> >> +	chosen_ctx->job_flags |=3D TRANS_RUNNING;
> >>=20
> >>   	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>=20
> This is the most prominent example on how to split it up. E.g. either
> keep everything in the curr_ctx removal commit (and just use 1 for
> max_parallel_jobs) or use list_first_head to check if we have a curr_ctx
> and drop it afterwards for the counting logic.
>=20
>=20
> Sincerely
>      Sven
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip




