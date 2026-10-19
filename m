Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA14BB28A
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405452; cv=none; b=TpsRkoDioYlJIyhz1/9UBh+rEZtUNil99Ce5YLJu9fv82MybgsGmRHK5cepBo4VDJhBUgUuRXTwhJPtvn5W3KzOjCK18JCmVFtMpjRCwH5vt62Fx+4kLFp9FESMMCchuSqBOR5yt3A6DfZ8IAilvaeT4w+SWFU4hi163ikFvd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405452; c=relaxed/simple;
	bh=hwq6n3lMri6f0tS9cV1XHP1OuBW9AhFJjSclegmlXgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i863dpbvB4vVUP1XTb5RPpRc5xgCiyKQz8tZJXzGfaigidZRq2KtptiYooI7LyKwzlWhWkXAL6stMsoC1y6IqgK7LSbw3yWmO1BIY+9jW5bXse8pxVbN1SpM2Zy5pLLeZu2BgMRBmIsaT7E4S5riahLTqVAZvUjD7CRzEwIZ1HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uR5KCq9G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uR5KCq9G"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17021385e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792405450; x=1793010250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=uR5KCq9G1RH2lqdq1UlEEcHMbz43vLpROotfjGGvjHIDuEgPeKnq9RwDQkivZgKNDC
         Sq8X4Dn0cwH/Fzh6/IyF7NW1gFENktFgycejmzj9AtTaJvnIjTq99B4cAaQS8FOClx2j
         5+X7V0t6CZUfaKMZhkVIc1heItesw9YQrMEOJIBjF3OvJKDBnQliRsZIYFyGKZhK/JPz
         YYBgX8rwsRXcwPek+NvYVQ7CL6mddfqKlEC+EBwZM//qlagqzpHlBqs8cMyd5JTzhgR2
         5vFHodufphnwbuzChUTSKU6jrJ3dBAwiRKZr/oogHRYoVcQpY1pPNfJ+3t5rhvJW2UTg
         Skjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405450; x=1793010250;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQPRCU8mulrVTcYx+mtCokl0uJBA6jXozBw1EvQlJfk=;
        b=xDo1xdGn0rDfL3nJVfbW++OJkDFPy2Uc9KpbcyI3nqI9G1N4YNZAsuRyXxjDtrrrIy
         AcYc2C+naJE3BCpbEBRf7RwuEWYRDG5hzhefwGOIDXxLevGb9M+7ofibmmeK9DxTi8gn
         tTZrPuQ5j6JwDu8k4U5PzQEKtcC6SNJ4Ra6Fqb9h1QfN+nkKyeQi6JGi88+3N8OMm2Kh
         xBwVGmEYAN6M3QkMx7ujzqUJ2dAfDf75b0W3LcEokNhhLXME0nLtX3llUtYvniXDgngn
         +M4a32KLz3K6r35wzW2s4Jq2KXJ2LdZnHXb34U6l58orxIa1gAYIg/hmrWdBM2pqGiBO
         Ko7w==
X-Forwarded-Encrypted: i=1; AKwUvBw5mjxoz6ppf2D339mfNrsFUZJR+ghYddSLWWgzBuqK9Feje0xnLpVZnp7Tcaw3gbjwqumh4vxVIu0kDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Ros/gjDpOaNCAVZvUHxiJpS/U8HEkoCE1ql5Vun5VU80Ca6S
	W9otPe5M8pMzoL2bihmzEIDAU0D70fT/yFjxXYtCdWNil530qS2JnARBeRk22H59eWc=
X-Gm-Gg: AYBFou0BByIQ+sz8M8DPcAvQcYveJN5AF+4gCwkIq7bmVhPC5oneqTNcEywwa4VWvTP
	O8cvbY/wWYvQFF7OeGx4zP4F9dr6sA1doaX5fNuOKqVnmeFN5WyQ83uOV0ERgxbtOOpMTO/VeUB
	+XeQ5dzKKiDDe7zMzElj42Xsjwl4H/dnFMd81tcxOD6LwQIj8mdG0HrhFO3+mF8+NjLHfJ/AEt9
	cAvkIgsTW5eKVtiMh+Wc+BR2VPlOKMlBYG4HlSmbAkDY2LUCgxOU1A7nqAtq21z9UAK1ZQ7afiI
	kids6LxHXHYPgdPc5egOAtKZW2w1Xp4fdpe8l7AlmQ2K3DmHJoCPJihyzjaftoh9CIJPKbCFiTK
	qnrfa3jN/fEN0clBvsb7SSTDsKt12p6HxKAbYTw6LlBUeJDUbo1YIuyJCerxuUi0r91PxMRM1o/
	XUfFkl5MyuI7nbGb19vFHR6BxVUMLUKIhe+EE05Zg2JOUt7eQ6kAdHt/5oR0V10eiWur1cc9dFS
	ewExRmoSIgT9LO/KNG1YA==
X-Received: by 2002:a05:600c:4e50:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a1d7600190mr157794965e9.11.1792405449821;
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.252.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm187781085e9.0.2026.10.19.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:24:09 -0700 (PDT)
Message-ID: <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
Date: Mon, 19 Oct 2026 11:24:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>> +    unsigned int        lanes;
> 
> This statement and how you go about using the data aren't consistent.

Re-reading this.

unsigned int trios; would be fine too => data_lanes and lane_polarities 
is a multiple of trios - always three - does it imply that the first 
three entries in data-lanes == the first trio ?

Presumably.

That would work too.

data-lanes = <4 5 6 1 2 3>;

=>

trios = 2

=>

data_lanes[4, 5, 6, 1, 2, 3];

trio[0]:lanes == [4, 5, 6];
trio[1]:lanes == [1, 2, 3];

Probably "trios" instead of "lanes" makes more sense here and the driver 
just always validates that count(data_lanes) % 3 is always false.

---
bod
