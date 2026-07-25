Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C303655C4
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017852; cv=none; b=sA3dawrkMl9zQVDZV8zb6RmdTarB/GKRuC6eyMs3IVGJvRIBqGOs5U9/6f3pAjloY2wrXtL+ZDHygDQjGoFtzBQZOD641QwJJjAYEecHu2hDFeU+2QHMm2wKVIhXdtC8ttlFXoHl8v+kqO/ZRanm0bTjGOwn3QhpFh+kZtKlDUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017852; c=relaxed/simple;
	bh=A746bdNcUJkfA/tJvXGw7GsSsywrS1dVwUX2pIcB8Ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfPkTVBMIhFDr9vu338nlxcJoSk5WEJYiK86tSZ7aKBBrvIk84nLTW8bh3CqUHServQIYABKDK6/OpR/bTg2Ovh8QQwXLk8gAia3aUbNmZrdPLfQf88CdW2+NWfkMTU0n+rx38A6igdumnG2AkdCHj0B1gZYSYLZobEETCZx9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0tKFkWk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0tKFkWk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47362928f65so1403173f8f.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785017848; x=1785622648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkfPWhGxyd5bYr7NDTgv1M/DacfMUW8wNSZdGPCFOtM=;
        b=S0tKFkWkcUdgGyd3j7agqK6qU0PjsxvD8cB3W5wS5siTfjtO98Mq6LzHB69SslTfOM
         oO8q0YXWhGhJnr1OHOQT1JtcOHi9Br0dLli07EzrExgknHqDOkGzbEpUoCzzLTQcfxaE
         +lkSSBuZaF0TyOlUXw/Z0TgBoFbc4T9YVMKRTE8LyMNCVnmD6/KXHnSQNsAy4aiIHDWu
         z8XlmHkWOvXm7s4CMf2Wpqx9JWxX1DQG4G/DfZD6ye39fkB2Mnv6Gvz6XzT8Kp1mD4gg
         lYt3uO4BuDItyZ6p+lhhipj3Hgb7JbmMnHS2BQFhdf+8AbRePKvhP8554vKeScHmfqVn
         d0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017848; x=1785622648;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkfPWhGxyd5bYr7NDTgv1M/DacfMUW8wNSZdGPCFOtM=;
        b=NHA6QSVjsP/1Mdh8d1bytVj+bZAacrQ/3UIg8PXYWpiBhqOADtOCVSLkTX+mofi1gu
         0nuQq7Rj9Q8YcDmHDVtHZ/B44G67PuxbiaJg+u0tEJb55Mvy8QQ539Gmr5SQRjHkWvCT
         gclRW1FQUHqUORy/S419eVGekeLXlW04UvRoQO+iMLsjCI43ad3xm0p+SBnqQZTF6Rie
         TqL19SOae1VEYXQ3mocEcLzaCTPpmnM3qcHLGHZzaIAhh9c96nQiW9UqDmBi8ef6brqA
         eYcXknEuCP1W6wW/ZWL6+VMP75EJtsWIXVoN7YKGduUwfsCwo4R+SnUSxB0cx2e/JUN3
         Ykig==
X-Forwarded-Encrypted: i=1; AHgh+RrMgKTgHf8Bzz8nXOi4QUem5CiJHmHBk18d6UkQ/XhvkTATOaYuhCl2fFJjpR9UQYWH/U4TxLJrncCjRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06NyQoshFYNnpAOKcRnOhYwNfp7GR/kjrs71S5/LmX/ompVc7
	6FEo+98MZYT0QzCoPMgn3kU9TWeZ6nT+XmiySj/LQIDETGaBqNStSfWsZJzUdnzTBek=
X-Gm-Gg: AR+sD12BCOCihaNEgLw534Po+vBu6or7inEkhD4OqKUK5b139D9c1vcbJychxZW19W6
	ZrFDQsM5UyRGCkoMZtGy6M2uF03GMF6ttdZ/D/ZobSzjE1iCiuFZpzryLru+9zpiKM2LUNzvOwt
	0Hfhh0LK5VgWYRJ6RCqYhzu42f0FDlxD9yGMpCvOGSdNFTaqHq6fWn3Wn/oxKUhlbKYIHH4NcB6
	SUCxBS4ihK+oK8JHb7Q+HEKnUHFHqmtPcc372VllGNkL/Ut9k4qtejBmuxGe+Sad1SkNr3WL2MX
	+84LKxguTsC9dwNZtm/7JOqeJyNH6Swkmq/VkNvMG4PoD/1PlwcLAbSINyThu7wfEkR/Yx6EMg5
	VbTGcB6tB0GPXx1atr6MMfS3AnmD52LhB1PNnuS16pf1UGblBwTY/V8g2LNBDIj5AjI7Qf4cUw7
	DgEtaYfgY7T4uyyR4=
X-Received: by 2002:a05:600c:8b08:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-496b56da86dmr39749995e9.17.1785017848221;
        Sat, 25 Jul 2026 15:17:28 -0700 (PDT)
Received: from [192.168.0.101] ([78.152.215.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfd1a60sm133988905e9.2.2026.07.25.15.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 15:17:27 -0700 (PDT)
Message-ID: <08bb8736-3a10-4038-b4ae-b188fb655601@linaro.org>
Date: Sat, 25 Jul 2026 23:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
 <c52fc21e-ea58-43a8-a5f6-937ea108fc2a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <c52fc21e-ea58-43a8-a5f6-937ea108fc2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/07/2026 15:46, Krzysztof Kozlowski wrote:
> On 08/07/2026 02:07, Bryan O'Donoghue wrote:
>> x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
>> legacy CSIPHY descriptions.
> This looks like breaking existing ABI / users.
> 
> Best regards,
> Krzysztof

Yeah - I need to detect if the CSIPHY nodes is available at runtime 
instead, true.

---
bod
