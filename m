Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448701;
	b=3VpMUnT7bNhpMi7wu+1A6rB/T0oRDTioIQDGYB6qayrhSVZVfgbmGxtPfYl1n99VPnox
	 icdmrluYVTxZAEzwfGVFVnl3rRi4f/nE0104Q/QQKBpy2QNKuG6tYkz/RhRTUzeiLlE1C
	 uABR0PSBpOhYkzG24BhaThBIUdcCT1hSLvRgbRiqUgra3e83q93DroazW0KvQNb2tE//Y
	 swLvCtcvvuHwQcog5bqJRu2qYuw1h/18Fv0uPCbEVyIL4W1vN1PrZBTo3d/7ANUElqSVN
	 KFDjIeyobiZbYRoqoZRLPHcMXg6QMxYEYwrqveikuiS/ncrqSBSVTroyNj2+PhZkIMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
	b=vT6LRDC7wTgHaj338q6hezLhW/cu+c1UzMdBS8njGaVLlXPV/qSAxHv33EHUDaNigltu
	 i3db0MAwnAzVaOkcIDDujGLEBEEJSefuwmo1WrBirDHsak82X98xpKOUdzNcd58GV0X3r
	 c+uD0RY5FKEOU/fHgy6J1X07977GAexkGx9Y4Kz+foatwowaO1zeEHelUJ4FmqX6Y1foY
	 anhHAwfV1ZpaZt6so2C3GTjoZMVq7m47jIvM7x9qYqTAsWz4pWmyR1jAcGcCLGpI/G3QA
	 VRCQnsg8ZeffxGy2MbZrbEl5LEhoHQCmKKFffV91fqUSE5P/vLaJqfpEsS+NQwRGovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E293606A332
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 01:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E293606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MIwkcfFT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2086340f8f.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 17:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794448699; x=1795053499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=MIwkcfFTDw1CFc7M9hKieOExGiw8T7CiLf3t3+t5CV7xhSgAAX3qJnWHyYdHW2btbM
         APU0VO+UqBPrBJGFTOQWRbrbsDleNI5QY4VxP8RT8LkEvyQ+PE0omWuzozZ5+gotOHen
         G8gVkQ00aMI7aBuiN+ov0zpDQ+3ACCU2PSR4Vxhw8ekGOmC6oaSFFnl4+MI7YviqTcTb
         9Pqb5kr8d/lj8ka+ynlS8cek49k8EpLeUDvQlXOXKNWiOKFSGhgpu/xv8gok1gue9gfv
         rudmZL6JMrjW2AK2Zn0lfAwuj0gxYZb5J/bvH62bMQOiuaS67jSlJSqcvmNU/GVJcGpU
         Jd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448699; x=1795053499;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFeZXEbhmfUqv+BRu8zMGHHr1ieq05uAvFEKtu7g9xE=;
        b=yTVDaUAMdMNevmZGUZu/bvNCGeBR168bg8NG+jOFPj2AfBOb6OFTiKvWgSPpNKcGhU
         tkxlfN9HkL3bkXL71aRbqR/3H9qPssAWuQCGKYzYq80vlt//127KBxa3AIp1K9gW+nd0
         Q81tpj5+iK/GLNitxpVlZNauADfnTMrVVjhiGZfFqBtyNWkJ/4xq4oU+ylCGu7jwbglU
         egSPBWNW34QhA2+C/qgqdRNrd6AvgeI+uBF07owfXh0OJwS1U9VnZa0YVbIxEAzP5Gbi
         fM2sCGkwiRyxyD8mXx+IWoGTfAxhHiVKMQsd26kv/UtuV1WCb+aPxIG3qoMk29di9/f1
         s8Lw==
X-Forwarded-Encrypted: i=1; AL+hErEuOQ3NSXfdQnaFKIwHeZwWdfgv2Z11hZzNts6lVFGY2zL7wJU8gtFa6tYULJyvE13mwqR2UoztJOJaMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MHqS7BgMoqEdMFJse2lUg1mkNLyTX/n89QQGAI3D8pRRZ7row
	BYt39zNqVrPqTqdYjersBkbAAkRwLiw5ZyoT3vMfizakYKnMdIg2sT2MzlvS0yxQaWWTjyjcwy9
	9LTa0VdE=
X-Gm-Gg: AYBFou2wRROELmXmmHdjJk76Q7ZAJVWP1y1DGiKX6g4XFC4K2qv5AwQzNHQoxB94ImY
	iqc131/54+Lq9nk5oX9mB6hxJ1tM1c2I3FcdhsjPkjX7+vfL6Q01QKb5C0+HURpeph+R5tAM4LI
	DLj+DVUiyCNEFmKzkvP40x25eaF3YsurlAJNap5oXlsquzSlhbpLbC4bqZ7+ymfUNM4mq5Zzpso
	OQBbaBhtjLMm9nOHNd8lDuRTvIZjjEL4fksxs+NFF3JEjvRxDTrT5Ab4LoUmBu+pLox6LLq2sbm
	oKgrg+3g2BgFS7OfdoywX3X5URXjLvFd7im8JNroJjDAURRayVKxRH2yoOOtRevAcKBlGNdaC5+
	j1DtHQWnnY9FRuBpD0t//eFaRCusrEWASKM66dKCgSzgoOw1T3SuQn8ttd2wEHhyFYds2kKDBOX
	zB6+d8uuSO/tV/BBOx479sbZA/nKaBYlq4O8soB+apAroulBD3BJXMwyMwEKoVVYjwIkPjp/Y+v
	MH+S0rfzSv1FUorNo8MCo5YagkGV+9VwaQaE+2xY38scA9pdywam2L2HDJAzDsGDhyBXzQw0krJ
	Bj87kuZ3tu5MAl6xYYS699XuzBJWcjvwSUovYcWa
X-Received: by 2002:a05:6000:4027:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-499c792ea42mr6742918f8f.44.1794448699467;
        Wed, 11 Nov 2026 17:58:19 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm8864900f8f.2.2026.11.11.17.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:58:18 -0800 (PST)
Message-ID: <1e6f7588-aa9d-434b-aa8a-d45031df5a4a@linaro.org>
Date: Thu, 12 Nov 2026 01:58:16 +0000
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
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
 <20261111135338.27008-3-allan@fatecpompeia.edu.br>
 <6fdd46b6-e57e-4688-8231-b31b61810cb4@linaro.org>
 <20261111154536.24163-1-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111154536.24163-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 15:45, Allan Siriani wrote:
> On 11/11/2026 14:35, Bryan O'Donoghue wrote:
>> I would appreciate a more direct and succinct problem description.
> How about:
> 
>    media: qcom: camss: vfe-4-1: program RDI write buffer size
> 
>    MSM8226 has no CAMSS IOMMU. Program WR_BUFFER_CFG from the active
>    format and clear WR_IMAGE_SIZE to prevent RDI buffer overruns.
> 
> Can you take it with this changelog when applying, or do you want a v4?

Works for me thx

---
bod
