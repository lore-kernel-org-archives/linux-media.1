Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708439;
	b=5bQBFXt4Ri6vj98i1VF/PEU2C8o1lJsGwKUtRJ8K9aNBjKGWRxdnt5/h8e13UZILzW60
	 f8gGEe1uTJE2lyLjHsXU5sBQEvSTwsbLEvmlaubbAJ3cPCrVRbk0o+Oq382cMtl7Dyupb
	 6UqpcDgdFuI2l+Xr8vG6mmVv/aIE4J+7+/Al0jLelyxIP+8raEr/JpHCvT8xjExzx/grx
	 CldtZkGgayhBdBx96TQkoXo5XXcNQ56mt+pJTvXcQsHgpJ69oE9Ix3OTQqCGHd6fHG6Cn
	 PCeH/wHqWdFgrFYCE8G8drrtuH9QJ4fZhrT5ulWXrLAFl5U4O//QDzoLzjKk04jQ/9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708439;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xt6CCzegwx57gwXIIUhPxJVYT1/6mmRsfjTCNrJQl+4=;
	b=IGDWVwOwF/qBpbaIlBmGBSUvRKuXrY+2y0oWooGTSRvu7yt0/u5vh8ZUem9mQxnXPq6/
	 tajGY5s5ijdro7SHQl2zyXdMWVX/cFgGAFq7he/w4LKqAT0DITg8C4p5rNRfjOC9DyT9J
	 Zzhe1YRWNAwvCkSYWu+YMgZivscDqFRbBvPvOfmZn9YeMYPAGM1tj5HI7Dl6Nahu/xexM
	 wN6nAOZe8B3P5o5SWiA7wQZ8CRs6QJJW55EoFbNqRNyMx7XWD/PKMps3mCIUyAU/6TBhV
	 1bEZWsdT+B2zUDMkgu5lPPIcsGKWGAbqo5eI8pG7Uv5OPTB9Y6a6RsAWmAUFykpKSMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CUQVUqxn;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D59606A31C;
	Thu, 26 Nov 2026 15:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CUQVUqxn
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9548E1BA8;
	Thu, 26 Nov 2026 07:53:55 -0800 (PST)
Received: from [10.33.48.93] (GM14V85S.arm.com [10.33.48.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6AE3F632;
	Thu, 26 Nov 2026 07:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795708438; bh=qbAONIy/SeoYIBUEJb8afeuxKQ5lwUfOP98bjEHX8p4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CUQVUqxnGGQTk+61T4guFif1c5Zq0E0q0/8haQhNzZdcdZ+cYfuvGRnqiNqAUZAPo
	 q7QmEGGu+9/g6vyoxNkL1b+rLVgweF2mFPBXSZFfRQ+UvZxvprKaxIksccyBP43okb
	 //IPYb8gQajT8VurUJ1G2L2yIlSRokqPjanO296I=
Message-ID: <1757ee89-1c08-49d6-9a85-e9b516c889df@arm.com>
Date: Thu, 26 Nov 2026 15:53:53 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] media: mali-c720: Add Mali-C720 ISP driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
 <179559694752.14607.4218343265884065337.b4-reply@b4>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <179559694752.14607.4218343265884065337.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, thanks for the review,

On 25/11/2026 08:55, Krzysztof Kozlowski wrote:
> On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>> +
>> +static int mali_c720_probe(struct platform_device *pdev)
>> +{
>> +	const struct mali_c720_discovery_target top = {
>> +		.module_id = MALI_C720_DISC_MODULE_ID_PIPELINE_GLOBAL_CONTROL,
>> +		.pipeline_id = MALI_C720_DISC_PIPE_GLOBAL,
>> +	};
>> +	struct device *dev = &pdev->dev;
>> +	struct mali_c720 *mali_c720;
>> +	struct resource *res;
>> +	unsigned int irq;
>> +	int ret;
>> +
>> +	mali_c720 = kvzalloc_obj(*mali_c720, GFP_KERNEL);
> 
> Why absolutely nothing here is resource managed?

These allocations are explicit to allow the driver state to outlive
unbind, since userspace may still hold file descriptors to video
devices. We use the v4l2_device.release callback to free this state
once all references have been dropped.

The relevant lifetime management is described in:
Documentation/driver-api/media/v4l2-device.rst

Although the documentation mainly discusses hotpluggable devices,
our device is not hotpluggable, so this is primarily to handle
the case of an explicit unbind, for example via sysfs. This was
added for completeness, but I would welcome guidance on whether
supporting this case is necessary or whether we should simplify.

> 
>> +	if (!mali_c720)
>> +		return -ENOMEM;
>> +
>> +	mali_c720->dev = get_device(dev);
>> +	platform_set_drvdata(pdev, mali_c720);
>> +
>> +	mutex_init(&mali_c720->device_lock);
>> +
>> +	mali_c720->base = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +								 &res);
>> +	ret = PTR_ERR_OR_ZERO(mali_c720->base);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to map IO memory\n");
>> +		goto err_free;
>> +	}
>> +
>> +	mali_c720->mmio_size = resource_size(res);
>> +
>> +	if (resource_size(res) < MALI_C720_ID_SIZE) {
>> +		ret = dev_err_probe(dev, -EINVAL,
>> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
>> +				    res, MALI_C720_ID_SIZE);
>> +		goto err_free;
>> +	}
>> +
>> +	mali_c720->clk = devm_clk_get(dev, "vclk");
>> +	ret = PTR_ERR_OR_ZERO(mali_c720->clk);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to acquire clock\n");
>> +		goto err_free;
>> +	}
>> +
>> +	mali_c720->reset = devm_reset_control_get_optional_shared(dev, "reset");
>> +	ret = PTR_ERR_OR_ZERO(mali_c720->reset);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to acquire reset\n");
>> +		goto err_free;
>> +	}
>> +
>> +	ret = of_reserved_mem_device_init(dev);
>> +	if (ret && ret != -ENODEV) {
>> +		dev_err_probe(dev, ret, "failed to initialize reserved memory\n");
>> +		goto err_free;
>> +	}
>> +
>> +	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>> +	if (ret)
>> +		goto err_release_mem;
>> +
>> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to set DMA mask\n");
>> +		goto err_release_mem;
>> +	}
>> +
>> +	ret = mali_c720_power_on(mali_c720);
>> +	if (ret) {
>> +		dev_err(dev, "failed to power on: %d\n", ret);
>> +		goto err_release_mem;
>> +	}
>> +
>> +	mali_c720->registers.id = mali_c720_get_id_regs();
>> +	ret = mali_c720_identify_hw(mali_c720);
>> +	if (ret)
>> +		goto err_power_off;
>> +
>> +	ret = mali_c720_get_registers(mali_c720->hw_version->id, &mali_c720->registers);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "unsupported register layout\n");
>> +		goto err_power_off;
>> +	}
>> +
>> +	if (resource_size(res) < mali_c720->registers.context_size) {
>> +		ret = dev_err_probe(dev, -EINVAL,
>> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
>> +				    res, mali_c720->registers.context_size);
>> +		goto err_power_off;
>> +	}
>> +
>> +	ret = mali_c720_discovery_init(mali_c720, resource_size(res));
>> +	if (ret) {
>> +		dev_err(dev, "failed to parse capability discovery data\n");
>> +		goto err_power_off;
>> +	}
>> +
>> +	ret = mali_c720_discovery_get_module_base(mali_c720, &top, &mali_c720->top_base);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get top base address from discovery data\n");
>> +		goto err_power_off;
>> +	}
>> +
>> +	ret = mali_c720_init_contexts(mali_c720);
>> +	if (ret)
>> +		goto err_power_off;
>> +
>> +	ret = mali_c720_init_ctx_mgr(mali_c720);
>> +	if (ret)
>> +		goto err_power_off;
>> +
>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>> +	pm_runtime_use_autosuspend(&pdev->dev);
>> +	pm_runtime_set_active(&pdev->dev);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = platform_get_irq_byname(pdev, "isp");
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to get interrupt\n");
> 
> Please use modern Linux drivers as an example for your code. All this
> should be dev_err_probe or dropped, because core takes care of.
> 

In V2 I will replace these with dev_err_probe within the
probe function.

> 
>> +		goto err_pm_runtime_disable;
>> +	}
>> +	irq = (unsigned int)ret;
>> +
>> +	spin_lock_init(&mali_c720->irq_lock);
>> +	INIT_KFIFO(mali_c720->irq_fifo);
>> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
>> +					mali_c720_isr_top, mali_c720_isr,
>> +					0,
>> +					dev_driver_string(&pdev->dev),
>> +					&pdev->dev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to request threaded IRQ\n");
>> +		goto err_pm_runtime_disable;
>> +	}
>> +	mali_c720->irq = irq;
>> +
>> +	mali_c720->media_dev.dev = dev;
>> +	mali_c720->media_dev.ops = &mali_c720_media_device_ops;
>> +	ret = mali_c720_media_frameworks_init(mali_c720);
>> +	if (ret)
>> +		goto err_free_irq;
>> +
>> +	pm_runtime_idle(&pdev->dev);
>> +
>> +	dev_info(&pdev->dev, "Media frameworks and entities registered successfully\n");
> 
> Drop, drivers should  be silent on success.

Agreed

> 
>> +
>> +	return 0;
>> +
>> +err_free_irq:
>> +	devm_free_irq(dev, mali_c720->irq, dev);
>> +err_pm_runtime_disable:
>> +	pm_runtime_disable(&pdev->dev);
>> +	pm_runtime_set_suspended(&pdev->dev);
>> +err_power_off:
>> +	mali_c720_power_off(mali_c720);
>> +err_release_mem:
>> +	of_reserved_mem_device_release(dev);
>> +err_free:
>> +	platform_set_drvdata(pdev, NULL);
>> +	if (mali_c720->v4l2_dev.release)
>> +		v4l2_device_put(&mali_c720->v4l2_dev);
>> +	else
>> +		mali_c720_free(mali_c720);
>> +
>> +	return ret;
>> +}
>> +
> 
> Best regards,
> Krzysztof
> 

Thanks,
Anthony

