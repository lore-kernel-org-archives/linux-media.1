Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6354A3D42
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466824; cv=none; b=qVvjbg9Vp9klk8wk2y/h/J0jxVdQqQ0glpHbc/HgxlNxVhfqo+2GjtxjLmT2rpY1XHlb0SLxlTbAfelz0+rGOQowrTes1FdNrlA+m3Dkap0CG7uGY0cQ2uRCqTQMKq4umo/yBN9u78gB0WFVRji1djR+qCww+f1v4yeuIOffYMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466824; c=relaxed/simple;
	bh=f2BMn5ioidRbzaI9E7/OdDgcAuxIkLaGENNPV91/nzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujtTUqlA+PBftG/Gq7XQdEpeWs9Iz0Odrr5pqpLqyQ4VP9at7SWYtOT5f6v0HjIcvPfpyjuazPiDSoY/uc0XGpEgbcs8LzTkXAmJFs5nIDeY7Ta3rxwmAFaBWSO5fkwdXpVB3TKsvV7VuO1LLQ0brdo0+7TP/Zh4zbJIOBARe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWO5fmKC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWO5fmKC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso720389066b.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791466821; x=1792071621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H80w9zSBz9R1ag4qx1WlJa+f5FQwYUpOAtTkVEPPBz8=;
        b=SWO5fmKCmSLDhFQF3sd/3422TlorOnWb9ykBI+z9dv2ig1oPq3sTWowNKRGppqTmNs
         O/7og0AlHUMbFZhZPqSbBfgj0z8dlfxFBYPftcND2SoD8ZAWGRtL3FUNZ0Fmme+xQO0Z
         gUDZ02501Z2I86NvjGzw2E8OTZLHAIb6aVTHMTCKeh1GQdYii6mHzbm1mCa/b/WyPBHh
         71EqwQgoXlw0ul2vzs19JWU176kCLTCfA6u98tVUYHsPNiznhyO8brB5gM8kNYurfGqE
         xi7oguad1hs8Bs/pGWG9uWq46kidx0DT7Fh2YuM+Gdy+3jduRqLv/iqcdpTOu1ZrZ8jR
         MXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466821; x=1792071621;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H80w9zSBz9R1ag4qx1WlJa+f5FQwYUpOAtTkVEPPBz8=;
        b=LOZx0kyeJORwIt4AVU1LpGkhFBwc4nBDLSqy2wVonYsxdkkBYFA1xUwdwd++um7PqT
         7GKTGy2M3omPkncj3KdK+C7b8yYmMxTBDGcFKVxfFKzednpylMRxt4km2RHeocmsxOsN
         AZ3t9Lt6rJGLLCjqIlGNWZQTcIMx1ovj/xtBi6PDtrEQQBlJBMcdVqcj0APsdb2//FWj
         kI+91hjX7hpz100qfFAEgIYe2D/3iaSAo7rNYPPMqi8U85WSOr7Y6BRD9FuaS199gVRz
         7ZJuFwSJsQd1rVtyZObdAk874JNZ7ZQ2wMooKlzap7FWLBZw/r/fbTVbmiuuXW7qljxX
         wwpQ==
X-Gm-Message-State: AFuF++n05pT0l/VWgEj3L/reerC8oAhDQ+0XbArlWbGMHOzGey5DaZsU
	KgTt7Jv7i8MMXioZA3e/K7ZwiguhWA5hsK+GNovNyVyex1uBkCQDtR1L+NT7uVwPRcM=
X-Gm-Gg: AYBFou18A4nN82X8y0mXP6Xo5n/z9QXOQma60nWPaKopIhPOVpS3SmN5TbkqsD+7GOe
	7Mmhcnq2LzGJYY+03GoefYQXO5nrxLZb7l+Dq7kFxr7LjP36Tut/qZD9kCH3wHsOvg+C+13VuKf
	hNEfp4p3mnFDCdfLJFNDlTcNYB43L7fCuII5T9L0vj1hiIejCiXq6i4gjWb7QP5K/75H3YyqHAc
	uThrmxmZjRk9JL6Tt/7xpCrQV/kSU5uvYZP/j6GqGD+M22qAcmc3pc9SqQAvDWLyRFxQkdDQ+iQ
	QMbtt6X/JaR014ujPP45jXeESPCRGnMKNuXsD9Eal7j/EJDwItTgw0/7LjB3wWiEPAR3qTexqyH
	EaP4R35FosV3jdUNmV88wETN/aAxZQWPZTwl82p2lsf3urWV9JLdRRD2HNces+H62IR6FUq+7Ku
	/1axRoaMqfeJR5QUs3Js+VjJVgvtwOSixarUaBzJX408/IMwqceIy9ibS2zOFpHPtYc9btdzqyZ
	pqK2xuZeCHHBxi5KMr6HbY=
X-Received: by 2002:a17:907:9810:b0:c29:4513:f6fd with SMTP id a640c23a62f3a-c317c0bbdebmr565259066b.35.1791466821244;
        Thu, 08 Oct 2026 06:40:21 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa482e9sm1524264a12.31.2026.10.08.06.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:40:20 -0700 (PDT)
Message-ID: <c0d8ff20-ee5a-48b2-8cb4-3a837077e192@linaro.org>
Date: Thu, 8 Oct 2026 14:40:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
 <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2026 12:23, Gjorgji Rosikopulos (Consultant) wrote:
>> +/* Number of bins in a Bayer histogram. */
>> +#define CAMSS_STATS_BHIST_BINS	1024
>> +
>> +/**
>> + * struct camss_stats_bhist - Bayer histogram
>> + *
>> + * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
>> + * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
>> + * whose luma falls outside the input range are not counted.
>> + *
>> + * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
>> + * @bins:   number of quads per bin
>> + */
>> +struct camss_stats_bhist {
>> +	struct v4l2_isp_block_header header;
> I think that the whole format is not correct, having header is preventing address alignment
> of the buffer for the stats, as i have mentioned in the next patch copying the statistics
> on each frame is not correct, just to have generic statistics format in userspace.

Err no I'll disagree with you there.

Since we are introducing stats on the qcom side we get to be the first - 
or close to first - system to implement extensible self-describing stats 
which is the mirror to the params.

Extensible stats lands in 7.3 so IMO there's no reason not to use it.

Also I think its kind of a crap design to have extensible params but not 
extensible stats.

It should be all or nothing. I don't see a gigantic problem in copying 
in data and then looking at how to accommodate dma straight into the 
stats output with block alignments later.

The extensible header facilitates next-hopping anyway so userspace 
shouldn't have to change once we DMA to the aligned regions.

Also if that is not supported by extensible stats then it _should_ be 
supported by extensible stats - i.e. it should be possible to DMA 
directly into the output buffer and pad the blocks as much as you need.

---
bod
