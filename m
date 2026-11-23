Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445636;
	b=QkpXiMI/JWJguS8cpDO8GVUZiQx2ZpjUwoPvvwDbR/kPgb9Kot1/9JtP6dJZWXHpv5Mh
	 3CReenmOO3wpXvDFZbK3yQpnppgjuRnEgnsV7qac0Q7w94kYTT9YN9iJ2rWn53yl2Aqet
	 zmaX3ixV6s8BQ+kpi0gECOVcm3k9jqOvBNJbOENQA83S/BRwQ3dmd2Vx5UPWOy2h8mM5I
	 QxyDdWllutbQfvHqlLWEZpjtiRw52Z0ulQnu5QxVQh+WVELF9xT5E34p/E/XN8XbFphx/
	 BSUk0ZjRHY7SU3oM8kJUC6J+xCxdS7WHncJUELNRNu5sSXGzehsaCuqrc1wCHiyhfYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
	b=FCrLtjaZiBm27hsSTP1y9KOxxeSoadRzP3GF9tp4mA4PE6oHjjOimEtFJHcuoIJFGvQq
	 zvw8+0s++MU/vLdQFqOsQ55DCTNvwOZiQxmgg4RHwzndH/o8s5gUWsue4vDVQPakP2E4w
	 nL+vCCg84apDcNfJSshrw7ICmbb2RUfq3Pk3OY8iQAG17QrVWjBVOr+SmI2HWlhypKWyd
	 FeeiwWOgXbk1oS7Ipt9ccvbPDqZPW4+WSR+qp7+frfiKKU0QXZPD0a7iM0EMrIvaNuy/u
	 95j25qpdtWk2670Pv9/C0GyfTGCc5IE8Mq1rF6t6pmRjZOYmSbTAC+kvxB8CqB8RaYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq2eIIQf;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724560A6F47
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8724560A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq2eIIQf
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so3133943f8f.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795445635; x=1796050435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
        b=Iq2eIIQfE+X2hpZnLtK5KXeW5oOoKNIGmzaUhyKl+R0y/t0iV0sHjqPOxnpAjzdE3I
         9IsJJ6o4y1l0/h/Pv/ngbneKJiVuxPpRkQm22MaJQ0NPe09KeZkRKx606assDeei0fJ6
         3G/QA7vW5vGJQV0wRd/4WO61QLsK6TltJF0PZF7BACSir8rV2qDVtMllfo6C8ivctXSU
         W09l8zRxnDMU0X9VImi8wam38vsPJMTJqK6GT3rtWKKBJIfSyQHWzDlb4rqYhlscj9a4
         DhY5yHQd/syDmbx2qe3bGjz76bWLuHxf25/Qyiscm1cwVrB+W4QhC6ilgc5j51kQWN9o
         9k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
        b=RPV9b8lcWWAIftTLvEtvuh5z2q0e00R7EKv3zBzBhn4GdI8fVA6zQCGtYQz7l9WefG
         AcJKFr4fsCtQCrx4fZf0P7MaDWuzEUI7TlDjqbCeA3gMliU8ncd2yvjlWD/IREMDJ8k4
         maqM5PrdaVmB0kS4Wvilg7F/TtJ/T3Y23kjSpC998KOp6fy97smH/oGmydxotUXQZc2g
         jwzkh6512xoZh3+Zkvm3o9Xs1HsNVifptujxotizcsbmoVLEldZnXa0R0i9X+EErm3xT
         yTn9zsygRGi95PVoCoeWpDS1r7bHGvStE1bq7q4Glg7xsQRmL4ryWCJ2gp2L1qZNK4V+
         ubpw==
X-Gm-Message-State: APuU4Z/DYs87wZFAOEQ4unIHdOxL28WMv2o//JdzavfQYeQw263J3Zca
	DuFVidhOcn/PWyp/lfEZTi5r034ZLab0HLhwaHSBpbSNpzhkExEuVLDc/24z0LgD12s=
X-Gm-Gg: AZFdTZcQ/V7DhmBEmYL5CUnB4juXfZSdyTJAC5rvWO9vZphZiWtIilq0ayS7ppAFOCP
	pO7Pm99potinkgQ3a3mhfsHJwf9TjF30oO6opyvvFm8sp4YP+qahAOncnUsjpvSjr0TGlnP1JZp
	jGA89idDymVWBzec4cSxKm46y7AjnepVAsBKAYKU9XZvh9V8uUNUgEdKkHvoniDPgT7BS9cFjtE
	FwWDWwOWOC98WCZxopFxsRz7gzNZ5U08LJTYb/coghinD1jqpmJc9DQvtSUzfEmwcRy1YMeKe10
	HPl8iG9d4SxXSQW3ww5D+VznaSxLY6GeSn+xG+2eJeWv2KOHOD9Szb/W+KWEgdPr/w87Bx+anz9
	ktWObCrwd9rhGZD9Q2d4egM/ZEi81RcEH7NhJIwz5nos0tpIpHetU+Qxdmj+wQNTjDVcO7tUEDs
	BJHIKu3tS6qyEubwdXic42LOvxk9oEQdR3hM0tYWU3OHmBbt0p+ErNGPYxuv/kkh3pMb5VgckVr
	u1XrYleHGt7s9K6zw+kfNSFr0hD4l7CMY9UqVJ0H+FljfyLlBYvnBwVueBJwlJWROMdyfDSGZvk
	enJPqNN1PgfWtEaG9Pxm0qnA0abWft78pi9RrbEJVA==
X-Received: by 2002:a05:6000:4b1c:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-4abb0c5d67bmr23963685f8f.14.1795445634931;
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22291862f8f.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Message-ID: <ae872741-7194-4a4f-98ab-5e46cf16ed12@linaro.org>
Date: Mon, 23 Nov 2026 14:53:53 +0000
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
Subject: Re: [PATCH 4/5] media: qcom: camss: vfe: destroy mutexes after
 unregistering entities
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> msm_vfe_unregister_entities() destroys vfe->power_lock and
> vfe->stream_lock before unregistering the VFE video devices and V4L2
> subdevices. Active userspace handles or concurrent teardown callbacks
> can still acquire these mutexes until the entities are unregistered.
> 
> Destroy power_lock and stream_lock after all VFE entities have been
> unregistered and cleaned up.
> 
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
