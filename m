Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FB43F08F
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011881; cv=none; b=AlXKp21liDeLR0JU7zt54EgD3J5y3/lAJjB1lEEq11z0mcXsER+u7OwxX90LYQ+Cj4ahX2d0MlIU3rJeTotYA5cywTtSl/a6U5C312kwel202wGGnDqlXVtKUCtxAHN4SOPO01HUMpObEnsa7uqMYL1twSMVX21Io/gAn6sLWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011881; c=relaxed/simple;
	bh=Y/BfzcHBW1+/hTfe8NWTi/nlFyz3lih/XK9O4ky6nXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ0DvKDPbAXu8aB6qg/yK1c4t1ArSaGntD1+bA+Bc/zPkYpgZfTdD2CTjgVUO1B+zt6lGEjhe674+LH1eRC6jWZaNxgsOK9RCJ3zgbDAAi4IK4bB01BW3fJAg0LQpdd0sVmxmNNzrXIh47mE0c2/dhuTa+Qg2r2LMzJp+oOJf+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJX5unF+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJX5unF+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe377a217so1345203f8f.1
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786011878; x=1786616678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ufo/CJ3ncCi7FHgGFSyE4mS7SJGms4hMqbby60EAfSo=;
        b=vJX5unF+o+L9Usnc99MdKQh4Zsp+lQ4ru1UyOoK98FsV0FqMmqf5gFqv5h+bYV5F2K
         GDVnM2uu7CPu9Dlx8iBfbun2T3G3Y8sBWdifVWM+bics8QewLZ16Hgyg1G11sSdzi9QF
         ZxVsyQ3Cqbs29GuftgkjO3PC+ZaqhvztBrWhw8LC5drldcQzE06EBWktd2lGKlrQfp7E
         hWhuNtRBB3eP0dahzW7VgdGNFpkGW8f/2b6dOMlXqnjYWdpvJzCSiFBw3n99xnc9mxB5
         ZQZv8z/HDFJVWoS2hxL9r1w2dyj7yf3M1heYh1rYPfEjoJBmQIFmAfq4OPkw9M3V5v4s
         scEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011878; x=1786616678;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ufo/CJ3ncCi7FHgGFSyE4mS7SJGms4hMqbby60EAfSo=;
        b=WphaBnds6Dma3jr7KCff7P0hWD8qbMfuopUZPlqLgtHCNjXSlYDdVovPiWy/VYAyRo
         nKoXO5l++GIIKTci0SrlQoHRi1ANZjafiPJnj4pV36G91k7k/Uv655N24Q0h0xRtASz7
         vu1D9FzPHYYVXKxu+oDqADk+VCg4+ITeRIy7Vmw1rAV3aRrskkQuwJiUvywSXX8oWnzy
         +mK7Ba32SJb3BAGTjwyZqaGkt48WiZ3DdCvYCnjcmBNNsUof14Kp3Sn9ZrUTF9XlgRUs
         XDuJUOWexfgjJCdLlT5KxZXr4k4ETQ+nkGL1k5Pp6XkF3MXf59kn8a4jPiQNqXUrCaBL
         4ONw==
X-Gm-Message-State: AOJu0YxNRaLT8FqyGKJd20z0QaZqRtRfx/GyKQQ7gcFyxUQTeffbZIz3
	xH0CZI00BmXkGtIgS/GxQpUzjSYNwtjeSBB0l1BexzIw3XjilQsx1Lwe1Lwv2tt5Td8=
X-Gm-Gg: AR+sD10EW9u9/wwMNloRuilwkSleiaEWlgrrHuTIiZ1dPT6zL/SMLQTEj/e1qkXEZHG
	G0lKDKBiWxTXuVxQGgXUE66upvO3395QTSyo5oDbcxXUhiuQvDkQQS6K7SinjL4TcAZmGHceDPS
	6rzynGRPJ7bFdy3EMkJLm0Zj66CI8KH6XMVu6w2MtHF83YCoUIkRZySFjbYnGha3sriecHF1CCy
	wfFw0cY7jApzfwtlwRez+ddR4kpYfnuBtQDZ9OtN3EMz/LOQNaMUMSFINB+nzV/IdPw49zYzBYs
	0NUpS+vbxsVuzi5UcTWz6oBccit25GAWyD6SBKCOuwlUQ3LVNVYSpOVGcvcDoV1eG8TpzwDmVWg
	svAMrgy5tWXr9e0L5qRnRot8DmcAIdjivW9RBWikJNIJOYe4dWG4CxZzs7La4lqVB9Wr96SSQcM
	sR27iakmJxpCe4AXgnd9o1ZqoVRZskQTC5KmLRLh+Hpywh0c2ZMaIjX9YdzwdUTgxtu7JHbrRQh
	A==
X-Received: by 2002:a5d:6a4e:0:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fec4edc2amr17986324f8f.8.1786011878436;
        Thu, 06 Aug 2026 03:24:38 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b250cfsm5060906f8f.28.2026.08.06.03.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:24:38 -0700 (PDT)
Message-ID: <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
Date: Thu, 6 Aug 2026 11:24:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
 Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <futJwsC0VjGSkjrB5PP9T0jBOVgWADaDAYyRRp-OZifaKPNtjcnnA59QJaQTdqYTeayZk9jY6e1jOfun71Yp5Q==@protonmail.internalid>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <689580d1-8169-41cf-a954-927e10135700@kernel.org>
 <d0983bf7-a708-46ff-9f86-f94fb6a92ba7@oss.qualcomm.com>
 <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2026 11:14, Krzysztof Kozlowski wrote:
> On 06/08/2026 12:07, Bryan O'Donoghue wrote:
>> I tend to think - absent an obvious an immediately applicable fix these
>> two drivers must be marked BROKEN, the alternative is to apply Daniel's
>> fix and then live with the results for the bindings.
>>
>> Since the DT schema change is still under debate - what alternative is
>> there ?
>>
>> I'm not far off sending that patch now myself because I'm not seeing
>> urgency on fixing this and TBH that's pissing me off.
>>
>> As a user of a system, I expect resonsible and honest behaviour wrt to
>> bugs, not architecture astronauty while my system can still reset
>> despite perfectly functional fixes being available.
>>
>> Great you want to do sub-nodes in DT. Not great, that's not agreed yet,
>> even more not great - the venus stuff isn't even on the list.
>>
>> Please indicate what should be done for -stable this week else both of
>> these drivers need to be marked BROKEN.
> 
> Nothing should be done for stable. Or rather: you can do whatever you
> wish for the stable, because we discuss here mainline, not stable kernel.
> 
> There is no problem here "devices running stable kernel are affected"
> which we are solving.
> 
> The only problem we are solving is "devices running mainline kernel are
> affected". Fix this one and stable will follow.
> 
> Best regards,
> Krzysztof

Yes -master.

My issue is how long this will take. Several kernel cycles and the 
debate is ongoing.

Daneil's fix has not been applied which means the replicable system bug 
is out there in the wild, not addressed.

Daniel's fix could have been applied and rolled out to all users in 
mainline and consequently stable.

Instead another architectural level fix is still under discussion, which 
is of no value to end users whose systems can reset in the meantime.

Its just not responsible behaviour. So I feel both of these drivers need 
to be marked as BROKEN unless/until a fix lands.

I'm hoping the vidc team will come up with something else.

---
bod
