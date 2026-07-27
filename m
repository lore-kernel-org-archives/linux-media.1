Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D380F9C0
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156025; cv=none; b=JyiI0+5nGfx1rTn43gFw7t09bvhNozhSjCNJ7eIOVRbaWsLJwHwRZw/Uq5pYhlckfeh64kx9+kojF347TgSTO7JBe5kdWyDJ4kcGxhGhN0VIIUeDmA8bnJnSXIeD7iTEdn6bLeggKX8HTSNSEKoqHnf+sM9asxi60LNkFw3upxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156025; c=relaxed/simple;
	bh=SyXw3P7kg3/KlTfgqDk+HTxBYtuQAAnyuPSFkEN4VS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ5lUJoTXGMbpw4B7B0yLMOBkn6TbMZbNRuxuHX3n6eLr2wSlTuU956iz3mnqW07Kc3UZ/Hzj/N9telKJzpk+SMpwRoJ/l57Uo/IaKulchifyt1MHXjBBnVigRpVuro/+v6pL0PSKHyS6XEO62TRxPoQtIC+visCq9ClJamLiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IP4awEy6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IP4awEy6"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BC3B19C;
	Mon, 27 Jul 2026 14:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785155958;
	bh=SyXw3P7kg3/KlTfgqDk+HTxBYtuQAAnyuPSFkEN4VS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IP4awEy6GSirSptUGJjmDfrMLO4N9uGKcvK4E/qSSv9+uAzjtgpld2JfTGSFqDjxV
	 ycmHlJnVrH8fvffk4hBDLrdwQvfOc6WjVATjCsnNM4IC57yl8iMI33uv5AttW6MwKz
	 9VNoMzSDGIJgzqyH0CT88KT7uGXIOf0ZfMOhjwos=
Date: Mon, 27 Jul 2026 15:40:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Guangshuo Li <lgs201920130244@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ma Ke <make24@iscas.ac.cn>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH 0/2] media: Revert 2a934fdb01db ("media: v4l2-dev: fix
 error handling in __video_register_device()")
Message-ID: <20260727124020.GE1348372@killaraus.ideasonboard.com>
References: <cover.1784295766.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1784295766.git.hverkuil+cisco@kernel.org>

On Fri, Jul 17, 2026 at 03:42:44PM +0200, Hans Verkuil wrote:
> That commit exchanged a memory leak with a double-free scenario,
> and it is not something that is easily fixable. Revert it, since it
> is still better to leak memory than get into a double-free.
> 
> See this email discussion for more info:
> 
> https://lore.kernel.org/linux-media/20260520090624.1071139-1-lgs201920130244@gmail.com/
> 
> I tried to come up with a reliable method to handle this cleanly in the
> v4l2 core, but the only way to do this properly would be to split
> video_register_device into two parts: an init and a registration part.
> And then convert all drivers to use the new functions.

We should do that.

> That's a very big job, and so for now just revert the patch and add comments
> explaining why it is reverted.

Agreed. For the series,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Hans Verkuil (2):
>   Revert "media: v4l2-dev: fix error handling in
>     __video_register_device()"
>   media: v4l2-core: v4l2-dev: add comments on device_register fail.
> 
>  drivers/media/v4l2-core/v4l2-dev.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart
