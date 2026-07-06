Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBF318EFF
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346241; cv=none; b=RoH2pnJ24ZcXAy3636EE8y7fSjeDtqsURicWzA2oTaEAWp7VYKC22eeH8G4rOwiWorsPzo9/jgKRuoOgIATkqbx6S0jZQUUNpcV1xortS0t5f4kycOauQ1DzCTLC6OLewb0HV494JyCCP6J1A3qlnIbHKZ35OvaR1hbWwKaxXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346241; c=relaxed/simple;
	bh=Xzs5g9dEsK628K9byNJTDAcYpR/tRUu1uwxqbtSIVxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UymETSDGyjBwEG1f+KjsIfQLZWsmOqmOJSDvHJA4hhG7QMvPEVRSyk8Q/FYDaqBcZSEcjZSYmbzezgpBR8khJRgdl98097+tZL9DCoTIR9k7YHFRRSShsKXooWi/xFzBu6ZbfCDPK6VArG/MaF7EwdMUOR9jlxMSGjibQH1XYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v1J2dh9S; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1J2dh9S"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so240698e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783346238; x=1783951038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BU04O1xBoSt4cocqne7Ze3wRzgQFHUDYv7uZbNdZ/Xs=;
        b=v1J2dh9Sx1bZVNhrIkMtTOr81g5s2YwTDjUPDFabHYPX6G6PGDVyHlSrezejao9urS
         rHEAZGEYFhYxJQDFy2waH3jQnza69TMDOxRQ5KjOIkcqpiIjbCOPyrTGqJjQZfRuPIOM
         gpqc24N8WYjK3fw9Mr1PZtyzYo0alAlZ8qR9MzcZWsUqo7FoU/Vii6rLLNeJv/9THsCE
         +xqzX0z0NPxQQYsyRh4LlJJvNsFkHqzP/RZZKy2b+hnW+UTQ+hRkGopb+WjSLS/Z6eUV
         54wYIEol5+wCU/2FWwarq6lt8UPGPlHDhgrm059zaTob0gaveGgVBo+POJOsKcXOMora
         V5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346238; x=1783951038;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BU04O1xBoSt4cocqne7Ze3wRzgQFHUDYv7uZbNdZ/Xs=;
        b=KKVvddo5v3zOMMhpwW8rktqz2IMNe8Vuyk9dYCsRKq9GSrHlkmnXESgxiXtnyOMMKD
         THTuq1uv9aAt9P4EI4OPfvnrRm0KZHjmg0WjPV6AdiGg0kpzuD/UBrtLvdoGZFyxTKPX
         73rS7jHRPwXbf/H+eBgfmzdjpx1RBcpp4MbpyAUYQAh3HjQLg5KnX5sV+2pJf3jrTd6C
         P5y6CgwopsOKEJ7D/0TnLZElnDzN3CwKdG1icddL5wJBQeCX6fMIXbxC4573pjIdakt8
         WjB3YwuKcA0upwoUSjy+o7NdQniNua+9E+A+DBLHrl9EO6lOaChmxVak9Qrv5iElWbHQ
         xQMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaQjss9jcNVzj4nzwq6zKW69C+2mAUJ0JEiaBeezJGkiJDmoTgMvKvTGavSQ8X+xucyb//CTiuYeYxDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDj0c4m+ZuIco2cdUlW/u8+p7rAXzMBAeY9lVNHVA+cp3yQzEk
	xqggxKEEimYFhwLwHZ+9weTFz4Oeo6KM/VarWGa74u3F7I8I9qMZ6o7Lk29ZbMODQr0=
X-Gm-Gg: AfdE7cnz62o0zu+IdOnQQZr6AuRYHbsur3L6THAwpuPNwgg1GvTaxhp2aVuz/BInGqp
	P87urVC7behfW/za7UGoLgBLJ2NQYHPxZohHJ4Xv7qKYtVSysjhyQ1ASW3nzgIudyrW0xs3bdMK
	n5s3WnPacNvCTVsdLGKxiXO3WhpSJeu9/95Cny0YHreZZJALqtiAIkYJ3mWOeGXfUgRLQcW5VB5
	EzPAkh9Ll0j400T5MnmOCnn0CxhlY/izUQraD33Y95a9LCNhSfI+as2a3nlDqLE4GIcA7BYK9gr
	3VIcjJDr0RRUZtZNZNun8TDM9fjWKMPvYUhHJH+giVUPMRkbKNRkZ0q0VUaYRquJcZkhPoU6OXa
	s5rv3PQHWt0FJTjDyLrqxcx8dEJh05GqbL1Q0YXVfnMpWunYJWfzRXkLPhfvjLwM82sx8Ufp/vg
	sAaSonLSS32vyt/5XAd1bjqPK1e9BZRjNlV+aGkjjR6cZu+kdq7+xtDPO1UwmpIQziB5c=
X-Received: by 2002:a05:6512:1328:b0:5aa:61ed:482c with SMTP id 2adb3069b0e04-5aed4557b80mr1425611e87.6.1783346237551;
        Mon, 06 Jul 2026 06:57:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm2903301e87.4.2026.07.06.06.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:57:17 -0700 (PDT)
Message-ID: <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
Date: Mon, 6 Jul 2026 16:57:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/6/26 16:37, Bryan O'Donoghue wrote:
> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
>>>>
>>>> Why? The common power domain and interconnects have already been
>>>> described as resources of the parent CAMSS device, there is no need
>>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>>> CSID, IFE etc are not parents of the JPEG encoder.
>>>
>>> The idea is to make all of these peers, eventually. Not particular block
>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>
>>
>> The statement provides the same information as before, e.g. it's found
>> here:
>>
>> https://lore.kernel.org/linux-media/fbc018f5-
>> c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>
>>       There's no functional linkage between CAMSS/IFE and JPEG - they are
>>       peers within the CAMSS power-island.
>>
>> Thus "the CAMSS power-island" exists, and it got its hardware description
>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>> a natural resource of all devices on "CAMSS power-island",
> 
> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of
> the nodes within it depend on that and it is _external_ to the block.

So? There is no tension with my point of view.

> There is a CSID MUX on some SOC other than that I'll restate it again,
> I'm not sure why you won't accept it.
> 
> There is no dependency between JPEG and IFE, one is _not_ subordinate to
> the other and trying to find ways to invalidate that statement runs
> counter to the facts.
> 
> CAMCC provides TITAN_TOP_GDSC external to the CAMSS block, that GDSC
> effectively _is_ the power island.
> 
> This debate is going nowhere. Check the downstream you don't need the
> docs titan_top_gdsc is provided by CAMCC.
> 

There is no debate, since my arguments are not debated so far... Why?

And at the same time you didn't provide any support to have N identical
spread hardware property descriptions instead of the single one.

What is a good enough reason to prefer complexity over simplicity?

-- 
Best wishes,
Vladimir
