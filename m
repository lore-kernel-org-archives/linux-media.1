Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FC4279EA
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182820; cv=none; b=ijwHYvI/FBLVbayp5h43V4lvn+zslHEmHt6MaesaDv0+XV6RXRpmd91CZOlqQDYIOXP7ylKzw3ND7/wRFLgT43QVabl4lb1Ja0PZr/RdrWPSy7L7q3J7kh5iLNTfHfgf0nOPFRqDgWVdEboPABsqoSwet027MfXw9r2aNtjPJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182820; c=relaxed/simple;
	bh=h0sPLnTlsUQxhlB/c/4nYrnOp2ouV3eIdQwx3lmCH+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/fQ1wPGcNEQbBe54enUKersjR5BQIe8GX1h11OnehnnQzNceDphgxHUdkg7cBFFvwriTIT1UB5nk6LME0i7BQq2LZb6DbJIqv+HH/6DUs78BHQra5lAQkRgq+nzZFZ6v9GdPzZ+y8d9gafqkFCmwAZgM7l8BedpGnXD8BeFBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IP4RtJF3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IP4RtJF3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so28925125e9.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785182816; x=1785787616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wetn3gRf3r576PuDu2lS5jC7fWv6xVZ19kQlvaEDCdk=;
        b=IP4RtJF3rSzydt089Nj0JkW4zbUgHECZ8tgZ/5gKOOV+m+WF+KG8UOxDb9A9nRpfxt
         VybnBUgBcp8k7zTGRn7Rw+HMYlOK/k82LbtoM6tPjz/gNGzoZ9q5sSm7Ze8n2T3Cezbw
         JT5VXt+cH0RBkIhpzn0s40iG7uVnp06eAYRoS5d11cEtL4BPe1ueWY82v6sGQ9pbPwUp
         5CVMk03d4m23SRjeaiuB9pq9/miaScpikW1Pjwd/udTsXwU+yBcx8dxNWJF0Gb1tQiqH
         wb8F2EC4hErmTi9DaH26kIgy3Kw9R6uGiLogZ8EonUjyz+6zewolhDnglIPR8SpRhmmi
         Ne9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182816; x=1785787616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wetn3gRf3r576PuDu2lS5jC7fWv6xVZ19kQlvaEDCdk=;
        b=Auym2Qm4eJ1YOW6ou0AIvvGYNWe1RETrdqRtNcsPtYkhezBCkQj7fqcUyN0K8i7jHE
         nkCk5G0L3WN4bf+g9SJDQYGI6HfhtAYagJb4cFRcBAtrrF/jSfG2SwKX6Yyi7ejX2p2x
         472JrGVkIIFBy1FdBvVaUhLsddGMKL5rrsRHke1VZjIYGE0/hw1cRrOg/crazyyNByxD
         m44ZMGYzUzZ1wstetO2a2We6s9VGTKPvy5QuPYioMUDV+jKPP1jbZVEZ7Hs1fkCU+Ya7
         ErF/lyxs4a8nf7Ctw3IJLoAy4Kl4ZYJmz42NLMSiXgvkn+TDeKq/5D9BjwqNRSuhvcug
         CEfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrci7Y+vOZZiqqU5xp0wQSdK0HllWxxYhkmGld9ZRuCCes1WKIJiQpC+HuhVMYYgM/VNdrfvxu+jF+eqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhuNUvODVOeVNKPsrQVzIHTOmyq4kVOTbClvtXmr6Y61iNLsH
	SsVmqYuEy/s5sAj3NA1H/MzqEt47v5dDN/p/8NiF8iourDbtrjfuIGn9FDtgdTBfDwc=
X-Gm-Gg: AR+sD10z8omS9cH84pyNaM+UYlHME3UafhCV6LVNIqp6eRuqmBNQs6JD28CiN8GvElQ
	qTIPZSv2NQe8xBHm6+cz79dv9MqVmjnCntIk6pw9uVpYDdu8K9KHrOheEAWh8paA70uYi1tI/5q
	pzvATDLMYUvZXhWjGpfYvJupuaiXo4oxLmLQgoYw5KjrDYPK1qClboMY291QRB0A8FmkHpWsSVM
	UoI6uu8TPlB+yL8Wh8a11jXwpFQsjrczYNRsFoTh8zsALCEw1EMNVAfm8iZfJX0EC9zzHjafLlI
	JNExYyL7v1z2Mikfjfu245YZXpq+naFDpDsx6rs1QOsjQiqB1cpu9BbZ9wJQJNUqLLCuFXuN0JL
	RKRz/nWAvJJYODzBHZC7aYz5y3q97Oh/fLtYqwubDtgUUeCqb+YKRePfD4WtDNKhjtIqdhrfK76
	hF0BkJdCCVYmYl7jYfGKsfxeF3
X-Received: by 2002:a05:600c:4248:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-496b5700246mr67328175e9.26.1785182816614;
        Mon, 27 Jul 2026 13:06:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.105.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm17482495e9.12.2026.07.27.13.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:06:55 -0700 (PDT)
Message-ID: <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
Date: Mon, 27 Jul 2026 21:06:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/07/2026 21:03, Vladimir Zapolskiy wrote:
>> +                description:
>> +                  Logical lane indices 0-3, not physical pad positions.
> 
> In hardware description it's physical data lane indexes, the same is 
> said in
> video-interfaces.yaml documentation, the numeration starting from zero is
> selected to follow even bits in CSI_COMMON_CTRL5 register (D-PHY mode):
> 
> * https://lore.kernel.org/ 
> all/59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com/

I'm not sure what you're asking for here - this exact text ?

ACK the rest.

---
bod
