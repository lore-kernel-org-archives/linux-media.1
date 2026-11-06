Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964390;
	b=eQJlPrTgtnVzGiS+pCkumr7MXow7+aSU6awvDAtDcomTh3H+Bduld29Y0SY4ajCN8TyO
	 fDirdyY9C03pNctMGs6TIeYmxK0Lf3y6ES8x5/klw55hvsCgs0TEsPkrn7+odYz4VMnfQ
	 DOVunB8Pf2qqs9zHOKjmrJTihowbBAO9C+xja38j7wLhivuFghOq1lGv56H/yGjqBf65S
	 ItgtbSraU21JKhKdMouiJXwkbp/tzeqGRSvNkagHF+EzbOe/GCPnlkWc5gq7SU7EZOMmw
	 vmQYpaxwH8XdODLTwJY/27ssvxy306dMpLeJtLMo5ZEp9FiF9JRvKrjL5ar+el2HSjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
	b=yd9qxrq81t1cl5pJH8zJoftcIM9yp5lIn7Px5Sz/JoCY9AL6YM0BDLZ3TPwiBtKcN7/1
	 oFjUOVVyZk8L7EMTxn/b53y494Wi8VnnWhylemFCEkzbZFSp7pPQ5koP9LaXkzfzs6kmj
	 pQfbTWGdpAL2aaXH7+LmHQcI5F925dxVd8Lw9Wv4Hk6MuyAivUjsSPDkUByrgCLf9b2cf
	 RF7mKx4z28VLnIFb+fcPjN0VEAP+Ho4lQ1SZDNIJvraRNJR9FEOCur3LK20aUMdo1kqzj
	 8lIavs2spnmf0GYNk7ICw40m0T5KEcJzExkVsJeVTshsMTFfNaT36JndRzffwhrvsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B094606A331
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B094606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=opUqJAWA
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so272492f8f.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964388; x=1794569188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=opUqJAWAOya7CeKLUFeRUpto0xhDsHDE0HohVtyIZnuUT+wiPe4cORcwLddq3v5huy
         i9pGZ4OqYg6HndDaZqJmJeiHMZxsorpAMu860/wKTG7jmUDZwZFMb21qzEfUqDhPRHdB
         wjgK5PPTSFqeFOVI/OkI0pg1Hf6EEUS+XwWDB7brg/tpwo4MRp2+2iu8CpUB2WynFEex
         NSNn5adlK+HYH8TtofdR2pDp8iRQ9QCMWtk3fFoKfJkzsbo2JN86EjBX51QXAZfEJqKS
         B36XSyIS3N15WdMNs5DmDNZNNYh5w6CaTX7o76QRuGcUTqhk9zNOqmfNd81CkTGX/w+4
         HhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964388; x=1794569188;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIN8oEdosMaUM7J7IKPgHIHkvQbHyBxozoGEFLEDHOg=;
        b=YJyVxndPrKQM0xO583iuxPsoRrU+5ujNpMAsXnZIkhfarUZCqE5m9u9qzt0vJHBd8C
         z56KHiqqr/Usnm1Mo1q/ulHe2Ar0+XclvvdgEf43Ny+Bmf75OB3DZH2hVksW45ZenLmQ
         EtOijgy8ieeSHGWA94YiKPdr9B3IR72CiVzQ4qhufLEycVCECnPIQ84D5ShhXgPylZAh
         J/3ndSlDUzPcpRxW3++fd/bfxSmhO4r80oh5mP/Lmw3CcIEiuB0zghx3Qm3ubSyNtdXY
         Cb9sIW4gZ3nM003ThPadeFjHFh/ueqqbfT8Tg/7ehEWY/Qs3LHiIu9OBBXpgHgWi7wDH
         RiAg==
X-Forwarded-Encrypted: i=1; AL+hErFu+11sv8up7WObJFaWlT1mD1RWc4iZhnjwHD1hSSMIXU8YH4MPy9M5p7ewhd/Oras3o+VeLhwy0cIxgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9q3PXsAKxkCVm7DbFNPkj0Qs1z4he+CCdlpQ6MV/UrxydvoC2Z
	72ql/RH8IqT4gUMUvRa+yTaY21D59nBDQHHo3DioPT43gMa/292xiNVYTWV+PyMb2D4=
X-Gm-Gg: AYBFou2o6mPoTaNsXKp0EEgFJ63Bq81LWONfUmRI0Tvps/GyWPVZCCPqT+1IPWSXFfC
	WBfRHrT4rdmj6yLihOFFXFIjCYzjNVBJ8fMCTqzzkeYcHsUNteNwTRlPIOypuKmq+Mps18OTg3H
	1FOUeau4eEwj9Np1NRa1gVnkcrvZr/iFAxC+nClmOq6xoCx8F3FNZIBPlNj4L6B0Ust7txkoiy0
	NNqSgAY5mLHN1RCH6vZYmFOxR/FCs9QTOE6Nw+WaAa+S+IIwzf1obRg2wbqTPXrbGcikUQHxCRU
	eanBs0/oLKQal73vLQdj/Qr7k5FIoDMMYu73ctA3KeGKAKILm7J3fLLJzipYnBCFP0NNhHfH8ES
	omIpAQJPBG7R4oC+GtljNV8rz3V19SBFerlMehIoh1vmvPZ1dvf7m+Hg2GfRdPgRG9KzIv9Mqzg
	3iYj9bZxDg9Ih1iHhjnMb90/qr7dppJ/Otre5zLpE9+BWg4PUXZBTwvH55arf2FWGEAOo+Ywc+k
	GjgM6Cv+pCrIo33QSBOY5di6JlBfG317qYSn9NPWVbgi+S7hpXvEdNoRGY1P/vEowbLPaNA44zE
	0wQuBOHJq+ZtN0+nFZaG46gnezj8R7qjWP69w+CvoQ==
X-Received: by 2002:a05:6000:4685:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-492778d1fb7mr3239346f8f.42.1793964387965;
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492ff85585esm2390286f8f.5.2026.11.06.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:26:27 -0800 (PST)
Message-ID: <ac2e970b-1f3a-4aef-9a84-034d7e460c0f@linaro.org>
Date: Fri, 6 Nov 2026 11:26:26 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: qcom: camss: Match VFE lite clocks by name
 prefix
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-3-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
>   		!strcmp(clock->name, vfe_lite_name) ||
>   		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite && !strncmp(clock->name, "vfe_lite", 8)) ||

Shouldn't this be the case for existing clocks ? i.e. only check lite 
clocks on lite VFEs ?

---
bod
