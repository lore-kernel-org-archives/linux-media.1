Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452788;
	b=22xF4rgrMwQS7SoQMS3MhqDsqanjKkp/eBog/afwMiXkhiym+BypWpb2XuwWTMI3cshR
	 TUbR4/rMb8s6HX8a54M2j0v6YANfATbGC/ymEPEFx8Fh/8RH26/TlChuSGmgpN0DaP8W1
	 j4n6LE66H3nW/EsLKUpCODeujCZHyCNI2Al2FmBnwp6JBOAYXKIZlVxYKyrFiIyx3lciw
	 sTYU2e3nyK7wHcCF5ROF+vUO6njgyOc+1P4UIwhBOB5HAHHZqb0IzlHud+55+Z7PCam9D
	 9Yv457yerMcmKEY7XjSE21I11rJc0LsDH6mu7tj05ced6fqOV/G+i4MzpJ2tTR9K4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452788;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=G5GOcfVTJpzXTpkHsyO9JFPHHkreXdYL3TX6r7XgD7c=;
	b=sD3eV0pwnVb8/6+6+3akOaa9zc0ajqTKTHcyHxaQ94qrqqmeNdrHT3+fS9ch0wI9eqKY
	 U9yBi4TgvzGC7oOjVCFE8tUvsLeY9Em0Rf6sydG4LCvY8iUCSnVwhg9xte975edlZO0pb
	 d7QujdYXy3w3ag1JlnKo86wouVqRFeWJo46h2RRyhJ8L0cHHLFqAm5SmZOIDtsoOUxHN7
	 9IdqEja4NeRFdVFIenlTirFU8sq4zBQICBiF3EJiKrJPoVqUzIqaaQVY+YXk2+9zRXS//
	 bMdpNE2LH70QAY3n/Ub3zXBO6iACfmSqyiD3p5ZNenrkE1WEil1wZOKtu6sSF0xi6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="KWbo/N1+";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735F606A32C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 16:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9735F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KWbo/N1+
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0351524;
	Mon, 23 Nov 2026 17:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795452634;
	bh=l8/dryjLxuvT6FFRE4uKR6sOJuF/HwjH8CE8LQaSU+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWbo/N1+IfkJV4d6PxOlBrVDROTiyT5d+9WMaT6Yz/GIqFi+/4V1c62W/YxD/aspM
	 D5w1jWSjV667oQxkJGEZIKzWYNXBSd3VpLhvJYDEO+E6CFWc5L+1ba7FBImJd3OMYt
	 iADYNegydcl1L7uu0RuFRG4CC7ye5b6ZbtBdlnS4=
Date: Mon, 23 Nov 2026 18:53:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/4] media: ccs: Use dev_dbg() instead of dev_err() in
 ccs_enum_mbus_code()
Message-ID: <20261123165304.GC2959742@killaraus.ideasonboard.com>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
 <20261123-ccs-clanked-fixes-v1-1-fb2bcc87a517@ixit.cz>
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
In-Reply-To: <20261123-ccs-clanked-fixes-v1-1-fb2bcc87a517@ixit.cz>

On Mon, Nov 23, 2026 at 01:02:39PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Commit 63bd19442f08 accidentally converted two dev_dbg() calls in
> ccs_enum_mbus_code() to dev_err(), flooding the kernel log with error
> messages whenever userspace enumerates media bus codes.
> 
> Restore them to dev_dbg().
> 
> Fixes: 63bd19442f08 ("media: ccs: Use %u for printing unsigned values, remove extra debug print")

According to the git history those have been there since the first
version of the driver (named smiapp back then).

The change is good, the commit message needs an update.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index c3592317ee575..284cfbd89349c 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2104,17 +2104,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  			      struct v4l2_subdev_state *sd_state,
>  			      struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(subdev);
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
>  	unsigned int i;
>  	int idx = -1;
>  
> -	dev_err(&client->dev, "subdev %s, pad %u, index %u\n",
> +	dev_dbg(&client->dev, "subdev %s, pad %u, index %u\n",
>  		subdev->name, code->pad, code->index);
>  
>  	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
>  		if (code->index)
>  			return -EINVAL;
>  
>  		code->code = sensor->internal_csi_format->code;
>  
> @@ -2122,17 +2122,17 @@ static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
>  		if (sensor->mbus_frame_fmts & BIT_U64(i))
>  			idx++;
>  
>  		if (idx == code->index) {
>  			code->code = ccs_csi_data_formats[i].code;
> -			dev_err(&client->dev, "found index %u, i %u, code %x\n",
> +			dev_dbg(&client->dev, "found index %u, i %u, code %x\n",
>  				code->index, i, code->code);
>  			return 0;
>  		}
>  	}
>  
>  	return -EINVAL;
>  }
>  

-- 
Regards,

Laurent Pinchart
