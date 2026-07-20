Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE183CB2FE
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535404; cv=none; b=n7hyoyXp+akMUqo0Gf9ELB9VjRVyk9lPOmOhQk5W/P/Y+yEmcof8JfhlOBJanqZBjX7EXUFF+U2hNYTLoVWCQTwzNjw2KCAYHCw+5mSXofRZcyi5Vp03tUhfCML7xXw0CPX5w8VgEk1YRYjr9wrsrxM05FOtB47sKSZSxicq0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535404; c=relaxed/simple;
	bh=q7+pK/F94rBssKU6SCoBGQTe5tWS4t6gigASWIPaSmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwaLHOLGsQmUkItum/rjN7Wwko/swDBP1iuOsOjoenHsYl/4FJbKIzHBRqtuiLFSae33hLUsspu16gbMeL5HQ7b10yl3jV3fcskTN1ekN248tgY6Bay8NmpQcqjT2fDvfxWkv794/4vZf8rDDcMR6zSE0MgavvsnizjzXkoSeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXcu351i; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXcu351i"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69e28b554ceso7881466a12.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784535401; x=1785140201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW9M0UyyBAgaoxgRM13vWPyJ9KUMKcOckCDKMVOqm4w=;
        b=IXcu351iaWEVAfUYMDFD72ht9IZ9xqW94EsvMVgEs7QbTNW7OgYJE8TfXsx2WV4NCC
         eqDb3Y+ETg8Pc5nRloWuMKSVpvtZl6N87WGQnUCbW73oT025ZNA1HWyrp8prpHlMDEDX
         2g3rczCV6BVhwzJFKMEpfjvXOkHNutb0tpqVtpJH7XRB5u+v4qlSLrtr9v5jBO6wsxp4
         rQv9DcZP/xFkfHMvIZ8JiV0mwKVhvHK5l3OoUGpZyYyOm5HROfDP/t6ilmUreAQkVsD1
         1573DkPqjB9TZS66ZU1Mj+7/IQZUcUSEh+uTZtSg2mvaJ72FgvCfe/xvGzqwfB9hmHj1
         c+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535401; x=1785140201;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW9M0UyyBAgaoxgRM13vWPyJ9KUMKcOckCDKMVOqm4w=;
        b=gF+SrNH+coSZJzF33kGxducM+OEU7CaaiscZWt/jzaEDmne5q0mn1HFWaIBzCizm8/
         zmIUchvIjdYm5rhrREji4CuYhhxqTF01CTDNyPzj57r7NnALbg3sZ2WXngmac972UTCV
         r8yntCFUaZ0wD6Tj9VcSOwUyN4p1uUciAvFLJBYA7SUOuamwqOPUzKkE1Hu2IujcAdP+
         h2fzV6hGf2CB4JtZ6mHzA7RYMWXiivMuuqX0fkz6J9+t84lFlNFpmle68CAewaWTYICA
         URyvPUhRjJNe8e+uM4ZwRO2Aw4hNOfmmpctyeCIudj4J9rWdZ1kESQn6RFA9gtK+w4BE
         YYPw==
X-Gm-Message-State: AOJu0YyImmQLpEZIApqgSON5GdFNLQFSDbYHW7ROxprYoj+aGq3KykJc
	MIxFNoLMecDYtR/V85cupz3hVq2RPOac3df2JUlRTQU0zpJBoYsOzG1hKMfJQJs1d6Q=
X-Gm-Gg: AfdE7cmshOS5m0AIIGho3H1cVMGtMEZqS+ZNs52V+xkBrZGOjvo7ixv5UvBtU3BM6ch
	36qmT+MhJVASpmxCzYHutthsTuhC6OyMQJSXjCcck+bWbAPTcthyCqbmdyueCW7VlITs3G1/3oQ
	NiwiZ8croQsHTMb9ptdZ8A2U8tn9QEWdXm4IobPIJVyyN4h8qrHy2WdFrW3ohl0KRtLtCEZwKTH
	cMOYIrJbkomKlaXnJN/b+m6bMR0SA3OgdKcKK5LaWEBYBkQgeqcb8BpR/dvPMCJqgaP1XDRYz7T
	1BZLlg82uYn3KuK4kv63fn375M+cwmNH5jFBJFWFBRMXf7OVCggmsiwbLER7zONNnwXRlNngnQd
	ibdyCC0rh0NRuavgQ+OEWcrCdWE9o5p+cY5K7TrjcFa/yrOmBTbkRWL1JEsswp/yJkhRdJgKpKR
	Lthou4iPiNnMRozw==
X-Received: by 2002:a05:6402:234f:b0:69a:1932:7807 with SMTP id 4fb4d7f45d1cf-69e65310df9mr4828148a12.37.1784535401346;
        Mon, 20 Jul 2026 01:16:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff537csm4185342a12.25.2026.07.20.01.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:16:40 -0700 (PDT)
Message-ID: <bc691d15-1e28-4f84-bbeb-463c69b239c1@linaro.org>
Date: Mon, 20 Jul 2026 09:16:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control
 registers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 gjorgji.rosikopulos@oss.qualcomm.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
 <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/07/2026 08:56, Loic Poulain wrote:
> On Sat, Jul 18, 2026 at 1:13 AM Anusha Arun Nandi
> <anusha.nandi@oss.qualcomm.com> wrote:
>>
>> From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>>
>> Program the CSIPHY common-control registers during lane enable so
>> SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
>> both C-PHY and D-PHY. Keep the existing reset-release value for the
>> other CAMSS variants.
>>
>> Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> ---
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
>>   1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 25a3554ef201..11b7a236e607 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>>          writel_relaxed(0x1, csiphy->base +
>>                        CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>          usleep_range(5000, 8000);
>> -       writel_relaxed(0x0, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>   }
>>
>>   static irqreturn_t csiphy_isr(int irq, void *dev)
>> @@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>          writel_relaxed(val, csiphy->base +
>>                         CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>> -       val = 0x02;
>> -       writel_relaxed(val, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +       switch (csiphy->camss->res->version) {
>> +       case CAMSS_8300:
>> +       case CAMSS_8775P:
>> +               if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +                       val = 0x5A;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       val = 0xE;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               } else {
>> +                       val = 0x02;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               }
>> +               break;
>> +       case CAMSS_7280:
>> +       case CAMSS_8250:
>> +       case CAMSS_8280XP:
>> +       case CAMSS_845:
>> +       default:
>> +               val = 0x02;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +               val = 0x0;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               break;
>> +       }
> 
> I don't really like this big camss-version switch case with magic,
> which also introduces more magic values. Maybe we should have a
> different version of csiphy_lanes_enable, based on the phy compatible
> or revision.
No.

Just move all of this logic into the new CSIPHY driver. I won't be 
merging more technical debt here.

---
bod
