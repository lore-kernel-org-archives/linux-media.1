Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957B23B52E7
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332445; cv=none; b=Wwfpzx/TIrfVydVlGmuLg72sEY480kvVxusnYscpQtWhCA/hAfmw3/1R9nyIfBaFhawZ6jeNkNbBZn95ScD4xvaIzoOoP02guuGt70Ehi0RKawEqBT7JyrgnuaDIxyvug4sUFG5a7/+AYewy5pPHj+fmfYUgod27PK85LlDHqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332445; c=relaxed/simple;
	bh=cRWNjKmduoK//U7tqDYvdW8Fw47BsRRlQaOBQhBhOfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rx6YBd/N4Joax//1AytXClThymAJICgu2v+22EG+PhYJr8lQOBX58OvtWb1aJ7C4MNmZZdHGA54bD2b4zH23z7+K4dBxw1nNdbUDRV6+6Qubl/UtBDJyUukMWIO57nG8usuTZ/lsvQ+4ONxc7eWQ0xDhcnVdURhfnBi890cInQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1UxLoY9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1UxLoY9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so4644629a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783332442; x=1783937242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UGN+tInxm7YHzGqwLdDJ1bWYCbBBGU54xQmERlMD08=;
        b=X1UxLoY9KDlDjt1y1R5kEZDF4V/rRkfJmQquq5271XE9EwHP32ww6JOrwjQDoOKfVT
         qnXjmNEhgL9eWPLX62XCD04i9N3VtrvgvBaHoT2ozZcKF+59IVeQXfy2wKSvR5O0rMVb
         43q2NVVvk9l4gqe5Og0cLHhbX3qlp0JRnQe4F2O3baDtvU1/c9VzW+3nDPiWsq4PwgGy
         8Dnk5tyTUl+EDyF/QaI6Fx1cgBxA7egkFaGUYBQITPdX+t6CLqxBlJMELiaRGDSZWPXY
         D15L5bQasIFmeSZGG89S3XRgGpQtGwhhoo0/0Lep19d+NyPaWgYu8+e0EBMDkXl97u6q
         WaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332442; x=1783937242;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UGN+tInxm7YHzGqwLdDJ1bWYCbBBGU54xQmERlMD08=;
        b=OYrVopfdq8D+KghBo19zXFbpazGPKz/3rrh5r7NhCrS7WPg61eDDApP/wyeQLRas1m
         xM/nPbLEkD/UKJ1xNYAXBmkP1YMT3iwhoVRtNj+7E6J4Lq3Yq8+IMWQ09vOwChNwDLnM
         X0b+Lv6x869T9TnjDY2vRADTtAx85E8gBEzpEPh0/Yhw9LNRkH26y3hqiTJOPHIoXBqt
         pU0yUrvNLK25kllNW0/oYbsp9JOBylrhNShn5F683MhuMfBaR0qV8n23UiBk+6vL1c0S
         H/Fz3GfyoSk7TtVxza6EsijekOGIBzzrp7Ql6x/EWabZwAzaEOi4tnvKWCmLIG06gDTo
         beOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+BIBrTZ4Lpuj55auQs1AN4aowlaiQTiCW42cJkAZsL9j/MhWMy3tejVQYEJ0dc9dzEJk1FadsinSSwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwjjzmRFlrKXM5yuuVafzS8XJmtCcW7i+FAXDW9DUJKgkKrDN
	2sHQ/4JYSdzB/pWZbfByiY5lId9LdMG/sF2il7tjMI5lJG3oSw5HO3d2AdGN96yYkoo=
X-Gm-Gg: AfdE7ckhB+/8pAq95DXnTCL6IURjH7v6t9EWZl7Uv73r2xNf7TaE0ez83kWNNW2z0kG
	MKb/d705iCEZZhNmvxAyFN1oFZHZL1PsD0qrVFaxqUUhslGzISjgoMidP8Ca23LWh30SiniSNBf
	MX9arBkvq1/k3bHjThCgQfTgt9svaDwvacByVG+8TPVxnPfu+7mu+lK6xzYWjMX2VoldLEY/2iv
	974zFz2eM1hdDWfOMVWLFmnNnK4DWbxEozCbv8NJVUaHjzAbVrUbSKWmz/FyyHfKumLlt0kvjwf
	faGtakgHth2nY/Ecofjy4uajMiXNeB65eKeyk1FIjlal26YuYU10XV/zIjwKRZW53QvUhUpLdXT
	BJQR2nSXrDpqTuc8152wsO70fqjEc8bpBTQsdiEIGTm3kZ7vOP4NLnhZide7Ohpbr67FVxfbZVZ
	VFHEkkyeG5kvBHN9LZz+lNQ1Q6yg==
X-Received: by 2002:a17:906:fe02:b0:beb:8c28:254 with SMTP id a640c23a62f3a-c12e66259a7mr358483366b.0.1783332441744;
        Mon, 06 Jul 2026 03:07:21 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c552esm710202766b.49.2026.07.06.03.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:07:21 -0700 (PDT)
Message-ID: <b7c335fc-4a53-437d-824e-63f7ad6dd06f@linaro.org>
Date: Mon, 6 Jul 2026 11:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG
 encoder child node
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
> to act as a bus for child IP blocks such as the JPEG encoder. Add these
> properties to the binding so that dtbs_check does not reject them.
> 
> Use unevaluatedProperties: false instead of additionalProperties: false
> so that child nodes are validated against their own schema (matched by
> compatible) without requiring the parent binding to enumerate each child
> type explicitly. This is the correct approach for a bus-like container
> node and avoids updating the camss binding for every new child device
> added in the future.
> 
> No functional change.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index a509d4bbcb4a..6008938ee369 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -102,6 +102,14 @@ properties:
>         - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>         - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
>   
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -317,7 +325,7 @@ required:
>     - vdda-phy-supply
>     - vdda-pll-supply
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
