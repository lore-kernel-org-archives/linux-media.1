Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB50F32ED29;
	Sat, 28 Mar 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719891; cv=none; b=UHKBTa0QmghVTWkJQllrh2Jd8vN16P66Pyf/nxiNBq1Kv6HghQ43fA9d454djQL9wbX0aevWSkOL5Fr/Q+wKqrIwWJE3CQ4FWgu4SnBkbMRwu+vs2gXxNqzMHJF1+8kPsFyonRvtTR5wULkcUlmkO5anHujCfH+j7jIuV+uhNlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719891; c=relaxed/simple;
	bh=9f5FoTkpUEAyYpmPdbk4UmzTlkKkBMcDTGMWT/ZTAtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faLiovbXkZ+UN+ZUmfyU5y8sZ6/W8K3fIrFcss8sxRMvH+84/G42XJj0DT+noRpWELcCRgQyD9wergI8bEtmE3Eh+yefaNOM/9uDbNcXIz7L18csc2KgjIl8JixfuqbZYbWV7v1NO67NsCSeICTsog//W2NmEo+8kkCgr9rMbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fhasfqx4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fhasfqx4"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A579573B;
	Sat, 28 Mar 2026 18:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774719807;
	bh=9f5FoTkpUEAyYpmPdbk4UmzTlkKkBMcDTGMWT/ZTAtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fhasfqx4pFNWTT4FMvnRjoIVljc0kzW3i6C1MXPKOUUT7+0w0AJEHMoqR4V/RriSM
	 Xj61FfLnBeYpuNP051JHAAizEUIRJtqlQX7uMQWfeb/mevcf5AFq3oh6etF6bFeEEY
	 FnjSpWOCEOrxvNqAs8Gvzv1IBFnUpyyXKHvpk7WQ=
Date: Sat, 28 Mar 2026 18:44:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, nayden.kanchev@arm.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: mali-c55: add missing
 of_reserved_mem_device_release()
Message-ID: <acgSk8u9wquMU4Iv@zed>
References: <20260328151452.148901-1-devnexen@gmail.co>
 <20260328170411.186973-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328170411.186973-1-devnexen@gmail.com>

Hi David

On Sat, Mar 28, 2026 at 05:04:11PM +0000, David Carlier wrote:
> mali_c55_probe() calls of_reserved_mem_device_init() to associate
> reserved memory regions with the device. This function allocates a
> struct rmem_assigned_device and adds it to a global linked list, which
> must be explicitly released via of_reserved_mem_device_release() — there
> is no devm variant of this API.
>
> However, neither the probe error paths nor mali_c55_remove() called
> of_reserved_mem_device_release(). Any probe failure after the
> of_reserved_mem_device_init() call, as well as every normal device
> removal, leaked the reserved memory association on the global list.
>
> Fix this by adding an err_release_mem label at the end of the probe
> error chain and calling of_reserved_mem_device_release() in
> mali_c55_remove(). The remove teardown order is also corrected to call
> mali_c55_media_frameworks_deinit() before kfree(), mirroring the probe
> init order in reverse.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Please don't send single patches broken out from the series they
belong to. Either resend the whole series, or, if really really
necessary, just update the single patch in reply to the one in the
list by making it [PATCH v4.1] in example.

Otherwise for maintainers knowing what patches to pick up and from
where it's quite difficult.

In this case, no need to resend, I'll add my tag (and possibily
captialize the first letter of the commit title) once I'll send a pull
request for v7.2 (unless Hans still have space to pick these ups for
v7.1, I've put him on cc)

Thanks
  j

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index c1a562cd214e..5cb59c70ffc9 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>
>  	ret = __mali_c55_power_on(mali_c55);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to power on\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to power on\n");
> +		goto err_release_mem;
> +	}
>
>  	ret = mali_c55_check_hwcfg(mali_c55);
>  	if (ret)
> @@ -846,6 +848,8 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
>
>  	return ret;
>  }
> @@ -854,8 +858,9 @@ static void mali_c55_remove(struct platform_device *pdev)
>  {
>  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>
> -	kfree(mali_c55->context.registers);
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +	kfree(mali_c55->context.registers);
> +	of_reserved_mem_device_release(&pdev->dev);
>  }
>
>  static const struct of_device_id mali_c55_of_match[] = {
> --
> 2.53.0
>
