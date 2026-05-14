Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0923DD524;
	Thu, 14 May 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748067; cv=none; b=KC9SqeLhvIdcVCg2KVBpqYW+pSKzoHhac5EI7RSRD2dzt/HlfcRvPv3rLoZGzL5RlgBx1xe6Jmfq/8qRNXCUVvjVw1yda6v3josvXzH8cpMzZ3CQR2UXAhi34j9AlbiLDU5FO3DuveStnyKn85AHtHxBvwNZQMcqtuHgu7j565M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748067; c=relaxed/simple;
	bh=1StYEFeLGrAaYeI0QulSSxPAxcHFnOoNk0VphHnfDXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJvFllMHhSpna3OyO/f3uiIRm+J0td1k2abjtH+qALKcVU2CqdJhDJ0nOtgOWQxd6AMmbDHS+YB8aSnByjrBwiS93aLO6d19CTp2xNXm+ONI7t9Av2rxsZ4YaAOQVH0EuaEFf9wKaY+Umxy8uSA7o1vDr6h6WiJ4HYJ8eMxZgQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EOPrinQV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EOPrinQV"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E8DD454;
	Thu, 14 May 2026 10:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748056;
	bh=1StYEFeLGrAaYeI0QulSSxPAxcHFnOoNk0VphHnfDXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOPrinQV1zGyVdqAMzvg+JcBKQjPzwfUtVDgjMTYeIxTLJdB2oMGPFTao2zN5R/uS
	 ooQzO4MxFBZVebCi6AKlcNb3mUDZ4q0Ct3pK/M9E2vSFQOJfnCTtM9StbnEDmdn/Sb
	 RTe1OYb8rfcCOZg2KHPSuAiwSP3wjGXh4YlC4U8o=
Date: Thu, 14 May 2026 10:41:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] media: i2c: ov5640: Split out format mux registers
Message-ID: <agWKjDSvuDTEmV8n@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-11-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-11-0869a7802a33@ideasonboard.com>


On Fri, May 01, 2026 at 04:39:13PM +0100, Kieran Bingham wrote:
> The init_setting table configures format control and mux to default for
> YUV420 output.  These are later determined by the users format
> selection, and so are candidates for removal from the init table.

Can we remove them then :) ?

>
> Split the additions out from the register block and document them.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index f63d81640f54..477f6a3ddbf6 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -615,8 +615,13 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0}, {0x3000, 0x00, 0, 0},
>  	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
> -	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
> -	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
> +	{0x302e, 0x08, 0, 0},
> +
> +	/* Format control, Mux control */
> +	{0x4300, 0x3f, 0, 0}, /* YUV420 YYYY... / UYVY... */
> +	{0x501f, 0x00, 0, 0}, /* ISP YUV422 */
> +
> +	{0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
>
>  	/* ISP Control */
>  	{OV5640_REG_ISP_CTRL00, OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00_GMA_ENABLE |
>
> --
> 2.52.0
>
>
