Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514204;
	b=XOmi4x42Sw0lzczWujNacB1DRdTNfk3DQgYco5CA37xON55GCrcV6EmXUcF9caiO9DeM
	 x5uxM6D4qJAndtw7hKuDpUhL51Jc74B/DAWlu5W3wr/+b0v3IpuEoDM2t4smiJLDCwBuT
	 ZDDfAA+fCUJKgAxgd6MTc0uhW9Qxd1ZExvqhulDImk3TDVIpHenhgNWPCuBiA26kwTEow
	 E2GEgRIAvAf+yJp85AW7H8vFvki0FRBpYYBnr10IyL3+YRzF0PXzEWSyPxr67oYDLq/mY
	 nfEWi4UgRy5XACLrBwtHTXyowQNJozZsKV5iufgiI+b+Zf+nO+7YoU3IIZpmHr7cT2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514204;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/ZZne3LQwRaftQD4IyGSW5yitBBqCg3YIkMiN/Js5D0=;
	b=lvuMw0K28i+dzOLDuq1VIlCAtH3Unav63NZBYMvOfTIISThUlqv7B1LCsozsjlG4l+La
	 wdMpudKm6VMbGRwycLWVPbCOLgaBmONMexR1W8WUyJ87rjAvopeaF/TnFj7FgowLq2exz
	 ViKql/8Wc7F/Qh0SjB8y3YkySt81dlB6hfEQsBixmiyrGJ/yJWC+sqBLYaJpBNChly1+k
	 4JMJDuPvhevpA+1znK+itCn+MMTD6Aqo2fZ6t9vzgjSjh2VKwSQrSH4Zd4Rg19Yi0cBmq
	 6woXfH0Acwhk7npjhTuWuZom3PQ22ozpkoJ/WVB5outlI//o9/GVRHg6OZanAoCsNMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TmPJVihl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C21606A33E;
	Tue, 24 Nov 2026 09:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C21606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TmPJVihl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67237339;
	Tue, 24 Nov 2026 01:56:40 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6A413F86F;
	Tue, 24 Nov 2026 01:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795514203; bh=xuCRjMCtyzZFdihFZbSvFStkGFaZ3+s/ycbhJit7JAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TmPJVihl6gkJNkbhZDHsVpOlC3oY3rgNcWBpjh1tcuLnVUaenYMwpmCrolkSCUezk
	 BUXaMYQCmUvTFqnIbgcWhxJn65lYV382f/EdMJkBaKu6Xu4aVP4Ss79TQcP+ladIVL
	 mD28ur3+U5REd/XJLqbPk/N4XJqp9x0rRaX6ZhY8=
Message-ID: <e085a389-b590-4448-b8ba-1e084fddb815@arm.com>
Date: Tue, 24 Nov 2026 09:56:40 +0000
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
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
 <8ad5ec8847859937aef900a09ae8b3eddaa15464.camel@ndufresne.ca>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <8ad5ec8847859937aef900a09ae8b3eddaa15464.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/19/26 20:04, Nicolas Dufresne wrote:
>> +
>> +/* VPU register access helpers */
>> +static u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
>> +{
>> +	return readl(regs_base + off);
> That wrapper does nothing other then increasing the code length. Why not take a
> vpu_dev as parameter?
Passing the MMIO base keeps the helpers independent of the device structure,
but taking `struct mali_vpu_dev *` would simplify the callers.
I’ll make that change in v2.


> You're chosen namespace is also very long, worth considering, but not strictly a
> problem.

I'd prefer to keep the `mali_vpu_` prefix for consistency with the 
driver name and
rest of the series.


>> +static int mali_vpu_get_clocks(struct mali_vpu_dev *vpu_dev)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_clk_bulk_get_all(vpu_dev->dev, &vpu_dev->clk_list);
>> +	if (ret < 0)
>> +		return dev_err_probe(vpu_dev->dev, ret, "failed to get clocks\n");
>> +	if (!ret)
>> +		return dev_err_probe(vpu_dev->dev, -EINVAL, "no clocks found\n");
> I don't think the second check is required, that would mean you have zero clock
> in your DT, which is invalid according to your binding.
The VPU requires a core clock, but `devm_clk_bulk_get_all()` returns zero
when none are found. Although this violates the binding, schema validation
is not enabled by default or performed at runtime, and the bootloader can
supply a separate DTB. I’d prefer to retain the check so probe reports the
missing clock before attempting register access.


>> +static int mali_vpu_enable_clk(struct mali_vpu_dev *vpu_dev)
>> +{
>> +	return clk_bulk_prepare_enable(vpu_dev->clk_count, vpu_dev->clk_list);
>> +}
>> +
>> +static void mali_vpu_disable_clk(struct mali_vpu_dev *vpu_dev)
>> +{
>> +	clk_bulk_disable_unprepare(vpu_dev->clk_count, vpu_dev->clk_list);
>> +}
> The two wrapper above do nothing.
Fair point. I’ll remove them and call the bulk clock APIs directly.


>> +	ret = mali_vpu_get_resources(vpu_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = mali_vpu_enable_clk(vpu_dev);
>> +	if (ret) {
>> +		dev_err(vpu_dev->dev, "failed to enable core clock\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = mali_vpu_deassert_reset(vpu_dev);
>> +	if (ret) {
>> +		dev_err(vpu_dev->dev, "failed to deassert reset\n");
>> +		goto err_clk;
>> +	}
> In practice the two above should be inside your PM runtime ops, not sure if
> that's coming after, in which case just ignore. It best to do this early, PM as
> after thought would be bad.
Thanks, runtime PM support will follow in subsequent patches.


>> +	mali_vpu_read_version(vpu_dev, &pid, &rev, &patch);
>> +	dev_info(&pdev->dev, "Mali VPU device product ID: %#x, revision: %#x, patch: %#x\n",
>> +		 pid, rev, patch);
>> +
>> +	if (pid != vpu_dev->variant->expected_hw_pid) {
>> +		dev_err(vpu_dev->dev, "unexpected hardware product ID: %#x (expected %#x)\n",
>> +			pid, vpu_dev->variant->expected_hw_pid);
>> +		ret = -ENODEV;
>> +		goto err_rst_clk;
>> +	}
> Both ways work, but you could also pick the variant based on the version
> instead, and only depend on DT for the "families" (e.g. the version register
> layout have changed but you still want this under the same driver).
Thanks for the suggestion. For V76, I prefer to retain the DT-selected
variant and use the product ID as a sanity check.
I'll revisit product-ID-based variant selection when another variant is 
added.


Regards,
Charvi
