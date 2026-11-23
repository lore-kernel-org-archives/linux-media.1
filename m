Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452852;
	b=EpIWB9wx/Bp/BrZHZyrfnVr9a7YUCS4oBGU9Wvsr46KB46c0Jl0Hf9KzUMRa6/hcqo6b
	 RQJR6FI82pYsewCSQvP9SDe6nLkvoH+FTaqd8MuvOkre2KNbcgBxU1Q1RxvFjOf8z0co7
	 uDJLwuYNmAbsIYAe+4LtKh/blsOcOBqfruFMOaSlVNxtAqadudsXaUeaP/wBNtfQWS+T/
	 +moA7DxzwGDBTDR5RFzKz5/gOfbTRMQndgTUXOQ2AFOhwEWAo71xohaK50eBcyn5epdJl
	 lAcrS8R4j+FEM5DpJ3HOUdX+PvhxWpJ8Z6KUt0LMSRmkfo8r/+iqWc0TFQFr2XEGtUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452852;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Tjia7Fxbzt9Y1/EE5pR7lMHyS4HVRPkit7YE4qQ0DCM=;
	b=oRMSG0ck5mxk8+fYmnzlWe1z5rJ7pvjUIifGaBmb17p5rYUuN82VeFJTSWCfiwcm8JFt
	 aXnG+LScHu9y262K/htCK4V3UeTNkMVpSDIYp8d7EnE7ikD6F46RH/VcjYlyGrf9WAQ/H
	 +N40+hoht6gDVQLpV2g0+/RtpwddcXjxzatZvn56R1WDrnA+RU7d+raBxkJ/QcTijvOkc
	 OVLwAIeR1CNpBULukRJ3PfFTaOF9mXFZsfcGXwvpxml075PSF/9JrpDuuuoLzj+Y2swWd
	 mGN0GMgbA3cCV+JnVcDZARcN+kOFJ45LNU655KgaG5u2lU6lxXF7avnBsLq1CcnRLmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LJpQI9yX;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAAD606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 16:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=LJpQI9yX
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C399F524;
	Mon, 23 Nov 2026 17:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795452698;
	bh=3R5yoA26KCEBHw/TkQ/kMBJZs0qJbFeRlsGmTG+ckx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJpQI9yXdbZ7M0eqND6vwctg5cEKhcIpSODb4jiiv4nS/b9oVe5YdUbtelcEbPY6H
	 fBSmKY3teSMS1TtJccEs/qvOpZDTf0Z9mE0qgOntdoDTLoxtFeejgIL7At96hGwc8r
	 8eznYtkCgA7cIPLNgt+jYXDm8BNWLg/tCFp0lfMA=
Date: Mon, 23 Nov 2026 18:54:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] media: ccs: Fix sub-device index in ccs_cleanup()
Message-ID: <20261123165408.GD2959742@killaraus.ideasonboard.com>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123-ccs-clanked-fixes-v1-2-fb2bcc87a517@ixit.cz>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123-ccs-clanked-fixes-v1-2-fb2bcc87a517@ixit.cz>

On Mon, Nov 23, 2026 at 01:02:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The cleanup loop in ccs_cleanup() calls v4l2_subdev_cleanup() on the
> hardcoded element ssds[2] instead of ssds[i]. On two-subdev sensors
> (without a scaler) ssds[2] is uninitialized, and on three-subdev sensors
> ssds[0] and ssds[1] are never cleaned up while ssds[2] is cleaned up
> three times.
> 
> Use the loop index i.
> 
> Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 284cfbd89349c..df636b8df0b51 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3002,17 +3002,17 @@ static int ccs_registered(struct v4l2_subdev *subdev)
>  }
>  
>  static void ccs_cleanup(struct ccs_sensor *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
>  	unsigned int i;
>  
>  	for (i = 0; i < sensor->ssds_used; i++) {
> -		v4l2_subdev_cleanup(&sensor->ssds[2].sd);
> +		v4l2_subdev_cleanup(&sensor->ssds[i].sd);
>  		media_entity_cleanup(&sensor->ssds[i].sd.entity);
>  	}
>  
>  	device_remove_file(&client->dev, &dev_attr_nvm);
>  	device_remove_file(&client->dev, &dev_attr_ident);
>  
>  	ccs_free_controls(sensor);
>  }

-- 
Regards,

Laurent Pinchart
