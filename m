Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F363D9540
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332747; cv=none; b=qVo+rVpKeKk2Ro+s2PXkcLYhS33DHeyCqiDxFywVDboXpDdOMwgBh13nfQURhaxuyzyQuB9YnOxyNosmGtzIwViW/L35EBO7QsbMb3w8DfJ6GDxlhxjXpLbN1LudFGsUztZAbE3yBzujz0lD0g1LKVuONxd39YvutUbkJMDD/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332747; c=relaxed/simple;
	bh=gqgOIGIN6sXR8VaiD0l5Q2LHm5agZmjYy0VZs9k+yjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1kdILxXfp1leccBl6ygR7xcwB8r6kW+8QcQwn/obQ+gTVOiMeuv9iYJRPBqSweR8hVNqAEWgcph+7Oyg6hnqmQajVDahXLWcUDmbHkkNvcpy4+WvNtAaIxpb7HGfphLUEPYVR/Qv9H1vd1NQztSo4EXS9F7Z2jIBBEe8iPpXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRIBpWRj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRIBpWRj"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so4653442a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783332744; x=1783937544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=DRIBpWRjP6YIlMnqGcYDXJ+MeyD3nsqikVqkGuR//MWxv21DRVtdAje+7iHEXQM6wF
         l1ecU8eqR5Ggg8MjCn80bql/csRRt2hGBTTTbSudJG5Q9Waw0CWMDsf+GALBEnUiqCPs
         LUO+HQkplwRdHPevEt39FnHn0afp/ntUwN65pUtfgkZFFfpI22p7mb+LJxuIirRniumA
         uiMB3VeHVALtHIssz8Sk/ZtPNoj2OyWPmAHSa5DoYANBiS8u/u0485j1Uq+CrNxwhxJe
         6V2qABnaG8aA8nXlB11Q/s2FJ4Bv9KbzSmN01AF79BMbY25NwETuwZ/nHlGV9CAxsKjI
         aSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332744; x=1783937544;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=aRVi2Ifb9DJXlzYjs1jFkbnPKr9MnpEqLhfcNw063xSrG6ddifjG06goAaa4vsGCC8
         k5JWbgqHKguuLErDr0l50Ilt6CpqfzkJQ54mpAa7Fk58D9ZgGFgAw2eokjVtcvhNjF6I
         PbIATMXDuv7xIk7uVbh6U2Sh71AHtXsbuc/c9aG2DJaAYx51/6jm1PObaZRe+4btaSO9
         GEi2VJT6MSjtcJBM3UuIRpg3LVdQkeI2JFBpvvWgU5AVbEw/LDqU3xOUtPvYjQvF9p+l
         UABb7te6HWt+CElcBO510UFXQyF7RYpU625hDi17Sy1bRgZnubyfr2waxaFyRZ3lEDYg
         VXBw==
X-Forwarded-Encrypted: i=1; AHgh+RrAOdfLxXm5F7UXdKp9hHToAiELll0XTetyMpGXwk+nOdm+embmVX3nMrPJK6JvhekOlZE+zD//bgh+Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDqlbm9IhqZcF3sCB+L+gicdlelL9T1gC3R0+cVY3jiDzlkkr
	kYv9iAV/yw6YgEjdvstydKnk/xQz8mMYiA4wM3LV/ajEhtbO+MjHULQ+F5Divm6fMIQ=
X-Gm-Gg: AfdE7clRyyKDPQNmthjPpAG79LAz5spBSm70WLrdIwemoYlULkg2WRsFe2Tu0brlvFh
	pd9wJwr9mVtfitRNf2XvrSafit2EpF7NLNXNiXfuC5x5l8xMASMORdCq/EBNlTlC/QcGqZuha37
	1mFqFdr+gtU/A5IvC1SKyED28FXAbuFQIcu8eS4dBoFCHlFoU7x8CDeos1RpK4oD8yWJw9cIXeA
	tvFXVEC4rDMIzNrUqsJXMaq1QsGK88uawrO1ye3K/pb2MFhLqjsPfhG6QciXKC+yNLlcCeeUmhS
	5/cRwFUk9UA4y9m1NggG9/FHoXv1Wbvcs7ILZtYC+8iEZf0A6fy11jpij7VFzew/PbxDhYMdJPr
	vpnvsRgs2b9hNlhu+asN5R5Dp3JYrHOJ9WrwckQQrRcpCRJFTseNXxRN+s5c1NItVoxhkQcoJHr
	sRes/86r6dFOpgdv+kTXhQ2nbYVJjwZqxCB6+L
X-Received: by 2002:a17:907:9454:b0:c0f:beeb:dbd8 with SMTP id a640c23a62f3a-c12e6b2e5ecmr395937066b.27.1783332744035;
        Mon, 06 Jul 2026 03:12:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm712364866b.41.2026.07.06.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:12:23 -0700 (PDT)
Message-ID: <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
Date: Mon, 6 Jul 2026 11:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> Note: The handling of shared camera subsystem resources (power domains,
> interconnects) for child IP blocks is still an open design question.

Why ?

A device needs to vote on its own interconnect and power-domains on any 
bus. A sub-device of another device may wish to ramp a clock for 
whatever reason.

There is no "master" device in this block of devices - save perhaps for 
the CSID mux / wrappers on some of these parts.

We have shared resources like camera noc, system noc and external clocks.

Please include power-domains and interconnects.

---
bod
