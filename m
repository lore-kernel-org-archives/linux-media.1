Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574DF43F082;
	Wed, 15 Jul 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142497; cv=pass; b=lRRDOmipxxf1CkFBTr4gwb7PpPd4g59sUrETkm6sts4j8FkdkMkm/bkrPJhyK3/RMXQ9EjreNyahtoJIjK+ESsV+FSwTsskpe9AalKc5braKpg9Sgia79l2Np85kvuhI3n191Qt+UVySOA8PjPqjvRcX7+HFY8Si6FDW4koHr08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142497; c=relaxed/simple;
	bh=hN25WY5L8971PWg6LGMcp+nuiPyTOz9iLSWFsryIYkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+8Btg2EnuN8hvYPbx4mniXGr9tyXpzUw1KjsFBgSZkOAY303cbreXIF/YjFciThX98kSIjWGvy6qFub1PiriLYThbJamDDAjK3qBJRCNbKgOQn0yd29dz+GvKHXnuDAsur1JmAk2o2xuk/KsIxGJ0K6xlqbv1gQWhUJwDyH9Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VKQXg9mC; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VKQXg9mC"
ARC-Seal: i=1; a=rsa-sha256; t=1784142470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kBGnWNuroPusskDm1zj0u4187PS+x19jIVs1LTI6jiSJykkBBRmtmdRpRB5juYF7GQ1NqwoM81Q2zLW+vCvQmYrhysacXeKhy39k8DM2bNY6ocef+KdvrjPv2zAh65CTWypAAoYlSZ8JUzF8eQiwqUyC4FKDxUVhHP2xcm1oBWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784142470; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ElXRUw3iwZwUUkeJ8T0AmYJOlPneuAtRexP5rxzu3ok=; 
	b=Qitd6gJVoJGJnomcN03m33/bNRqONOILUcPJ3u0R1y6qD3yqYqPuFx7Yu4jcjkbNTylyqcJHj2YV2ZtSFTyiGVApdkoFJ4GUf0xsaC1/XjiVCVeJhCVicrG7z6MDmFlyqvTVGh0YAuwFBsuK0jz9oy3Jz1BqAgD7Ltk3LuIpORY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784142470;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ElXRUw3iwZwUUkeJ8T0AmYJOlPneuAtRexP5rxzu3ok=;
	b=VKQXg9mCRzRnHqSVA9sHj82/qc5q1eiYUYwoj2iJ9qYRCn+kzNgt18lxSSv75cWQ
	XrDES6NHZfqfayqkh50CObFjzz2o2ZrWpYXYNNRmBLgRYZyxHMumRuN/NVfybDa22wE
	edeDOLdzx1Vgv5CJ8u2Kr4CsSsQPPpMCGX1AAvJE=
Received: by mx.zohomail.com with SMTPS id 1784142468976679.2896307879109;
	Wed, 15 Jul 2026 12:07:48 -0700 (PDT)
Message-ID: <8089de84-0793-4668-9030-42881912e6e7@collabora.com>
Date: Wed, 15 Jul 2026 22:07:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260715051939.64652-1-royalnet026@gmail.com>
 <20260715051939.64652-3-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260715051939.64652-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi,

15.07.2026 08:19, Igor Paunovic пишет:
> +static int hdmirx_register_audio_device(struct snps_hdmirx_dev *hdmirx_dev)
> +{
> +	struct hdmi_codec_pdata codec_data = {
> +		.ops = &hdmirx_audio_codec_ops,
> +		.i2s = 1,
> +		.no_i2s_playback = 1,
> +		.max_i2s_channels = 8,
> +		.data = hdmirx_dev,
> +	};
> +	struct platform_device_info pdevinfo = {
> +		.parent = hdmirx_dev->dev,
> +		.id = PLATFORM_DEVID_AUTO,
> +		.name = HDMI_CODEC_DRV_NAME,
> +		.data = &codec_data,
> +		.size_data = sizeof(codec_data),
> +		.dma_mask = DMA_BIT_MASK(32),
> +	};
> +
> +	hdmirx_dev->audio_pdev = platform_device_register_full(&pdevinfo);
Nit: platform_device_register_data() should work too. The specified DMA
mask should be unused by the codec driver and even if it was used, it
should be inherited from the parent dev and not fixed to 32bit. Please
either remove .dma_mask or use platform_device_register_data().

Please fix Sashiko bug reports for v2. Otherwise, the patch looks okay.
Thanks for working on it.

-- 
Best regards,
Dmitry
