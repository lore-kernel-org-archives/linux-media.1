Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894113BBFAB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713396; cv=none; b=sMXvwNJce6GAJdDJBMFvs7yY3j2JsVTUC2/JJgcFapvf+ZFn3jlSbYwvLxjQoow4b2X1siAFJ05zBfcuYwgNkV7mV1SVoF4EaAwi5KWoGU1JdbYgT6yRYPa/nU60M2uErvRe8m+bTgv+OOGqECJaTpqfJ5ABzKOJLGpztSisOts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713396; c=relaxed/simple;
	bh=U+PGb6aIFUkkwFis3Hkvn0up5svo/RYtJBDhQOzvuYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA41cF9u8XxtXBnHwfLH6Mg8HI3zS73HDeDsog6VDLe4VtnT0VRLi4gbYhyj644aJK7BxoPYOlRrwgJygbt0zsNqIaewDJ96YYhwPmJQOc8zBwV3w5Mvogfugg8zDpZrwMfzsB7f8z+9NwztyjOHycKNoWhIbo/EFI6gmrfoFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Avnx/QEG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Avnx/QEG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69e28b554ceso12165460a12.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784713393; x=1785318193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBmeLLqRW24OAr47eslDpBbvu1uL5Oy4qRjOe70Vezk=;
        b=Avnx/QEGzy/jX0hjH6PTuxP2fjMJWuYsCIfr1tDig7G1CmiwGdBX7rsyQovv3xR17U
         +caNZbFthz7lzqFPxDm+TrvndfMEcc81xNkcFRn4Nh+Qsh6nihoCgjo+qpGPyebJKcuK
         MGHt4/eNVoLzLUyIBjdtwHBWsaIFaof9mD7bxNXNTBsAOM508HXkn4yBDcGcxHPEm+ka
         tYzHvdpNt0auhnu2NHBnjXMTzIzVksJJuQ1w8CKg/t2722KTDYi/u7I9qi5i8fWQTb0e
         c/ewS+hLUgI7eaZLbqWhpJ2ZpEIo2AgNlER3wN9BG/RwKx6lwgoiXlpN3SCoEMVy8+Ss
         PTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713393; x=1785318193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBmeLLqRW24OAr47eslDpBbvu1uL5Oy4qRjOe70Vezk=;
        b=iVSqe3/rOJRKqn1gSsWzCmYTcwnd5SMApl0KT3me16HRuq4vQ44OS5vPRyCglsR/bk
         420PGC+9r3dSJTUr+rr//sq9c30bqu7rQ0sreZS7Is5x+0hiXl9fWp6ZtzBUiBrMvu5I
         RAujRtRn43NN2U2Lbv9RtwezSm3SbWmJvdO3U909pxfeahF+JVPC0DnlrYusHNX7Ipgp
         gEV1BW31dOktxQfF41aCB7//g7tezrbZ+18ZhQWvxn+LJQJa3lGCjfqPxk0lg5FBVGwv
         PQQVbDbgjSnbGV2f6TlaZZjT3q3aKvWsyq32rLz23YmqmA2YiiinqQgWUyt11IVsiULr
         g3Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0hIyYY2/eW0kAmQFvIBMHhV9lzmSlSsKKAykVmvEOD5FdJ8F4msc2ZD1DlwT1wRLm2CvmAXLhN0pc4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zZtVursQ8/pVTTCsRcl7X+eOCb9TJbbXXlkBZDKDLs30+h0p
	g0O/HNESnQ0T9yP6+EqJweNWW5f4z4RC6QWxhAbYFnEkO1A41MOZIrWrwErKl+Epm2U=
X-Gm-Gg: AR+sD11vfuGnJd4vxqGpf1viXaV9xeE8FQaBSrLremvPW3xeUjAhQPtmhAxJcOdL1dH
	yROphxQjLH/vUo7u7bts/hdWzlbnA8pbtio/bZpnxEbKPYWKwL0db9ZIvw/et1w2gref8V9348Z
	RSJCZz/D8mCWzYm3gkyEgHbXRKmh6rOAdnh5M9dtpOOWfgTzEZrvFhZ+LB9WdcWQV16zmu63LIV
	wgGKy1gNPpPf22F40QNdZiaFPdLVDu3Btj0C/sUFBoCZx59cuqZ3UAGaYcQdT98oRt5A66ldlFn
	JUsXXAyQwEzNHlJSVF40cAVYKYZ2RE/mjsEGtcRDPiUoeRZDlGZpkkfJgT+YQBWu8Id9LboQ6Ca
	CRNP9Ufpd9b6VnEc3gnGrYOHVCazoo2jyR2Y4lYFXYitdBeaA4PCyn/gKu46lYznV/CIyatayL9
	xLP6/iiWdvL4ebkg==
X-Received: by 2002:a17:907:c0b:b0:c16:8931:245c with SMTP id a640c23a62f3a-c16b4756003mr1081440366b.21.1784713392626;
        Wed, 22 Jul 2026 02:43:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebbaf5sm77858966b.44.2026.07.22.02.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:43:12 -0700 (PDT)
Message-ID: <95d6ed14-d2c4-4b3c-8320-9307b5ad9d6b@linaro.org>
Date: Wed, 22 Jul 2026 10:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
 <ZjDt97YCI6QX2gXf-F4lYaIj4po25RZtKf27ElBUOzGcXoPUf6mR9uSVb16GcrHYpJdCJg5Ee0IX6oJvQx1gFg==@protonmail.internalid>
 <2512aab8-fbde-4b95-8619-6c32d60ab500@oss.qualcomm.com>
 <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
 <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/07/2026 10:11, Hangxiang Ma wrote:
> On 7/22/2026 4:07 PM, Bryan O'Donoghue wrote:
>> On 22/07/2026 03:24, Hangxiang Ma wrote:
>>> Hi Bryan, could you try to add this change into your PHY driver? This
>>> macro format has existed in old arch. We once have such discussion on v5
>>> thread.
>>>
>>> https://lore.kernel.org/all/bc6abd24- 
>>> d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com/
>>
>> I'd be obliged if you could generate a patch I can include and mark 
>> you as Co-Developed-by !?
>>
>> ---
>> bod
> 
> Sure. I think it makes sense to pick up this patch from the series 
> directly now, especially since I need to post another revision anyway. I 
> don’t have any concerns with that. If you have better way to handle 
> this, please share your thought. Thanks a lot.
> 
> Best regards,
> Hangxiang

I'm asking you to do all the work :)

i.e. test the integration

---
bod
