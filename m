Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39C52459CF
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358858; cv=none; b=a2FK/FvB0OdDNSLtSdWbDOuJnyo1mDC+Mcyw7GBlgbGmmvR+P8Pbmyhjoryd4DGLDJMF/qkDTBtwWOcZh2PATWb4UytEDOow87KeYN/fRS0NQlr632vpVpQTxRNot6UablzrZciymaSgv06YP/jDUVrhTiGUEoK1+LwacxZdGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358858; c=relaxed/simple;
	bh=1CZuCyQ4F7gIhJWlCZS7gOU94W9dFudind/rqbdZLnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6+wDkubF74E1JW6pMp+l7GSHzke1Pangb8XJxajQ/mlQhR6TXwy1ACy2oIP5oY/Joino8nzmSpcEKhblHuTZT6WHnFrguBi+E81XvUBGYgAsdoCDffY9poie7D8GXArHLmTevwJHU0vwNkVEfhFqVwaGs8DxpPyQviMDlTD/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbhw+e6Y; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbhw+e6Y"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so87544641fa.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358855; x=1776963655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=mbhw+e6YOzTXs0axvtFDK2+Shs5RZqoVEKCp4AiAgq+9DwRWx/afofi2IMKkEHUZCt
         /v8DyZQ0NndvOt7baJCgUpaykGAuB7kSdhZ1em53Xy3V9QL1HrIjJz4VtQ3NksC87EkX
         +k8GJ/l9vB9wD/9PVjyIxaONFjDDNBWg98iLXqHMRHZjF5FXAARbcwn1fCfj7Jpc5zGo
         oK0REA0bewgZPuWYwIGYuA1msjcWuilTOCxj/F7TRN4jYV5mJwosrU+LnIloky3GzBSu
         ZvbfgfFAfo8BTJ6UQag0K3iJQnhEwEjpiqFrE0WEoTYVztEZLi8tnTgoF2IqZw+bJH2d
         Bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358855; x=1776963655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=RAiRjqB0QlOev207GcvqOoKhZleiXTT7qUIv14+2xm8uXuFmCV5iu+mwfDp/105dKM
         gNPp/eezOV0nuttNsVUZbxnfDOP70YsKc8/vuWKu3euke7xubGJqTIAS/8jt7oOEIJhP
         9/lXw80rji5sri8ouYEfdgPR+O+b2dkj2K4kSoDZtDkVqdYOsd3TETBUfiLLy3Nnye7b
         q+zaHwDV8gI6ABOLsWZxPzvnvm0HkFlyVlHCosVHg2QeGUffnDSTAqeVqehwNOoKXffk
         7DIiAKvWUlGA4D9HXn2gGIZttDe7jw5txVC9Sd3bQFLPLg8p+RAKph86luHjTMspeSwq
         WD1g==
X-Gm-Message-State: AOJu0YxaqeBKD5jJokPhhTnwpk+CakqICCtxfFcPbRe4Udt3XBchfsQG
	Jnq1qoU6ZWs/knFAgJTUP1899eYZKQN/uvZMp52u6ul6Rb4pxy4OsNlV
X-Gm-Gg: AeBDieuz59XYJHsQKpVenSJLIrsbTQjRcZYkbLYSgtI5OPzxSZQzchN7y+mY9iOYsS4
	lwH+z22ya4FKd9IcQ8YcxCqI8tx0fmK7qZ9Qm1Y8c3GfRFWPAGTqlGaBBCtQHrCdxOmAOzHdeur
	rdE5SieWRRnUxqllDVFfXBH2VbaEUAr1DNIyrQuXLj3BAYpiQII3IlgQEGjZksk5odwDz985iKU
	+r0AbiOgGeqYdeWdJFZ9CYHQIH/eMXUF/Vt315f1SBRSGbkEyaFjVAhHs2+F3aABmpnkklQf63k
	E/hbwOyWg0DfttL4XjrTgtq1ZtwPpkyHmCCzrkgxCXb0PI/hVfeqJtJfJNeVOuBJ7szn7Kvux40
	t90ii00tE9mRkKcTH+WrlwUBAyxpqXSzP74JzgTZoxV2vB9YY4yspb+CQI9Oam7XckxXTuo1AVH
	VXgcfFp1oGekcfgrgD55NdszOb9ByjZJvBVzSsjntvPzv1b2qE8P1dbUKmIDPlFDpzhUnwXGN7S
	S0=
X-Received: by 2002:a05:6512:3405:b0:5a3:fe5e:3d5f with SMTP id 2adb3069b0e04-5a415540f62mr51697e87.20.1776358854697;
        Thu, 16 Apr 2026 10:00:54 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272e14sm1416433e87.3.2026.04.16.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 10:00:53 -0700 (PDT)
Message-ID: <6b8f767b-98c3-4e31-beb3-20988f764359@gmail.com>
Date: Thu, 16 Apr 2026 20:00:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>>    now, it does not work. It can be enabled, however, it will result in
>>    breakage of Venus for faulty MSM8916 firmwares, because the code
>>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>>    this would break support for some MSM8916 devices. What could be the
>>    best way to work around this?
> 
> if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?
> 
> Also, you mentioned HEVC *de*coding, while the commit you pointed to
> disables *en*coding (decoding had been already disabled prior to that
> commit)
> 
> Konrad

From the commit message I assumed HEVC decoding had already been
disabled for the same reasons encoding was - faulty firmware reporting
codecs it doesn't actually support.
