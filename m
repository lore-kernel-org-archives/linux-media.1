Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407741;
	b=RdfAB1CrVS9Zn9E/32HQVFaa3xWCbgKus/y0ZoT8R3zPTtKqkEWUk+7LXsDBl5dpgV2w
	 wonpFjyBQs50cIMWbSrx4GBkxKQ53aasMrYNEt+PDOAspiWot3l/uaOexvh9yfMyfqjwF
	 MzpNC3bm+LIHTxksV7oLfgR4q/OIW96A5GPCsJUeiRHDDDneoSZ8DvqyluZEJPbFNnUsX
	 43vfQlR4jX0lWRpEq1xE9o4In4IFOQPSJvlWu4r3QkL0nwoSO0r7gXQgVJX0lepbVwo6w
	 h8Jx2zPHoafp1Oc7J4zZwCyx2Ad+iquJ7O2xCoqDkMcIZ8i63vlA5D+BsM8Z+3GxkKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
	b=KsTXbIXXp7vObwVlJPDBMPXDXSgr8PxOW9Xo11ds1tSOUj05MXXOxOI4gDdetYE/lC6r
	 nqf3nd5/MTgjEuAH80rQjryPXxt/T6y787bQPGMGwZS6QHZpfFQLkEjsWEtnti9GAzEXu
	 5+sja2kbYo8j6P/7kW3U3XE6d6jNIca79m8Wh3ewX1ouC2AVqDDhNRufPTSmlIZQEBB27
	 J9FU9yGXXhK4+oKxDIvj2Eolegp9P3kXuxENtnf2tMgt+jVXmxhkIQXSZUBEbGqr4scsA
	 DJt0QPFDuVzjaRwQ3XoYwwCemJHNmv4HtCFXb+L3FfnKy1dyoU9MVSrbUEQjRz69WJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A7606A880
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884A7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tApccBJY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22663685e9.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794407739; x=1795012539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=tApccBJYxGqYQ0axQSwCJPn0mwq2weRps2CbB1jIwhxYbrvOD/qMMKljbwL9hVXS74
         Bq5tsBi2L+q4Tsw5R2xzIDpQyplM1pXPHpAwjgO3otf9997xSSSo60UzxeDoZRbXYryi
         JQdJsy+xVPrCkupI7Gf4vMm6SuqxzvygBY4/qeWw2O2SXl6GCAwasomweInRz+0KoS8z
         I19pjTJbFW4qKAYEGpxjj2eAV44C/SwlA9lLWUKiHNIPtxkXAkEPl7qPJcxUqPSn6Sv+
         ShE9T6jeYB34bMiGVDINraOaVozuMlE/OpN4JPPrNmA5/d8wA0OR7xVzd+AJcPfk/G//
         qdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407739; x=1795012539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lau02JU43W/hog/yKJRveOgSPeZUVSI1SbMEi/mraWY=;
        b=cPSS+3jJovG3xwLjr/73a/drV3MflHE1sc+bDl1dujxGja8sUE4D7iY/c/P/p4Nzg9
         aUOYVw1BHDrTDlwAmiqq37BP7iqjFq5jhH90fjgtgpMiwjxB9DZHAI0dpIsBbnFXssx3
         ZWPdSQpZorB18zwaGd3L9Hn+vR/+KSnDJ7ykGfbimDTIiNdvbzRhsLRlj+1qyrV4rNfy
         ucTTa+vuel02S3556jSFh8gCCwuZ3aZT1pMWB6iYnS0OGm2YcUA/3CvXbIjfKQpfTSET
         jFqyb5X7GGj8MA2X8VWR8wTCj1451CX/YnPUWI28YEVbYGyc6/pun7xi9ICAdh/BaK5Q
         QGng==
X-Forwarded-Encrypted: i=1; AL+hErGbEHC7YMIEstrBjH0A9OohnPFdvQoQAbSeXPZ4O7BCVD3IX845HR5F9GZU7XzBAhZlykbR5izmPqhfdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mHxX6H1K8JiPo2KRKyI3WL5Q+rLPtQVV3GWcmpor2n/t7JjZA
	MFt1nHFD/ZE9eJjRsb6YElbLnAotFqNkAFvQMP2sPtCk4+jvfc+RKysJqwDm88VH3RM=
X-Gm-Gg: AYBFou3GQ4CITlMoROKQB+ltrMRr0n0THmHgXT2mvQ+oxxpo+0+Gtdxhz8RNmhjqejb
	oSAfBF0C6atMs2wehH0zO627Pr++k8i4fFxDSOGFFo8pMQgTWEKKmyRgSrvzdnDrQw6X/on+Cey
	zpACFN9GecQEdRaYjrbmWjUysqgEn/M89Dnpq6XJ3YZkTSxdOe4YFeKP3gTr0iuiJTR872svU+m
	FJJ8xIDH7W4mKCaxjv1+Y3cKQZTx2idP8jf6ThXoaNofspIPstCXot+k7UiU2RVvAWdLhJ1Uf1n
	8cY2ct/wIdkWs5qd4gFN2DyB00z+mgHi1h+ZmuYrQmLy0u3ZzlFr84quDG5K5Mh8nv+naaWeIYU
	E4tOnFLke/T5W+21I+AZCgCrE+RsGeKc67Xap5ZVAfZ58W+GPLYJvX+PqAEa6xeO1Z7ZGnmWGFD
	fhaxjpu211ZLQzLutt3/L/C4bBt3xb0XVvvTKGwueiH5HHyzZeBjfHw24yPFLSmtKnHJTab0FdO
	Uk8/pPnP/J89xYKFavfrP+DXAzkeNT7VyFbdl2VxUlQDUH5nQ24yCl+C3XSVJRwvnrXmKE6a8VP
	WHZX5A2PpBKOnyOwR/VVGpabMsLwtn6t1pv8jpe3
X-Received: by 2002:a05:600c:190a:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ba0931ed3amr49687875e9.4.1794407738850;
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm11475146f8f.56.2026.11.11.06.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:35:38 -0800 (PST)
Message-ID: <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
Date: Wed, 11 Nov 2026 14:35:36 +0000
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
Subject: Re: [PATCH v3 2/4] media: qcom: camss: vfe-4-1: program the RDI write
 master buffer size
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111135338.27008-3-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 13:53, Allan Siriani wrote:
> The RDI outputs use the write masters in frame based mode. In that mode
> vfe_wm_frame_based() only sets the FRM_BASED bit of WR_CFG and leaves
> WR_BUFFER_CFG and WR_IMAGE_SIZE untouched: they keep their reset value or
> whatever a previous line based (PIX) stream left there, so nothing tells
> the write master how big the buffer is. If the sensor sends more data
> than the configured format, the write master keeps writing past the end
> of the V4L2 buffer. When the CAMSS runs without an IOMMU, as on
> MSM8226 today (the SoC has one, but it is not described in the upstream
> DT; its VFE 4.0 shares this register layout), that corrupts unrelated
> memory.

This is a long and rambling problem description that looks like LLMese 
to me.

I would appreciate a more direct and succinct problem description.

"MSM8226 doesn't have an IOMMU defined. If a sensor writes more data 
than WR_BUFER_CFG and/or WR_IMW_SIZE expect we will get an overrun."

"Program WM_IMAGE_SIZE and WR_BUFFER_CFG to restrict the maximum size 
the write masters can write"
> Program WR_BUFFER_CFG in frame based mode as the downstream VFE 4.0/4.1
> driver does (msm_vfe40_axi_cfg_wm_reg(): words per line, lines minus one
> and burst length, IMAGE_SIZE unused), from the bytesperline and height
> of the active format, and clear it again when the write master is
> released.
> 
> Pass the active format to the wm_frame_based() op for that. The VFE 4.7
> and 4.8 implementations, which use a different register layout, are left
> unchanged.
> 
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---

Something like that. Please don't let the LLM write it for you - the 
word-salad is difficult to take in.

Commit logs should be elucidative not occluding in nature.

---
bod
