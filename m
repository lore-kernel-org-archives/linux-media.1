Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED02E1722
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610966; cv=none; b=aJrfx3ekeS7ApTDWBTDurDY3c0mZqSbR5CFfd3uvSgQMygZ1iZfyPySW7TsX6UKwQJYTLwUoyls5hy/3wr1Y4wQPSriFoNC777hu/oc9It7053r/27m7oYClmCJ926nBcepf4ZHOaw2G6QJBPC+3u70HBt9enFDyxfN0+W5kqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610966; c=relaxed/simple;
	bh=ONgjSmtJqhZYCOi4k3AvcYjqSx3slhnNZpj2V8m1SnY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ibl4sq5Mnw+JnA2B9rULzESEgjniyM6sCchDTfqjAd6yGizzwUsZ2nzGlP7gLk4Sn5tiGQSe6NoF3puY76+6+rqJUkcrd1ggEIhZG37/ElkTardzmIT6lH20mI5vpTjKw5xU0KQox5pzMo79161SMUUddTsPcezSN40aCu3udlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onSSLjcG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onSSLjcG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so8197885e9.2
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785610963; x=1786215763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+cDiTNkfT7RBUUTIaN/X9QMQFiUy4egwCdPKgzjjC28=;
        b=onSSLjcGqQ8O2m5+rJc1gnLOZ+gXdLnhyvzO6y3lg+5qNMDkTW0cyXR2Gr8FSmu+eH
         TSKX8nsnarSQYA+MPeBhZvCUDa0geEdEXcMaLEhDbmAHbHhgD85PjSkVYSLpb4AN3l2E
         nw8459hDB6gRejhkqb6LM6KEp4TvzVowHu1YBQe5RLVLZvsGUIjkAiFinE0N8YPw8Ujr
         c00wh3nrbqsPCx08fKUBPGN5E5NniCbsow8H/14dd2WDRj2+6grOY51sSB67Df3ESUPr
         dEF8QFySDIN8L9JHXiKDjXuvz8LkVwEmCZ+IQjKnNuevEg4J6XkThc7qX2cMHyZxm9gy
         NIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785610963; x=1786215763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+cDiTNkfT7RBUUTIaN/X9QMQFiUy4egwCdPKgzjjC28=;
        b=p15woqmAluOd10iuTk77xe2FV514LSaJcZcEOzF/IsjHD4oYz+nkHuESAkQkYR7GYw
         s9+vamJ3IFno8UY/Ut9T+yyqUKh8aIoHhSIWN9uM/ziwZXApUhZzcjFbsIa0nd2Xc0Sy
         lLYZdWkP2PuUXelC8fJfMIt4zcdNj7mtPPXnoMDWNLLLolFLHnvPxvo2CMlmck7GvgWX
         b01aXhMiJoY3VeE9dH8Ae7ah9uhFv0GD3CBkeijnOk3HD+FvRNNKfXfucmsyJuHOgpaZ
         2iyDKxsmmiTmO6xnEbIUb/S8HFjj5e+C4JORePCn8hk5OsWawNuwCX14sSv0QJ6WP1C6
         s86g==
X-Gm-Message-State: AOJu0YzjzZkX7B7H1bZ8OLkdY9jIKd+JB/00GLj2+o1qLROjao0xkFsT
	GF2rTTtvaKN72g6dTHHU3HYiweSGcyvladHxsY2X/QJM9jdKUA4vobUz
X-Gm-Gg: AR+sD11wQbSUACDf89d8Zf+1g2swidyERae1c9jmGE+QVao4rKkGYtvF5Cl6HouX6eB
	0kkRed/AXKsZAJU6AQTZzoXtq8OYaqaW1m9YGYSN4UpYfctiy88zjVeqAYovVepOeOhoJT8d2fI
	ItoQNY82enAxpnZHFwxtKVxolh25iB8y/TdHRbbGDL3VmSrbJoq6mFDbO9RI19TlnMm1ULORv50
	ITpb6vE6jNsU2tRCM39ieG4K2iC/W4rRMhZhNUhpmP2YzpcUaXRMEWs0vpcJK2WJfDaNOrXlgUC
	mnfmKQuMC06dIwAafpMN00ollJMUXwrpiAx/7zbNpZYr9ohfOeW/sKwultdOJ2HTY+oQWB9Z2ea
	LU3f8kznOFSF6sIWkoOLguhvGuM9tfjclsl9x+zuXTuBnG5r/fCCxtS2v9AUyNUPpIfusiJL3iY
	NPtjXXHDSLa6sc+DngHhhP6GBb7R70ZkS8hjyOw1pf2CYqhH0uMzJ76Pk=
X-Received: by 2002:a05:600c:1553:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4980ee7e62amr59215235e9.16.1785610962658;
        Sat, 01 Aug 2026 12:02:42 -0700 (PDT)
Received: from [172.23.0.7] ([64.188.68.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm122720995e9.13.2026.08.01.12.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 12:02:42 -0700 (PDT)
From: Neko <nekodevelopper@gmail.com>
X-Google-Original-From: Neko <neko@altlinux.org>
Message-ID: <8b4fc7c7-a0c5-477b-b03a-dd1e7c2467b9@altlinux.org>
Date: Sat, 1 Aug 2026 22:02:40 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: sm7325-nothing-spacewar: Add UW
 camera actuator
To: Danila Tikhonov <danila@mainlining.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
 Achill Gilgenast <achill@achill.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-3-38978de67963@mainlining.org>
Content-Language: en-US
In-Reply-To: <20260801-dw9800w-clean-v1-3-38978de67963@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/26 9:04 PM, Danila Tikhonov wrote:
> Add a node for the Dongwoon DW9800W actuator, used for focus of the
> ultra-wide camera sensor.
>
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts

Tested-by: Vasiliy Doylov <neko@altlinux.org>

