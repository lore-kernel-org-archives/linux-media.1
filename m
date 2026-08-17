Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED93E5EC0;
	Mon, 17 Aug 2026 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982421; cv=none; b=SZKePjXq4e1NkQf3jgzeHrr04ajj5uzwCUVL2ntTZ0avbVn66eMcbEiRIgYCtldhUDJs4b1j2516foLHoREr2Vp2/hlyNDAXNS3QtPUluvKKSI6Q0S5XmjDgnWCx56TxDh5ynksUVcEUYPyvIPLRQe86WpV6Py3HFpwyl7e2yQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982421; c=relaxed/simple;
	bh=YZOkasreBsQ+MnXpfyGzG+AlDurz+6cLY3rlaHgVfNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aG6nqJTzihNbk4vtOtemVCIdT9US1rDq6NS7EqNgBk59wXyCvL2KwzhhLdnZJJfQj/CLpNtgahr73BtiHwqZzxo7QPCr7eKK55hJ5EiKtQNgc0DkjzNGQWTIamwl/7YR5thdQqDt3ixLq5ebyiXqrI5Fqr7m1idR/G2bLKoheJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VZSU8KNe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VZSU8KNe"
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3F89E4E;
	Mon, 17 Aug 2026 17:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786982337;
	bh=YZOkasreBsQ+MnXpfyGzG+AlDurz+6cLY3rlaHgVfNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZSU8KNeQw0AYK2JRLjwEuabwEZKg2UYGkrVxCToNqCAxmo41CIZ9BJW64/OQhcDE
	 cOq6Wk7BboLh2CRFBohdEdcw4K6Y8Z7mM3uMvJQ2M2toC+j1OZS6t5ao1ZpCvcTHrT
	 pavjlNITQOnQJXZilto1w1f4RRFIxHopof1+HaK0=
Date: Mon, 17 Aug 2026 18:00:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Linmao Li <lilinmao@kylinos.cn>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rppx1: handle the MAIN_POST white balance
 gains block
Message-ID: <aoMveqnDXyPvJdTD@zed>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-2-lilinmao@kylinos.cn>
 <20260817154952.GI2757863@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817154952.GI2757863@ragnatech.se>

Hello Linmao, Niklas

On Mon, Aug 17, 2026 at 05:49:52PM +0200, Niklas Söderlund wrote:
> Hi Linmao,
>
> Thanks for your work.
>
> On 2026-08-17 18:45:28 +0800, Linmao Li wrote:
> > RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is defined in the uAPI, the MAIN_POST
> > white balance gains module is probed and started, and
> > RPPX1_PARAMS_MAX_SIZE already reserves room for all three white balance
> > gains blocks. However, the parameters type table has no entry for
> > AWBG_POST and rppx1_params() does not dispatch it, so userspace cannot
> > configure the module.
> >
> > The missing type-table entry is zero-initialised. A zero-sized
> > AWBG_POST block can therefore make v4l2_isp_params_validate_buffer()
> > loop forever. A pending v4l2-isp patch rejects zero-sized blocks in the
> > common validator.
> >
> > Add the missing type entry and dispatch AWBG_POST to rpp->post.awbg.
> >
> > Fixes: 9ebf50010c68 ("media: rppx1: awbg: Add support for white balance gain settings")
> > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > ---
> >  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index a75a27a8afd09..88162f0bdc115 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -25,6 +25,7 @@ rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> > +	RPPX1_PARAMS_BLOCK_INFO(AWBG_POST, awbg),
>
> This looks good.
>
> >  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
> >  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
> >  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> > @@ -79,6 +80,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> >  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
> >  			module = &rpp->pre1.awbg;
> >  			break;
> > +		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST:
> > +			module = &rpp->post.awbg;
> > +			break;
>
> As you point out in the cover letter there are many modules, specially
> in the PRE2 pipeline, that we reserve space for in the configuration
> buffer but to not dispatch yet. But also some in the POST pipeline. The
> reason for this is that we have no users (libcamera) or test-cases for
> those blocks.
>
> I think I would prefers keeping it like this until we do. If you really
> really want to go this path should you not also add AWBG_PRE2 here, that
> is also not dispatched ;-) But I think you should drop this and just add
> the missing entry to rppx1_ext_params_blocks_info.

FYI: https://patchwork.linuxtv.org/project/linux-media/patch/20260815193839.141406-1-devnexen@gmail.com/

I feel like we should populate all blocks indeed to avoid holes in the
rppx1_ext_params_blocks_info[] array.

If we can work out a patch quick enough we can send it as a fix and
have it collected with the rpp-x1 driver for v7.3 (hence, no need for
a fixes tag).

Thanks
  j

>
> >  		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
> >  			module = &rpp->post.ccor;
> >  			break;
> > --
> > 2.25.1
> >
>
> --
> Kind Regards,
> Niklas Söderlund
>
