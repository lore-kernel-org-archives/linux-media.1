Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DEB3FFF85
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673710; cv=none; b=Ec8jbhUWZNK9dfEmPNrwOrg8JZ7+ugm//Na64EAOFV/SMDYdfiIQmxQZAN1UQLn+VuDntcmh2KKYhYmaagWFDnIPSq1FpJkMfCRWALnn0ncFcw2PSvsITQnccVfIah2Y400xEWl+j6Nd+4lTGWMHoTamyIsHHBr+HQa5UkayncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673710; c=relaxed/simple;
	bh=MS2iNtQCXbIlbselvMp/n931LY6FLwtCuJeCV8hkBeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJbz8u8XSP3q4oA36JyBLA3jQWQqUEDk9AWhbWROA9oop3n4seQpcAbxUpAsoEciQCWd2v3uQAIR/nsnItmGCKdrrCXKvYZxi0XhpqF8OE+Qan8yxX9zEXRRELbp71IwMLsSWWn7lwbHZRynWRlF/BRPm2S25ygeA3X/iq8s494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hs4g3DsE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hs4g3DsE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590dde14so29296955e9.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784673707; x=1785278507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UZpL0eDJd6NTr982Ff9Khr33VG/2sSIiZnS2Evk0zg=;
        b=Hs4g3DsEwc5PeMrWgePkzOU4OHnoRO0JAP7v9SKXQ7xVj4pt3k4/aW2XMKnGibqpxg
         0R4g75nDdlGfpjkeIrxSgnHy3xXSeipM3h6qCKePX1OnA/4MeugyIVK2Xcxbt/aK1V20
         fcxU/zoIpqE7pfjJNspDMPMxmfvbKrnOqvThOGVSKIq3GrXSkMUGd3sLffwRb2V2k+sq
         R89UWXKVENQFOiFUA5Ztmsa96JyJLIL1fE5drYKZTvAVAs98rfCtPqE6CDc0jn+63uwT
         hs2g3Ok7AKWs6m+6ceATmGhgiPPA2ec0tfmhGD/HyPRw/edRwxj1COB46V0o6F0djPf1
         9rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673707; x=1785278507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UZpL0eDJd6NTr982Ff9Khr33VG/2sSIiZnS2Evk0zg=;
        b=QCorAL5Qjt8grHTCDJ26e1Ti2jOnva3irDqt9W9LZEazkk9uA+1AGElwxgGp6JFijH
         QrsSgcjJDksQCGOBIAy0KBT7Bc0ksmcnuHDkVjZ5Y7ojaqwpmTiBOgIVHvW0FwwFqS6w
         Qa58laIrUE2463yDwNk+gVJPNAz0X/3Z57lERHTrSHwQXQqJyzZ4XAgkhBJjUpBz/jSb
         mU/+5rNo3Ac+0AA2YFrIwiNTjRAAwcjPlynmag5FAXJw9ZU0R4HNr8QO+TNWYtdEOjlk
         sBvb5gUe7kRDA0DihvdMjCEONXTUCxZ7KpSdycsclcH2O8IfaQ3Ba79/BQ6jxgSI7Vek
         I1pg==
X-Forwarded-Encrypted: i=1; AHgh+RqpDG4npW7Y+a2B2coc4jwGyx1jy0BUuD9XuIOVNZdBBSB3vR9/vIJRez69RkoWu/qMcF+4/DJ4AwTmXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytfH8WBNiLiRksrNi3rk9XZ/jsPLAhzu9PWa3p3dqyXolrbcna
	7R24Rw3ZjJJnEIhMS9YJsl2UFtfRq0wqFPUpsTze9Q3R5M3Hsv+fWlhriduZehJ5JIw=
X-Gm-Gg: AR+sD13q9p4WiV/oJEbwdvwICmrSdOtLPjGjn20YJi5pGw91pVQVaQK+77Frn1sGNWB
	CtnvUky7afjpbwRdF7Ths507HSVGbj0iBpgdauvRSAHmHVTqN+WVkhrVnJhUVSJDp2dn5qnoALT
	8rZ3HCInCtee6zhecAdYCMzoO7GqI/jAxhSbLqXaFCdOGVIVV/uv1vWXBr0/yVYYdUofQiQfPt4
	NG3CUjUJNDP+hgfWzUXQ6jHyFml6p0j+VHM/OF8iqpe8jF4bRhD7vd9mdG9RVEJoF30y7T4CQaI
	0xDzOwyuJOYSi+tc3t//+OgDlW3/58I64uX7bNYw2F+FM+uo0Z0vkwNjPPKcwbLZ+cVGoDpwrr1
	gTFXhelVQRKnY5QUZbGxapvDqsIJNyUucMYPh7JvK2MoPkAUs+sx/G9zsK2h+R8+j0nFGBRqExu
	AN00sAUTJL5se2lug=
X-Received: by 2002:a05:600c:4f44:b0:495:5e86:4e59 with SMTP id 5b1f17b1804b1-4955e8653bemr112642595e9.22.1784673706658;
        Tue, 21 Jul 2026 15:41:46 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm26563145e9.12.2026.07.21.15.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:41:46 -0700 (PDT)
Message-ID: <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
Date: Tue, 21 Jul 2026 23:41:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 05:50, Hangxiang Ma wrote:
> +            csiphy0: phy@9523000 {
> +                compatible = "qcom,kaanapali-csi2-phy";

The sub-node should be dropped from the examples.

---
bod
