Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872670;
	b=VYHQu659SzX2aqgsh8ArKSJQkMJBDc4T2ApqYJ6bdMYAZtViK0jydqR1JtTJ6A7pr29n
	 ffsAphPZpVXFj86AKw62uEbzf+frUZ0UK23pE+HEqQeBkPuRKUoBdK4NcLWWxVIvgDWxC
	 BsNYnRKD30pBbjzdT1m0CZSo6PbeMgpBqYF/PU3Qt0guJyxB4iOew6txDg27is4jqkyDr
	 DJKMdrKG1PcUNs3OXshIYhz7YsHnV4ojQPVZbW2PX3Oktb3a3tZDeYsAaMDM4NcYYbFfa
	 0pvagTUxRuopZ9SfHpmihCoRQMVmEn3VtspzGSdu+uoQ9b1wmXsCUFkjN5WQT8+pF2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
	b=YUdnCqxITNfZmvqOfj7Iesui89pTfDpl2F2nSNa19HTXuVU1m+p6bQTiOOW3sMus8TOj
	 aF+XxVjJ7Ley0qyBujx+dMPFI+xq+GypJRy0gww/dtUrOAR2EQWyht2N4xtE0OEEoEKrH
	 K718w24nqhaYw4oROfKZjebArkpeTmJoDt2G3elKepcvc6kl0rtz5cqH/t/ecZXeyCj8u
	 DmGkuE9Bi4zp8hpNrf1f+EcE/9cfyRFt+i0Mz2Zlg0Pve0nrLEpBVwE5biqqj3oxEl35g
	 s4lBci8SVwzOQ94VltNRGtxDHiZFO/THzPmm31J5o8Hi+ACDZha/iB8Rx1+ysxTIqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE6606A333
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oDxVwy4Q
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18032695e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872668; x=1794477468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=oDxVwy4QjautS5UcbeppFUfZvhwy5qT5Jv1UH4ghJVU/8virZccbyxZ4fjXAJNCGLS
         esvAzFkveT02dJ2kpQOpbE0amiqcPFMSdi8ynCoZOHwVo8gOOvlbUSHRbi2fmWty+hmz
         SF/qPukCL3iwBiS47562s4lLr5ovhjElVybA4VQuy5zC1jNUg1/4IJHEVTR35ZLvtEkb
         VOcKToXIEgN+pARuf43SKAEh1ygFy3fmRuZq81JESr80ic+c/6Tz9seths4MLJfP1ec+
         VjBmDYILLJ6RZ2wc++GgtqHXVqPtrLbf49LkOTiHY7cXw2h9UNYfyiVuAPQIPlGQ7lFE
         kHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872668; x=1794477468;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTUCOSNrg5qxLH3FnfcYfQ51wYo8dyBSWxreUtwDliQ=;
        b=f/bD7J9n+r+0nHXaV7dMMZZe9bNEhaqR2levThIyGE7iO2M3n46tCYxpH2lfg/ckYI
         8DsNPbwVVwdlv4vpQAuwYJF28L8ERn1Xbf1URK74NSnJ6GCwbm0aj31b5UWoXz8r/7An
         tRDjKulM3M7LFubFbqN3seZh81LBr1p0Y0HuxVjXTrMqgklrj5YbeHTuOelSkkR0N2Vc
         490J6l7Mt5QQBJYCE0jv8et4iRrP5PrOiyfByxVymOBeLX8C+jKra+m2+dv0AQxctPmw
         LgzjdeIH3LsPxsMY2gr0OMmOe2hTNL9/CO2bwMlFGhsz+VDx0WsINudna4i8cvA/IgbI
         5aLw==
X-Forwarded-Encrypted: i=1; AKwUvBxGG+GXfOtmWSMHhB00X5T565u9F1Bb562QU7SVhR+QpDLyYKSxIxeJYqsKdxKYVpZB/5y98lH8KpvGEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JxqeFdxlehFgv8m9+ELQrwiRhoCle46gKdz2eHocnl2ekh9nO
	yRVkUk9dDKed2sczDSiM7b/ClT23p+lr9ePT/8nDsxjZL05EG7vAVKM450UfwgHKtRs=
X-Gm-Gg: AYBFou02fKMiFvPbsN92aFU2nt8AHqVeJyG070FcnN88ek71c+XsNrTWZouUNkoFNSr
	oL14EqBui+mUPyLNrMGx7w87zGL8fBSSiM3o+aMNZZI8crHGL0y3wtpKoZdXm9q+UAWomvEoP8p
	vDA/szTmvWkht79mmmBIizlkpaMQ+XFjwW5ZO4hh5CxkNnlMsKHiVKsYAiSfjXb99vplVARsp7T
	Ag99hUgKQsSENhcstNT7eb+eW4T3vj5jDVJgmHeEOcSZl2f6dK/z4jfN8e3rYWZhadlv9eK/tDn
	dTNBUJhfEKy/OZ4Jhti23PWCKaodioYTYgyPB4KZYUiVWrVN7fcnwC656AGmGB/jmmcCECvHv0d
	gnPUz9UMIMMJc5wt7QfKMbrCIjcyksgqATB2dtvC7irdEKcHlvkyVwzt7Ze3/ff6bs9VYDto8oD
	1y6Da7SK2ij9xqUSb/Pj7FHVP1OxiWNfW2YZIiiO/Upg3dJPn8UPenFVtAjEj1H5fgo1iw8WAjf
	S60OZIURPPcgLVDN2DsYI6biPFjbp+vCcii9aCA41W6/XXcNk9mmhQI2hq+fDQZJf2nSLQhuzbb
	B0CYWRRs6KosSXz6wwjudke+i13gvcp0hEF9ipCP
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr428132765e9.6.1793872668197;
        Thu, 05 Nov 2026 01:57:48 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm49867725e9.10.2026.11.05.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:57:47 -0800 (PST)
Message-ID: <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Date: Thu, 5 Nov 2026 09:57:46 +0000
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
Subject: Re: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there
 is no IOMMU
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-2-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> +static int video_buf_plane_addr(struct camss_video *video,
> +				struct vb2_buffer *vb, unsigned int plane,
> +				dma_addr_t *addr)
> +{
> +	struct scatterlist *sg;
> +	struct sg_table *sgt;
> +	dma_addr_t next;
> +	unsigned int i;
> +
> +	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
> +		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
> +		return 0;
> +	}
> +
> +	sgt = vb2_dma_sg_plane_desc(vb, plane);
> +	if (!sgt || !sgt->nents)
> +		return -EFAULT;
> +
> +	next = sg_dma_address(sgt->sgl);
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		if (sg_dma_address(sg) != next) {
> +			dev_err(video->camss->dev,
> +				"Plane %u is not contiguous in DMA space\n",
> +				plane);
> +			return -EINVAL;
> +		}
> +		next += sg_dma_len(sg);
> +	}
> +
> +	*addr = sg_dma_address(sgt->sgl);
> +
> +	return 0;
> +}

STOP SENDING THIS SLOP !

---
bod
