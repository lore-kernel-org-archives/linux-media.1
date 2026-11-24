Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523760;
	b=uW1wFOw2N7VT+zYYEmSeRc4pLsjCniBxj0kA1/KLuTqSFf+N4cNyoqVZAojAewSxN9W/
	 LDSRZu5Ot9BDudhP6nBG6ivRaou74QCUMb8uzXM64B9NEf5s34B1u5/MZ1WiiG18iMss/
	 RTBuoTqZOIF4wEw0wRjGbA7vCYBDOjK4Hdyn5YIjbWmcgEE87tcGa7XXkWEkEVnFtZ9P4
	 6E3HykiCHmSGtMBETCdoVChxwQzLamPI1YPIXPwZfPto730as3vN0UloVvwcHwPg/7b9b
	 bVUDZb+FaDWpLplG4SDR/e8emoUvsXSIrPEY9zx0MQq9s4J6J4G83dD8Eg4pOphzDfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
	b=y1wmkSDOUW5UlIBZq0N3zqDdF8nVSx8yIqGAzYr4FsoMUITa9zFI0MH8XdWd0iweXzfp
	 V1bAyVqWtK5y5THcV+isjzYPPER4O5XpQUKTYOJa1FAk//6+PFZExUImdKLijww/owBU0
	 WfW5U5LT/MU0vb6cOT1tN5lC6g/KJy5MhRX5HnbWLUpAygrm+bXkrWvYGmtq2cMgod66G
	 NlsdbPtN4eJTGvl3271R4vBcfemjMecWtGPGkKbrmX3tn59olyyVJYUVE0w3HmpmmeDGf
	 8LU5FIhYqTaD9uZBvNQLI4gWLkUxkYHKMALMe+jLxYNPnbAIoYC6m+pqa6uEQYRzDfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ED4606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9ED4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oGH5MxDT
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51373ae637so672843366b.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523758; x=1796128558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=oGH5MxDTn+d8EiD6of2XuA66WykMNo9n4h4Uhdx54Kkx1dFVHhUULXYgtpoF0BnCRm
         TZUkYi/GO+ktBWCOSerzr6XrHk0LVdCMqIe3OdtCnkeq3z9NKCaO4djuexke7K5p0Ed2
         1lhkV+ggicW+lB48KjNL865PrjwbpXuvgbAGdkR8xo5X1z7ZmiR3klPJLknVc/uW9x+T
         +Zc4Y0z/DVdFQPg+aRynpcBYKhu1Bc93iRLPBefei4XLwR2GnBKMkkA5jmGtpyzA5xlJ
         vStQJobCc31gcwxhJp+unl3iwmKyEpMNxL02QreicRUNs+WoQ84k+Tvg++TluZaOvLmZ
         ZiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523758; x=1796128558;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0JZ8rpuLBAnmoXP2EXMjipyYHstvEtP1ShZXzsUQ1o=;
        b=rgGHzbkdMA5/+uR4OtkFrUM8f/OlAgpzEzOupWjZbIHaqyQlahG5uZ6nRmI0V8UjCU
         KlWOIukvLJ5iRuKrgIZ3CYdL1w+gFKjwaDjZS4gtGaSkN4XhEw4wVLReWvtad6dGZy0T
         5ZGyoJRYmO96zvcnPaKTU7zUQNfxtVKWgYjk+cFeD2QC0p/6B+Wo/Ct8SheasjL0bkcs
         C0K7sxaRMtvqLFnzxd+SbGzW7OwipeJ2gR5wfxPJ0TqZhIKDzvBO5NrrAymVluUd08Lx
         gP1h2/lZLh4UR4DQTK01FECD3FFPoNlroNNklxUZLVIMN4aedvyYpKS5JJ1sH70HrVeM
         2ENw==
X-Forwarded-Encrypted: i=1; AL+hErGu4mNQ9blrmAxcwwuXqnrobHcZqeImfQno57Y4o4xLMISZff+3DizrtImMcJ9C95nT5dzpoBp9qouz2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jg06CmipBD0TJPhD/EoMRJsKU8uAYBDfaCslyf7OiLBOnbjpa
	vDVhcweR9P/qsPhxNxx7XQUrG7soYlccNfV939pDVVPRy/0kIFWbHHxeJTr45nlv0oY=
X-Gm-Gg: AZFdTZfBH+Cg0H5jUpfnXH6WtTIyyHeCVZlBWHLbWfQiDTLDU8VHSZMISfFEMRroHne
	Bi2w0s9UizW9XHjdsxERGgYKBrGQCE8h8SaWVlk5B3KBOa744PATLZkcNi6Ou4L6yVbRDk20Q8g
	LqMHgFqKiPRmhUBI2cg1a96uLpmy+L2TgcfqZXyFopEnWhTi8nTIzZmQSgzZiF0NL1/hQdXfqvx
	5KI/ps5HMk1JmGcH2pg/GWQ75ntXxO5eiBTF6sQ7P6guFfgqLJdsWjzlY1EUeoIhUiV9hluT1og
	qYzBrWMuszIDsAply+8yStShBSRKoR6Pl9ZBK1+TDUPLuzYS5ZCmQjCC/43vnwb2rG/hBXY4MYy
	TtUP9zOpbzgU+WUwcI4iBlw86BMN5nqj/gBhC0OJnCDyZRuiBoo8zFyhSq6ZJN30nNLue7SoxmB
	uN9OO/O8Ri+fM2csyXm3AtJvlOVLsY9DLT5g4d/EzN/5g7oWS+btZRXW1r4O+QCubLgnIatEGvz
	H5uF64xVq/pQ06/lx7CSTVYHVlVXbwml/XSvHGUaMJ5MMu7B14qxP/DT9EQQ+f+EpOry3hspjjX
	Zg+jJgIW77nW25uFCqJIwPQrE/wy8/hWyt9QLtYuDx4=
X-Received: by 2002:a17:907:f812:b0:c50:d92b:6f40 with SMTP id a640c23a62f3a-c513a88a6b1mr1121542166b.20.1795523758207;
        Tue, 24 Nov 2026 04:35:58 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm503065066b.61.2026.11.24.04.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:35:57 -0800 (PST)
Message-ID: <57fed113-9f79-41d3-96d8-725be5e58918@linaro.org>
Date: Tue, 24 Nov 2026 12:35:56 +0000
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
 <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Language: en-GB
In-Reply-To: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/11/2026 12:28, Bryan O'Donoghue wrote:
> On 24/11/2026 12:20, Loic Poulain wrote:
>>> On 23/11/2026 17:16, Loic Poulain wrote:
>>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum 
>>>> csid_iface iface)
>>>> +{
>>>> +     u32 lo, hi;
>>>> +
>>>> +     /*
>>>> +      * The pair is latched on SOF rather than counting, so it can 
>>>> be read
>>>> +      * one word at a time without tearing.
>>>> +      */
>>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>>> +
>>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>>> +}
>>>> +
>>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>>    {
>>>>        struct csid_device *csid = dev;
>>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>>                iface_val |= status;
>>>>
>>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>>> -                     csid_sof_event(csid, i, 0);
>>>> +                     csid_sof_event(csid, i, 
>>>> __csid_sof_timestamp(csid, iface));
>>>>        }
>>> I think a callback in csid_sof_event() might be cleaner or some other
>>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>>> decoder.
>> I added it as a parameter because it is provided in much the same way
>> as the sequence number, given that the timestamp is directly related
>> to and coupled with it. So it is not clearly obvious why the sequence
>> number should be passed as a parameter while the timestamp should not.
> 
> But pretty much every hardware implementation will have to do the above 
> function. I'm asking for more functional decomposition.
> 
> You could pass the hi/lo for example and make the sof_timestamp() 
> function common - called once from inside of csid_sof_event()
> 
> ---
> bod

Anyway yeah csid_sof_event() increments the seq_no itself so you could 
just have a ts = csid->get_sof_ts(csid, ...); and functionally decompose 
without passing hi/lo down the callstack too.

Either option really.

---
bod
