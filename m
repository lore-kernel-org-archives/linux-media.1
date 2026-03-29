Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCC30C63B
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774780316; cv=none; b=Nnyo2DY1gZYn361oJnCh1NH2aeiPaCPKBoO8mb9qrdY6BcYX2c+K9ggxBd4jD4qY8RR6saBl6vUebebR51eGtrLAgM5Uiwne+BPlIE9YsVeNgJEbZAGK1QqNYNWnpupVtPtELBM6/IbZS+UGqDirhuDZ2dmRExjiZdBHYZi9dec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774780316; c=relaxed/simple;
	bh=dhNXEHIExnX2f1N4l5eDf+K1LJ9NNaGnAN9f1+YcNoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4Mhn0K12EWKkPIGIWQ0m9zbwuVRyg/VetAxFE0GnOMDf6dDVdCuM0bc5S4k8/g7zF6T/GUBwzeughiu2Lz6qlI9QqdKZ+McLmptXKA8bE2+yeFDqcitXOmuiRr1ucfk6uV9c7/YHU6IsDe3VxYFjCLGF5Qd/Tb/6HvFLAWQAsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btvqxH6n; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btvqxH6n"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so36882105e9.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774780314; x=1775385114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbEfcfX+u+PNt8MJVjHcHvkNIFPHR+VDZcKCREDq0jw=;
        b=btvqxH6ncqZRl3he6Rn1vC9Kf9eRHEuLCHaLtNWMYsgySngkVZKNpe+otVFbugqr7o
         JdBaG3qvpag+49ISmDFapmnnIyLHpPstUg8zeU6TYhTeAM6hfupV8b6YiMqjqTcSd1HF
         lSxZXnvv86LUX2fLGFLF8fJvwIWCUCUJvKvRGMzRp/VGUrIHNoGSdwgRTPoD3DQ5zq+H
         WVTEzt2tdwrZbmSZnmMcmZD9rJ2/bi/iElP2DMIb9HJyxBz4zgIIc5GLv1wMU4OeKWse
         xj3NGzdXNZKgYZXQCduVjE9JqHFWvXkUbZl0RiobNHOddXnZ+j6B9VnciPVLgegUkjZg
         khgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774780314; x=1775385114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbEfcfX+u+PNt8MJVjHcHvkNIFPHR+VDZcKCREDq0jw=;
        b=H2yU7QhXW8knLkqTCT8aDdjtFwv4Kozw3gcfSVrjaKZjPgDWcOd0GYKgJda+V9v5qV
         0NRx4+AzqfrgdHMm6cE5lSUdI2SyckZILHXR6UttiJ/RLzrvkYQyp7vANoF6cTK5TK2D
         Khbqd2Rvj1h+F3w8BB9tTrsqH3NzsJNTa79aDBmmOT499S8tuk0JwQ7fB2C3DfUEVSo2
         jnlwAap+nZKxC7mkHz2bMZ5vYojUkSZEKfnOkqMahXL2eDZrQLkbX2cwR+qoTcY/srrA
         5Dm8H9kOZy7V4FzFo8yp/wgMRFOMY0d5C+5ABD0ntWfgzf1jsOAqK93kXKbllZ60aqq2
         uEPA==
X-Gm-Message-State: AOJu0YyAZLzETsGSgBpUyVGxc0QicC5W2o7/k8CxIKTHztdI6Ol/7ew1
	wq3xLbCchSKHRYVmoG7NuTVVKqR0VZmUxvcPzpgbXn6WEgx7RlHl4qtxBWOcMRSX0Q8=
X-Gm-Gg: ATEYQzwm8qUZimtLFOeDvJeTK544ChGKQfdkXzB81obLzRbfXjMBnJaawf20FKc3t5o
	ypCq9jKpf7kaiCcOw3r/BKb7TnlP4MeW94udSjfixdOn/JplB3xuzWv7kpz3f6QWCarYQ1ToTqs
	TlLuDb/+TufAqq17ZyCt6JVjx0P6IMQpGU795E4iV11Tz/z5mvaytyViyIr6IfXWzkdnKVGKMtZ
	PbC/51PltRuYo7HPEeVr2Y3rUmzPWpF4BMhkMHrLiwohbsIdltXPyV5YfgO6b0fCsm7YLNN9/a3
	SgMiS4Zdw2MGlvI8+YaIkvAn4cTWfcdbiB1r/de4ew+wFooTtylPKPNxwnMNuhnt1h4NB0w0KDb
	Kgk0ZQXxjnDmGjMwoipSoDIR0oWO+hKhZiSXf5vRyzKt4fn5X6aneDm3EdKluJUIWO2LvqYF6JQ
	isqVbcB0fLfPPrm1aNQOiqZAtoGsYU7KI=
X-Received: by 2002:a05:600c:1d1e:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-48727f0b0femr145120625e9.9.1774780314061;
        Sun, 29 Mar 2026 03:31:54 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b4d0sm201579705e9.3.2026.03.29.03.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:31:53 -0700 (PDT)
Message-ID: <6309703a-fd61-4224-b9c3-6e1b88ca168d@linaro.org>
Date: Sun, 29 Mar 2026 11:31:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add per-format BPL alignment
 helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
 <20260313195152.275196-2-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313195152.275196-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2026 19:51, Loic Poulain wrote:
> +unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);

You have a naming disparity between header and implementation wrt to 
your doxygen.

I will fix it for you when applying

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
