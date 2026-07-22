Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2543C7DB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757790; cv=none; b=dkHRP46d3s0BTC0FAwEjl5B7lSsp/oaJ40bASv88P/yjL83Z6b3feQFzFoHS4StZBSqaHp1q4FhPx5nMfg390jFdYnrsPMDqm496BZm3Y5cW1XVEizpWdrmLX1NP/NTYEMKST3wkAmcI+nzR11bAEhgXuodOe63yxCzHjS8/Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757790; c=relaxed/simple;
	bh=E0N6ejwofGQZKUI5IG7AIORG61v+GVYT9YvB2dlakvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZclCHBLWNapjTyEpWaQs57CHtSIPpyd1qO7awfV4SZZ3YHKxCSJX49cK2fDyWIlgb/WFQS/ooG+kQZwAlbyPIpY8mI3awjhkYhiXbvaY4TceokzgYV7mjeFMog7dtgQFkmdtk4jWl4UaIJNkL06jzNFU1wV0iKKSBDzrRr9uhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pufwH+y9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pufwH+y9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495590dde14so67185e9.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 15:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784757787; x=1785362587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMMeAthFG9QEamm+yIE9z4ykTfRpuhgtov8CzjPdbNM=;
        b=pufwH+y9BeOz38C3r8jNtZNoSW2a9HeNhw9YQPcNPTQxhYiGNqK85bhauNENipfslX
         QyWQYrpuwV3ag9nHvpBOz8rNSwcRJp78QxY/wVK3z49U1j79T1gvMm5WFKopAzOQcKv3
         5IVyx74FRqiLDk/rBPSienAQei4+tlP9sqr4/JfpORYe1mt8gPHA1wbJN8etr5CD6pKx
         YnfW3tMPLYoVSGgoxoQ38X+760qs49i2KJn7B1xS1eoHcG6OVf7ZD5KMNkHRwikBJg3O
         uIR+dzv/BXmCvJ3r1vO1kOk2STBjX2uDQZ2vbn9WagB2V16Lpb7xklufE81GiBQNXW1j
         sT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757787; x=1785362587;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMMeAthFG9QEamm+yIE9z4ykTfRpuhgtov8CzjPdbNM=;
        b=o+7eiYnqBANMBjM1W7uqg4liBvsABLw9W0mgiEyWxI3/1tgEXBWdarZ5JcSnMZNUju
         bUh2LxybdA8KRSoVQkle9b5wXZYwbXnBQPOnVDp8Pb4yUOEopN3cWaQp+8up9SBDUqdb
         x7Bq1/sW1ajylsf9KwcNNmBwlvL87q+Rw3BB4HYHhrpGXwB7GfIrdvZZ95Dsx/hW3aGr
         jiOFVWgXmpNS4C1KeFFvtDltZILmjOTcUarolbD1UGrEMx9CfRugl7r/2Dd0IbRyShX8
         n5fEytj4wwolmPDqqDvCRNKzPPRucmFvXyrp5oRjd59p/8v97l5plRz2mj7cWHExRkFa
         f+pQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF+eXhtZXFyUHlNkJlyjkGqamgAm+TqFI1QIsFF5WJVlshuZMlXd+LkfxSjohxq874vn/Mx0hUM+saOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhaJd26zqr8K3Bu9s9DcXQjHVyMwKgBCzF/O3YnvkEAN52aWn0
	XKiZLFVTj+vCiaTvERQn8BK8fYtx5kZw5RjE3A+lpEzr3zGu+gIqRuOXxMx2XohkD5Y=
X-Gm-Gg: AR+sD13xLn4LNt+YLTKhomewecil+8/hC2mWvtckIJwbx/5ywe7ImbJMsNbDW0w3q8/
	pcwrCu6E3PUzqHM31tGcqv1Zh4BZbzb0pppbgRbvvLnjszitmCiQBc376JtRD5akG8PoUzSjwYM
	A35LypXf/noD7UcdDOBLLttjhL7E32lvDl+pfF1nGNPha8GZ8R/0m0qabw0ROBGDF/xY9f5wGVA
	Xm2mWR/wyfrIR9gPL4eMbG7H85C1zSP7tE1cZH5TkgqJAh7pj0mTPuJAwYGBPMzfRkyqjmSaRtx
	pNJcSJQ4kH/1VLkWrHW3GtZgg9KKSZ2Ad/kg/yr5NcsnvlNAU2fPNBXbLWjfaAbgACReDtbPeAM
	huLdm6nBdxO0o6QfDKOmvrAhBFsDo0SPWnSsTrxOjI612HaCopKVOYLZmr4g/5POk++SYAeBLRM
	3VOeGL3iQ+VFzeIA==
X-Received: by 2002:a05:600c:1989:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-49573cc7cdbmr4456425e9.15.1784757787192;
        Wed, 22 Jul 2026 15:03:07 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm8969357f8f.5.2026.07.22.15.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 15:03:06 -0700 (PDT)
Message-ID: <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
Date: Wed, 22 Jul 2026 23:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 14:41, Vikash Garodia wrote:
> Update the memory-region property to support two regions:
> 1. Firmware-loaded codec carveout (existing)
> 2. IOMMU IOVA reservation region (new)
> 
> The IOMMU IOVA reservation region is required to restrict usage of
> specific IOVA memory range. For example, VPU restricts usage of 600MB
> for specific streams, which could otherwise lead to device crash. This
> change allows platforms to define separate memory regions for codec
> carveout and IOVA restrictions.
> This schema update supports existing DTS having single memory-region,
> thereby allowing gradual migration of DTS to support two memory region.
> 
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> ---

I'm not mega-happy with this pattern being used - I prefer the pixel 
pixel_cb sub-node model you've proposed yourself.

OTOH you're the maintainer so its really up to you how you want to 
arbitrate this - the 600MB constraint will work even if its not pretty 
or the best thing (tm).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
