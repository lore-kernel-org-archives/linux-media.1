Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488438947F
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723092; cv=none; b=DQuApqYkv08Gb1MxdXWeosYHEENTHN8CHmkrPa7xcuyNF3iA1e/2KLdi0XqFy3i98TXFgxJY/9C0YaphOXlEmQI3e/BZhJr8yhjNRoJrHddAmzNRzg/qSv+EU6k+FVOthNEL9Ac5xpWdTCRMAR8k3gz4kxg7+N6dvLPL5kiRM5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723092; c=relaxed/simple;
	bh=+20KaMhvSSbise5Yov//7HnUdccMVp8bTEt3w8XQOI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D98Gqa19977otkmXSnys6IcrXGvCBUzp66BX+Qwcj0aGRYi0VsEb84phsk4eDpU14ReRiTU0UP0c4ZFsIEX1d4EF2zvEklJRBmt04LmCQfJOPUi2OvSwsAR1EikTFL6RXbr95vn+vYbRQsUGHBxst+Q59fJG/EFdK02j7aXuGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hsBK/O7P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hsBK/O7P"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECAE4DC;
	Fri, 18 Sep 2026 11:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789722985;
	bh=+20KaMhvSSbise5Yov//7HnUdccMVp8bTEt3w8XQOI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsBK/O7PrI+WthgBraQv0eAxdoNZdglHQeRovjqIlg7Q5VLwQwDak4a33SZqLXgcd
	 4y4iO57NQv909m5oVHXUV2FfdH3Cznqh4rjL6bWYTWeWSsznkTybD5tNlUZoxX8Vas
	 9+umXpJBIUtthMxgsRYhB3X/s6HDI+pmGHIU9J/M=
Date: Fri, 18 Sep 2026 12:18:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20260918091806.GE59058@killaraus.ideasonboard.com>
References: <UzpC1s2YnBtZIaRCab_Y8AbCecyauDUO4OC7Nhd1-h4TE21aLSghbwDuOKgdwJQugvPMjM4foPHuL-UKnBLD6A==@protonmail.internalid>
 <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>

Hy Bryan,

On Thu, Sep 17, 2026 at 02:47:52PM +0100, Bryan O'Donoghue wrote:
> On 15/09/2026 00:38, Laurent Pinchart wrote:
> > We can consider scheduling a third topic. Proposals are welcome.
> 
>  From my LPC submission:
> 
> "Should offline ISPs be implemented in drm/accel"

I personally consider that this question has been discussed enough in
the past and I don't see any new development that would call for
reopening the debate. Proponents of ISP drivers in DRM haven't (in my
opinion) shown any substantial technical advantage, and the few
technical issues that have been pointed out can be addressed (and are
being addressed) in V4L2. I don't see allocating 15 minutes of BoF time
for this changing the status quo.

> Where does an offline Camera ISP belong in video4linux or in DRM and why ?
> 
> There are two main types of ISP - inline and offline. An inline ISP 
> takes sensor input directly and produces some kind of processed image on 
> the output. This is a natural fit for v4l2.
> 
> An offline ISP takes a memory buffer given to it and processes that 
> buffer against supplied parameters. This model can be implemented as a 
> video4linux m2m device but it could also be implemented as a DRM device 
> and included in the DAG.
> 
> Taking Qualcomm SoCs as an example the Camera hardware provides two 
> types of ISP. An inline processing engine IFE and an offline processing 
> engine based on firmware ICP/HFI.
> 
> A use-case emerges to implement the inline ISP in v4l2 and the offline 
> in drm/accel.
> 
> Some tension with this design would exist as user-space would have to be 
> involved to update ISP parameters and process statistics. Another 
> tension is including a firmware based system in dma-fencing including 
> watchdogging and resetting if required.
> 
> There are clear benefits to having a loop of NPU/DSP to Offline ISP to 
> Display that drm/accel seems to offer some interesting solutions to.

What are those interesting solutions ?

-- 
Regards,

Laurent Pinchart
