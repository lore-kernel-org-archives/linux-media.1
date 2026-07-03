Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E583D45F8
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089945; cv=pass; b=hAV8xTpcmCXZoa8Lr+MpfR5W+wLsf3EgpV82jWsPYwSGxwo0mxSfbhpSbHiTwcLKBRej3Rl+nx5ceXRfGMpVSzu+0mCVxNgK8oef2kr1ES/cA3ciObd5w2JDTpazD5PBbg0xSuzjsu8IJlt3tKPAcaMO6vN0VdLTTUJHjXCbd40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089945; c=relaxed/simple;
	bh=bbdnBOpPYQwxQVCTGpvXRGqVIgi5VAXFlurWB8Z2dcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=med1eMiqd7jhoxIBWvE0vScB5kHPe8eJT7JvWWHYcKUgdnMWSd2VWWX1S2sMrxFMucHwidDAa+E1KFPUAQ/voOkqqHmHZCEHmsUaIZrLBa5qwHyqNx+UvfJjzrQu8ZGbj8HSulP5LI/sVNL6CfMrzTztGW/vEp5ze+OtqO1+AtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=GBuFRYhY; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GBuFRYhY"
ARC-Seal: i=1; a=rsa-sha256; t=1783089934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V0mhtmKGJrUTPlM4lNx+yH7/IadKtHIBvxLnnSk2nop0GWeeDzpjIlpoCv7UIDS5jo7s87fsfH9vwOARyTCKchgR5NCUdfDPoc1u+TiB+sorojg+KRYagmHAV0RFZwOrWHo6iDE/RWLLLBEa0soziS3QP2DsKDFNLUYI9Yl648w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783089934; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nmDpc7B+19awYjGJUdI/Ymoo0z93Zz7smuvzaSA0a28=; 
	b=DvX+NEY5qim6ws4lyA3ZeFrT7EWh7jEt2h+Hwa5/QEIiRx0tv+1n8si6duz6N9RLa+zezXlRiGj8yF1Y8nAU47Ggp6nk7v/+s0xO5/h4wbXN3FqQGMMNYBZk1gnqaG70t43F2QWjToJnu56t4rx3dRS3g9K6Upq0xx6r/qNj/9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783089934;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nmDpc7B+19awYjGJUdI/Ymoo0z93Zz7smuvzaSA0a28=;
	b=GBuFRYhYHzebXdw0PFXduIql65kvRp+OtNZoNJqLXCpWo4Y57jcZ9ywQxMMjyHbX
	+cTPKqWbs+oyQLvu6CUqCJwAfKG87O84soDkVP8f7QKYJrN6T6FIwqdvMdh76Epp00A
	+o/mwwVd68enBBtnPhcYZjDS3na+HljNcqjsv0Vs=
Received: by mx.zohomail.com with SMTPS id 1783089932845313.0430968504985;
	Fri, 3 Jul 2026 07:45:32 -0700 (PDT)
Message-ID: <3f9b7fe7-de08-4dde-94af-408dce1060f4@collabora.com>
Date: Fri, 3 Jul 2026 17:45:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: use request_any_context_irq()
 for 5V detection IRQ
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Dingxian Wen <shawn.wen@rock-chips.com>
References: <20260703070029.1762457-1-eagle.alexander923@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260703070029.1762457-1-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/3/26 10:00, Alexander Shiyan wrote:
> Replace devm_request_irq() with devm_request_any_context_irq()
> for the 5V detection interrupt handler. This allows the kernel
> to choose the appropriate execution context (hardirq or threaded)
> depending on the underlying interrupt controller. On some platforms,
> the interrupt may be nested or require a threaded handler, and
> using the fixed hardirq version can cause probe failures.
> Switching to the more flexible function improves driver portability
> without affecting functionality.
> 
> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 4c8957505a50..fa9818705f42 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2609,10 +2609,11 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
>  	irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  
>  	hdmirx_dev->det_irq = irq;
> -	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
> -			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> -			       "rk_hdmirx-5v", hdmirx_dev);
> -	if (ret) {
> +	ret = devm_request_any_context_irq(dev, irq, hdmirx_5v_det_irq_handler,
> +					   IRQF_TRIGGER_FALLING |
> +					   IRQF_TRIGGER_RISING,
> +					   "rk_hdmirx-5v", hdmirx_dev);
> +	if (ret < 0) {
>  		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
>  		return ret;
>  	}

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
