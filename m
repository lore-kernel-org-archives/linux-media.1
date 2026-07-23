Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F696470447
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806282; cv=none; b=a4i5fyPOw76k0VIRDmatbuohhLmM/pA+39qafpmCW5adRCxG2kWfI/ic0+Bp7fIMD3sGJxYZlyRmH0uGlEeGec97C4iDqMhPNC4ELPbpqc3yE9oUzyP7+ZkFGPxc033fMqP+cJvopQExdMUQD95QmDsLTJvIqBzDuMeKxbYXYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806282; c=relaxed/simple;
	bh=ObWNXK3VJx/3xTZqQzKKlhSpfFWFGtxH9w5Top8hHrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib/SGBmItd2tT+MC5lOqqqeCScaRnTlmFFTE/Q5f4Qw7NJs2dtnKsK32OHVfN3ESCMdt7u01D9hVy/adUr54obmKlH603Kbmg3ktKjP+oNIdI/KdanhUDrOeN53HwykwQvf6h7Wvmr9ip++cbrbmcK3U7/xCxm7rjOKWcxTeTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TM66bAew; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TM66bAew"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c93a972b9so1176421fa.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784806278; x=1785411078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EFWUR72bAqyoXSmK1v8OhlBz/5Yc7QEf3J9VzYccieM=;
        b=TM66bAewR8MkEZ3gY/Ud9FMkdOZwa0Mw/AKGL2UuzED4YjwgfLFIc3jx6QcSwdgX6v
         O0GC0wAJtWEyD7HkFqZ/LXgkggNnJgJEgb9BpHx8hkb68KsqHeok46EVaOgm/ZtkCO1n
         NudKX2z8Rw3oCWUthsenC42dzFCgrvqLhVN0vO17rUlyFJiv0XPFkf2p3qENZ/gs7TQ7
         tn32EWz3/5We1j7WsHN6K9PRcbYh6pw1z0fI+DSjQ1Ko6EJTjMzeUw28GrNjwrFyzENs
         ofAmBO/KAawhx9vxAJUNsVWCAHM2NxU+8u0QryBNr6NCy3m6fBBmMqqirtnFCRMogo6s
         nWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806278; x=1785411078;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFWUR72bAqyoXSmK1v8OhlBz/5Yc7QEf3J9VzYccieM=;
        b=Ff03ZawnV3kMhIeOHzq0te8Fb2tOdM/7tiiUPWEBPCyTZgVHHSZkvHeziYDm4Rx4Xr
         EdFPjX6NJHal0B98mjZ3d/rXoAbkaXiWiebRIOBLo9ehYmni0UiPuCG9YzTE07IeeSeq
         CLSxbDih1vJ0nIhZm2/3mpwzZ/RmlO64Za1bLoC7JqZRv+g7hWgL6JC/gBqXckK0TEcy
         EdoUDCc+EqlWPU8aditXGy8g1Hha1meHeQb1jpqP48RlBap5ua493i06sIIfQkguiHG0
         yq6P+Pzk8FJUPHuQSWr6TTrjWhTD2SvBgex1fsOrroeYhVXp1uAada6lMxLo776bhxIk
         1VUw==
X-Forwarded-Encrypted: i=1; AHgh+RocF16An0iwVjsG6tgFhELYEuJsFeiCZCWiow9spt7QyDMJ2XlUjici5Q+NPazcyDo/ai08PR2zr1fZCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl67mTWJp60c3n9K06fUqp/8YakrtH7Cia+pE47vzQLYkCCI1y
	FUHQuAfBpRpkbkHciCqLSOYEpjK5uT3e9HqAzPJD062cw20GuiyEAj3lUCbpPqNZpu4=
X-Gm-Gg: AR+sD11uWc1Njt/KCGza3bQXrDzV+TfHXq7ehWUZWxWMwbtjAYJPswVWIxvgNjBRDFH
	8K/X7qi4k9V5HVv4y6cOMz8PzDjQp5zUEGGMm4XS4T4JIpsMKEdQDdXpI/6aEASVqj1nvTFn7wV
	8gJwXrhPB+y0ZLQ0KEQ5w3Z5EqMbH4zF2af9SKDiesPp4gRTfHbPMQZVjNrVz4TANtABE66wrJn
	ilwWS8oS079mT/76ZOk9+L3YRLXNMDNcx38xNz7yBcSojubtQGRM2CjbzuqW4igR8ChCEzS98sz
	lf3otl60lpEL5lFjLyLrdSiXGVCrjgKyRU0dnKE+gqDoRhW9qhmL0FqfJmzZ5MPyWUF9dv8ZxMk
	IvnWVXNn5hTx051lKW5kEPOoSZ7xuPT6+Gxv6hGxl2rgVyTmmtvqFPxs2QdNCBJ2ts5lUDZBUV8
	CICwg3jSUm/wJ6KvjPExjkCh/M9gm97bA0qdpOhQmgVv3xcw+nwsulR9Ui
X-Received: by 2002:a05:651c:b22:b0:39c:6b1d:4569 with SMTP id 38308e7fff4ca-39f150ae0d5mr150241fa.4.1784806277877;
        Thu, 23 Jul 2026 04:31:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558d5sm9492781fa.30.2026.07.23.04.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:31:15 -0700 (PDT)
Message-ID: <a2729b8c-5e03-43f8-bd76-5dbd47c8816f@linaro.org>
Date: Thu, 23 Jul 2026 14:31:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: qcom: camss: Drop csiphy_res_8300 phy
 resource table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
 <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:09, Hans de Goede wrote:
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
> 
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
