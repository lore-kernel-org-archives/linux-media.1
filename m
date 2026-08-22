Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A02DECA8
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787416435; cv=none; b=GfX04KGZGsgeoevEptLAy2oEIa0JDGFGx5Bsp3TB2ONkchxJssZi6sV2KgEp/JlNzd8si4eursEiKBqDpJ+Is1HP0HCnPwyCpGoY8gjkIytDPuIjFP7fCCw/7bFxxNTfXHJFTiYmm3GX4SZL56Fpz+drLjf/508tAA+l+qX15pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787416435; c=relaxed/simple;
	bh=oGcc8VIcamFFepAD6IAmSlBLrLGFed7pvq5nIb+E4eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMgA28FgB/hYerW21JV5p9Dloq4lHJW98EUq51u1XLzoOGk5V5aBKb4CaMbpwgLawqifqWSQcHB2TatenBDFRrzpEZ48Ovxs2VLqTD4nqLaogHLDscyHzP7hHNt6Y/TajB/1kAfUdq1nm07jKaL0MOTniZ/zg16AMv96C2364A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsEKQzAO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsEKQzAO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2676190a91.0
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787416433; x=1788021233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmKmKrmPYkvkNLuKTmfz5lzhGrm9BSMn079ll2DIt4w=;
        b=TsEKQzAOfACNXAKNx5AW07PtAdyvmTb+7L7P5MBypj/kjx4sTYojRkgPVUHVIdnAxV
         Z2kqLIlUIeSIxTl28XCR1nFH+E83clPXgoAFFJl4O9iCoBfh5IUVvczkn7f8iTYd7R/S
         t2Kmzmg/Dj0Fn+pFeq8MGZOYLsAEGrj3ukd61S9w/99B00wLQxNtuyu+noEqbR76drou
         WvPCt7KjNdeklnKExsDLyFDS3bg5pCfnvaGqFnAJG1LdF/q5/nIZhTw2YzfXXr63IyZK
         HgcBj3QhFMk/LbkHj6YDgpNoHmrvjwwITyly2YtCdyFzJK0kqbdrSY2YH2xIgke59xyy
         3cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787416433; x=1788021233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmKmKrmPYkvkNLuKTmfz5lzhGrm9BSMn079ll2DIt4w=;
        b=A060VGYAJVquzfG4nERsOMM5HyPgE6MQUhgbs+zuvljzbEuzia+TJZli6d3BpjbmKT
         rjHqGH37jLUy4SEcwoZaM2iZwoeFg9qs74i+GpMD/fk4Mao6IA8RyI+6lSyFdBnVMr0Z
         tFOcgE5l4qL4bArwVfFqKhkT9MNRYa8WDbPHzvscE5Eq7Ov/OMvyCfqbd73zL3f1Mnzr
         V85ZP0RhyWaTxpY79qh7YDmOU4qhOMlhDsiygrOSgPeDGHhnPbndwcLoyXWjLxvh+vav
         bxXn3dGZt6K76dINmC4K3w4gfV99rEqEw2zg1aUqMcmawbuSyv80VOMM2gocnzIIwm9t
         qcVA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl3pUEyx6ef3CpRquInzUEE1q6OecO+DYjP48N2BDQSbBH8djk9Em0d8j0qr/ZTQN9gBpnItd1iODL3w==@vger.kernel.org
X-Gm-Message-State: AFuF++lmFepXJqQxIjBTcuwEHJ1VD2M+cWbdkRNpiSuIWejK7dIF39Tu
	2jH5Ur9bdoqTzAHk7PRfBqDfCn3z+P8G+6Zi4XQEchUetNatU47Kl4BS
X-Gm-Gg: AR+sD12ItAaCNwBIcKbsBycBd5zOLQC+SaPQ4LJ/jRuX43mTOiAT8ymWv00/H2lO4qJ
	86FnicKtMYdWr9+YrkfTMPmpQyTky0TiNUU8mP/6TQG8ni/QrDKX/8xzPpSSodGAZLKREVvnaCf
	8xqTBvYVsaRHYlGha4KHWpCcswNHsmKhXFWhKZAS5ws1yJg++LjdcFuhDTndNH5A/Wf1JV5IjlK
	hpt2OXL1jL/JowuM6i1fCR8eloYdIMMbXwcJzUADAsOnT7u/ISZd7GTGFwDSwz7cl0PSW1QOqhf
	mo92m5fLajL5NMaStKiPRKGbLvyqtjQWj0ADHIjRVGmRfeCEMnmyoUhxwyRj/+CR4K6Zmep8HRj
	hPS3CNvFpM4rqMnSEykd69IZgdULyit4wctlZHyaevfA++O6AzJLMnVE6BeBan2+Beykxvw4Bp1
	9tWO4ds4VUpJj1+YDQ22bOCH3RZPFLecjsPhJOmqY35vCcN4Ruv/eHVEwZ1RqCH6hyV+qBftAkf
	Vd6StGUWUtxJkBXDW/E1+I=
X-Received: by 2002:a17:90b:4a81:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-395c34fed98mr22503172a91.4.1787416433248;
        Sat, 22 Aug 2026 09:33:53 -0700 (PDT)
Received: from niharika-QEMU-Virtual-Machine ([223.181.119.104])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d33dcsm10911996eec.18.2026.08.22.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 09:33:52 -0700 (PDT)
Date: Sat, 22 Aug 2026 09:53:41 +0530
From: Niharika Khare <niharikakhare2101@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: mc: Remove spurious WARN_ON in
 __media_pipeline_start
Message-ID: <aokkTcorNSJOnJFj@niharika-QEMU-Virtual-Machine>
References: <20260821165833.10042-1-niharikakhare2101@gmail.com>
 <20260821193326.GI59206@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821193326.GI59206@killaraus.ideasonboard.com>

On Fri, Aug 21, 2026 at 09:33:26PM +0200, Laurent Pinchart wrote:
> On Fri, Aug 21, 2026 at 10:28:07PM +0530, Niharika Khare wrote:
> > Vimc driver's entity topology has three capture nodes and two of
> > those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
> > other via enabled links. The crash report and the C repro show that
> > the two capture nodes attempt to invoke a STREAMON session one after
> > the other, which resulted in the WARNING getting triggered by the
> > media controller.
> > 
> >   vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
> >   vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
> >   origin->pipe && origin->pipe != pipe
> >   WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912
> > 
> > The graph walk originating from Raw Capture 0 (first STREAMON in C
> > repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
> > pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
> > (second STREAMON in C repro on /dev/video4), the pad is already
> > claimed. This is a legitimate userspace request but not something that
> 
> No, that's not supposed to be a legitimate use case. The WARN_ON
> indicates a driver bug.

Thanks for the direction Laurent, I'll look into vimc's architecture to
check on how the two capture nodes ended up starting the pipeline back
to back.

> > kernel should allow while the pad remains claimed. Hence, the kernel
> > checks the pipe and returns -EBUSY instead of raising a bug, same as
> > the other non-origin pads. The check on origin pad's pipe needs to stay
> > otherwise the origin pad case would go through the increment on the
> > start_count path, even though there exists a loop few lines below this
> > block to check the pad and return -EBUSY. The check also provides early
> > failure detection and prevents the complete graph walk.
> > 
> > Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> > Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
> > Tested-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> > Signed-off-by: Niharika Khare <niharikakhare2101@gmail.com>
> > ---
> >  drivers/media/mc/mc-entity.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 3fa0bc687..7b4ef2c95 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -778,12 +778,18 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> >  
> >  	lockdep_assert_held(&mdev->graph_mutex);
> >  
> > -	/*
> > -	 * If the pad is already part of a pipeline, that pipeline must be the
> > -	 * same as the pipe given to media_pipeline_start().
> > -	 */
> > -	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> > -		return -EINVAL;
> > +	/*
> > +	 * If the pad is part of a different pipeline than the one passed on to
> > +	 * media_pipeline_start(), the pad must wait for the ongoing session on
> > +	 * this previous pipeline to complete before it starts a new session.
> > +	 * The request for starting the pipeline, although valid, cannot be
> > +	 * served until the ongoing request finishes.
> > +	 */
> > +	if (origin->pipe && origin->pipe != pipe) {
> > +		dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
> > +			origin->entity->name, origin->index);
> > +		return -EBUSY;
> > +	}
> >  
> >  	/*
> >  	 * If the pipeline has already been started, it is guaranteed to be
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Regards,

Niharika Khare
