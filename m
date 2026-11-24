Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514278;
	b=GaAn2ReXVLqNn1Aj0btAToMqe48EpOqbMNHf1D0NyLcS409eVxefGhx+EuqKb1jXuGOA
	 J6s3UBLfEgb1Jx/oW5oBeZDKUk/J0CRyNZOAZ86HGmNP9fz7pZVjh2Q+rDUSb/TnEFgUE
	 aJo21OieeK+VHsdlzpE6UBjpddgsnrwGR//k5Dyte9OPyi+0+XYwBXwtKng2di2yd5KzU
	 bMWZZWysYHrfgDG6IA1cYvXbQXQvSYTB9TrmD2/DBaGxQTMC6MZqj1kArGtSTMWKjlEXm
	 MvoyY6ggAGxC1VzhUJMLNqfzpzdlubN24oweBsgr6ZZqPHuo9IDG5Ow/eSWRskufplQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
	b=d5u2KTYcwocjYh0S/qx8iX0JgC7bfwaRdMgjlQdYuaTlJRFZuRsXzuvTXchkgkJz2P0z
	 d7nB7zI9/sH0GkJJpfc1NbAnAH1CUtvLU+BfE1f2/xdMtb0VD0nVNhp4nDo1+/WXooYkO
	 /FTjFrFDbNZ4fGoyIY9YYy4RMe5+uygSPMXJXycefKsn3rS20YQsS0ky17oTKMO+oxHbn
	 xUW0FrS94ZbN9b0FUasw7vFdoC7OfoL9pB5BJMf/cfVVOPxcYb0eqjkKOCuMZemDXzHW5
	 K5Gjlxm/heEyALVyPnmEZvspJn4ys7nX6SPCm1JT6mBY6iCORhksdokOI1OebzCjGFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0942606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0942606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=t5feP5FS
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso858774866b.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514276; x=1796119076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=t5feP5FSqUeh4OUPpz/G2qREcYdQLeO7DmoP0KcDpNlxLW5YDVPbm/4Y+9l5pIfOLg
         VTJdJsniqfbvzKi32+gjtTylG+NLszNUoLK8grYIn7MZz/2KY/vNC4ikLKW3INcctV59
         MlDfs9WlBH8JxRd+ehnBXj6MaJ8bZhRyk38kNrlsopV9B0bit7eK6ORPlBo7IpMN8DlL
         n/qiTjcsvSQJuDp7OIdkYsVg/DnLTEg7M/S9v5ZG4wEJbXxoRaFKFfrT7EhT91u+EECX
         4wv3o1IfjbwfPggyiQFREhKZWgfch+xyo2W1f/GlGAtwzj93Gz4SVLOV52hIZtWrXdNx
         yQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514276; x=1796119076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXyUg3NoH8fdqsuK8DsovCC6A8tK75idYEl23ompiLQ=;
        b=WUqgzkgGhbGJjQsQR+/4s/N1a4AXPlzFjAmpzULoS1DbDR8vTXjz5NC6XyHiYdYwEn
         UXU8tARMAh41vDBppoYq2AcMLzx1OMkUvPzeOISTN23JGH/lufEj9OkI0Sk8uc032KEk
         x4IVGyV4TLBt4EAKsCwzPznJ0o8uy7+A2xLe8dCEnb1zHwcHcm+G6bUYB1d14UgzfDQq
         Udc4dnHZgc9LBaI52MOSVKRFEinQ09FSUk+itYanEeBNXgWvlqP9nWm6QZdCZvnT5hOJ
         9BOGhL88xaLpHEadF9L2xPFPM8YIYmnVcncR4MzrLhkh4Sj6YaQhMJmUOU/WpkwBbf+E
         PBqw==
X-Gm-Message-State: APuU4Z+Sgc8gG5rqNUYlfLZwY3vD/zY36DxijqfGWRSWnolca3eBz7ep
	tujo8tYhh3MKZ0ul3NzXrOFgKPEtz8aFbyZk5wdpFf1w3ovkaLgNBa3b82iVufpkxs4=
X-Gm-Gg: AZFdTZe5bs3H2OiLKQRUCR3jjnSqFG26ZlFNDt39BC/cyK9BN4uGcQ5Heff//jDD0vk
	Y5yFyQ+Itif5tVk5tA4s17wJGZCH8QthbMXEAvix5oJhFwOt7SJsOnO+jWEHE52U90byd/IK1Tl
	hYD9U6+VYO5fEMvMR3Sf+DQu+MR8GmBx0laHZDB9yZPBMIDTnn6bGJ8F9Cg4/2xKq3yS5qSDRDm
	vEayxt/mDqsVeH/dBVqKJtI76C7gC9FQv0hDKlXgKnSEJyfM0KpYFL7Ll7kwJwTHcwL26wVmAK9
	bt3EDF42yThvWZR/jo04h3TMZAMJuEC1gJ3o4T9RCrad2nEv0VH/zCaz0cCeTOEBaQMPJsVCsUU
	7tf+Tdnkqx2j5cxG/5bWYAiW/qrArk8i9iyLE2wv1N0dRx2sSE9gyBSsbJajjYkXQIDwKaWX4th
	n2bL9JZFaihfqk1nHnT/I2TimBLVK9GXoxSaz6crW4SAxMR1cYPyStSAtsuymcY34fbYQ87F3FV
	BzdkFehhgaPud3agECUMhuU+uVUKvLRzcMHBOXKqoRfepfdDU8Fzu1D/rVBoi2kH5dKwerYuM4W
	SFbz3x+1zTMkOGID1IT85oJJ4oDno+oLsRD55ZqBiGqb7jil7iVi8OG1kdT7UKx/
X-Received: by 2002:a17:906:370b:b0:c51:34ae:dd7 with SMTP id a640c23a62f3a-c5134ae12d8mr835789566b.17.1795514276195;
        Tue, 24 Nov 2026 01:57:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm492806766b.80.2026.11.24.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
Date: Tue, 24 Nov 2026 09:57:54 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
> +{
> +	u32 lo, hi;
> +
> +	/*
> +	 * The pair is latched on SOF rather than counting, so it can be read
> +	 * one word at a time without tearing.
> +	 */
> +	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
> +	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
> +
> +	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> +}
> +
>   static irqreturn_t csid_isr(int irq, void *dev)
>   {
>   	struct csid_device *csid = dev;
> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>   		iface_val |= status;
>   
>   		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> -			csid_sof_event(csid, i, 0);
> +			csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>   	}

I think a callback in csid_sof_event() might be cleaner or some other 
way to not have to replicate all of __csid_sof_timestamp() for each CSI 
decoder.

---
bod
