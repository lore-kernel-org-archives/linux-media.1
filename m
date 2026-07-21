Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F153E43C077
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671403; cv=none; b=t4Ypb8pKmZ2Q6lNvuzh2kqw82LMwzy6i9SiH2z6/6x9S5i07HiKMwn4TWSMlE5hVXvMjAbu7+qO261pRGV+6OCJ8lIAA+hg39yc9z2Y6X1EDZFG8U4mvfpTwmrjInrcaa87n3tIVyqXDXeP5d6DU5GGs6Olu19o3+QOVkem7JjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671403; c=relaxed/simple;
	bh=NfxTc9u1k/pJstjrOpPCWnueH31m1uLTJjV8FglwT7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKa8t19ia4IkTJ1mQn9YffHq/cNppnTIJ9YvGliIoh0EPLsbyPHhhXpAVOd6u1dUB/XXbtpN6xKItC86+/FMsJJwSRiun2MeZ99MEqJHiTwku1QL2HjqKYqZgE8OM1pnEERwjWg0ppzvxYItHyEeQz9ZyRuzeJLd4gK0tmar3V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ErWd7r/+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ErWd7r/+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so29751365e9.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784671397; x=1785276197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=87xm0pVIVbAME9LD22FELQ5TVcZbO36WZnkYbB9lXfg=;
        b=ErWd7r/+Ctjkavrf0kZB05vkESWKbzK2ni8ddrEFGhGpnbX30C6w7H47QQGn1Yz2jw
         rCXGuCG3bk/ZZFKLn7cOfFCAvBO6GP2FQhvzc19rpi9fjWh9aE5XZoIiF96LonGuKjrY
         8h5ZOsLJKFUz86CZPETBxGOPDRDEvuIaFMgHwxUKGi/8h+d9SwC06ZNPmAQxHqEeO0Y8
         kB91Jslvd6UVuSrdp14Itm2/IzW9hgnTUsSey/G+DL340noyCaUj/pRvEwWoIunt6iHf
         /D/qTXpgd0n8gPUKtZy47MrMa+YJZNjXwQk9xQjWSlH8Ri1zs365mrrvboDfjVTNYQSh
         1JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671397; x=1785276197;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87xm0pVIVbAME9LD22FELQ5TVcZbO36WZnkYbB9lXfg=;
        b=ofNMTak58VtsGjjK9cUBPWaEOAn56qW24PPa+1cmBAwJUYHYBHYDJBkEgcViKgCwAI
         sf36otS+RqO3a3KnZedQkQYKClXTHqn6fDB2wFq9xt9Z9EiyycmahAt3QiVLW6SCrCmj
         s/MSFeOQirO8xnQy0YyvnWbLDqfEEPrKB9tyCcoUEUbrphjYua8tN/J8RWRCU8+1NCx7
         MHiZG0GkEAt0Ru8SwZqHl5TBCH0IoIhqXOcAEwzsp9t3ucusOTiD30pkZaowq5sVrqEN
         brTYqjyD2Y3MucU+pQSN9BNE3O0BUojf1lpyvSFkRzEIsOOwEc+GAAAIwWQBBuBEFtJk
         /fhw==
X-Gm-Message-State: AOJu0YwTyIdG5CFdBph6jwJ4whnW//CiewFI7cukiCyJJmwtDkVY4g0Y
	ywJmnyA7K/tjmqc2ErMVO4HBUE2Ec6q3a2XtW4aSEoZeRB/R+5ma4+FQ24tfp3lLy2g=
X-Gm-Gg: AR+sD12/F5JkkPu63G7OG8f/2oQnYgKaZUVLQCygtdk9opH0fKrrBX/Oyo4bC2yX8Dj
	+AQYldHUKQnU0rKGkkfSu0FBTiKunDiqsr5zAasX3ZqIZHqS4YJMtgujg4taTs/6WcI9++MYCLH
	qpj+2Ndp2oRr7OsbnHHyN5AvSztqUbYeWu1aNOZRWBEBtJ6HnfCQcRztR6X7K+j0xwD/llxhJDN
	W4/GPK8SlF8b3Lc9ae6JotCpan6IZhLH06cGqZIGFRWoSATrVyxMKhB4m/THxfanF3Q2isyM+6d
	bYZrPJEMZMA3pawpnvNZa4ZqvEDU5v4lqMih5R8M96gf3qYeAJ5XADKrdDsDl7PMMUQBmN0ICNF
	I+4AHvr0rYTQchIRyXrWl7znzE9mohQIBI052DV3l+JxitWtRTHor13uH318tW+3ucassndlk9h
	WYO2I8K2pY8t636GA=
X-Received: by 2002:a05:600c:524c:b0:495:4cb6:71c3 with SMTP id 5b1f17b1804b1-4954cb67f3dmr236177625e9.39.1784671396789;
        Tue, 21 Jul 2026 15:03:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda9bsm42531829f8f.31.2026.07.21.15.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:03:15 -0700 (PDT)
Message-ID: <58d54373-9544-4d97-834b-f0ad74f70864@linaro.org>
Date: Tue, 21 Jul 2026 23:03:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <aTQi_PnCsL-z4uzSYYbseiwJeNmXnvMEkkIN2x-JtN7_TgDH-v06zQ4-Kw9D6z7vmaZpb4uxSS9at2WydfKoqg==@protonmail.internalid>
 <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 14:21, Loic Poulain wrote:
> Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
> lists. These clocks are now handled centrally as global CAMSS PM clocks
> and are automatically enabled when CAMSS is runtime resumed.
> 
> This avoids redundant clock references in individual subdevices and
> ensures consistent clock management across the CAMSS pipeline.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
