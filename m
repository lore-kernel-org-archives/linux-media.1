Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269046;
	b=c63in0YLEb+NWVhunv+rwnRvIzP5LKoVrg/lR9snBXTrnC9TwkucaSd93YKvSsDwXdSt
	 E4LwcXirb9IRXlwrlFEeysSK5sKnt9L4T0Pfzujfn7Wxy2c7xVYqSRvMO7XqdllygIhAj
	 pGwL2+wnsbU1vrVLPySEd4vLOw8FYFBNOy6hbFkc0cuw/XU/jNKJUsmNOabTRPECKOUaZ
	 PqvCzu2AC0Mx5fiZIWE/f0/15c+RY0t7WluX3G28o5KHmYW3RUV/HgQvkDxgcZmTJ2vga
	 J2PBfNgxVxVjk1HMqyijQOKB0RjMuo1ogQwbglsKtZNlji+7XhME0DNzskLQ93vWwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
	b=FAEEZrYcKBrRdUZltt9o2WfV1TKTvEcUvQepcE1YkZpt8MxEFyPxhXMsbnw0YuzHGxcT
	 ivETBB18TBZFVJhQZAcmMF47gOxLodyl55pmiuozCwUj/zE6JPUIypLT8XxDtlPxeqpoT
	 AhfpfjSQNJ5Y01i0Rf1tceopzTSvMRuiAR2WyEOxNj53iofB37SqEj9+QilM82XRXUvrU
	 A2jbxifLtfv0ZBbC/j6MNg+GlTSQdUkfg7MI6i6qRU/fASbIQ2ykQTqHqH5i8S2oIAUxz
	 QgNnHFNQhWjcCBwJRkc0JMle5g1QTw0GJh1V/TIM8PVDB7bi91saj5+vo6Ay8XKjWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903D606A338
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 00:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7903D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so12242135e9.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 16:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794269045; x=1794873845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=YN77BDj28AgJIKBjQOvbV7gOozPi0QbWFAXmF69f0sSx+uC5nwG5WFm+q2acmxICIC
         jU3ABme9xOBIXz/YlxDAATfhxn/I4Ek26jZ32MsWxTv0SwHzXG2fchiOJvHFbpt9q7/b
         iagEpoRSfb35tW+6AJ6KUtAKWTQAh0CAXMAASLbNe4+1LoGFkQVCkNcvxgx5M5Z9ch4r
         gqNuq5qri/Qe6gcGW470dXFscsCTziXLbFOr6/jI+rpwaEDBcPUuRINtNUmdkVnUTqhk
         XsXtyU6M26x36c8vWDq80w8Ran5mIWbTd9TIW9sJPUYuhW+dw8H0k1viQLJvoqVWy5yR
         7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269045; x=1794873845;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=Go4FocbNJUkG2OQSm4b4AAUC6W7/e8AcMlvIniIcAFFqK5ji49nELwzy8zXrkQYVds
         Yg1YeekNx4Xo0i9kGsJ0SkpbhRkVskW8aYFYdDJZy7pe/Yb6HaTr42hXpUKwm1Ll/Ynz
         9s/8pM0BaSHVU7fkAFi99uF1sU+Fe2iDRRFix98r7YZ4XlIHujdhiHd94+8O5jHqnuJe
         XyuFGviFKPge43GSs12O6tW5pwaHOwiRufpP0zjWEunl9YVjY3zWf6jtr99X2b9dBMZ/
         9zau1sZLmyRg+XhCZsdUfXa5QHY9JFafcC6R8waPg0pSFQoSi7/pq9vLda5ItdCPBpsE
         l5xA==
X-Forwarded-Encrypted: i=1; AL+hErHwDlPWaHJtXLQXf3MlECmH/IGfkAsRpN7/NBxwET1ek2InMBFwgbRkQ+AZ/lp2UVcKe2A0rW9KLuZMFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yioxixfNDZaYFPYpYBM/sqAbuRBR9UivyBERm31/FuxpxcLrF
	UI6OSGnCT4/8oyI0R8HTADsTt4hCMwUBD28Ju+sBmn4tXuq1MYtDsvk44CFKwATVfzs=
X-Gm-Gg: AYBFou0KL6XhGC1B/M502w4X/1tRbp4WAX0zRhyTX/mfGYLykbLprU2oLC6IUjheNct
	HsxIoRRIiQ/6xgvULsxS6UXPAfFxJOHPNXnVpnY0bER82so4zr6YIWDtSq26a4q7GwmDYy4fdtA
	bIwlYj050PM0qlxyKxc5yX0UqA8xZIiWtqeUwevYdsHpsnKnvTgIVHpJcssZcQgB22bGsilEsJC
	BTphvrT9Scmz/TpjXQMT5XcqSNWY+X+3Wc/kol9R+4/lZasmDRTBV70ZNzYZ7vGZ1WPX4W5mu/b
	rtosRZ8XgJuRO1aYobydEadAT53DTNXIX4qvhMpJlYz/CJBWkx6wJKBbdZKhxAr83tiScKHNdxC
	kTG++Oc0fUjjS+gvD2syG8khEaNMhYOynPPFhbcE8hrf74FXW/4ggsf/pDmBrnvOHDcJhpGJrZA
	6sxQgAm5d6KOrpO4f3CyiJvz32cywNlzHLVyfkj0qX5zJ7M4WvzRV+4FMisubo6o+zC8tr4s01Z
	LVBXdQfcCl1kV4ZeJXdnCaYMXYPshVH8kNt/RLlu/Y1yahWqVKes48NGYRYUgwzXG4AMwk6Buyz
	jAeZUmJNw2HVs/pYnKDkdLUyJK5j93+4SZ8Ft0k=
X-Received: by 2002:a05:600c:811b:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ba02344e46mr9602805e9.19.1794269044761;
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm38245075e9.5.2026.11.09.16.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Message-ID: <fef23213-8ccd-4235-a375-c00aa540bdbb@linaro.org>
Date: Tue, 10 Nov 2026 00:04:03 +0000
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
Subject: Re: [PATCH 4/8] media: i2c: Add Samsung S5K3M3 image sensor driver
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> Tested on an LG G8x ThinQ (SM8150, CSIPHY1).

What would be common practice would be to post patches for the platforms 
themselves - i.e. the DT patches to test these changes and view the 
binding implementation on real hardware.

---
bod
