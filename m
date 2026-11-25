Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616455;
	b=ndlwAdf7vjjsqAiN8v+rS8ra50kTZOqLIHNOFu1KzFHcxdQljMRNWE0wV0TgyIiQ4zp3
	 g198Od0ETGeG4bIlvWDOKc48qN+UZOu7nodIcDMLJFHbHHfUY/eoas4Zz1Wfm1pFz36z2
	 o0QuAWIdypDqE0rIvF0at9TwNj77h/qNW4Va8UbufJWJnmyI1GdrLgKvxkzmUzMteQQjU
	 a4IXPcFY++5erCmbjrNqoW2Vufv97H0erWvhpYWi4oYxvVhz6/GUFCC0WEEhGobU0ISsr
	 gqxzHBPrZphYuiS1jngLmmrWHdgjlp5blZtZrsCpFfJ8WuOLME0Hq0TsBK4nL/td3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
	b=uhk5npVkJ8RwINRc6bDo3aYhQHClUJpXDGsM8M22DZTj3/+mPpNJ5+8FqkLcmvBngCOO
	 77ef1h2rxzciKprbA7dWtd8NfQDxjkZs+jc/vglf7uYIEdTDSDhjuKfydYEfC8bIrsx9z
	 2yVEWphx2Ve1e2fdG5pFGurHPRrpoG21swx05aakwO1A3Y6c7kzgS0Fw6kYoQrXnDNDOX
	 8xym3NpAEzyZkwKjqTzzmRq2JzEgJ/3rSUt9bAxugMhYVSR6jo/fGjUU902l7FqQrgaly
	 cNfjc1BtLvl0PC3k3ufuW/qgwLL0iqVxeLQTvUJk56UJd5FCHyNJxtKRzIRL/N00ILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A9606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfe7a31dfso4372011fa.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616453; x=1796221253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=uGl8+q2+W4FLFqzK94rJ0xx8KjdkJPZX2a/BebrK8El6t7BmHdxAKcVXgxwcW1nRdt
         QaDP5T7P3uqBgih6parY7BRxsPbdJVw802NP7Gemiraa/Np6gnLKQF05xoUOx1QO5MTd
         iXoyIX/MAsm4dgMdBxlD8orfF15XV8WYNeU7zRmZg1vABFE+6eCqXZPgxaPE0TxHJHwN
         e96tkwkdFYRSOzX0hVuRIdJRorRZALa/qkpg3x3l/kbrdH4UiWuxpGgy16ZbHfEv1bUd
         KnO1yO8xY7OVPSOlafW9vxu96xbVdpSfm+8lwp/NfkBrKZvX+fUIC3TE3oAeApXuh/Bg
         Ef0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616453; x=1796221253;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=HNG1JSf1ZgM4fyeIrubb4/tFIjd3o4+ZTAYhZeBBIxdX9+idUuKMQocZrf4Wa6TaU+
         NUYosYsd+WWLE5ulsyaeBfBuWFKeiiroPi5SfsVaYuCSEymmD3bvSgkoK79kLQ9Ospup
         a+2HAW7vwq7NFTryhphH+xrtzZDVLUpLFcePUHIpuWKnRShROcSgHh89hjoP1pGoPLoz
         /nHKeabP2G0SpVrcixOxdjAYrJo+Q6uiO3k/mL3PbZ6Cv1FmT8JmPMHSIZ7/naNpsiEm
         uBBFwxv48RlG6pnAG6xSDEoNHvPiAF6In+SwB6ofXpw6N6kXGtkrvCZ/Cs5V56YJYoQv
         wAYg==
X-Forwarded-Encrypted: i=1; AL+hErEzAZ2nqOKfPpo48oS9UGz98TEEBCo/Rul2qL1YsIQ3JtsojpXdw+yq63v5sbk07pCCOauhfzdXXac1GA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HeKgJJFF9K0GHMqk+7BZF3NPuGRzPJlmBKXs2fzLCOTY79NFW
	7ISOaPVg/HewjDYSigfumvcpMrW1GvBXpqntc8v0/a9MxiXqz71+1jKmwzcLeRo0VzE=
X-Gm-Gg: AZFdTZeUQsvNRfxy4RehneZ9zb6tb5R3gJ/vOx/CdjYONAROVj+BK5mFrk2ygCbdXPl
	1pMW0CuMdWh4Fp0h0gT8G6JFSzSVpxr10NJDle5ufbETrpI51quAN+V+ldBVWGDX1Oob9fPZgEJ
	GtlwZL3qvbX+bbIF5CjMhY+cnD6CEGxPZzOT+G4ix1C2TRs7jmIJb7Law9iVopUsIAoW+BSYcEF
	5KJkYGIUYN7XGxd/zbYsP0R6rK0wrK+eqx+eoE86Wa+20ZvIKSuSwfCsU+faaz/i5qeirMxDbtC
	QlN9zSrTkVJiJF32dOcD84eRgtYsu8CX6YiG1ShbcQcWOnjdZa/WQoZmRv4iyROKTNVBE7CIlNo
	mzoi1OYAJBinB/IbwyDgaxFqO0841M68expIdWpQxbarErUUCPTKDgnOQuEgNPktfx7gk97FyMR
	EScbx9z919b+82aikXjew8bXMV9ZgdxKZY2W5wuAakweGp49JgY5uXIMaMbYKRb0m2XBL7a/JEg
	xRy8LO6+XMMMskek6VdjhRFjCyaggz4vO79rHLs/VeSp17gAo4NP/bZZm/GODuzS4tg0nMVQt+I
	h0Dmis+qUEz/U8ZKfRisd0idPx4/c4IVlKn+auyMzB6a+SywzTse1I7X3j0HA0YhNBvbuhBOb5G
	AzvK/rSM=
X-Received: by 2002:a05:651c:a110:20b0:3ac:e540:987a with SMTP id 38308e7fff4ca-3ae7f7ccbccmr42593531fa.0.1795616453477;
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm43974421fa.28.2026.11.25.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Message-ID: <8510bd96-fbb1-4d40-ab90-6e337ed501a8@linaro.org>
Date: Wed, 25 Nov 2026 16:20:52 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
