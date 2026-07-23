Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8924ADDA7
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814684; cv=none; b=Dvkl7dj66AqeEjdZpocheQAnjWT46877WGEyrd/1UPKJH8knV+H7ERmqUV9mpM9erYSrJozO22jkLaoIxh0SGjoXQpOFhbC3jZDBOPlr/9qghfZce7bZoKPFrtlGyVJEAZc1J5MpGDKDNOnKi4eIamipLwx9eL5lY+qXKRn0FaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814684; c=relaxed/simple;
	bh=OAIhkl7GA3kUt0k6jxECSE2oTylYgopE4+XpkWnaIow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNrIRpSTkqENvl2KjJEs/QvjQKTiKGxi3zGsJsZa76W/weGGcyKKpYvHWar3LT2TV29fK0/KD6smR3lAMPFeJiz8A9kpxtwyRNcXIgruzQooF2r51rxV//C+hCCz4zOWWGlv15782txpw6De9G+XpYPbKCQhLcoDdSthoKR1hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTrnmoWV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTrnmoWV"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so53918e87.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784814678; x=1785419478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MMOkhSRFKiJt1MWjJO2tOcDa5RY5viiuHU6OsxyqvtA=;
        b=rTrnmoWV8QMa/w8IN15kdGUYsgvOAPvBbmMR48LiEuwxbU9nJDUBnuABnR0xWQ3xS9
         ovflQjm1WrY9AjBiLiE+cpFhzZUNhQaX7a7ViaGiim/aqL8JyceBwsNf/Ttk+PdQOihI
         V09hkmcubpiTjNkmzYttCfU55V8DWPMZr0f6zW6rJLAG6Ykhj4UUXJtV1hQIsb/5m9gq
         TbaLmM64ozt80SRhZCVESIpFb9sxuVluhEFh4DkyuWUZ2uoSD9fYJeaFejc/FIWsxkv5
         I66DmwYf2dkOl9I11AQg7gmo3wlzuf4FfG4FCT9J9m4RdJMWj5SdXDHKS4dgX3i3E7CD
         0ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814678; x=1785419478;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMOkhSRFKiJt1MWjJO2tOcDa5RY5viiuHU6OsxyqvtA=;
        b=nfmrNrUKl2lNL2oPx5cFVZNh2jtS3czJsR7OtEP4bhzySiEqIwn6JdRjPMTvk9iKgf
         3oNkcfrW0r0mub9GgjGcSgI9NHP63cDmXItjK10pKrbbn2Is54AfsKkCoBVzB17mcXGx
         Xm045JzBzP46N/6oEzFysda8n7IVA7OB0nt2WyNNLnPMd3XNBfkMXnZFHNf/3cogp5JL
         Yg4ICEj5d6lU97pAM/kdOq+gRDMH1Kg+2Qsj/SjfWt1oJXs3XESDiCPLg3Lo5fCvoMT4
         RiMsygZXHh8fhYUmvjv7WjfDyVx7qcaC7Wp5Daki9bbEvONnZLzkVbYMbAXCDbpAkqIu
         ACPw==
X-Gm-Message-State: AOJu0YyaOZgI5M5pLFzFQ0WHFFmU92Z1SUgLblpjYDDfJrLSct/6MBHv
	OH5KMvJWd/OWkqdBYmemHcfhMN8JC/3o6qWTJymcHzNXYSeWmLnWsu+R0Fherqb0WKM=
X-Gm-Gg: AR+sD11KUp9iTMHNmXraCCOPC/yJF7CLjvEB4zCA+ifZBoLQA7Bo4xeo240ic5NR1Nl
	/rxKzThsJC5IDUS609RmeQRYFArT3bGbEPDTRKCa6NplXUYP4THJAbvm5iCmdAaHzKaE81yzj1n
	rgi4rdecd1lbuATU8Y18O/f3agLv32TitLQmZrQbvHWKOUm/bdJmqPkS2hOFg8SQjeaAG348hvv
	KRriJunKOU/tDPBrRQM8gQADgAANCq6DdUNWHwGdxhLnzNnEDgwQaBchI55mpSVSsr3KTIaGHxi
	9i26PUvrT8QKnFfZeFj2pGVp3J3lFKp/6K5nvrZHI5hbaGHbGIMFFfsTzfZ0dYjttOFwXiHQG6X
	SKTrrxWrL+VaHvEh7SFUZDSgSyCwE2jZ7Gz4Fq7kywm3jhF0/SSHQT0mv6yrCpLKvix0CW3aAmO
	eQEYs6OAuD1Akecke054Pi2oFdJPlhES+wNI0M6uxeeml0r9Rb3nMWsnDt
X-Received: by 2002:ac2:4f0d:0:b0:5ae:c063:638c with SMTP id 2adb3069b0e04-5b2b718d67fmr72261e87.7.1784814677891;
        Thu, 23 Jul 2026 06:51:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm9269361fa.41.2026.07.23.06.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:51:17 -0700 (PDT)
Message-ID: <e59d9658-0705-4c1f-9888-1d10e7e153a2@linaro.org>
Date: Thu, 23 Jul 2026 16:51:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
 <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-og0va1b-v3-3-de8e44455a42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 17:33, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the OG0VE1B. It shares the SCCB control interface, power supplies and
> the single-lane MIPI D-PHY description, and differs in its chip id, the
> test pattern register, the register programming and the output format
> (10-bit RAW instead of 8-bit).
> 
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
> its 640x480 60fps register sequence.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Thank you for the change, no more review comments and no regressions
to report from my side:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b

-- 
Best wishes,
Vladimir
