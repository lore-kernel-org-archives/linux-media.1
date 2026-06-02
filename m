Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314C39446D
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434031; cv=none; b=rVmZZ0j7HoMkUCrtXdfVhCx1yV95kBUE7e0N5pprLfnuYzdSnDP4IMpyrDe4wKjeY+MyhiHHDfwkjTeXKH9HqIVhWi5jAVRbzf+h7Vo+zkJGUiESG4kqWhu8Rn7LgG6BQKerW9luaWgVd4+oBf7/LtEZ4yggcsVRzyhg50lVPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434031; c=relaxed/simple;
	bh=uvhufSHkS27pkk5zPIVNeG5TbVytzxmiQf16IumQwvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DItYtQ2vhQZcDoHn5FtLKVh5ZuaMiKZpd8kCmoz8LDM7hBTee9qS8X+dtSZQuZEktcZfz3ulJYluTinCUhr6eVyQPVoABHgWAKeQmeGLI2mqq+Besr2CXlwfpHrk1rfrlGGyWSh/O/k2aenPTOXiqGpfQaVPysCvOx/cRghIus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF2xCCuJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF2xCCuJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso20352725e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780434029; x=1781038829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=YF2xCCuJxynz08ycnNg6UkGnNlwN05tSjivjUi6jtdz29GiqQFZJScpt1NiN4daywK
         bJzpU7BKkgtjHO0/WDpfCQBHm9+Y4mOt5Zkzggh8aXQgojDIrr8SlZImvuI/rEmU+k/N
         dsY8DchWBwumWwSe4RDNVzDjOZ7A/A3rwWmPO9vtIrAWhw6PZDVexwu85JyBuk6s34T6
         XEdGt6WD67CL5/X5TRlymbFq41L/kdsx4i6Wt1TP8/4jZJoXihOJU2lba3CwkO5S28Jd
         TMrw06kE7NntZRrgMS1lE8bf6rbDBERJEklUaTnkLOpvqDCHZ6ur3rM6HsSs3IqheaK7
         cppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434029; x=1781038829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=mEOZ+cK+K1NYt3sbhrUXgigFjh2nUK6PP/22rxSFjb2hXDXpMSG+eUhZ900QZ4Fchs
         mWWVHDt0Qig/C8cIPTaXx8uCYWWGGx29iLjuHuIbqaDYInJwjirRA6bIcSs20rnxtola
         jKwK/NJ6lY4QgwvdePdR85YLteKJzebBRWI0jEzX1tvLLrKLmfjhNDcNYmCtFoWD2oIe
         nnxXudbDd226GrGxyGekkLAAKy0B9a37NHkXEAPUIT9gfUwz7peNIUDNG/BQwdlooy+T
         ZhxgCq05UEjO0jGmS1tC/6r3v8bM3ppRGKExcw967ZDdFXzZT3aa4z0xYgZ58bZBuAg2
         Hu6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qkexdX/lXdhFgWgKKdqchyBv3WK6jDyDOqRFQ+aR9fsqhl1m53H2EsL84KaZQDCpG6Nu27h3JPtaE0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeqm5XVXuIz78n2S2zCNi+9FfJvw37iQjj0FJzmaXJKCgi1Gd+
	UjTgOUYg0g8wKtm/9Hv9+R8ia7A/YCZu9wW76Mcy2muj1FO0MWAF7gGZDT9eWE/3P5E=
X-Gm-Gg: Acq92OHr0sEmihRGme2usINtoeUg8r+RaQeKWSIy42DVVlRqVepvoKC8uFZPY6t1qAu
	45I6w7h3aiyoQPXXku37gdj7EfQSa6pNPeRqS5UzP+5cbOBpXZkwYj3+0X0isdQAtcFWOhAphxc
	L+IqQ/3ETfWeY5ujYS+0c4JFoWQbkC0uUqA5ZQPb6Q7iDXatb1QdrPpwaUko+f/dZDo7pTWWn68
	3rwDKOrBOZNy+sJH9ILFIYjMs9U4QSIAdy/sQ2vsk4JPTqzZCy7tlgQkt6yorQDwUT9CozS8HlZ
	5iSpq3725fd5bsMRL9ER2g7PrDXjXQljv/kkY4dXRiK2Zzdkg6RQErx9xrc74ZuJNP4/Gxj3Z0g
	tnf8wYrZM6tMtsU4kYfdQe8CzcCyotsTGVv2Y54iOTjdntIvyeWg4cFz15iOz8DFePVx169Q3eZ
	/nJBw8uk27+us47E/wz/2uR/ZqftidflFaFjezGoMyzLPI
X-Received: by 2002:a05:600c:4513:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490b5fe9bd8mr6349125e9.25.1780434028575;
        Tue, 02 Jun 2026 14:00:28 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm1316135e9.15.2026.06.02.14.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:00:27 -0700 (PDT)
Message-ID: <d45f3000-35e7-4f65-b9fe-5348105abb0f@linaro.org>
Date: Tue, 2 Jun 2026 22:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2026 21:55, Frank Li wrote:
> phy {
> 	...
> }
> 
> csi2 {
> 	phy=<&phy>;
> 
> 	port@0: {
> 	}
> 	...
> }

Agreed.

However, we also want to support "split-mode" which is a special mode of 
this PHY where two sensors can be connected to one CSIPHY.

After a lot of debate adding ports/endpoints to the CSIPHY itself has 
been pretty much settled on.

---
bod
