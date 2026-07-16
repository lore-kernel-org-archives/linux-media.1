Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360141E6CB
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206334; cv=none; b=UobrBUN5QVYTqEoTmPWy2J0nk0toxumg/FGCS8bG51btlK4+zH/3yzlx6XJR2+OcFHjv2hi/YAfh8PDLwXalnXgErmnNw22ZovzgtRGiXYYmw9ore/ZSbWGXTReX65u8KNyZkRf2DeX+lwinWCOiVOw78RvPB9PdjKhNkQHLt5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206334; c=relaxed/simple;
	bh=vAA8pxZ5/QO9WJwQ0ohnXcdfj+/EDTgsdWHMG8PbNak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC4DrcW7V/Atjx3XKA99L0svqPbhM0/2+mR6BY5WF785QaPR42B0HRmH92iyDzhZZSfOohihYGQZDJito4Gy5/mrT53RqL/WYyoOhF5uSEkQd5uZhbh2I8E7Rs0dn7f5RMQ7JhPDNlvtIpfvlq0lIpbIJIzllFDXGXeWsZOjFKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsWZshiS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsWZshiS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso4083862f8f.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784206331; x=1784811131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CL1+h+Sv7ciDTM5rA1EiT5WxOx+c/keG9qg756/bbt0=;
        b=PsWZshiSjWBZHHBj5BSL8W61Ht8s9oLWMvGafStEr1/tOZeOa6lWeg+2wsg2DSSHuW
         +AZTZ5uzuJb5RkoYARw2PL5xmBuG1UmPf9GX8QvxOKCA3pBtY8GQ+x/eyOk6cLpTavXz
         N3GTD4zZgVpSZ8AzxXCKmlAunxXmYR/DDIYSqgihyYEbc1wBIXAp45CvOFOyO7bKA6V/
         CYxxCv6hv8hcUJcJ0TyYRvmsMeEzqU1Ok63GIh/nrzy5rXoS4+9ZbopDkAxtlhroZeQs
         tRWCe1knq5C19+aA52QCp/GPNJgffgIluQP8/9gip9RaLlOv88dIVWluhJ5yWMTQQC6A
         5VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206331; x=1784811131;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CL1+h+Sv7ciDTM5rA1EiT5WxOx+c/keG9qg756/bbt0=;
        b=qmkW8G7TUMs6CcIRfeECYujgnluVWKKGlbCTRjwypEFnVeG21knyVYEm6xEMzAdqoR
         FJ4wao4+mfw7OMkLQPQL+RV9dMOOlIOwcQ/lMR57JXzNXxMI0zt2z3jPh+PoUpXphFBQ
         jUiaSXeaWvcK8lF1Xtb4QxPzsOEnGjNAge/jq14ieJi0SqAFLgoh9fsC8AFXk3riWdpG
         k3Q619juvhXtrsOBEuqrGpBTfhwhzg/GgJ7kM4262l2tnxqAWz+WoyWuqRsHqb+5C+4A
         tVCFH5Noo8Nw0+29YkT3dtIlazEPWCSLjQxfPK0zntsGusB2fgzBjTuCUcX9zIjQitxo
         jlwg==
X-Forwarded-Encrypted: i=1; AHgh+RpDzUNCXf5y7buwHcfhfUxw4pAAJ8KRb3ZfVfEibsu0owOK+TRUtPw2+HT1J6Asjv5LR6l5yEFBOllIhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvbgbABx2ExG/8I0JZkk3TUfWwztqU+is3Ft8JDfWNEwRILGQ
	qPBUIe0f0izsTCWxZ7X8srqTbfdZCkDWHfaBrnd99FIkZm6IWZYLQ5z8QvBdCrDwgUE=
X-Gm-Gg: AfdE7clFUoa8CkLjnUDQ46ERGXJRwC5Le9O/S6uYdm26gZRP604nqtibjHRf/qil8os
	WhLzrBoS2GmSo2S1qcWLB4hZj89nzGTgbFYEiZRyI4RpnVtCMiulKRtAjBKYZpWOjzveI8x4eMU
	My+lGelGG8f97O6yikK5YjOyq6tCk9s36E0IL5jKLCRe3E6TebgQnhV9kU0j5zGKIrKGs4rvDNz
	JWNeemvGL5cYyCWS433eROW4x7kia4PA574KMMLFkLAWLX46eggKSdgn3r2d283FDb+doAlHSgT
	9uAQYh6Oj8HS19IBJrWL9TMNPYMt9SZqlnv7DfN8+mvbqAXjXJAsG/BnZCdUkol5wyuoAEXhnr+
	79rUlkQRAYqvKWb4beE3tfFHkJ8Rs9BFr8na5K2Wg0urVVCOhujl88ONBWMyqTWQ5Rd0+My6crH
	j6dU3+bErkG/YR1Q==
X-Received: by 2002:a05:6000:4b19:b0:47f:56f7:7a57 with SMTP id ffacd0b85a97d-47f56f77d04mr3955700f8f.28.1784206331245;
        Thu, 16 Jul 2026 05:52:11 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.36.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm25433837f8f.22.2026.07.16.05.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:52:10 -0700 (PDT)
Message-ID: <c6015615-278b-4840-a79a-9c7520141341@linaro.org>
Date: Thu, 16 Jul 2026 13:52:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
 <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org>
 <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org>
 <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
 <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
 <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
 <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3U66hvi0iZrtRbyY3B-uwEap6xDFHFkVoaEBwWhV74Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2026 12:28, Loic Poulain wrote:
>> I just wonder if there's any real upside to all that additional work and
>> delay/churn.
> There is no really need to support runtime configuration as of now
> since we only support D-PHY, so the delta for v10*should* be tiny,
> either a bus-type sanity read in parse_routing(), or even nothing at
> DT parse and a future configure() branch when C-PHY lands.

Right, well I tend to agree that a runtime configure() is out of scope, 
so, I'm going to stick to Rob's guidance.

If you look at other upstream stuff you will see phy-cells = 0 for 
single mode PHYs and phy-cells = 1 for PHYs that can be in any mode.

Consumer configures the mode in DT like every other upstream MIPI CSI2 PHY.

---
bod
