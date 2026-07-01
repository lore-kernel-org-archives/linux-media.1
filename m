Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41840C5D4
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 23:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949083; cv=none; b=Q/AVye+vy+oWTk96rY5JipJsV0Iai/2yLwwCoJgHTpkcN1W98Go58ElIcqeSoglrDHwG5MgEkSZQel/5yB/vMVmZTXGc87O9ZQYLxCaI9URm+G0rSzZwC2HvYBlOpToaTyWAXC3l217t8QPUOcm9/0S/TzE0dc3Qwu3Ul/tPXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949083; c=relaxed/simple;
	bh=Ul+8pa7VUBwqQ9vUFj7cuT/cSE751FIa+VX8ioXeBlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqnNGNV5fdFs/Ro+3sUPf95pNOutXRDi4oPJ6AyQFYMMwXNuCmQpDAeb+5ZqcQlt3GBb9CcjapKLk/MSWRarlNRsA19h5zNDa6BrVtSCiMBrX98DvBV1uJH87pUBAcZTHDENa1lB9vr5iAtRyS4uVWQzq5IhwTDxnMXFISWv+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=au6dbQ19; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="au6dbQ19"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so223091e87.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 16:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782949080; x=1783553880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=au6dbQ19ocDmFW8BHJn9lEOMKFQxa57yUbSs2zRJi99wQw+wZvrKCbkurmaCo1z6ba
         QqM2NXH4gWIXH+y1SspK8t40P1Q3TSZVDI/a69Lwf0KUdbQMnQBnZ9pkPaEQ0lCDYBrx
         14+O5E19dxpdNBt2Fi2znI4X9LzOa6UX6FgZKAO8B/l0GcqH+RzLAs6PGLJ9a6CTr9j5
         O11S5Bx7XBBec1iTqvBjlrAJHz4STwdd5cWuvF3505igPFahuo2K6LYpBaWIT8X0BQJU
         nDtmRGDQ+9IkksZVfVem2NBE23modaHpD8AmkTAi5DQcbyiypS/zQ1zp7dgHVK94vuo0
         Gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782949080; x=1783553880;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=ryM6JaSMJpKGFGRDfhvAM0ik71cRWgCiOkHqZwDXyorAR9Edlf8NyxpQxxG7hAn0mP
         2ikdsU71HhbJZSbx+VtD0Gz3tai/T1zKRLpNwP5iFn7v9ibtvUYtDo90dZlFuLfXbizj
         II0My+NED/2wVE3tUDNg5Gk6Q3Oxhjk+JbIdvFzK3V+urxsK8lMFojN4790XmPj3a5S+
         6IzmN0xDKgfH6TxRSiKiBGAQPaBEyLF/o/DPhiAjekmDEFHC5drQxXcoCtfrZKrgYefu
         qk75vo8KZtKaUzqg9yH2KG1KPD3vMC48Xmzvzftu5HEMNIA80AFxWmvw+KF5cb7h0cZU
         ZY4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrxiJL12XOBItLuWPDuN7joN8uxvHtP8ZYR7CjDGgpKawOgwwsTtMN+x5sd46izn5+WVbzCcPTfrl1IOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLDWMK3kmsKmerACr5XX3/8QL/az+xYAN+oF+An8eq5ijYY6qE
	tX3bLMLdYMY6o0otb3dEWD/SIKY8hLWNxpHevrTQjyzL+saW8EV9Y6VFvAmLNRvL9Ag=
X-Gm-Gg: AfdE7cm0AY3VySJsIkwyM4TzVNSRsP+XrFy7V6N10ZMU4oTBLK8FGQPBV0aG7dcn5Zi
	iyeRdMJk8Mk+kmHy5Oe6wSce8y+AnrmT24QsPFO/UkSFBaZDoxDVNDeqOwCou2ujS01VNd/C7LM
	oCDYmLgZjJ3gMINfqDNgk1zqyf0InykmLXxihHrx0SoTq1a7KPlRP0xO2q5U0VlA+tKL7z1aLHj
	BsGjFv2XgJTCh+AL6Ki1HAW+JtlbPO5JdA0b3Rzfx2sWoJ7WWl01bT0qhvtF84Q5UH4TZwYVwVp
	7jk/oVwlY7eeXgrjHgzqxrugME69zsLxQhX3SZphsJZVzQMlwiGgrK1Z92YR0IWTq4YEJ0/0fZ0
	c3EYo8asZ8yqJ4oYMhHHt7DR2wOpFTrdsvs7sKkl/YjW9epGjhPIkULFHYAWgssY0hU5JZ3dWu0
	CzwPbVP9oSWTQz7NE78BT5SdYrJEnO7uC4UIz1XRfKSiFLE3pB41OY/85EHpYbsDM1mXE=
X-Received: by 2002:a05:6512:4613:b0:5ae:b17a:2617 with SMTP id 2adb3069b0e04-5aec7435771mr533633e87.6.1782949079808;
        Wed, 01 Jul 2026 16:37:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc478sm300818e87.68.2026.07.01.16.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 16:37:58 -0700 (PDT)
Message-ID: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
Date: Thu, 2 Jul 2026 02:37:58 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/26 01:54, Bryan O'Donoghue wrote:
> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>> #phy-cells should be 0, because the PHY operating mode is well defined
>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.
> 
> So going through the list I don't believe this is correct.

Be specific what is incorrect.

> 
> Inserting bus-type into the PHY layer is borrowing from one domain
> linux-media and pushing the concept into PHYs.

It's the other way around, "bus-type" is an endpoint property of media
devices, reference to video-interfaces.yaml to get more details about it.

> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
> suggestion will specify the mode.

This cell is just not needed, and unneeded complexity should not be added.

> Then to understand if we are in regular or combo mode, we parse the
> ports/endspoints in the PHY node as we've agreed already.
> 

That's correct, and while it's unavoidable to parse endpoint properties,
a phy cell value will not bring any additional information, in the best
case it's useless, or it opens a door to a clash, if different phy types
are occasionally specified twice.

-- 
Best wishes,
Vladimir
