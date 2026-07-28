Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A341D643
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229928; cv=none; b=tzmXjAtYJKYOVDIDyuG+QVN0T66qK+cx4xniO5BMiZmlISRVySMGLm/jvUG9RGzGn5mj4jBXQOpjpk3WKXBHXnj2RPfGPwvRUe2OdTtd2BQW1Jwv+nIlQK9byQPMdRla4D96+pixt2IgiNV+zwAJy5M+AF8AfvJhNfYX95k+6HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229928; c=relaxed/simple;
	bh=kgErTsufV9ATBvVYA8GXFM3ncLv44xFl+o0icwsDL4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USAjueLeH8iON6IYEr4DHSlw+xSL77hwDonPkMnUjIxlrwLHR8476itVEG3HFkJdP/vewCIz/TB5yNvYQdHOoka3QNWgiNTgPEepRWF8lppVG36KkxjxU6uUbS82+y6jiws/DtVo13VYHyzoziZW5vX4pZh7+H8DGDvIwq8/f3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNiSA9ok; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNiSA9ok"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df43bfb07so709860f8f.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785229925; x=1785834725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=SNiSA9ok6B9SVibXBAeCg6/xdj5UK65PEVhfUcwOefBRkWp9/APPau/+x/eEOFB5HH
         iLpSLe9aL6NVAA+tODClnu+/8xjK/+IVdjnTRhV1SOs3UFTEHwsk795ymeuA9KYLhDXi
         3xya/t4/AofW5iraZur8l+phEG+O2RsY/EkNDlPrfCOWWxpdzLc4Z/oVOrBIjC3MuRUd
         gqfNVod8DndBxn0aVtpsDoG4qPz0J8Nkd/a8sKcbCYiJOf3ihq3ddwgR4cS70pTjnDid
         N0yCEt0l7IeFwEfWWGUrFvc64gidd5WGQgyf3WDfdYCF6fsp11W64FewQMgh32l31jIb
         Tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229925; x=1785834725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=iNnLbJGoDtaU/hqf9T6JpNdGapjmbpvB/46G23yyVXSHDy8f48AmdnbDku2pWqpliW
         m6XXgeIyvrIrrLWIua2QxwebWcOhR8zIyHuuCuHvC8DPV4VwfuM9x9sa2coA0YnhniqF
         jKFXNCR8264lTOCa8oK7BxXSIxO2b8TmZhG3uCKJ3+qUQY8d71CX7MswZ+YQx2WoNn8M
         qdY0idRKxqF2nGmuyBrAYT4mSwxKz9RPNv1JPh0IyOySdiHV6HbWBzphkuzXiMSNJWFe
         3knTKUs7Y3N4rfIRTsKPEgqFDS2hg5z7I5K0xn5YJwNbZ8enq9qc8ldLawEn+pSUMnIP
         F9MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNx9xQN2eLYGKXRjF9aKlVXTepTWa1ixvQ9tJ/jAdS0DTQrig78TcJ2wfwY5ObLjVcOY5R3mUXRbn5WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUi6EQEdJq+HWEOAktaUC6hNUuUfRjbs6bNpQ0M1MgBncIjgNt
	ftcPi/u0igelwE0n06fnjXiDnccnY45rK85Io6cArLXU2wETM40HMraqul9quu0Lv9o=
X-Gm-Gg: AR+sD119KRM6i3y6bbYuCNIBSTxE13SWJh/NK5/MgdrqprI5dmK/OrVlaImHBsQU4OI
	mIRmtvfEhIjBJvnWXJo+tk1XMpyHzvj1c2B4JFPdHCmkhtsyvYFw7ancb58Le9TQdm0qyvVxT9L
	FK1dVU6viT3TeB/NMWvI7MYUg34/qrPneBqAjNXcAvTqUSokcQGqLKvl0BubRx00Sk5qmZbtZxL
	n8tZgpka6zcME0MMGpgJKa9C8Vwcf2PhiAdygJ2ehDEX1HbVAnXT8KWYwkffh6Vszj1Q2Qkn3v+
	Wcl39XdK+8jNHygXLpNm79Kk9PWLYjTh93Flefl2G1aGaYiM+RhE7qqIK3lreMQxnFU83wY/jrR
	ZYMqIL7sXC3cKgnfhdPmLxp9baBAhUi7uR6pR3hmIlHsZ9+CK/fM/1yApo2HL5h9DofVSTdNX6t
	z0Aeej6VVpDRGuQTfv0o3lLHfs
X-Received: by 2002:a5d:5f83:0:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47fb1edb552mr1578570f8f.22.1785229925096;
        Tue, 28 Jul 2026 02:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm59809618f8f.31.2026.07.28.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:12:04 -0700 (PDT)
Message-ID: <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Date: Tue, 28 Jul 2026 10:12:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 09:25, Atanas Filipov wrote:
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>;
> +

I'd expect to see MMCX and MXC in this list.

---
bod
