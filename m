Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906573FBEB0
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404216; cv=none; b=LAs6zdU5laiNi5b3JYYHMrJDAMWwZRMMdNbbLSv0VCHfZm0AaCfDtD7AAbSUdvTGEIcj2lX6DM0Vs2/qXe+h4NkUBE8662LehF7ZgYzdHk4N0UAi9JQO/EtsDQxID0hSkQzE5bydDE4GZjEwHz+RsAOPzp9cLgzbYXXMO9kE5Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404216; c=relaxed/simple;
	bh=3ig9HyOBwUAQGnS+nGUpC+LS7V7HWg7iPJ6suT5Ougs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHh10XzDqCsCQboMPNyQJAoNRE5YwFl5A6XcQPqCAaNu36qdvzIaFcxq5YstBFzItZ7PTsdDwyAXS+rC07oSzkOx3+9bVk9zSqaXA14gQx+qDYoVMlhCHtHTyTLy3ZtgvtTS7wSuDzHxQf2jcf+JLeNSniKREDXaMQ5WSSxT634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AljOxfXi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AljOxfXi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so18637295e9.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785404214; x=1786009014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YenH0EkAp38hPwj0HJf+phj+YdBWGT+XzdFAusXbYyg=;
        b=AljOxfXi7M6djbXYt1BqJ0E+TVCRIM0p2z20b1y9Izuo0IX9Tk9T97kT9O8e7Mqelv
         CsCdAXnGlv5urJ4fzVkV2HhzJ/nj1tkmyT8QPU7HPmWBh9FYYEpzJ0w791TuTNx0umlb
         uxGCxRmsjZh/Xo/Nm79HuvB6IefQdtlWerXIeFBKKE65uizCCgjCKEpInDr3eG8zPtnI
         MxXikzCRgglF0n/XYT0ghwun179Wb7ngfRrmNNz94OA8aTeav5lOkD8ASM2z/XoGn35V
         g2s2MDM85+i3jy2t0CDx7eCoaFHfvDJHXbopQuUkywxenF9dnMQROFDHNT49q/QtSX58
         uwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404214; x=1786009014;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YenH0EkAp38hPwj0HJf+phj+YdBWGT+XzdFAusXbYyg=;
        b=hdARBUjq0dnijBbpod8HFyvYeMWSlY2adgftLA53mXIhob2JUeEvsQEW03MPsiAIc5
         Qh8Ukm1snnphzIAdsLPysZ0n8zkGvtVVzqMKuEne3p2T2ODSWoi3CjqJI0zhzXSSMPbE
         tjwdfhZo6ZkzG/kCjwDrHFmxbHytGrD/fwDQ/c4oe004A82DgOEL35npTJ62KMfn6Oyr
         jVjzhtDuHTr5ZLfExU0bCe1voO+dIbo3LHaChMsWv6mwYLkTQTmuQDFkXkyDoONyS79q
         n6A071xQ8BHfBHr+yl3We41dzgWXT0ntuf4TvMhT0dlHMj8TA9p8VKEcDAxzPGwthrtP
         Hlyg==
X-Gm-Message-State: AOJu0YyMyfq4Zf/PeCqxNAibQeX0K++tnIR8z/RGGhrPIjZnvRM6cTNR
	7xGI3O0flPtISyaWyuRTeQrUM1garEYm0iaqkEIbsVqL+cIDdhes4grfvGdsJ0JlKdY=
X-Gm-Gg: AR+sD1082PEg8hQNb8QqRUAoMKq9ZpBDC3wYgUK/DiXdNyB3CxbEZHj+he8eyQDjlnm
	uZIgrRCHGtYjXM4ahqoT6bzA+AA0jJlAfLiGDGdtAWOmgeyW7O1thTjrq1RO6ZmLZ+6/AYzeRdY
	cOdmzoMW/GvARnq+n5RZ/jQK7StNG4VQMfnyiloEcks7FxGduGR2WS55tE3MR6+JlOgvV8ExosF
	zp98Ycktc33tr8ZH1MMnTIkUdSUm7Clwl3CUjQ40UhvANcmlI1nbhv/pDRsUvq5NPOkqLiLfAJK
	Hp5k4WaW8DE1i4BJyOGuCyWaiw8/z7/4HWIlVnF/LfkouuuGw62RrPjCV2+CMOfEfQy8ldn9VNS
	im32DS+Pp7rtK044UAL0cbyPTi7wpDRrS70bJ/Xa6IQNA1qwmfH94pb2DxtqOyRnDPw8u+BV9hD
	A/QaRmsPVgS4omr5QjhKF0hzro3ONZm2URp/k8QWJCgk8QPIS58afsubSZujXyaJbxXOdQHym8
X-Received: by 2002:a05:600c:8b2e:b0:496:c967:5f9c with SMTP id 5b1f17b1804b1-49800ec19d5mr28488325e9.33.1785404213726;
        Thu, 30 Jul 2026 02:36:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e3d7fsm4722046f8f.9.2026.07.30.02.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:36:53 -0700 (PDT)
Message-ID: <a24cac0e-7d9a-4293-86e8-9bd0e724c102@linaro.org>
Date: Thu, 30 Jul 2026 10:36:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: Report hardware version via
 media controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-4-74a87302dd9f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260730-camss-version-v3-4-74a87302dd9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 10:24, Loic Poulain wrote:
> +static int camss_read_version(struct camss *camss)
> +{
> +	u32 hw_version;
> +	int ret;
> +
> +	if (!camss->top_base || !camss->res->pm_clks[0])
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(camss->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);

I'm virtually sure this fails on !PM_CLK

---
bod
