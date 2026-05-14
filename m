Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB283DD50F;
	Thu, 14 May 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747811; cv=none; b=kmT1y0kupc9JgbroplGwJrjqV9tR1CJs8pU0vyRPdCIsSXAvh2BtZyWlS/G+7igQZfyc9DRdd56+R6aArwCK+QH6bRgTBOHGS9HQrjKcKSaDctcobg8cfbKA1dzW8h409aWZm435o/5NqWI22q6xu6Zao1LMdZfQ0Yb/C54OMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747811; c=relaxed/simple;
	bh=UwWfVm2VWDCELuLxD3nvT7S5jyycrBHPj7mJk5Zzfqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov4v9Prrt/bdAUmHtCizS31NxzUiRN76hP9dZsVCHRuqd+NulWCk1vO8mZ0Ke4YjAgeAyUO/GXHVUXd0B9mvdKBjRbNOfMsnQ6x192Gd7SNwzY1mg171K+Vs2SWXqikr4S3WqiaEVD+f/RgdPFUFYr4YLARtfKv3q8Z+pvWop3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c8jpp/kx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c8jpp/kx"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8B3B454;
	Thu, 14 May 2026 10:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778747799;
	bh=UwWfVm2VWDCELuLxD3nvT7S5jyycrBHPj7mJk5Zzfqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8jpp/kxD+sqV7m6is2qEHkBxfFXCxrgnD01rDJTsfvPo04ssCMdXVl3Bb2cDvC4N
	 LCPvxzgxRY/OOA8ZjC6U5t0MxNaAVERxRyWzBnQBlcaKDnyKz480fNVOwPJreDEvW3
	 CFd3dujYrOczFGDbMkIfDYez7zSud6tDoMAdqw/M=
Date: Thu, 14 May 2026 10:36:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] media: i2c: ov5640: Add ISP Control registers
Message-ID: <agWJkrD-b_TEuiUb@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-9-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-9-0869a7802a33@ideasonboard.com>

Hi Kieran

On Fri, May 01, 2026 at 04:39:11PM +0100, Kieran Bingham wrote:
> Define the bits for the ISP control register to be able to use
> and explain component enablement.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 34fe7f51e17b..fd369a13463e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -110,6 +110,21 @@
>  #define OV5640_REG_MIPI_CTRL00		0x4800
>  #define OV5640_REG_DEBUG_MODE		0x4814
>  #define OV5640_REG_PCLK_PERIOD		0x4837
> +
> +#define OV5640_REG_ISP_CTRL00		0x5000
> +#define OV5640_ISP_00_LENC_ENABLE	BIT(7)
> +#define OV5640_ISP_00_GMA_ENABLE	BIT(5)
> +#define OV5640_ISP_00_BPC_ENABLE	BIT(2)
> +#define OV5640_ISP_00_WPC_ENABLE	BIT(1)
> +#define OV5640_ISP_00_CIP_ENABLE	BIT(0)
> +
> +#define OV5640_REG_ISP_CTRL01		0x5001
> +#define OV5640_ISP_01_SDE_ENABLE	BIT(7)
> +#define OV5640_ISP_01_SCL_ENABLE	BIT(5)
> +#define OV5640_ISP_01_UVA_ENABLE	BIT(2)
> +#define OV5640_ISP_01_CMX_ENABLE	BIT(1)
> +#define OV5640_ISP_01_AWB_ENABLE	BIT(0)
> +

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>  #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
>  #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
>
> @@ -601,7 +616,10 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
>  	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
>  	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
> -	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0},
> +
> +	/* ISP Control */
> +	{OV5640_REG_ISP_CTRL00, 0xa7, 0, 0},
> +	{OV5640_REG_ISP_CTRL01, 0xa3, 0, 0},
>
>  	/* AWB Control */
>  	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
>
> --
> 2.52.0
>
>
