Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523325;
	b=eiGnCtYAQIY6LXTCdJyP1bs/2dImsB/YAz1Vg2YMtxaWW6N3iHhhGUVHbOhf02HwcQ5C
	 L46FH+cV4R+pbRGNRxDTLKyLtEfrlPru5pxcuyr4CqbynEmfKTEohUov1GbRjzo9bxOfA
	 B2JchdJ5MsECcxSc/xM+Sb0ihVcje9iUXc3vYRyXLdwnynjFgumKo0GDg+NaLZXSsKgZR
	 re1yMZbtDh68bSNXI8lhjP13VTMRT2DzMNjQWRvbkeHewNj2mYrdWUTCuOuG/biRLjKpN
	 VQxw2h7q3B8+n3ULsr5UHRMXBMd3w1LfvGYTqgjpozg2BaDxEFKZ+sDICEuhIznwcww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
	b=0qVcWIuMkDIjMZ5sOZFp0u24BNe2j0F0ptWwF1zTM9JXSIPSoME5dAwa2BT0iDFnulLT
	 tz90CPW+nTF6KJCTI0nWQOpQNVhdwcFT2TwtVgYpmtMDrbCBPogTKIVL8Llw3rQRtvbE6
	 RE0M4V3jYhq5dTEaiEncZV7BTApqtZU2FcwQAd2ou3AcLOUjTyTRgueTFwT1pMa/IbU96
	 Tt1gBSFPwfiv0NVz9GpNsfYtaIkGCjqamOGUmCYjCLIfJIx0Fx04DYpI6dO1vfKoJjc9z
	 7nznBDVfcsRWfeuAY3mriVYJ4lI6UQzQFsh/9IL3mkOeuCIFMRT6Ry4nxE09YrhMb1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64132606A33D
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64132606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so40777955e9.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523324; x=1796128124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=mdeJc0zFgMONR/NIr7+cJFXQYT9CzjbZVK8K5bHdLs5owNebF6BU6Lbm+9OJDMU10Y
         yt7f+5sLgqYmVZIDmBpJ4ksEtISJb/I97RIHZbwO6MvpHEzvTiAk3fxKdlhe4KnzcOzj
         ZywLle01PUQKQXASCQztj/WDuBw56a373qOxXHDEI8c2CClJsa5dYMIz6SPbcBJ6fGs6
         EE8HLW5oohacke5/5JVwZ14wuPmHOaO5S/x37gkYucadKC7fjdMmkrsfH7WTbEm7GF7b
         +sIlmr+BFFRDH+eHJlg/ADSXxq72+jMtqdO3N/xPxEpd4/V0unSmakepAaTOry33TdW2
         vypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523324; x=1796128124;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=CG1bgPCG0ysPAm+A1ujgIlqUVrVM6VzfALjdLV8AJgAyZuxDcwMAC+4Wuea4+rhRXK
         8/ipqldIpgFN3HDgtwJSqnjfFjiFVx+Mb9wHdSqZf/C214DkSe+FaDNk4lKg1uWfBzes
         YsSilO9dF0X2f1A8kjdO3ZSKXc5NGKOBQCOVIl+7inWVXJ3KWv02c7LXXY0dL3nwftMM
         Rqya6+pMuRvPH64UXCVJnp8/CjHEsZMuUbwhQcG4IaGkzZgmhVO9me7W8QJwrhNc1x3C
         6qLMGDP+NZGI0ZBlsEx0rPHKDzqEGyTCchnsNjV3u9PwMgDpp1WntJKuzNhnX6t+uRso
         wtAQ==
X-Forwarded-Encrypted: i=1; AL+hErFWtjIiXeowqVC5d1l8V+v4Mve77tm+VJGnX2LHZ9A4MH7fuf8fXdb0TJsz8tdrtH7+p8mOMS58ykBONw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SKgAIkXmxc4PMow6f0EkSlbvPGO2Ou31k0MGV9wjEJQpuNgdM
	KVOjJLgqMFoywG2a14Km7id9COklmMMp+6kFKEqTuw514tkB820ufLI50PwdOpluXJE=
X-Gm-Gg: AZFdTZdGWck5kCwJNACYqg8d1Nv2KC4pGR2tgCHQmurN2TmL5nvCXFQbKCIqjc6EKdB
	eOVuEq5Ej5Cb7qSeIdRDcXFxns0A529g61w2vUcja9FTlXTXiXxoYQMicWEeXUGWlg4zD/BCZvc
	on5Lq44fahSCRBWs2LlXY1A6VrF3D6kcMseiC8C/NceS7SV0ye3dLjb9gooytuYovRfU8oAiMud
	aXqo9SSqmbKSyJsjyAItNk1L99hO1n6AgG35ECy9gsRT41RDoSKPvOFlRM4U+BNOMDvYJ3UALWc
	KgSqLDwBW4agMTkT1VtCSRlas2ko+z9DBYBqtMNCiacucX8rxAYMzZUgNtJx4dSkZrDpUL/k92z
	VKneEZ2UEp+LrS5gj33ZZh42iVwj3H6Woc1kYvNtrhfGa6awTjT252zxEDkFFFuHiDIS71tAMIu
	hRbMKgGUt3b1MOtMprp493F3nwrKXp/5jdC1b0+I+hdhRKItrQdb7dFaTY/hNARhH/M3ARomwdx
	bOr0Qy7NWfDOkidlbr6yr6EWObsmiYq1PkWmmVWC2gvvHH+gCZE3/hXz56m4L184BwfaT6Gpi6S
	cWcT2Ru5GZJmpin+9NY1drTtpAnNS6I+GuazFNNfst4=
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr300507395e9.16.1795523323754;
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm432306495e9.5.2026.11.24.04.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Message-ID: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Date: Tue, 24 Nov 2026 12:28:42 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 12:20, Loic Poulain wrote:
>> On 23/11/2026 17:16, Loic Poulain wrote:
>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
>>> +{
>>> +     u32 lo, hi;
>>> +
>>> +     /*
>>> +      * The pair is latched on SOF rather than counting, so it can be read
>>> +      * one word at a time without tearing.
>>> +      */
>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>> +
>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>> +}
>>> +
>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>    {
>>>        struct csid_device *csid = dev;
>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>                iface_val |= status;
>>>
>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>> -                     csid_sof_event(csid, i, 0);
>>> +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>>>        }
>> I think a callback in csid_sof_event() might be cleaner or some other
>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>> decoder.
> I added it as a parameter because it is provided in much the same way
> as the sequence number, given that the timestamp is directly related
> to and coupled with it. So it is not clearly obvious why the sequence
> number should be passed as a parameter while the timestamp should not.

But pretty much every hardware implementation will have to do the above 
function. I'm asking for more functional decomposition.

You could pass the hi/lo for example and make the sof_timestamp() 
function common - called once from inside of csid_sof_event()

---
bod
