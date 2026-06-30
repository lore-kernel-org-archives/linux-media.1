Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B939C1D86E4;
	Tue, 30 Jun 2026 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815074; cv=none; b=P0ifFpeRubkP0v0R9uvWy6S1SdICQsVceEhk1eNv8gVwN58zNqzaDKDP7azZzA23TCg24EmPRZOZZXbPOzgAD5hwbBnQ6WXDIKkMJ4MizGnI9kb4+6aURy2v8R3rIM4nXiEX52s2R/N8bKNvDjmFGACfkJkM5slq2Y7eHP1kf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815074; c=relaxed/simple;
	bh=erQe7Ne8OmWbJg7ppUflzaGfxgmL/j+6V765gCDZzb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJGZx6/jwVk3Gy8b+79+qTkeKhkYzXK8hqvk3kW38rxlrC9b6UFKSinBXirn9gvQvbNaQ/sr3rOH5Z7ojplRTUBNp/nMw8CM5o2cOLxArSuGiLmS3tUsdGrqcLJ8/Il1YaupnT3L6OCpparxkDqlRBQSBRYctCmblnajumFjZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dqN/PDvr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dqN/PDvr"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007B7D52;
	Tue, 30 Jun 2026 12:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782815027;
	bh=erQe7Ne8OmWbJg7ppUflzaGfxgmL/j+6V765gCDZzb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqN/PDvrl/AFFGllCuBKDq9yNUS735xMxbgNHCi8n+eryt5VJGF2ki70hx92GA6nG
	 +fVfb9PfBVo7AuNGec/HbtDl+EjBIC9HvSEZf2sun984ra2171XfRJTn/uxBfbd8X5
	 PFR0x+DiMp64j/u1Yiwk5MIY0ivMfEXl0L0r0gmg=
Date: Tue, 30 Jun 2026 13:24:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shih-Sheng Yang <yshihsheng@gmail.com>
Cc: hverkuil+cisco@kernel.org, kees@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] media: v4l2-dev: fix media controller registration error
 handling
Message-ID: <20260630102429.GA3199975@killaraus.ideasonboard.com>
References: <20260626192257.GA2894880@killaraus.ideasonboard.com>
 <20260630095456.1745545-1-yshihsheng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630095456.1745545-1-yshihsheng@gmail.com>

On Tue, Jun 30, 2026 at 05:54:56PM +0800, Shih-Sheng Yang wrote:
> Hi Laurent,
> 
> Thank you for the review.
> 
> I've addressed this in v2 by moving the NULL check into
> media_devnode_remove() and by using device_unregister() in
> __video_register_device(), as device_register() has already succeeded
> there.
> 
> I also checked the other media_devnode_remove() callers. I didn't find
> another caller with the same failure pattern or an immediate risk that
> requires changing the helper API. Since changing media_devnode_remove()
> to take a pointer-to-pointer would affect a wider set of callers, I have
> left that out of v2. I can add it if you prefer.

Sakari, Hans, to you have an opinion on that pattern ? If you forget the
context, the idea is to turn

void media_devnode_remove(struct media_intf_devnode *devnode)
{
	media_remove_intf_links(&devnode->intf);
	media_gobj_destroy(&devnode->intf.graph_obj);
	kfree(devnode);
}

into

void media_devnode_remove(struct media_intf_devnode **devnode)
{
	struct media_intf_devnode *node = *devnode;

	if (!node)
		return; 

	media_remove_intf_links(&node->intf);
	media_gobj_destroy(&node->intf.graph_obj);
	kfree(node);

	*devnode = NULL;
}

(bikeshedding on whether or not we need a local variable is left for
later)

I think the pattern is safer, but it's not common in V4L2 at the moment.

-- 
Regards,

Laurent Pinchart
