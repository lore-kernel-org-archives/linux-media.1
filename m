Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B953E9C19
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404106; cv=none; b=WAQc0BiFzYhhpCspjVMvL8bQjWCwHzcPieqaCZlf70/6QATMOiWyOmeEGdSV0sTgYjpM8ZI/sVwkVrbfivyWNA3rf5aBCjnoYpsOk7rRfca1gPLSqoI0OmGdH4LmsStANehMiyXsZyUciSGKBVAwWwNzwA9GAJJVBN2DtgiINzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404106; c=relaxed/simple;
	bh=WRSKlHcAwr3G1F+wQ5iSAxUHLgUwnf9+Sax49YuQ9XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzZBocDk4ckbaJ1mWcGS8I0bQftd6DY2cwgcQJ7k9VV1wuMUKmEPyU3k9p7UKOK82Ce1w8zy5xZswktuwVh3nUq/SdKfc7kO5qMOkQrAXQPIt3quUagx5soRIlKSDFZr6PQnUxZLE3j68/lG7w91axNby/ww6eYd+zYtw1OWqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t4qlZvFY; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t4qlZvFY"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso2977294a12.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785404104; x=1786008904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CnUAmpFzxzwhVA75taAM2rHQHvnmLOjgpDvXD3WMWyw=;
        b=t4qlZvFYMa5JZKh8Ev7Df5Zjwm620FeN/hdvu6HIr9YRtv6NREXmp7swOu4kinPK77
         /V9IvT3Jy67a9ZP6BN63FVfp2zjWjB6noEg5QPoQc/mJ7D8EHH1Dp+/xVKbI38GdlJo0
         IJRoky5M5ENlDAOUjqRx2GmXhoDCaBjgD8WwbRisYNjMs5l545YqSQZ/tkQXN0FVqFJF
         oXqlA7YyJwFEjnNTXo0oCSQT6fQkQFHW89w4xK/vpasYLE5sjoDbtwYgZzv4QiTD9ZAL
         bZhdtNBkyxllY/lFKEugb0EvPLhWy7SE1ubx3SnHZKBLtTk0knvjh2K+2uUArWly0X79
         FicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404104; x=1786008904;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnUAmpFzxzwhVA75taAM2rHQHvnmLOjgpDvXD3WMWyw=;
        b=sSqY3G7wAnFOQbCpPTvj4quvtkCGdNyVwkzzuIk3KsGaP9/ER6lx8bv+pKPXF3fFG7
         S1wDCPlRP4WJrwIy5x0FLNdOQwmC9SqzinCZKjdg6xBPuHa/XuSUK/S2nx8NeSuBkmhL
         cyWKNUb/KIAwIcwMY96/qdhaw7y3mEU7ndqTpEAPTp5BDZ9gnNha0aaWs+BgXXFW2lD4
         a1HncRlTFCjfYfwXzkw84Gfl0GwHVoq6eqh8IkJrmRx2pkBGVf2opBqKtJlClPaTCf2V
         QXAbclGkoB9l/TTWUP+LheOwb2gzYVB3rRGXm1tF72hsYeF7e2CVtd8KsQem62ggiIMr
         8Giw==
X-Gm-Message-State: AOJu0YzPmgOdjX9WIugV4J+Tkg7yR+cTWhHabKABzj4udp7xddZ/MV8C
	3jllfPX+7LfTp0e0xQHsyXpd9R8pAcH2cSebVdz8RRRU+BD8U4UF0q5VbNCn1eEao+0=
X-Gm-Gg: AR+sD1099p0p5zrCVTkxYZKcDrIPaY7kzYj1FeEcdiW9APfjhj8Xz47PhbXGpZFWMAe
	Z5edcz/LqB+4y4RBHGrXYO7Ws0ihBDIIu6QgtyB20dk5S1g7Ad6rjqSy5E/X0OW+OclzE68FM59
	C+0TNJ1aYSwzDM6Pzyu7nLu1QOVsPaOuNa1zXWgLj4LfqoeUAl/L+cPl3GS80giOUy9qf2kU6Te
	czUgxCN7gvMr26poOTFXp5TKlEW6izsKn/bQgS68R0rEprUXQue7xLLHbqJiRvyCIOXqhwhIB3L
	9X1asuxia5p/Sscjwo3904e98aAzncUHBrLigw/Ap5Lyu/esPeR+NhrsW3ta1j7OlkD3owoRQEu
	++jcWmQNwSVXueCmtcJep1Kw5NaNh4PHhse4uW3MzxG/v/8c2V2972Z2n6r/GYsNEAwsa9m3VLp
	o84o+9cVb5N5vDm/wUbRqVmkHi7Nea9pJMErxBcP48mWwMFZ70BVkS6+ekdrfiom9FcniejJrF
X-Received: by 2002:a05:6402:42d0:b0:697:decc:7f9a with SMTP id 4fb4d7f45d1cf-6a07b7ebcbbmr964799a12.9.1785404103643;
        Thu, 30 Jul 2026 02:35:03 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d4a8e96sm404347a12.30.2026.07.30.02.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:35:02 -0700 (PDT)
Message-ID: <a880d399-a39e-491f-9724-c892b1a7ac5f@linaro.org>
Date: Thu, 30 Jul 2026 10:35:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 10:24, Loic Poulain wrote:
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;

!PM_CLK this is an -EINVAL I think.

---
bod
