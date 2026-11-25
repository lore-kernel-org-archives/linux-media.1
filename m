Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596951;
	b=gABgtewMIJMmb45SjW5iMmCcauXGRUUSUnkkhO7FKYW8QOqrRj+Fp3oy0Vel150nDZpo
	 yHnLOYfpkzDOfPhrA89xMgqu9xlPbxFFLj44ltpGPOKBH1t6UI1eCwMLOdRni1EzVbqPJ
	 HuOsWQSTbfUSUCyKlBa+PfTDa1TkfJz12kN+F0Q9DTYqj26Y+4nd+OYKCY1S31iU2XnwV
	 TZSk+il3Xf9zEc7ljwE3KTV7aWVkie+UOrT1gOxqNxiosC3A2pTqwWRkFXW3CF4uKHD8f
	 qoXfCso+qdUseYFw0OoaGwil2W5aZYYFL8ciEL5Qh0FQgNndcNCKjdF4cFc2cVK4OIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596951;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=vgsYe7KPFry5vGAlJY0NmB0rWIeyx9jEZizFH8iUmvE=;
	b=aHoyQ9fi2NW0kyXgI6wlFQ1LublTMNFTbs8EAaOchXMNwLsz5yXBi/SFvbg9TNpWThcc
	 Mv6rcFbEww2YVk6Ni/0kDatrlSriTj/4h+ZCLSJ+0Nel1IygJ3ymRBWCtqwxuN5q4YavR
	 y9GY9Djj4uiazA0QU5USrondloL3HcrS6CR5BpFr+YOEtT3Np3SAB0LcAI6itOo4Gm3KI
	 bEV7GNx4kp1dUHnHWiiwXHigAnqMBeSo50GZWQg2pfkImTNBWJpqfIt+flUYYE0g6uLxG
	 uZbsMhafC20jae5UAVL+zCMt6Dk5dTEKIKXkGRYU3oGBrb4LqEBPG5qFpohMTnrQWng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mnu8MBVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D369606A31E;
	Wed, 25 Nov 2026 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mnu8MBVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D211F000C6;
	Wed, 25 Nov 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596950;
	bh=vgsYe7KPFry5vGAlJY0NmB0rWIeyx9jEZizFH8iUmvE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Mnu8MBVoxumYqteWsAstS9zqXGLgKPyadSkd8o1fkNxDWdBwZwF4hwXzQro0llQzP
	 Z7dBpQFx7C/kUmA1dy9G9uypc3QNuE9Ykf50FNAG0EqzE/V965Ma1KyBdo1U4tAPSz
	 WKG2rt2aXNX/1l7sVRHEolrpOheHimrlcMMEvdmDkEKcIB2H3u+gOyL6aCSBkOmeWE
	 HzUyuNsk/XByWquPy2g8QzLoQaAH5WUX534bYO0/EjwKMwP5WgByBTddNPPO1ZPHTt
	 zqOUH+caFdZV0rOTu38IBn3+IjhL1yBpu+NAqbLQQLFDtOdJoUr6izCommDJ0/Pf47
	 L7YOyALKmKq8g==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/24] media: mali-c720: Add Mali-C720 ISP driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:55:47 +0100
Message-Id: <179559694752.14607.4218343265884065337.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
> +
> +static int mali_c720_probe(struct platform_device *pdev)
> +{
> +	const struct mali_c720_discovery_target top = {
> +		.module_id = MALI_C720_DISC_MODULE_ID_PIPELINE_GLOBAL_CONTROL,
> +		.pipeline_id = MALI_C720_DISC_PIPE_GLOBAL,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct mali_c720 *mali_c720;
> +	struct resource *res;
> +	unsigned int irq;
> +	int ret;
> +
> +	mali_c720 = kvzalloc_obj(*mali_c720, GFP_KERNEL);

Why absolutely nothing here is resource managed?

> +	if (!mali_c720)
> +		return -ENOMEM;
> +
> +	mali_c720->dev = get_device(dev);
> +	platform_set_drvdata(pdev, mali_c720);
> +
> +	mutex_init(&mali_c720->device_lock);
> +
> +	mali_c720->base = devm_platform_get_and_ioremap_resource(pdev, 0,
> +								 &res);
> +	ret = PTR_ERR_OR_ZERO(mali_c720->base);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to map IO memory\n");
> +		goto err_free;
> +	}
> +
> +	mali_c720->mmio_size = resource_size(res);
> +
> +	if (resource_size(res) < MALI_C720_ID_SIZE) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
> +				    res, MALI_C720_ID_SIZE);
> +		goto err_free;
> +	}
> +
> +	mali_c720->clk = devm_clk_get(dev, "vclk");
> +	ret = PTR_ERR_OR_ZERO(mali_c720->clk);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to acquire clock\n");
> +		goto err_free;
> +	}
> +
> +	mali_c720->reset = devm_reset_control_get_optional_shared(dev, "reset");
> +	ret = PTR_ERR_OR_ZERO(mali_c720->reset);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to acquire reset\n");
> +		goto err_free;
> +	}
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret && ret != -ENODEV) {
> +		dev_err_probe(dev, ret, "failed to initialize reserved memory\n");
> +		goto err_free;
> +	}
> +
> +	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> +	if (ret)
> +		goto err_release_mem;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +		goto err_release_mem;
> +	}
> +
> +	ret = mali_c720_power_on(mali_c720);
> +	if (ret) {
> +		dev_err(dev, "failed to power on: %d\n", ret);
> +		goto err_release_mem;
> +	}
> +
> +	mali_c720->registers.id = mali_c720_get_id_regs();
> +	ret = mali_c720_identify_hw(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = mali_c720_get_registers(mali_c720->hw_version->id, &mali_c720->registers);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "unsupported register layout\n");
> +		goto err_power_off;
> +	}
> +
> +	if (resource_size(res) < mali_c720->registers.context_size) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
> +				    res, mali_c720->registers.context_size);
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_discovery_init(mali_c720, resource_size(res));
> +	if (ret) {
> +		dev_err(dev, "failed to parse capability discovery data\n");
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_discovery_get_module_base(mali_c720, &top, &mali_c720->top_base);
> +	if (ret) {
> +		dev_err(dev, "failed to get top base address from discovery data\n");
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_init_contexts(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = mali_c720_init_ctx_mgr(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = platform_get_irq_byname(pdev, "isp");
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get interrupt\n");

Please use modern Linux drivers as an example for your code. All this
should be dev_err_probe or dropped, because core takes care of.


> +		goto err_pm_runtime_disable;
> +	}
> +	irq = (unsigned int)ret;
> +
> +	spin_lock_init(&mali_c720->irq_lock);
> +	INIT_KFIFO(mali_c720->irq_fifo);
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					mali_c720_isr_top, mali_c720_isr,
> +					0,
> +					dev_driver_string(&pdev->dev),
> +					&pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to request threaded IRQ\n");
> +		goto err_pm_runtime_disable;
> +	}
> +	mali_c720->irq = irq;
> +
> +	mali_c720->media_dev.dev = dev;
> +	mali_c720->media_dev.ops = &mali_c720_media_device_ops;
> +	ret = mali_c720_media_frameworks_init(mali_c720);
> +	if (ret)
> +		goto err_free_irq;
> +
> +	pm_runtime_idle(&pdev->dev);
> +
> +	dev_info(&pdev->dev, "Media frameworks and entities registered successfully\n");

Drop, drivers should  be silent on success.

> +
> +	return 0;
> +
> +err_free_irq:
> +	devm_free_irq(dev, mali_c720->irq, dev);
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +err_power_off:
> +	mali_c720_power_off(mali_c720);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
> +err_free:
> +	platform_set_drvdata(pdev, NULL);
> +	if (mali_c720->v4l2_dev.release)
> +		v4l2_device_put(&mali_c720->v4l2_dev);
> +	else
> +		mali_c720_free(mali_c720);
> +
> +	return ret;
> +}
> +

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
