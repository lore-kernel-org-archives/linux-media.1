Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05787471D1F
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806261; cv=none; b=Eg+zwV3HxZ9MxS5r+yaN/+vHxr9tINp4b9cVvPvNWRRv1R7Pcg2VZxDR9zbTKOn+DfE+uoX1UXYYtGa5GDT0mmvf2cvAZzNwmqPcaFKFryxHB447USMNjwHI0qTTf1Ikg2F0RKKNRZYj+eetAKnECe/k0UH8Eg7T1JYs1PpRdjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806261; c=relaxed/simple;
	bh=4f55Wmue7rWVrMQRu5qQEvu454CL76w82D8Y6+yNhCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulJFQyTOC6IllIgMMLMlFUk9WrYrMFh9GscC4rxkW8SHGvr4F8acwW9UJhKo+vp6yP1LUVYiksisXLmlac4vgDpRmVloPdBZXUXeybQ+ustnuK/uZWhJyYZ0obKl6XQa0Ap7f08salEuXR5qvwS/bfHkqpZbDxAZ44Kw2Yammiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoxLwpOT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoxLwpOT"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb7ccb9f0so88909e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784806256; x=1785411056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vv6vUno4qgjTH+OYVVQNA1sqBXT8T8DDiSHLEOwcpLY=;
        b=KoxLwpOTR7M6n4IXU2LzutfxjZ9i3iqCb8PNkiGwMB6YySaG0azcP81WFRQrvXQdij
         L85G0eorO+wD3QJPrRSU4moDsu0liyddHNUz+8gPOhU6s88Q7aci7L5eXvaOxzwu5xue
         7sNroJOL4ZZ92vBd6Yv21E7oBqFf2hN8bd4pOm/jRbYHCoMuCwOGcF7jepLebzhZwBZ6
         xyhv9kfcyKL5jqkPdZs5dAHBe5flldCMAXtWsoQKdp99EvUdxtRj/vBFbxkVTAmZsKA7
         khd0NILSFpJWdrlzDAQpDfCUK3HTaGjX4K8SZkG2FEjSjMIu2bE/fE1VSjJu0XL95TSM
         X1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806256; x=1785411056;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vv6vUno4qgjTH+OYVVQNA1sqBXT8T8DDiSHLEOwcpLY=;
        b=jqkvIke4ucGFoJl7/0m2c2Sa0jU7aPQtTc0SU+jaLWGTxD5Jt7fcomoIDTzQmG70+8
         tH+SjfhQdrbGN9one87ipVlp/U5vjKqXK9tEDK1EyrzI7oATPUbVWYO2bgufbAuUEIWO
         rqnPGztSJAOxs+H6tBEjR4JtGMzLPLsNbDAq+Ko6Jr1w4pi0sPeZ/n21Ow/onCMIFGh0
         HleRlU+Y5+rbIuDqbKpXhOOaby6O1hnO3+WphJ5a4YSE6efRCE0VTHfKIWWj557FLkvJ
         DJP7V3s5pReHJjb7A33GdMRrqI4UVpqSaKOboniCNxQEXEcH3sqKBLh+ay/VPAkd5qZA
         F5ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWVPziKQieamFA1U/RRJQI8lIxVjkDdXaPZ/m+YqkQaXe2yv5ypZINn0cuZD5UxnWm2FRG3hbnQI9MZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2C4iu9Det/TrPljVh8SiZ7n/qfn3g+9RWgEp1DAYHg/23bzL5
	jS70lXLkL31k3BzfU4KTVquGe3wk8Bw+nT0uScIY+Ke+1hRdkl/9Is893wZynuGHC6A=
X-Gm-Gg: AR+sD13ry3576NflifPXyd1B75JSJ4YFmuWZcpiVofhWcgQdLCbWa5q8arbHREHFkoi
	6YKYmbxRn2m8kGnzI3eV5OJoRFTeGlYjm/472ayyZnF8SAoc69KSQXDdumkEFqn3WIWnNSZ/x2R
	0SFOZJT3LLbQ13eZxS22stqPfDg1HjzLAOrhtwpPoQOjHPh4qQwwRnFZpRI26gM/POn2Im58su6
	XLyMd5Z6P0ukefJsgo/33Iovn8J0WX0SCYOq1mwSoir7wUCWmdsDPQpYxC2LHVWsHv+dJm6o6wF
	RYVvXUQFs3lw2z8R3BH5TTXJOALAjoDb4QSNthFefLzIKuJbUeldq/nzC6F8moeop4TO4Br5laF
	2kOdSScqClKmmTSbWE/5w+WfLAI1UUT3WeR863ZIYywEFNXg2816g1Il3hj+IhLo7RcTLY3Wjri
	5Qj7Mfhyuxo3TIalW5iOr92FfSaIdBEgvSLzrnlLRyhOGvaQ+4bH4KIkbG
X-Received: by 2002:a05:651c:1993:b0:39c:67c4:4eb0 with SMTP id 38308e7fff4ca-39f15170d72mr136651fa.8.1784806256225;
        Thu, 23 Jul 2026 04:30:56 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68885a0sm9745521fa.3.2026.07.23.04.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:30:55 -0700 (PDT)
Message-ID: <d4dec9ad-0cd6-4666-bdb5-11daa00226c4@linaro.org>
Date: Thu, 23 Jul 2026 14:30:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
 <20260723110952.55597-2-johannes.goede@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260723110952.55597-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:09, Hans de Goede wrote:
> The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
> icc resource table and qcs8300_resources already uses the sa8775p resources
> for most things.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
