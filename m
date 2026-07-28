Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485241F36F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241615; cv=none; b=JJXBdYvGqfdKNVjre586nY0+rTnRtLMUr2zKN9gHbH9stO57JUIKqLADOmYy6LcPPuxbOAuLzEufFgwCus9rZ0NoWZJ3qU4dTblMSIb0/RYV+xzcegNpA21rguzS15KOtx7sza3hDr4X/s6WFOY8v9OWQQ5xJq/Y6ttDhfKsnmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241615; c=relaxed/simple;
	bh=Rnk9kUO5NilLQ0MRPMhPkQ4SmqYDKd8hEsVwdDkuI1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sm09KKH9xChbcbgPbWQOB5WsGAd8AXXF4ZdonezKMGFcGZZzB+XhytgAtDYhBL60XQ3lOdoa8QZfXMbRzWdCXD3pRcdpJDgjnKkrY9LzVqg41KqhzHHCat+WdVOK6/ujQlE3YSAxQ00TG4OQ0QhRqx5FZGNNFFPuT+jl66vuUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gg7Sh+oH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gg7Sh+oH"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F548558;
	Tue, 28 Jul 2026 14:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785241546;
	bh=Rnk9kUO5NilLQ0MRPMhPkQ4SmqYDKd8hEsVwdDkuI1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gg7Sh+oH53nhqd1X5x8rBu8Y2CKFGp2OssDFsuf307ierUCk7I/93KYDaQc7OHJvn
	 44MWer9JSOeOTHkLu0omFiGLqol/5nsoKI1xe8gCBTISYhI87EnlJSs7WJFurGaR61
	 beoxgyy/UBD+WMWE2bnpMxRvrzPJMJg1UuyWRFik=
Message-ID: <2d3f854c-0731-4405-b77e-13929049ca67@ideasonboard.com>
Date: Tue, 28 Jul 2026 15:26:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Sakari Ailus <sakari.ailus@iki.fi>
References: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/07/2026 14:19, Laurent Pinchart wrote:
> The MC API was introduced in the CAL driver more than five years ago in
> commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
> centric API") as a disabled by default option. Five years later, it's
> time to give users another nudge to move to the MC API. Deprecate non-MC
> API usage by printing a warning at probe time, and defaulting to the MC
> API. The legacy API can still be selected through the mc_api module
> parameter.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/ti/Kconfig   | 11 -----------
>   drivers/media/platform/ti/cal/cal.c | 10 +++-------
>   2 files changed, 3 insertions(+), 18 deletions(-)
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

