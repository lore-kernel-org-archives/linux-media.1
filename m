Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA34F68D2
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970688; cv=none; b=gKMNjwsZhZkNHifL2JdPxSRSdUWA9G/9R1guH2ZaFXPWsnseC8OBaXWlrbXthX1TlkfhswGdxTYVUZmzBqxAeZnF1D3cVI7m05YOC1bl0a0LjdlxmHdmlEIFqz/n4Al7p4Au9LQw4omlWF6ZHBN3DBqWzfbQL4+zxLBxwDseul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970688; c=relaxed/simple;
	bh=JAZDEVVWBpCzIsROIvJ7aOp+s0L8O8CrbhuQdamS+9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A844MPYkMsNUg7VEc2EePZOqpBrjyOErm93ARSxgNfKVDA7RipFpwrd1GATJAahO5z+V2+w8Fhg5eFRJKCNQM8kICCTX8VDInPF6Hk7I4P1xmELM9Lbn1aCegLGEn+ubtGSipemt7301/5lxCUiLaVSbIRke3JdMVYvAkZIyo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9TLTe3L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9TLTe3L"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso21408755e9.3
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970681; x=1792575481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=D9TLTe3LV0X5U6WrodIJZ4Js9dABg9SPiO5halhg4sMS7y5xRqIJi15y/LSCfW/gff
         3PPz0AbVI8KlZQMI+JMJ0zom3Z184cvYzFHfbRWzVs9fuw3xO47o+Fp/XoJq/BLEWRa8
         GuhozyslteyFWi0slZ1rKsak4hUUaOGJTEdFluoNTO/4Yl+p3OYnm4dkMI/5HKoc+0qY
         El/6gNKTJY3hyOBZIoIiE7jZvHXsvu7fHJVmHWedsjwzyI5M0+WRIVkGmvBDHLuUw78N
         www8t0s04MAsGaGS+3oYPfFZwAZYYVBrW1XTiLUN6m23lwL9Tp+7Zkf6AAPHK1hOBCFK
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970681; x=1792575481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=HygD+wl/6c5XRkRxodifLaXkr0jK6vsZG5zP4EH5OuSJxpFevBLqXJdLdQ9/xVUegp
         TVsQ35ZTPycRo6PXpLi/kE+zzeQ3pR4fnwq/RS5Lk6pEG/ReB7dZz+crA1cqJt4edgOn
         LmtGRVJyIJTEhQPZChELh4Dxxv3ltlJ2N1O83Pdf44htvwcENfymX24QPBvCRgh5X5xP
         sWSUi57zsu6VZH+mXpDabZAcV2/uMQmQwU7PRh6j+pmMPNYG/wIhfEEd3dLci4bq8Se7
         R2+UiuslaUees0yUFcPVmLaSMz1GYh6Wmo4Z9LweMtNnDTQMkqXEct999DTplb4WTQwy
         7xlw==
X-Forwarded-Encrypted: i=1; AKwUvBxACKOTDpfUvCrwHfL2LbVuuM6eAFOnOFPeD5PGT417NtRnQP2K89sNJohgibmyniSRKh4m8KouiaggPA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJAEfAKgsR/2zrOJDvcq4voJGbp2AqlgWrxDyBMEqU0xG3cBRBd
	RbWdu3OvrVYTqlAQ2PFOPx02S0kkdAfogyMOvqfByhW5VU9EehJvpl1fkicyMCa9OYQ=
X-Gm-Gg: AYBFou0RArF0xT/NGIDs0cSICeJACrBLtZ4lUBdE2lG+jySmjVP8uhQ2oYaYLUJWubE
	6op1Ph3n1V7iGPDBLCLV81bfvZNVVpQncksFSQhe+5BsZ+bKO+Vfs7O3xVwaqyPwSl+ZYFIpfrL
	Q9rVSypyQUSrQ3BKs5e3jUj1NCIdTLKfQvClyq+u//ZuOyy5To1Wpd/C9yn3gl/gSQZ5abvSXbe
	ukGUVSFIgTqYe/SKiqlcUzWHxugtYsVotFB68nZOWeWnnJJhApZq7gu89nNFUyvIHqFTcSpl0zu
	ArfX7j/sXUqKhW/Xxlhjr8sWNINCu9VC3+zOpPT37WQhPWr3/IJKJZFleykvxrbWPBKwLEkTFkq
	tRHxQze7eCTmC9DzsETaGGNsR08cxl04pg0Na+XPaBrMM2WEw4FA7wQpSO5BGDnt4ALHZiDuJop
	LCUiH+3haq3eEP7EaLzbiU8L8uPBLRDG0wObeZJFnWyXmDx+Fk8mm1mwnAug65g759gA2ovLkot
	bLhWeOACpn8
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr299229875e9.23.1791970680941;
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm6026436f8f.29.2026.10.14.02.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Message-ID: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Date: Wed, 14 Oct 2026 10:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +
> +  iommus:
> +    maxItems: 1

Just the one iommu entry ?

Please:

- Make sure its just the one
- Include a comment to name the one in this file

---
bod
