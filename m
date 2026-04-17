Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E338644B
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412898; cv=none; b=dLEklz2Y2r8k3xMkwZSDsBSyrqjoLDjkqse8q07d+14AY6j68piRGGthd0sCFVmBdXqZMw5nXNy++pnMk1Q2ciM1C8Jn8NxgLD4Z5LEqyWC0BIWx34b+HFiLSEAFPOkG46HRFl8PBnt4nySysF2N6zKrR1KPqOV8GbTrl+/dkNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412898; c=relaxed/simple;
	bh=E61CLs/TOZ+fqQeNjE+IVq/6jI44xVi6r2MOe0iAMFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IanzzOTdGsfu6ZhvhzW5sbKi5c37Cq2h0zll5NNc2Rp0ov1LCzE9DOf9SynDxfZyxvah6yO6WajoVj/Ok/NgHUwKNPtGgmI5+6XzpxN2TWhQwBFnbDyNYunWX2RtJFnan8XULQ1z9l4G45eyftRIwAboqmQy+S012iQZKReCNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGy5iI1B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGy5iI1B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so250377f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776412894; x=1777017694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAbA/rea0AphHw4Y3No18IGU2RBEKq1oJbRMenVLx2g=;
        b=CGy5iI1BaWvvwidWJF8LQhzvGsKiLFtR1iiCNRu+yjDeS1eWQui7pYG3KiiJV8vSIB
         4s/EVvWoFY963V0Dm216eFqPg0Af8t7UG1EvtviuQ9pQhQvNUBFvYgJovca/BYgwmaoQ
         oEOVlXkpwWO4CR1vfyrYwQlDTaoPdjujcWfQU8YRDhVAhPX7onpa/tIKjW6cWhQ4wQyc
         ZvQp71+DuOf8V5eWHCwjEQD0A3P5Oj6SP8f69Tlp9MqPrGqNgy9GELGLzMmiziiwyj04
         XCW9SExsyW0haj36MfNPr0FYq2CvCqYHMlFTMBIREgltt3PuQPp8oX95FVtTo3JpfiAb
         NlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412894; x=1777017694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbA/rea0AphHw4Y3No18IGU2RBEKq1oJbRMenVLx2g=;
        b=FrAka/uA+E03CElho5xGQIThoNWiyZUEl3m5HIzUQyvn22LH6GtsPcpY3CPOkwl2Yh
         6oX8XkoTcZes95RUjrcRJZ+DKdEI47hnpglq9Fy9InZrIMBvGFbiiSavJyR0ZlJW+pi5
         PCvGqaDm7lw0gZGXzmNAxmHkE49pbjOsFwFdOD+iqMTo/LRhMkXr3gbRmN+RIBnEfguX
         rMOYesferCXDmOoDi5wdjhI4BPwFG4idCt2GZ8gpU/qtg9aNJ/xFrYCwgTqZD08cD1RC
         j0jU0EHSqssgjd5utyvqEu1Y/4QukeUz9muRBaPtU5yAjMxOC7uAA1FNzhkM0+7fqEzH
         C5MQ==
X-Forwarded-Encrypted: i=1; AFNElJ82ouBotT3xLS3XNG57ojGa4jmmr5BH+C7YLfpUvVNZdpGfw7nVqJZOIaiqhX1Rt7iwlbivaIBlnyEvIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qKAzHapNP76RepJt5bScO4Ogd03lrS7AK7d/eoEvlJrTjR7t
	G3dsZ83vKXClvGHw3p27Y0nbImJzmBE4gyu81U00ky2J23dVnHO7dNdZ
X-Gm-Gg: AeBDiesHbNFSbFEz9ZQjZFWpRAc//NSGc09Gzn7SvBKfeW1f83jDrq+f1jrFdqlmMQd
	9HOkpAI27Mx7p7zhdytXZ9Swu3/3RcGwBW6WCSiaC+E7IVBOH5toB1peC8P57smFvVP0KGA8h+4
	+iO8RkCE847Brb4vpMAG4iKhwQhLFE9g/WpXUZnf7BeHH8QdNXM30x3UzpXqBI60OkA+l9Rq8Xo
	41MmEOJsskQELcpWIi3/0nsjVYdxUduMMUkdDdM7abmhPKqWjIZBV2iu0e3IsgM8c6sUZLFfT25
	DD+Cte1RCd8LEV7BJuiCzmpfdRbSOlvIMPeuqZJoeniWptewKU06U85cQCh8xxKuVICrB/smG43
	ceNe1uIImB6Cg2AqLLHJXG8dwuxk7yTm26orjjRDiWNFwjPdpHrxsGOBIRks6ZXl0FrmkvIUEHI
	ZAeb+RyeZY/5Uph74zx0xKSeqwsx4IkfoNQScP5o3z
X-Received: by 2002:a05:6000:601:b0:43d:b0f:eb44 with SMTP id ffacd0b85a97d-43fe3dd4e9fmr2452398f8f.15.1776412894006;
        Fri, 17 Apr 2026 01:01:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm2468491f8f.26.2026.04.17.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:01:32 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:01:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHo2WOF1Rcp9zwf@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417073939.2686170-1-hhhuang@smu.edu.sg>

On Fri, Apr 17, 2026 at 03:39:39PM +0800, Huihui Huang wrote:
> There is a memory leak in drivers/staging/media/ipu7/ipu7-boot.c.
> 
> In ipu7_boot_init_boot_config(), boot_config is allocated by
> ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
> the function returns -ENOMEM without freeing the previously allocated
> boot_config.
> 
> Add the missing ipu7_dma_free() call before returning on the error
> path.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> ---
> v2: Reword commit message in imperative mood. Remove unnecessary
>     NULL assignment on the error path.
> ---
>  drivers/staging/media/ipu7/ipu7-boot.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
> index d7901ff78b38..495b3e05a9b1 100644
> --- a/drivers/staging/media/ipu7/ipu7-boot.c
> +++ b/drivers/staging/media/ipu7/ipu7-boot.c
> @@ -263,6 +263,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
>  					   GFP_KERNEL, 0);
>  	if (!syscom->queue_mem) {
>  		dev_err(dev, "Failed to allocate queue memory.\n");
> +		ipu7_dma_free(adev, adev->boot_config_size,
> +			      adev->boot_config, adev->boot_config_dma_addr, 0);
>  		return -ENOMEM;

Adding a free here leads to a double free.  It's the same issue.
One magical cleanup function in the caller.

I haven't looked at this but I bet there are bugs in the error handling
since magical cleanup functions are always buggy.

regards,
dan carpenter

