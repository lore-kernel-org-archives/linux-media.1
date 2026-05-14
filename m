Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B873C141A;
	Thu, 14 May 2026 07:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745527; cv=none; b=h24J5wcpjd+EgVLcGtJI+uB/tjD5gw0BDIuivJ7oEJnu4aXYN7fZ3wWCAZknPmNVMtUwUUFUSHB0919ej5oLvUCwM8oqNLfgi8lNtdj8juk85L3t4W3d3CY+xp5qb9WoTrRc9kBi5bjKzviq6u3vfenaHCBVLXlgipdxzHnN4ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745527; c=relaxed/simple;
	bh=CZ267v1Bbg6RL+8dsbOUbFbyKkgirewldJRezoyvZ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0MR1I77yND82Px95cWP+28QpV+2BHYJ1h41K8vb0/+XAafDOidoaNj7T0YyHZStwX2D4CpnhnCYgjMNnmjJvjW9BVfID6c+oZKuRqKfZMfMs3JHuLt3X3gFGYCpsYWbJz9iLjy/rJX2z9E051hwqFD9v+NMEa4WUeW4s5j4lOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KNiQO7aE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KNiQO7aE"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77DBB6A2;
	Thu, 14 May 2026 09:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778745514;
	bh=CZ267v1Bbg6RL+8dsbOUbFbyKkgirewldJRezoyvZ9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNiQO7aExYCvnng6goXGy0n3hiIp+SVJPBCHg/l1lUC4VDj9Bshs8abu5lfnFbzl4
	 pPtj7xcqZ4TBjU+IWlpOYg7F7TNqjAc/imzTaOhADaPjD+T5iWapsj3kb8V0dT5hJM
	 EAkB4J25YWGmfQBvNmpTVf2RKEVfe0naa8PyMAOA=
Date: Thu, 14 May 2026 09:58:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] media: i2c: ov5640: Set exposure minimum and
 defaults
Message-ID: <agV_cPZeRh-BI1NW@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-2-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-2-0869a7802a33@ideasonboard.com>

Hi Kieran

On Fri, May 01, 2026 at 04:39:04PM +0100, Kieran Bingham wrote:
> A zero exposure would be a fully black image and not useful as a sensor.
> Increase the minimum and default control values to sane parameters.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 01ea6b2bfeeb..b5e529ea662b 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3479,7 +3479,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  						 V4L2_EXPOSURE_MANUAL, 0,
>  						 V4L2_EXPOSURE_AUTO);
>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> -					    0, 65535, 1, 0);
> +					    4, 65535, 1, 1000);

Where does 1000 come from ? The register default is 512, should we use
that value ?

Also, is the 4 lines step value correct ?

>  	/* Auto/manual gain */
>  	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
>  					     0, 1, 1, 1);
>
> --
> 2.52.0
>
>
