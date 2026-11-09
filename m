Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244679;
	b=N9D+NL2sXL2s6x9K+xO8UBEjb69FNRzfVL3B56RXXLlVmE5ZfFj3LZsvI2+t+3I/kozK
	 wgwYsldmUTpVKwgx6p/1u/l/GHlALGQOdjVruh5Vj6PVJ2Bd1uqQ1f7kWDmVZuJlHx7Fv
	 OpztiZeocJfLbCUR6yMwZljhip9gsuvGziU8kf/xVBTyxUqy6PdAyvvvEH9bb49uW/zSk
	 e6sLHx0vQR0FVRzriYXkQeehqbBl+HB0vLVPAs1pCSonfmUrQBcRH23o2xSFmg/dPYnGW
	 B0Z/WNqdojS8FN4gsZNDAJDa4CiE1T2iDciNzNMQ4JvA9qvEzlKdi9pTsHkOyQH/C8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
	b=ZsckgH/2N9oXHOdxHZYVUzbkLDBfucI9IAyszykv7/qSxrYvichycne1iUxH8A8ObFab
	 jE6kgbgi1TEPE1sJbo9VaFG98dgCGr5HCCwoy4rpBY1pleQk5xVzn2u4hgaO8CMj1D3D1
	 4UgIOfGzBE9B2Aw6nVJ+yuURFRHmt5HFfJSwU+TivgCukXfZ+CRSBV1PDz1hx55bRBpMd
	 mN1KyIClawd4//k248HpqtowSpHHtO3i8i1k9nurDz17r8Ys2fn8e3k1KoRu6ygLhdwyA
	 KcrsHuwZsxOBp/UiTsoZL+nRpIM/0Wr7eZ2Xd5vVzLeT0xZTEaRNruHhkWZ3tEWATAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WjEApXFE;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E53606A325
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16E53606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WjEApXFE
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2db6408cfso610650137.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244677; x=1794849477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=WjEApXFE1pTnIb+KmmPuTjctaOkqfyxAgG2LeCOpwF4Csad+fG/qqRpt/cdm+D9G0M
         1pP6PJHRBFg+h1ltlJZycyYIwFiWqylUZAVSOsK16VKLgp6XHPleHVTM6rVuNCByXiVv
         4GTwnAMk/drrkd/D3ZbjHpDr2NszDRBGF9uxwvxqmS8/RVEpAD3b6VSI1JpP8wbgsZO+
         3Dm8KX3Ep3EjqFPEmwpzerftrK7VnpLb6691tL2/9qEXtnhFhct8uouFz96K2gI0P3BR
         co2shXK4eXnDpAiBL0vkj7Hgr/VHsOhjzAi+c8bFoVsDz8wMffsgYGQkOszFmGbVcWip
         KC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244677; x=1794849477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=kVZTltMj20t9tpd1W6qE/53u0/ceaw691l6rqQ2lCEmoeDR4o3vdV/voEH3rqiIoGy
         /DpB5F4EZucGyH6FfaOO1Qpgi9PRcc+0j4U5COpXGOmpSl721+ufkloCVYI3y2/sgXsK
         mDzFbRJWbqMw5D2NckfD8rcOTOCHmkX1IM4w8JdTQUQzWbYFKzjzA0HApan3cEfnWxiL
         /zgJ4hSeBiw+viTHlzioiP0LsqtXPnUNtNug2JOOWDqrcAP6u+RTrgGXxH58HpKf+UK1
         IEfkTu9dSiRDvghIhQQvZj6OnFiCV36tVAlDynWN3lIcDNBY9baD308J8oBAvdco9VCP
         kZqw==
X-Forwarded-Encrypted: i=1; AL+hErF6YWWXORuUScj9d80COPw8qrYKy2Exl9eKfv2I9qObAQiRrfEzpPUTgn0r+tZyDbKc7Be48EZf3+76yw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FXLzxSZuATzGbt3e8CHOjf9dLhwLQvClQik2lhfvQVNDDYdUF
	AbVhkGvruiFpinA9GcZthWV2n7VRCBCLQj09pTwvdFMCMX3pTs86zIpfJvrZRY7it14=
X-Gm-Gg: AYBFou2XvFc16aNHPyR/dhksmS+k6FeHV6BrIOsvTNm9TriUt7ToTqSXdZCAPKYCRBy
	eoIKsbjsxRrtUKwerqnGd/SeLztLEyIKAvIY7aCqFJZIAS8lGvxyHS0p4wchmYZ3sHvTC9R5SuG
	fChvzkx/2AvsCQIjwTk2muuLAbBUYAao/FApHu5JjkIFXKGVZqNrz/0Tnxfu5AkMjInqBZ91OE0
	lUSnjPM6kInPv1sExCyhy2Tr36JAaAxWCUmX57nCYH54oThHZplMrm7VZmxqza9JtuL4cMDTyIk
	JSngf5jTkvahg6bhyESTR86XNjSPKStzC4dY6UUVwN/XJWZtJBxaBpdnlyZmuLUUg7vhFyItclN
	uz3rhtQV5ctMh0ATU63hWaeCe7w4dOxVaxhJQ5H7VWhk0dJOehpuNPbrubxjtgWYp/FUCd0I7Os
	vDqWlm8ZwCZZs9FZ5iVjSbKF592U+KEjhe+J80lO+Eg15pxD/LN2CPy73qVeVsBFP6ZCEZP3E80
	t/c7BjvGEQOj60F6syEs6uibCKuONxyg/xDnJjN//5AQ7joV/HOiJq3nEVYxQIp/rvAQy/28LUV
	yvOZdqjXH8g65j2FTsIfwuzjllwrplGz0T2n0Sc8WD1caCcpYS99bI8787gnAeZpkZJv
X-Received: by 2002:a05:6102:2922:b0:7d2:b348:6355 with SMTP id ada2fe7eead31-7d2db26a095mr1451337137.23.1794244676733;
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200838f0sm156302241.9.2026.11.09.09.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Mon,  9 Nov 2026 14:17:50 -0300
Message-Id: <20261109171750.76883-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-3-allan@fatecpompeia.edu.br> <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 12:57, Bryan O'Donoghue wrote:
> Requires a Fixes: tag

Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

> This feels like a slop-comment which is no bueno

Agreed, it adds nothing. Dropped in v3, together with the comment above
the function.

> (pix->height - 1) << 4
>
> Silently truncating here is incorrect.

Done, v3 writes (pix->height - 1) << 4 as vfe_wm_line_based() does.
