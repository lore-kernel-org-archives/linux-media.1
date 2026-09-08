Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748032E06E6
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858279; cv=none; b=VrisHmVdbSc/612zP6ZhMjYprlSSb05txCydYeKSFrdpukH2QJIC5IJqaAaMiNLY9r/9rEGZTNLRJv4iA1KsjKWU7dTtyA5HD0HgDotSILvy/NCD3o7DojXQLLeeU+5bvdfNzhbJHg/3N2OLx567nMQKdDzXor1PWezhAwAQAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858279; c=relaxed/simple;
	bh=fd4uQRKYnny77/Bik4CEh4j4GRWixJylCkkRTAY1Z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqxmmtbvJQsWalv5/kTQfzSD7GA33MY+9OSWwRHJ2pOUsPY+yRhWzpAkM68iUgQvz6F85jaOdd1GrGx8Nk2sXaK6FEo3qK6nWIH3PAGOTtp87kodyhvtYK3AeCxFbTHPQ+3W2QrU5zxrik6WEva15TvukULb7vWXvc5lNoKiiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aT3We8aA; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aT3We8aA"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60d5so65722666b.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788858275; x=1789463075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jOiAPr/lYhowaNGed4DcrBIROTXHsiVna6rmwj5qtY=;
        b=aT3We8aAy41hynQfTPrxSM8iyaFXUWCRNsRvgh2rLxnU2E+n04JcPC2k1Vou7vbbF2
         N/F/NTDSZQ5GgmyfsjRDJ7iRwCR9sw1+KBKRYjVUuGycioGLyh9KZnP0nzUqGR54FrOw
         buM9o66ckgCOaGdhfSV8fdJBMy1ZgTdMC1Fs0Sb4l5h0JES/LEup/LsLifxgCn40j70P
         hftRTKII4JWsIov9GFRHCbLiVcwejV4sdp/uKvpARvtkybnr+Da4is8urf3yT4s6V5ad
         f80gMSGYgPPvi/DIUy1VUbv+geGqZqe9q1vz6NVRLSowy8iu5BlvWg06qLh7paEPPVze
         EVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858275; x=1789463075;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jOiAPr/lYhowaNGed4DcrBIROTXHsiVna6rmwj5qtY=;
        b=tGHky+vmlV795vXkBBkSF/YikTmvJ/a0VUINRdDHGOA/aTW6cwa0Kkv0IsYZk6PrT8
         kq/Lb7Cz2Gn9Ofd8dZOaNzNcbyJlalf/ld5rlXfuisRFVixicIPowxw3mMO5t9rjvJwP
         9pDUJKbigIbEsfxRmSj7PL0AJYCDw0yovE1j8kgGjbyRPF85dRtrbnAQFEmo0H7Hg0al
         wOi3ZG9jthG7obq/Hf//hgy0FWt/zXy7HxNQ/LdY5clqaqZIxI3taNkqEvPb+M3K+z9w
         g1PCxrYnQ93h0JgU7A3i2vF2FwO/jXgvQYHlHw0EwRttm0q8WC/nxCds0ipiKvjeNcpj
         99LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr3tzDWyNQfXhNfXSiJx6BCzLpIMMvekJa9e1m+noNq7Y5yiSYcZJMheBhi7b2DR6jSrc5WLPqpX0xgw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4Dnpye3olqvxexX5z3aFRwsbOyxZbEQ8zkjMxynowW2Ol+Ebi
	wICEcX/j2vy1wNeTAarS1BvJZRdaShCP7/FtnFOhmDWFrC7Ry8wupON2E7bzjKkC4URKbxR3aQ9
	VEB2ljK0=
X-Gm-Gg: AYBFou22Bpvy7DSzDGT3pfmnEEPL7ERVFttOZgi/cdgBl13kD1WObBvBDtloVoEEgUy
	q5pF0dSo/ELtMV8/QmjG82Z6Fl5vZJx59tyNizsUm3+mYaywYlxsG2uBp/Bi7GkhcprQuNWYPzF
	NhZ32rIFsNqMcVqEhUVxQI/xYel1UQFh2h/8Ovips0/v0Aa7CYwN5QHcaXjlOxB8TiWytbUjHHK
	R0ErXmkPampOeu8MSzAvOsGhSNbarb2JOW7jXG6uwVbzXgqKQsLEhUcMkkszB2HWUpjHeQ3Wetz
	1uc6aaj6EoKnsoTSe10tnlpzwVmxUMl0cyIAX3gegjvmSVcPY8Cu3sXx/xO38GRfTHKYoUkucvX
	5E8xzJsywF2NYNyjEzb0/qJXjDK+RE+gvbeMgNTM7w9DF9o1Hzv3ZfKhNqThUEMZvGN9NNQCWKn
	MsoWd+2lCpUV8vVxnGHpSgEh5Hl9NKX/kC8x9CG92aZ7TVdQgIEoA1cRBoF4xxZq5sHmn7H5hD
X-Received: by 2002:a17:907:1c81:b0:c16:6dac:a008 with SMTP id a640c23a62f3a-c2904315bf1mr256440766b.8.1788858275130;
        Tue, 08 Sep 2026 02:04:35 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm580109266b.46.2026.09.08.02.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:04:34 -0700 (PDT)
Message-ID: <ac084a5e-2767-45e8-95d1-db623c80ee2a@linaro.org>
Date: Tue, 8 Sep 2026 10:04:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: ov02c10: Drop duplicate register write
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <Tms-fUHfw0sPf1-YX_rgSNq7z1MNyvtfCImHXhxAUQAoTq-fwKvZF-p8a3ozCxAJ7kJCo-lKEU_JSkfUJy6oIA==@protonmail.internalid>
 <20260905030732.39196-1-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
> The second write is redundant; drop it. No functional change.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>
> ---
>   drivers/media/i2c/ov02c10.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cf93d3603..6220461fd 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x395d, 0x05},
>   	{0x395e, 0x02},
>   	{0x395f, 0x00},
> -	{0x395f, 0x00},

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
