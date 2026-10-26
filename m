Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005732;
	b=4S7ehOqgR7yuIE2oTPZBgGW1d+/aHCIP9CyJA35bweYjasx8qhlvQTFWzP0NVElpol1R
	 6QILi272GgMUQkOabbAMeEUUNq42EFZOhRhr5nz1oay6V7WBmq1TBkLFrQM/a2ilQWA4A
	 htd9HKLtWFwHr8lrXDJpvz/KtlOhq/n0GCC9qx6phRs1z37spp2kKjLN6METbNb2l8UML
	 FC6wegdv+Lms6dbNP2niEpw9osVeU8wgVYEuy+vzewXvRpFbamrxhQ06CeSLgA4MEOlKF
	 q6BYXgwAjF7kGyHc3iDqav+sZF9Fdk4hZrRPYG1HY6PpNDC1ulrIc0pTpC3SOite4bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
	b=xRuKZPg9yupU50sUydZl93J6jGhGRl0J8c6hI+iumBtCrEJoLzZdvu71WzwrbZ5k+dHE
	 sRWeZrjDmO97frYruF7oigJTveCqdZ9TMEVTHPBuOfzchz1+uJmFCAthfJkMYIXXqOYcQ
	 n5D7tQXaPThugXT/apiZFriNXyipBU2c/t8bsrtstibjjdyzfIYa7VfdPBeqFbW/BUP1K
	 Pm1AEgkUKX7u1omr4JUDraT3nl6+8SujvTDwf2CEp9awL+TLf7YTF9472L4Q4qYhRL5VH
	 +OKSS10P5NOJEpx1/UkPjhkmneLos96a0riXJ+3nNlllwuRRLNbpBXCOKgpZHeyTpHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAD606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBAD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X2OOUp+A
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so732705f8f.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005730; x=1793610530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=X2OOUp+A02CXDZvu8A20i0A6Kra8e4XDde7P4W/y8Ml4B6cdCfBkSSZbeRW9XJ7pfi
         nf1zLDFqoX0M1m5ST91pY3FVF0iZ+yXj92VKjKXpuv2aFa5fX4+KSHpSwjTnhmmkzQN9
         LYM0Wx72tHCgBnmCr2VjuVhsdL6lYkzKHBVImzyDavyCD6owRdMEIY7o1EP4oHiCywgl
         ky1O+qCDd16rZJTLbn3RmrEt3mRNpANDxIAcT9uZeEzNE1NqyVQHZT3vfhMxKeJ0ybRN
         ci+LCHoJ+iRHmcuKntLk0ExEcVJfSZBGBWq3+VGeMBX7qnIO+KUxtXnFSexb814dyljs
         isng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005730; x=1793610530;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lFx2w6bCJuej2RXH2wzPTTzm/dZdmmNeuWWjCPk8mY=;
        b=R474Nl+dQaOGWaNvk7eXlg0o9115UT5HXFSLK24GflGhkjSRXm7fGUiRgW1E4FN1pk
         GVQ0FVgQV0gzSHhXaziZ4syAiOEvDcDZVt9AwFm3Y+DMvvEyfJTfvrOHTIye6a901mZq
         rANkxRLJiQg2BYo0RqWWERFTKVBlWoCvOh+Flmx08XPa+XtlysEfEcsGH0Wptuhi6bmR
         2iE8tios/g4Ujiv97jCL+WPIC8LrRC/zjV4btULQ33Av61xCa+emzhPhVwae5eAZTnio
         4zNyvXFYo7vI3w7IKMbymLaCNnu3mNAbRxFo2JOgCZTOtgZEWjKWM8cuYRn+bfXiFJCm
         4ytg==
X-Forwarded-Encrypted: i=1; AKwUvBw3quGcDC6Z3KQYTr9dnDQlJuHsE/5yumU5kWLdvsGph0MnpWL5EsSMGdgDbwtkFwgOARs7LNCXLedqSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+FQ2bRoovydYSzwAIvb3KMz2RIQKO8TpV6TdgV8EPPDAguE6K
	nbdkkGuKCW522A9IM/QAykv26sZcqvAeroyZ6Cifqex/wGHJem+dtPCvRj4wE8+XTAY=
X-Gm-Gg: AYBFou31mszp6zsfCWJglorktMlL/6vYpMlazgRHkEbXrZHW66+MHn1DBx9SYduwf6m
	THKs4XDRpn9XHsLxqNS6K4l+c2lYR0wkw7tXXyB+5cYZiccIOjpFZq/9wACkleZQiHQoDqfKRiC
	LIMUjlY5QNFsSticTrWKdq4f/6+qmm/VeJB/oImhmLipEqfXNS3OWcYP39lTYPyvE7G2p967IlZ
	r7irQtB7QFU5Gru14oGr2RWWJNmbqhDlCKda5Et7L3LaNqSfHVx85/eMHxWU/No1CjBmk4WVzP5
	5ZYFGI0/H1uaQvXlEi3E88T2H2QG/aSSwW92kkyX9bZQNBrnzUGR7ex2Grg8Wh2rxHzA0ein9I1
	l84aTEf/Q8ew+jvPxf9e7DXSpLVRvH30umQjnGo525au1xqnQUy75cAz9AUIzoCyosvVWTRLPgd
	1go+ImT7mRDHgjgRluzoTUw26n1t4Q7eamwWBd7ymnQd7BRRjbrpKpLQs/Q83BNqS+b/5erK86C
	8aBLm197tAYYzkeGmcWo7hFIeo7TWqXpP1QEMKleL7+PJa/tlmLntwSja1qt7hyOGg=
X-Received: by 2002:a05:6000:2312:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e3eb8b4c5mr11452297f8f.22.1793005730243;
        Mon, 26 Oct 2026 02:08:50 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm14118984f8f.58.2026.10.26.02.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:08:49 -0700 (PDT)
Message-ID: <2665de15-dea8-493e-9a24-1c12cd9eda3f@linaro.org>
Date: Mon, 26 Oct 2026 09:08:48 +0000
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
Subject: Re: [PATCH v2 3/6] media: qcom: camss: sm8250: do not set VFE core
 clock rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
 <eGhL2aGIqxBFBKgd68g6t_m4p17F_a0I12V3BQjSCuOQ0HisGBIC1n8Oh4dIXGvyIEEJBQptPK1TAGQpg_ik1Q==@protonmail.internalid>
 <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261024094027.3095475-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
