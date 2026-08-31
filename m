Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94C3E49FF
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170397; cv=none; b=Cv+AIBraPv+TIQ2U4vK7MLRmBOQOX4kifGXCrPjMnx3H2KqeK+QxQhecmWP0cUgKTKNWDts0XCpvpaT8WD+2cQCPQMiWWkSXUPrBtmezm1tBPw9DTIk4NNVlWeGWHrbwREzkZiK0zfc2+pVB0RK4OBnAr+s/pbhfoae3iaErk9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170397; c=relaxed/simple;
	bh=ZeYhAm7eqIm86q4h2XtbyDnpgNB/HP6heJ+Xlgb9ARQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfIYW1/qZhQYdrv1P644ETJecY0Dn+29MQpAZo3Zha2q3I3JIrjnL9VLXXgUtVuAqt4mXeTbMPQq0EsBPSGk79Z/GJHafsEuLElFT9r9VCN6B/vO9GCcmr5qHFhYg9DsrGYtpe6iNwq8WlfY/YG51zN8uqF/F0wRCbHTkV/xfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESfbsf3b; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESfbsf3b"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca80d708489so2233221a12.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170394; x=1788775194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THrUgKzhRsf3n6+V7nW7vARyj/3BTZ0nOxBCb6HB/4c=;
        b=ESfbsf3bFFRUNUvUkZQzuoaIbFNnIP7bdmfaKiVcGc+yYZCw5kFTBCVer+L5EaXPVU
         9N+9Tb8rXO6m4rUy9VCdMVwEnMdNftfVQDa3n7Uq5sRwAhpMvk3SFYfSNI+KlNtFYXh8
         wPLVaubuBC6M3sKKY0AKKEZFl3VBnLOpmZmpYmkPB8BrP0w9pYNvAuR6HqZm9wzBTKuQ
         ZYr70R+cCVVtfPzqmFjUxBYo76SnbkNzhyVvlemseh3A3Picla6rBBlHOo/QvXZNzrBh
         Ltc509zR1pyohFKV61z2CPqkOv7YLuhV96/rsNN1qVWsAbSEnM500LEwQqSuvfcFfl66
         sd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170394; x=1788775194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=THrUgKzhRsf3n6+V7nW7vARyj/3BTZ0nOxBCb6HB/4c=;
        b=M6cIqgJRs99jz+b5mZKzNuTkQ1caacBSzZfFPegYcqfw7ALSWfVm/C1eFcW5xxeM4R
         VGQIGE2+qBFNRw8xbfbPalqPyH6frTPB24YiWroPX2cxoVclmaP4oD64H2zhNvP5BOhx
         r+DdPI2l8z1tAr8kqdPu6zml834FX2hKhQ0SgVYAu6LvHmXTGlxnh9DGuhJNkpQsIuqt
         osXg7IH2v9rfoduvcx8KALYV6D//mp9TakgAT6O6WDiUu5Ga78jQYs5kmODYU2EzBgv/
         3b1X6TyLBu0UK1xURz0FHdoIoH9db69iyR6KmFtKtOTezedE9wyKpPobBXV4dGF/5l4A
         cucg==
X-Forwarded-Encrypted: i=1; AHgh+RrreBg3AcwC39PAiFZwVj/49MAg2dWG+vbP7tqnu0nQNqq1dNddQjZiJ2kCCY0pBy+kiufiHzRAAb+iGw==@vger.kernel.org
X-Gm-Message-State: AFuF++l0ZEWr/usrHVxLNd0UyCUf7FYAY2ctaHvkez4SRO+VdyGoK/Mt
	adwfhDa8iHkXWIloKHYmuqDADA7NVKaTBXTx8be35i4exLQBSKCIcws+
X-Gm-Gg: AR+sD10yE2P9anWcW0sDKVxllLwvpWr094rYFvdP7OsaRVw5c+KoXN1dPOEgbse7+X4
	peTiR9McihtR0Eg4monbZdaKNBSLPWcrpm0+J/Jj6A1Th/hVekDzDQ4L/v6cwB/sZkgXUosckoc
	LWVFjJNZGkhmNQg49fW9GDt1JyPitVt1au0jYiIS9kYQc1gHqza1MK70+PT2ETST4FJi0rD5mx1
	7doNic7DUp+GMTg784hghQQyq/fEbtSO4MdHObN4t/yk1o+/NSmkJBwqm8Dw4KWJe2RKtfYgSj0
	y9TL6zqfDONggzgLtzBZCiOAu5LoD0qr1qEA/YkB3+NJGVyCxvrvfCLxoLVyCp1kQgKc94359vk
	jRfgw9KOOmHnxiHrdKQ/4pdrDsrqUiM15feQEKC+zJqzXtyIR5wealblAzaJr5mLFrrOqRgjdgm
	wf80cSsroxttS3vm8+03c3zZ677eiktq4P85AYAAUJYwwZAt620+Cxb8esLQybacm4SIF/VYlWS
	IC1DqU9pC440BS+BxDbwQ==
X-Received: by 2002:a05:6a21:458f:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3d5d9281d59mr6078501637.14.1788170393811;
        Mon, 31 Aug 2026 02:59:53 -0700 (PDT)
Received: from niharika-QEMU-Virtual-Machine ([223.181.115.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm27345377eec.23.2026.08.31.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:59:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:50:11 +0530
From: Niharika Khare <niharikakhare2101@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: mc: Remove spurious WARN_ON in
 __media_pipeline_start
Message-ID: <apU5O6ahkYlvioju@niharika-QEMU-Virtual-Machine>
References: <20260821165833.10042-1-niharikakhare2101@gmail.com>
 <20260821193326.GI59206@killaraus.ideasonboard.com>
 <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>

On Sat, Aug 22, 2026 at 09:53:46AM +0530, Niharika Khare wrote:
> On Fri, Aug 21, 2026 at 09:33:26PM +0200, Laurent Pinchart wrote:
> > On Fri, Aug 21, 2026 at 10:28:07PM +0530, Niharika Khare wrote:
> > > Vimc driver's entity topology has three capture nodes and two of
> > > those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
> > > other via enabled links. The crash report and the C repro show that
> > > the two capture nodes attempt to invoke a STREAMON session one after
> > > the other, which resulted in the WARNING getting triggered by the
> > > media controller.
> > > 
> > >   vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
> > >   vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
> > >   origin->pipe && origin->pipe != pipe
> > >   WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912
> > > 
> > > The graph walk originating from Raw Capture 0 (first STREAMON in C
> > > repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
> > > pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
> > > (second STREAMON in C repro on /dev/video4), the pad is already
> > > claimed. This is a legitimate userspace request but not something that
> > 
> > No, that's not supposed to be a legitimate use case. The WARN_ON
> > indicates a driver bug.
> 
> Thanks for the direction Laurent, I'll look into vimc's architecture to
> check on how the two capture nodes ended up starting the pipeline back
> to back.

Hi Laurent,

The WARN reproduces without the syzkaller reproducer by configuring
formats with media-ctl, then concurrently running VIDIOC_STREAMON on
/dev/video0 and /dev/video2. Both sit in the same connected component
via Sensor A.

I tried checking the pad in vimc before video_device_pipeline_start()
and returning -EBUSY, and this removes the WARN.

However, a couple of other drivers are structured differently:

1. rkisp1 embeds a single media_pipeline in struct rkisp1_device; both
   capture nodes pass it to video_device_pipeline_start(), serialized
   by stream_lock. vimc embeds one per vimc_capture_device, so the
   second STREAMON sees a different pipe pointer.

2. imx8-isi acquires the pipeline with media_entity_pipeline(), falling
   back to the node's own pipe, under graph_mutex.

I also tried the imx8-isi approach in vimc. Both nodes stream, but
teardown NULL-derefs in kthread_stop() as the core refcounts one
pipeline while vimc keeps a kthread per capture node.

Before working on the teardown: should vimc share a pipeline across a
connected component like these drivers, or refuse the second STREAMON?

Regards,

Niharika
 
> > > kernel should allow while the pad remains claimed. Hence, the kernel
> > > checks the pipe and returns -EBUSY instead of raising a bug, same as
> > > the other non-origin pads. The check on origin pad's pipe needs to stay
> > > otherwise the origin pad case would go through the increment on the
> > > start_count path, even though there exists a loop few lines below this
> > > block to check the pad and return -EBUSY. The check also provides early
> > > failure detection and prevents the complete graph walk.
> > > 
> > > Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> > > Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
> > > Tested-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > > Signed-off-by: Niharika Khare <niharikakhare2101@gmail.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 3fa0bc687..7b4ef2c95 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -778,12 +778,18 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > >  
> > >  	lockdep_assert_held(&mdev->graph_mutex);
> > >  
> > > -	/*
> > > -	 * If the pad is already part of a pipeline, that pipeline must be the
> > > -	 * same as the pipe given to media_pipeline_start().
> > > -	 */
> > > -	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * If the pad is part of a different pipeline than the one passed on to
> > > +	 * media_pipeline_start(), the pad must wait for the ongoing session on
> > > +	 * this previous pipeline to complete before it starts a new session.
> > > +	 * The request for starting the pipeline, although valid, cannot be
> > > +	 * served until the ongoing request finishes.
> > > +	 */
> > > +	if (origin->pipe && origin->pipe != pipe) {
> > > +		dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
> > > +			origin->entity->name, origin->index);
> > > +		return -EBUSY;
> > > +	}
> > >  
> > >  	/*
> > >  	 * If the pipeline has already been started, it is guaranteed to be
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> 
> Regards,
> 
> Niharika Khare
