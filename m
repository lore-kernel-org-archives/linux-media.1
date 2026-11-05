Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872757;
	b=J5JQwFnQc4/WwMBJRhJFJPq6YTU7jXDRHq/LJz3KMz5Uif+o3CDPNLkOWv69NXapWMFf
	 WURrJ5qNrzUm1qa07rWk38lK+F8H8nljvOqP3YDmRJIJsaq78unlAyvC+LGv8OksRirrg
	 ERQieNJmiDLN1F+OR7U9k1wBKupoZYNqlQt8ssKnpLXXWorgMO6T/b3SpPsHbJW/bIaeM
	 p3RWcskpVnwsMHWcusjALd08bZROvZ2YsiIkvA8Pekgns2KijFL6F5m5AjyIl6cqaNMpK
	 fTVHbNytsShipbu75q0gjPz7M6UVcDsG9jnz5OcIcC52i5YWNSse+wLd6ZMDC3ErRzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
	b=Ihg9Onpax43ukbmdpOqr7qZtkcZ7QVwiBMeBpfU9PAeyDCTc+eiqLie4MTLoCh3BI3EF
	 raZGe2ze62coztzhfX4lCtpvBsdSyTpklBD+xj0oCoigd3t/7Np9sfK4oQt+gxMKbt6pD
	 bvUi6aklol7pcuCoeNrZ/2NTT3QESUrRn2X/L/WWxw+8U9gIVqhXFCcoASYYzkyvBgci2
	 NX+JoKy5CuJMg1P4qvxSd+s/PNH/Q72sTeFcGUKYIImB44JRfykj8GOQOrhYHwv60zdDE
	 LHF0Um6kJhyhFRhzzGsl04dPfHmSK6wLuRq2qzlIVDZD4jviKWana7h3ihilyESQ+TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bOsLWi3y;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A466606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A466606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bOsLWi3y
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso7745165e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872755; x=1794477555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
        b=bOsLWi3yDV2SwlL808R2GcqEQVSxTvrL2oD7ob3OjAAj6tc3AbRZuHB9WpYAvZbY10
         D6CIX5o7pS2ybUuf9EOUZIHcOKf13g7OUQP2bG7nXOCQgB4/gJ5St+I4C4dnbGG4ja2w
         TX2WQIAOxwA25adjgPV111iGrBu3uyctFICYclZcFy+OVEwEWY9Z/SqdvWHuNlVSMPuW
         XvW7fkWFFCEAfBIcFSjcLlbSlyotblLpMJcUhSVJ7DCcbP4GYxoPIfPVkZheVRG5p3Hv
         WZAZRidihq0S+ndsMpq6Y1wlZwoHVhs8tXQCEqn9HZmgQyjzKuJuCf8rB0hxpj52nNfA
         L31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872755; x=1794477555;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72hF0zaijNyHtswxhUEwhT+OMs8ScZ0feIrG+Lm2KOU=;
        b=WD/49PWgJLD1e9BpXvXM1uNtBCXJqREYr9/bPz11rAzG3eV0aUUHfbOgzgO8f7Hh37
         AKGlHwbVVd5P8j3UO9KKqiaJsAh0+Djjdd2Iw0gMVvKqJFFdrzbDAQsdeOrG/Tmj5GIc
         iSZGxSjffmbgxB5BIR9Wxg5AjUhYwU/ph0fxadWEJtJ/0+SCXHqcYoJqSqkYeobsWcmG
         FVgE5GYuwtyUvxgz+1Ip1ka5Sljz+DkxSLLIpDXVbSarSofyhrKq66jP4Sjjd3CKMcyn
         k7rgoPAWVCJdSCFFgbDM9jTRkblPTHVmwupg4zhAhy5OM7sm/9ZBpsk6iOdKV8OdVDRH
         LFUA==
X-Forwarded-Encrypted: i=1; AKwUvBwEE0oKcH7LtNm3uOORSh/5YwOUzYrZhlCxSJY0et+kr1DxAZJv2k7loGLZELXeajzJgYOP7+tmvEqlyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xV9Ge4fZZx13jBkHI5xND7oJChPcEgqzGDNmWRAd/L79ejAZW
	2ri/gq+JAuL/KDJp62x1CYZYhjVmDy/c1ZZx9dcAn0BDV/YMTEKhczWUFFP2g5XkVhE=
X-Gm-Gg: AYBFou1p3Lk+AmRQB190cxp/aE2uh5UMDE46BDIIIL4gi7LsGHlrQqo6eS1UKvRmf/Y
	pS6YITKVoM18BACg8OrCFo3erqD/3z5lxgF6ztq3F9ycY+RCriOcLe78TaLbxtE9RHBOZsosU/G
	iAxPwR30lgmpvhOWivM2tJNj/rLJupeCmVFgQnz7Bg82AccqxLiSvMGAcZbwt2MhByVk4Rs+rMD
	RiyTtDtCoPwM/mR2lINk0JQvtrXW3d3vVwsDHqPG/7yehlAPZWfDsz5mqLoJmqm4EOh3Xdf0e0b
	guro5CJWFHB8Ua6XNuB7oiKXVMJ8upypI7f+1wPZuX0nXZOH7G3xYSuFj4MPn6fVJMP+XEkB8Sh
	gi4asgJm91jL1vbsPropXSrbRdOyuoN3UOxjs4p6DtdGM6BNqbudWY+d2f4N8mSPsXag1yYs1IX
	opSe5KrtTlLbdSLXIgxQi+6lQDYJmvSHoNWiqFrWKqKfCzBxYi/4ksrkAHTmMfOWVd0IK6dr/fl
	E+LA/1b2/YWR1n11WT5HYHpTZV8m9YQ1wsOaAlC9BTKdG5JF8PVPyXrlXBpgPrIyulf5e/2QSPg
	WNgV6E6/Eq6idkRz9pkPfGmieUA+OnBJJb6NLrUNlVz/ErGGp3Ix0jm5e6iMyg==
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4ac1765d977mr384989555e9.21.1793872755037;
        Thu, 05 Nov 2026 01:59:15 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b432a883ffsm54957825e9.3.2026.11.05.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:59:14 -0800 (PST)
Message-ID: <f46f0d98-5756-4b2d-a8b6-ca68a1a071bb@linaro.org>
Date: Thu, 5 Nov 2026 09:59:13 +0000
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-2-allan@fatecpompeia.edu.br>
 <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Content-Language: en-GB
In-Reply-To: <8824d3fd-4b39-4355-a4ab-5f7e711aceb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2026 09:57, Bryan O'Donoghue wrote:
> On 04/11/2026 20:23, Allan Siriani wrote:
>> +static int video_buf_plane_addr(struct camss_video *video,
>> +                struct vb2_buffer *vb, unsigned int plane,
>> +                dma_addr_t *addr)
>> +{
>> +    struct scatterlist *sg;
>> +    struct sg_table *sgt;
>> +    dma_addr_t next;
>> +    unsigned int i;
>> +
>> +    if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
>> +        *addr = vb2_dma_contig_plane_dma_addr(vb, plane);
>> +        return 0;
>> +    }
>> +
>> +    sgt = vb2_dma_sg_plane_desc(vb, plane);
>> +    if (!sgt || !sgt->nents)
>> +        return -EFAULT;
>> +
>> +    next = sg_dma_address(sgt->sgl);
>> +    for_each_sgtable_dma_sg(sgt, sg, i) {
>> +        if (sg_dma_address(sg) != next) {
>> +            dev_err(video->camss->dev,
>> +                "Plane %u is not contiguous in DMA space\n",
>> +                plane);
>> +            return -EINVAL;
>> +        }
>> +        next += sg_dma_len(sg);
>> +    }
>> +
>> +    *addr = sg_dma_address(sgt->sgl);
>> +
>> +    return 0;
>> +}
> 
> STOP SENDING THIS SLOP !
> 
> ---
> bod

Oops - pardon me I thought you resent and NAK'd patch.

My mistake :)

---
bod
