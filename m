Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0F428472
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784755275; cv=none; b=RZyBFCJO7Faub0rc49iw9ivyaCHkXa/5I3OKgQRUETvKdz4nVLTujRitaxG91aD2cHi6Y3hzniaiYBr2kSXqTxGGlkYhLBVgccr6wVDn6rGSbCzotC3KFZyiSpwMQW+T3V5jUb2hZR72GyTlSjE4l+aSg8j+a3ReeEVl/vW+RbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784755275; c=relaxed/simple;
	bh=jLxIR8/arA6y0SLDu2xu18umhCJg7Mr/B8usW6wre68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1ehFMDzu/mU7+UzsRnRbtuTnr0EkVXhZodjx6/zpeyBS5bAVRpWJJVeHvdg2xid8cBTEguLm5kHb3+hjnoFk58GF72f7Tlcx0IR/e6Ld9kmhD5IZyTB/8aH2c/GkgGlkLSEuQYY3q40dNiAfo7zPyQpsjjv29BWaPUanBp+eAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3D66bvR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3D66bvR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so95179755e9.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784755272; x=1785360072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MetGCHJH2H32CloHxU9sTuHEKcU3rsEz5bg6J0iX7DM=;
        b=b3D66bvRbpugWEw+Z3NCZK2Y+lvmGucK9Qf4M6i+5xxV27SUEh5JYiVmrYMn4SVTyk
         0I+k2Bqq04VUTBJHrsZSADNkLLqZUatZ2v0jq/nXuo/uWen5S97inxZg+TmUylW9yhhl
         XeqCl61i0s4uGwBT7byNY2zw3IGb4jRwz1gB2aKmfK951z2cdd13llA0QDwiPyu++NWP
         89kjtUA/jKKtYmIjPAgoTas1IDkqNygCy5cTa0EoxD/raH3q5RofsP8gF44UvF4aPQTz
         CrOXUO9noSQ1REI709AkU+Qlm2WK/VHw2TFvCp6C6G6aNSDU8Zoss2+CmNkJ26mlhnzf
         oIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755272; x=1785360072;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MetGCHJH2H32CloHxU9sTuHEKcU3rsEz5bg6J0iX7DM=;
        b=g/njTKWrHSLdLgSycdhgg6sh8FKkWRoxBsLi/dQl5+6E1OeakErG+8mZERQi33ZipN
         3RPzwUcHJhLtJL69qjNUr4lg5/DHbB+PTTl7qQgMRmkhiU8BR67Ibh/sbTeLMmSw/CFI
         Ob+M1oLxLrlra5aClv5sDh1dhC9PJjsx/yZ66aMjfX1UFcV3zfgxxzUSRXQ66YmwvfgP
         mQUiOlCJ72jGcpRhJ8IKgWzPt42UFWmy6MuLOtQVOP8SZyk+kpxOeptZBtaSSnvKAzbN
         P/D//8QrQOPl4Gno5bd91I5NvnKerF0gxa7IU/KcD1f6YciYOTsQB02h64w+vJm1v0EU
         Lt+A==
X-Forwarded-Encrypted: i=1; AHgh+Ro/5LHFqMjEK3RK3TBwwjvdgcVpFOLr6G6eNq2pBhaMIl8KRAqnmJiD5fyyehmTBYu+t42HuBwzY6R5xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCG+NU4BWRa7yO8D2zDwekb3OqL+nD4E8vV6NNyfBDHboWRgjr
	1ehpLjxy2GSwZBoACX1EOs73kG4PhPRg1O6hchACljVWlTJ0jdX4TRn1ys7BFPw7xu8=
X-Gm-Gg: AR+sD12vsAczfUkAk622QSzewEU+lgKgcq9h4BY3CdR/wYfpEp4wwHnrXPYL0XtRnJc
	+F97w06xXBx7tSIfNOyR6OYdxgwkVXaIVbrsCG07x/45bwGYJh1jY5cS+EPjpAC9PWwu+Pomur5
	QSnQxv70o+bd4pl3eI3Uww0TSX1lu8dbBDciHEyGg43P0JEgkBEmaIXKEEYShRg83I2eRhru07l
	mfKRWb/kkdqf8jvb7gqHxeB2Qt9ram3G7/Y2UsPrEkrlQgDuzJfBB7U46XAT3GnNt/yiKJbORwO
	m1Kda5f8ABAiEkI0SIp27UQsH1NUWo5/9yhzHmWnZScKJPQ/gPLQeH55hKa8iK3ZfvUmpJo6LWj
	c60MiDQECkteFPt8I92a08p/7VmSq8o/QIsbn0n81MF4MgTURp3hceUMWz9Yd1+DHouGf1H87VG
	0FTTXbiyD3atFP/A==
X-Received: by 2002:a05:600c:4f12:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-49573ccd035mr4678525e9.9.1784755272538;
        Wed, 22 Jul 2026 14:21:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956ab22e74sm82772835e9.1.2026.07.22.14.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:21:12 -0700 (PDT)
Message-ID: <bb60d2d1-dafb-407a-a784-2ec219cee0d9@linaro.org>
Date: Wed, 22 Jul 2026 22:21:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource
 table
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
 <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:36, Hans de Goede wrote:
> The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
> info and use csiphy_res_8775p[] for the qcs8300_resources.
> 
> The only difference is that the qcs8300 has 3 phys vs 4 phys for
> the sa8775p, so explicitly set csiphy_num to 3 rather then using
> ARRAY_SIZE().
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
