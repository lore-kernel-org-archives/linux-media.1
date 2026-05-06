Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA747F2E3;
	Wed,  6 May 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077148; cv=none; b=eSAZP2ZHFf4AKdiz5CdneyTO6ky1vE/7NSsWE1ht9d+Hba6tnq0ZbSJv+V+WNBQifCctiKWCfdjPk7nB08AMFrys9YuuzBPBqxC9ZcCNXD9SWCWOCr8/xqmA1oINAsbS7E+qxOsDbkgo0utrXluwtDvCBdA7OhlbMhXtwidrtnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077148; c=relaxed/simple;
	bh=faLeW0wtzD3frY5Q7ZoepRa1sIizw1jaytAj9zqKE5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZSR7WdmZupByh8kFl35kzZJJs1slw76sDeEzWZM41Lz91gHjfdg4widg2LzDvj9DW7VzO4H4NGoDTIKm+h2csdC6nfJKZB/PuMU+1Lezkx1vFegZYmW7kx6CPfEfiw0lWz0LVpOOa5P/UVGc62tCb0vwn6F7gRZzrlW3tCHfsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QdkgGNsG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QdkgGNsG"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423B463D;
	Wed,  6 May 2026 16:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077140;
	bh=faLeW0wtzD3frY5Q7ZoepRa1sIizw1jaytAj9zqKE5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdkgGNsGh0t/g9DtHJ+l3yZR9k8jmOHAsxfu2OsdU3z+PWu0lxW3INXfnW7jIR6zH
	 qxo1709JWCey5XCpOAaPpqg+kv4EZt9A/vSwuHzTyl5QRlAF1OlMXHuDntNWer2brp
	 nGbvCRjF/dqU1k1azSc3NrT2RCYadvVoau0s7ED4=
Date: Wed, 6 May 2026 17:19:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: imx8-isi: clean up already-initialized
 pipes on probe failure
Message-ID: <20260506141902.GQ1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-5-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-5-xiaolei.wang@windriver.com>

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:10AM +0800, Xiaolei Wang wrote:
> When mxc_isi_pipe_init() fails partway through the channel loop or
> when mxc_isi_v4l2_init() fails, the already initialized pipes are
> not cleaned up.
> 
> Fix this by calling mxc_isi_pipe_cleanup() for each already-initialized
> pipe in the err_xbar error path.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2b76fb9c18f6..8533a979d60a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -539,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_xbar:
> +	while (i--)
> +		mxc_isi_pipe_cleanup(&isi->pipes[i]);
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart
