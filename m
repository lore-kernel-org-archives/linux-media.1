Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31703CB56B
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355073; cv=none; b=Ol9fnoz3BcUzVHzw/gbgCMepeubAB/ILy60D7CCNj9LUKF184GbmN6wb289BQlUH9FWTdPnsjb8MuCC9uqt7pVPitQ2oSUd3Eifl35NXLt6jiWHHRgUpIYbGuRbsXblfJ+u5KFsbHYQIh97bEJEt8PVvFVeDl7xf/V7lwcffgaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355073; c=relaxed/simple;
	bh=jbGSyWqJyLohTYmCLKvB730dHsQBMDNbc5XkanPK7/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2+WWicic/AiNhiPSUptGCsmJ073C8YT9HGAsu9wL61bWsfa8sGgwh9F8G4xHVJ6OOR/LksTAARIykSq2kSL30/7en72ufTdvPrLBjT8yGwUeR1y6TwpTnhamY0hFHK5i59HHT2qn8qNsO6ymb8OE7LoWiReUpoQkLZNV05Iqqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8zbIz3e; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8zbIz3e"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b014810feeso170711e87.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785355068; x=1785959868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LE8yxChc+WSkATkEhDd8gBfNPkNIzWWJVjtjI5ufJCo=;
        b=a8zbIz3e5YssqPIFskmSJFHAlHwnDJILzX0FZOsqLNOgP4KKGys/2ZuOLm7uFyfuyl
         8lHJgWtilFvmU/VltwU82KxyX8+yOFeOs0HOJubkGKRU02UduNgfK/xtY6fLXvjJbPtN
         lkxRIpVJuh5hbm3+WeQt3up/zZ87pcsdjg649ieYkU/0AXdeGSjjwMkSOFPplLm18VqC
         r3gxuwi/s8Swme5HMcc97NVjy8PJiVoNJQlPFkz+YVMx6KCiQMNtYgaZMkYcoZSodvgo
         FLcYyo4f1CBIaRruD23D/wp5UAKSv+0wmaJIiGba8T1AcTtZjNV5BReCkkrW0l5ZWN0r
         CKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785355068; x=1785959868;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LE8yxChc+WSkATkEhDd8gBfNPkNIzWWJVjtjI5ufJCo=;
        b=L3n5SlKOj7LnTlQaVMHkEjgUgpkPK6BbPZwVnG1Xrvu5IxvWHALi575uWpK+lTSmlp
         H1kBLVONr3Jmgw1wmux/A27LIa3S5D3AXjq0YsZeucRTTu6i/3LMSxbZSNZbBUlGpvok
         4nzKmM0kxFh6UxQIFWaT7S0hHGLXzRiQa6EdnNvppwDGpH8jeEC5b8x/NXmPKbqAn1XS
         AaFSOuuQQQN7h2Kn3O+rc+hUmePVtED6WpLtAJ2f/eTJj/i5dUTf908UoOg9BI2KZbK3
         btW2b4H/ytVlhK6cJxhObtGAdU9h3j5fGEqvGNSJGBxnt+BRB6AF5sOwzHzhSeUB9l/n
         8Zdg==
X-Forwarded-Encrypted: i=1; AHgh+RqY3XZxYfMxaUbg5kMxCqCABaFy+wGIuZ+fMCq2BaekJu3uFvqLEww+GyxlO99LqESv02mh3ZIdTEUjMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsy6XPAt+dlKlGh68uQWpX6Uz0gfWguNhl7Wi5BGWgpkX1+qox
	7xaWgBfi3APS3iUIF88CWVDJrmJfBnUDXQ1skhWc/V1b9LDnlq7A3dY94Ie+zjo4kYc=
X-Gm-Gg: AR+sD11jE09Z5EPjIgggDj//TtO32N/yDByORKzgGcoSB0cMUI8L2pn7ZquINOedU2c
	GYKp7kAGp0tfVFdcgTEGLvaw2Q9ZpWrfP8Casqb8weMugy1mw4HBqYoJCNUPW0OwGJBzbfY6ybJ
	U8idzXJJg20JzsDVkQ2sdm9TYndDU1IwARD5PnISRasyUh3LjeO1cIL6fd07MM0bSalMgzpIKk4
	jp2z1uYGlt5vvJG0dGS9FBkZTt2qLItU7aFmdyBzy98677tf5nSMj4Np/ALo37iiqfah0srJwhH
	nngCTniuIrss/TCem8N+JKVDhZdZD0YKTy54Hp80L9ygu2SGXIjmzbPgKT6cEsU0zpD1mKwDxFp
	xyH5/qEDekstR9iXUe3JuarQPx4VrcdnWdBCIznLP44dfm5ntw2DlVk4tKXN64H5XgLBxV98DIr
	y+1a9ItEpYTv0tCWhP04gQYMbFTpj+AWLjj1lWxLegC9l9kEWHAgRRJz3WB7Z/xPhnVs07NLnXH
	K07BcExkUnIJ/m67N5xKVhM4Lo+NlJBvN9l8QkN76GjhXj3VEa+EA==
X-Received: by 2002:a05:6512:2250:b0:5b1:5e89:30f6 with SMTP id 2adb3069b0e04-5b2da4cfa64mr16335e87.3.1785355068442;
        Wed, 29 Jul 2026 12:57:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d78ea812sm572610e87.43.2026.07.29.12.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 12:57:47 -0700 (PDT)
Message-ID: <99ffd9e6-f47b-45cc-a039-d8cd5dacc28c@linaro.org>
Date: Wed, 29 Jul 2026 22:57:47 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
 <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
 <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 23:06, Bryan O'Donoghue wrote:
> On 27/07/2026 21:03, Vladimir Zapolskiy wrote:
>>> +                description:
>>> +                  Logical lane indices 0-3, not physical pad positions.
>>
>> In hardware description it's physical data lane indexes, the same is
>> said in
>> video-interfaces.yaml documentation, the numeration starting from zero is
>> selected to follow even bits in CSI_COMMON_CTRL5 register (D-PHY mode):
>>
>> * https://lore.kernel.org/
>> all/59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com/
> 
> I'm not sure what you're asking for here - this exact text ?
> 

Returning to the description of 'data-lanes' property:

> Logical lane indices 0-3, not physical pad positions.

Logical lane index is the same as a position of a physical lane index in
the 'data-lanes' array, this array data cannot be "logical lane indices".

A valid description is found in video-interfaces.yaml: "An array of
physical  data lane indexes". So, it should be an array, and specifically
an array of physical data lane indices, this contradicts to the given
description for CSIPHY.

Here the open question is how physical lanes of CSIPHY are numerated, this
requires a verbose comment. For instance Qualcomm CSIPHY configured in D-PHY
combo mode (two sensors attached) has 2 or 3 data lanes and 2 clock lanes,
for such and other cases a 'data-lanes' property description should be clear
and unambiguous to allow a valid configuration to be provided.

-- 
Best wishes,
Vladimir
