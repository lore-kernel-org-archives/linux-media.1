Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2438239D;
	Fri, 21 Aug 2026 19:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787340813; cv=none; b=mJ210Ad9JQtqRw8JUnq5gumKvY0aDgzpc8jziRZWlryCGz97XuSvfz3G1ADGvqkgZXJb41C2hLk9/DJk6Z1OnaX02kbqrBiE9l2qMPu1xqrlV3e0Z7am/h3RwqPCURmsJyziOpusaLepbgxnhbg6f6G5lb7ddYJSJal501IeCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787340813; c=relaxed/simple;
	bh=Uho3NdIwgCBTnes8fauSTnr92ue5xPY/vlTNSudOtKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jipaMBT9LFoVye5m6C0KYYvwPAiDs96cqxnJvqVGmS1Tisng6YLzYedmHtSiFk8inCZ4JC9I/fAOzIoIrEaeNW1yEtIvfsnInf7ECojDQVqyHn+mFhCVrChjCkH6OoRLhO6qMuXUyXwydYQceIqh1MSZ3GsSPgB51vorSlW0PxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GRP5Kath; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GRP5Kath"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:a440:2900:9751:ae5e:a777:a318])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E399A16F9;
	Fri, 21 Aug 2026 21:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787340725;
	bh=Uho3NdIwgCBTnes8fauSTnr92ue5xPY/vlTNSudOtKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRP5KathGS77LYvhSgfUmgzKiZtPlwkdGHraooNp6RsYYwSSAlrW/m9k7hBajNkhs
	 cZabai1bWSpTkEfwAOR3HTLVBtPx35be9yUHZcfSEo4mBmS71s2u4d+1r/Wf0/Z9cM
	 PzBJWLxEV/PziKiD90hUre0vjh+dDtOp1QTZFEPg=
Date: Fri, 21 Aug 2026 21:33:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niharika Khare <niharikakhare2101@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: mc: Remove spurious WARN_ON in
 __media_pipeline_start
Message-ID: <20260821193326.GI59206@killaraus.ideasonboard.com>
References: <20260821165833.10042-1-niharikakhare2101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821165833.10042-1-niharikakhare2101@gmail.com>

On Fri, Aug 21, 2026 at 10:28:07PM +0530, Niharika Khare wrote:
> Vimc driver's entity topology has three capture nodes and two of
> those (Raw Capture 0 and RGB/YUV Capture) are reachable from each
> other via enabled links. The crash report and the C repro show that
> the two capture nodes attempt to invoke a STREAMON session one after
> the other, which resulted in the WARNING getting triggered by the
> media controller.
> 
>   vimc link validate: Sensor A:src:640x480 (0x42474752, 0, 0, 0, 0) Raw Capture 0:snk:640x480 (0x42474752, 8, 0, 0, 0)
>   vimc link validate: Scaler:src:640x480 (0x33424752, 8, 0, 0, 0) RGB/YUV Capture:snk:640x480 (0x33424752, 8, 0, 0, 0)
>   origin->pipe && origin->pipe != pipe
>   WARNING: drivers/media/mc/mc-entity.c:785 at __media_pipeline_start+0x1add/0x22b0, CPU#1: syz.0.17/5912
> 
> The graph walk originating from Raw Capture 0 (first STREAMON in C
> repro on /dev/video0) reaches RGB/YUV Capture and marks its origin
> pad's pipe with its own pipe. When RGB/YUV Capture's graph walk starts
> (second STREAMON in C repro on /dev/video4), the pad is already
> claimed. This is a legitimate userspace request but not something that

No, that's not supposed to be a legitimate use case. The WARN_ON
indicates a driver bug.

> kernel should allow while the pad remains claimed. Hence, the kernel
> checks the pipe and returns -EBUSY instead of raising a bug, same as
> the other non-origin pads. The check on origin pad's pipe needs to stay
> otherwise the origin pad case would go through the increment on the
> start_count path, even though there exists a loop few lines below this
> block to check the pad and return -EBUSY. The check also provides early
> failure detection and prevents the complete graph walk.
> 
> Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
> Reported-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=68e901d044baaea1f60c
> Tested-by: syzbot+68e901d044baaea1f60c@syzkaller.appspotmail.com
> Signed-off-by: Niharika Khare <niharikakhare2101@gmail.com>
> ---
>  drivers/media/mc/mc-entity.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687..7b4ef2c95 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -778,12 +778,18 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  
>  	lockdep_assert_held(&mdev->graph_mutex);
>  
> -	/*
> -	 * If the pad is already part of a pipeline, that pipeline must be the
> -	 * same as the pipe given to media_pipeline_start().
> -	 */
> -	if (WARN_ON(origin->pipe && origin->pipe != pipe))
> -		return -EINVAL;
> +	/*
> +	 * If the pad is part of a different pipeline than the one passed on to
> +	 * media_pipeline_start(), the pad must wait for the ongoing session on
> +	 * this previous pipeline to complete before it starts a new session.
> +	 * The request for starting the pipeline, although valid, cannot be
> +	 * served until the ongoing request finishes.
> +	 */
> +	if (origin->pipe && origin->pipe != pipe) {
> +		dev_dbg(mdev->dev, "Failed to start pipeline: pad '%s':%u busy\n",
> +			origin->entity->name, origin->index);
> +		return -EBUSY;
> +	}
>  
>  	/*
>  	 * If the pipeline has already been started, it is guaranteed to be

-- 
Regards,

Laurent Pinchart
