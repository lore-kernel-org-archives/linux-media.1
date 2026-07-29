Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A639A05C;
	Wed, 29 Jul 2026 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307478; cv=none; b=S/QcY5pZ/sgZraNAf4WYKZpKpYNdaOtyaHelmt/9nE06wQ7iR432YA9JC5wjzmQleoxn7f/FDFR2UQFG39DiD+h1hp/TXMgbIGvi7UxLqTqmKPCdcliKvZhQ/8WD7Ri9oYhFMXMxR4O7ZIRamzl740+Gn1pzGr4A8pJ6aVsTyTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307478; c=relaxed/simple;
	bh=/gFl4FNNNJ7gj+I5/zGb4U9lvGpzmxKCs/v0IsTYlC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCQ5o3yi6JAP5GwtBfr4y3n/IOC59j7aNPF4TkOPydlMskHIen0INGBNu/KSMnZFpfzMELiGc0a43JpN5JQr67PgVS7FlYYQkqZpRNaL1Zapq+R6psODM38JgMS5E65rN8tcaAUQ7VJB0NvRz8RLhad9/hZB2SHBk5/LOBUMrtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVfCG5in; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVfCG5in"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AE71F000E9;
	Wed, 29 Jul 2026 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785307476;
	bh=ue5hJMcxcR1GVrgFu1vQUB/dk7xzKBDN++w5XX4rx70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BVfCG5inqgNEAwtoMmDUWJPhVc7Fdk8IzaYOC1IshBvEUCdKeVKmyg59tQXCItzKe
	 buw669Mj54tjptbxFT5dCR4TlhAGGpecr6cVf9M3k/UKyeMIFlm0sq81LEI3NdMk9J
	 a1IePPaWf8UiYwWI4ByTn/nZpeLbb9HkyAJDv9BkOcZFR6rYqbI0tELJftdY6gloyL
	 fO3AB842Lz+4Hu2CaEx4NPEMoeQSa/KLc+EBd9i6wwONQ8XvnWzSZYv4Z2vfa20J94
	 AIC/x70dVEOZRMyTAvraJ3HYqP32Jbfdv9zAy5mAvom74L+x8+oaXZdMnTK/rokVJo
	 znrnH7/hUWfAw==
Date: Wed, 29 Jul 2026 08:44:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, kees@kernel.org,
 rongqianfeng@vivo.com, axboe@kernel.dk, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, AutonomousCodeSecurity@microsoft.com,
 tgopinath@linux.microsoft.com, kys@microsoft.com
Subject: Re: [PATCH] media: dvb-core: add upper bound check in
 DMX_SET_BUFFER_SIZE ioctl
Message-ID: <20260729084431.30e0fee8@foz.lan>
In-Reply-To: <20260729083026.0e26efff@foz.lan>
References: <20260722193719.81157-1-blbllhy@gmail.com>
	<20260729083026.0e26efff@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jul 2026 08:30:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Wed, 22 Jul 2026 15:37:19 -0400
> "Cen Zhang (Microsoft)" <blbllhy@gmail.com> wrote:
> 
> > dvb_dvr_set_buffer_size() and dvb_dmxdev_set_buffer_size() pass the
> > user-supplied size argument directly to vmalloc() without any upper
> > bound check. This allows excessive kernel memory allocation via the
> > DMX_SET_BUFFER_SIZE ioctl, which can lead to system-wide OOM conditions.
> > 
> >   Kernel panic - not syncing: System is deadlocked on memory
> > 
> >   Call Trace:
> >    out_of_memory+0x12fd/0x1370
> >    __alloc_frozen_pages_noprof+0x2620/0x2fa0
> >    __vmalloc_node_range_noprof+0x7fa/0x1490
> >    dvb_dvr_do_ioctl+0x11e/0x260 (drivers/media/dvb-core/dmxdev.c:296)
> >    dvb_usercopy+0x15b/0x360
> > 
> > Fix by cap both functions at 64 MB and return -EINVAL for oversized
> > requests.
> > 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
> > Reported-by: AutonomousCodeSecurity@microsoft.com
> > Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
> > ---
> >  drivers/media/dvb-core/dmxdev.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
> > index 3c8bc75e4d6c..b4dc87945be1 100644
> > --- a/drivers/media/dvb-core/dmxdev.c
> > +++ b/drivers/media/dvb-core/dmxdev.c
> > @@ -20,6 +20,9 @@
> >  #include <media/dmxdev.h>
> >  #include <media/dvb_vb2.h>
> >  
> > +/* 64 MB upper bound for DVB ring buffer allocations */
> > +#define DVB_BUFFER_SIZE_MAX (64 * 1024 * 1024)
> 
> Having a limit is good, but why 64MB?
> 
> Can you provide me more details about the test scenario: e.g. with
> what TV standards had you test it, and such.

Forgot to mention, but instead of returning -EINVAL, probably the best
would be to setup the ringbuffer size to the maximum value, as
otherwise this would break existing apps.

Btw, what apps did you use to test it? Had you check what's the current
limit on what apps?

Regards,
Mauro
