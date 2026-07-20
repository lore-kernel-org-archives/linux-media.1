Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E8449B1A
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576199; cv=none; b=skx2MmiWgx6wOw6/XWqP27dAtkrVNoSRLB8xXorBh2vQmSl78IQtFyU6HiTR8yFMYOjy/8Jg8BUMBazlIRy46T9uHhOn3G4/aJ6OHjMi85E4paOiIzaWIjM1Dk7UZAGcJ3Q2eSdTKK0iwBciJSffqQ8coZsYrE+zLaJOfEwrgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576199; c=relaxed/simple;
	bh=53p1zbn/yV9DrECz0/tAHExb1rBasS8D1r2YL5QxKgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PITGPAybTJskgWZRMrYCbv2/YuKXp2Y5fIx+gVD3JeoEuFiWyg2Fz+mtcoBPKMaHie94/Q2TJ/T2Rf06foWFLeRVcw8ky0+GiYXcfNgGurM1HLwRnRqTf/SSvp7xiesU7u9PSXGe3eLMsFeqJiTMNxNqKUOoWGXWuMgvPrFx77s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3UOcuAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJx7oKBG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3UOcuAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJx7oKBG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTWOx3397187
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=; b=N3UOcuAEWJ7+2mBM
	3u/vFPdnA5rR+rufb8Dm6UHZV/SuhNloGVlMqirxhEqmv91g/5B8AGeZAhxeMWAv
	UGPpm5Ww5uOu5cXOnnykqrWxIkxBkb+T/HMGOfBki+DbGKtMRXuubu/EaGwVaYxp
	44hNIXUFyKvotZW2oM765sP3KBTNMpqMD9BIAzpE5MdZzhGGn66ra/VkA0DTb4SH
	AdqI58W8adNKDcDgTXRqOnmJDtEDEuaaZQh0Wxf0sh+pgdeJwT6dux1ewcu7Beru
	55oEZ1o+HrbcsMqbrQMDL/eoEW+Q0FCDr9K/Uzzl8ztsjVIurHvCmRf4Y0OI0dvE
	27msXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvc8kuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:36:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso6597088a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784576196; x=1785180996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=;
        b=YJx7oKBGk+ONzNwd/5yO2+xHsycPTScTr38GJlEEX5xoIQkfPSVgXV5NMckzxuytVc
         +1lBlC591mzTJevrypDJ6qR5IUtLwvLdu050UIJS4ou4g6FpULy64JE4p+3G4JBRqI/w
         3/nGUGOp0SedgH+SklxhajSNs2vuaEPcxEnYPyd10+wcZHCHFSf97SxDbtsWU3m1QmR5
         fjZUoKHZvccKmma/XMrMm4kM9f5t36hI9DrP1w0DF0Tcsxi5C8cp1/pLmNO2s7HXYpAE
         STRJALIprJA+2zubyoF6fY5Y5Q0kL+U8zO2y/QHaEQx2ZOFGcdINRHVwvjPZ9+NjsoTk
         kqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576196; x=1785180996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peSd4WSH4sZA1It8QAcMRr7yERVdJsaOySQXMlSSuqo=;
        b=BnF1sLYtC1UAyygSGJXojgue0XTUd5k3Jr/k5/j/iIUwGc0b9nsqHdCIlo6cIfFN2E
         Lc++K0lWHd60MQxS142/YkeC098qRba06w7AWPAJZlsWFBhYEvXeoVQdMevXgyjlmCK6
         GoLue4mgpAxJGyAhRkPIyw/6+tx9+hi+NV4TpoTK9Abu1+G7maOTE+fZykr9nISY0yzR
         Jml7XAqb5Wvyb27sBzsSuzj6X+3DLwP1u8z8b8qmc75CKqVuPCupBJdTFJD8V7cNQfzO
         TiPJDNvDo53VgGznu9MXXNeD8F+HM6pB+NlqZWizAiOCc0v9YXAxVpahKfONKdW5EV/b
         x84Q==
X-Forwarded-Encrypted: i=1; AHgh+RphgE+XlVigZBPJ1tH5qm7henc+hZC33XEBlceKDtJRWuDbbMjtSmjWs8REf1TdoT0VZ9zKnA9hRfueYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFoOMuJl4KdhB/5or26AQqPvNPyEm5ghC6lkoVZa1SyuMhH+0
	Px2bGrOdHNd2zkRRyfHuDIFYWSpPUjxbjyf/SE5bS19Cori9o4p4g5SL8BnQxgzUxzPWUgGxbdX
	kOZdMVx4/ORI29bTY9kpErWImn7P9mHzyOaU0tCh58L36Jtd59pC/J0NICxzrVBQOaw==
X-Gm-Gg: AfdE7cmRL+Q35WcfSIGn3m+qDymlV1Exd5wXdIFAd/26QLDXSCaD7ERQU6RJldnp/jT
	SQlmHtoY5PlWmNHyrexTiB0MS9t9+MRRlyQtx1upDs2x0oNm/xJHAEVgJ07jGirIjKhsMe3DzKT
	vl/oRiHql1KhxhLYFc+ggKtrW0O/zCFJh2F234+XAVeHz9lEtt9+PQ/qtTGHhI+N1K3rrQ5QuVo
	TtmXxXtGsEr/4vqopcHYzSHC3q58OugrCfPobm+jWSbSH6/8CBHT2S9Y4/1kK3E+U3QuryMlQXp
	8R7bPDlp2KoJtRJxMDLz9W1HdFLIrgOzV4OHzJu6Hm0ly5w2Miu3JYTCTVfSSnqAodDkIQ7HddB
	Pahlv8jRLgqCEelBDyyWa09C2jUsppQXrI5H5IyynykCmmDrJc02vINhIMQ==
X-Received: by 2002:a05:6a21:7483:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c3ad665ce7mr15639719637.2.1784576195541;
        Mon, 20 Jul 2026 12:36:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:7483:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c3ad665ce7mr15639690637.2.1784576194978;
        Mon, 20 Jul 2026 12:36:34 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm45541529eec.6.2026.07.20.12.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:36:34 -0700 (PDT)
Message-ID: <1c7c4ced-027f-4c86-b780-b400af949b15@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:36:33 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add C-PHY support for sa8775p,
 sa8300 and sm8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com,
        hariramp@quicinc.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <61d91ac1-636f-4b0e-b3c2-d51207cbd8bb@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <61d91ac1-636f-4b0e-b3c2-d51207cbd8bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfX+KSAJMdaSlFm
 DiR5bXcYuXknn1DxADHQ7TFTkpSZAiiWIzwcApSsfsOy8gbpgyjmaRz/Fa55G0JakYYYEU2GNN9
 5X5Els0MHZojNt0A09euPmWHSKnCJKI=
X-Proofpoint-GUID: EDZeTv1vN_4EaR2an2leamxpxKFbyBSe
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5e78c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=O6vi9WdpL0XUn1BfersA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EDZeTv1vN_4EaR2an2leamxpxKFbyBSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxNCBTYWx0ZWRfX/WjSUQDO4b7e
 mTTDlp/WGC1duONbZBm4Lq8z0OFTu70StNKgksGa/cKGC01o9+zDWIwIM5em5tYpyoEPLGjtbwc
 7Mq2aYRLalJhelzSFMuadl+lwrb1bKmRktjb5v4IkjiEoJWATOr+ZTlvaa9FwnHFizj0X/u79jZ
 4M5qTnXqpBAdohwFnxvLFo0t8OGZ4qiHASVJjTRvBQYzl/tAIF4QwiRildG1hhC5uEzCm/wplUV
 4e56jsYIKXw6L9khYMaPVXu7NSu8zrqG7RaxGFzXMdiSZnefdtkNw65mwdXCvLxyfBRJ6ubce27
 BpjdAXBSKHGN2ahqA63SDz+ctgmFoCk1UPIPPRCpy1Bfsbjk6uxtj016sCtdPwJBNeT0qlVUWGV
 4b4303R8Up75cQr+aCKV7fMZQtvQpMadbJ3Zgxt2Yf1BnqAtLtcZ8Bww37jSvgg2gVE7Nk1qejr
 ddDJAZDlZbXilpa4Vmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200214

On 7/17/2026 7:45 PM, Bryan O'Donoghue wrote:
> On 18/07/2026 00:13, Anusha Arun Nandi wrote:
>> This series extends the Qualcomm CAMSS (Camera Subsystem) C-PHY
>> support to
>> the Gen3 platforms, adding C-PHY mode configuration for sa8775p
>> (CAMSS_8775P) and sa8300 (CAMSS_8300), along with a dynamic, data-rate
>> specific C-PHY register programming mechanism.
>>
>> It builds on David Heidelberg's C-PHY enablement work for Qualcomm
>> platforms:
>>
>>    - Program the common control registers and prepare the CSID RX path
>>      to select between C-PHY and D-PHY for Gen3.
>>    - Add the sa8775p C-PHY 3ph lane register table and wire it up for
>>      sa8775p and sa8300.
>>    - Introduce a data-rate selection mechanism so the C-PHY PHY register
>>      overrides vary with the negotiated link (symbol) data rate, with
>>      tables for sa8775p/8300 (1.5/1.7/2.5/3.5/4.5 GSpS) and sm8250
>>      (2.5/3.5/4.5 GSpS).
>>    - Validate that the local (CSIPHY) and remote (sensor) endpoint
>>      bus-types agree, catching C-PHY/D-PHY mismatches early at probe.
>>
>> Rebased on David Heidelberg's C-PHY series (v9):
>>    https://lore.kernel.org/all/20260617-qcom-cphy-
>> v9-0-83da8a8e4e44@ixit.cz/
>>
>> Tested on sm8250, sa8775p and sa8300, on top of the v4 revision of
>> that series:
>>    https://lore.kernel.org/all/20260301-qcom-cphy-v4-0-
>> e53316d2cc65@ixit.cz/
>>
>> Anusha Arun Nandi (3):
>>    media: qcom: camss: Add sa8300 C-PHY 3ph lane config
>>    media: qcom: camss: Dynamic data-rate specific C-PHY register settings
>>    media: qcom: camss: validate local/remote endpoint bus-type
>>
>> Jigarkumar Zala (3):
>>    media: qcom: camss: Program CSIPHY common control registers
>>    media: qcom: camss: Prepare CSID for C-PHY support in gen3
>>    media: qcom: camss: Add sa8775p C-PHY 3ph lane config
>>
>>   .../platform/qcom/camss/camss-csid-gen3.c     |   2 +
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 394 +++++++++++++++++-
>>   .../media/platform/qcom/camss/camss-csiphy.h  |   6 +
>>   drivers/media/platform/qcom/camss/camss.c     |  28 +-
>>   4 files changed, 420 insertions(+), 10 deletions(-)
>> ---
>> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
>> change-id: 20251109-qcom-cphy-bb8cbda1c644
>>
>> Best regards,
> 
> This is great work, thank you.
> 
> That said, I think CPHY embedded in CAMSS is the wrong architectural
> direction.
> 
> I was thinking we could add in David's CPHY stuff as a holding position
> and also because its at v9 BUT if that means adding three more SoCs
> ontop of that... that won't fly.
> 
> I understand its a priority for you to get this stuff upstream but, I
> think this _shouldn't_ be done at the expense of adding up more and more
> technical debt.
> 
> CPHY as a monolith in CAMSS is technical debt and adding it in to the
> existing CAMSS as monolith is just a shortcut around a problem - that we
> haven't merged the CSIPHY rewrite yet.
> 
> CPHY should land in the new driver.
> 
> Aside from anything else - upstream Linux needs CPHY definitions that
> make sense for the community.
> 
> inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep dphy
> include/linux/phy* -r
> include/linux/phy/phy.h:#include <linux/phy/phy-mipi-dphy.h>
> include/linux/phy/phy.h: * @mipi_dphy:    Configuration set applicable
> for phys supporting
> include/linux/phy/phy.h:    struct phy_configure_opts_mipi_dphy   
> mipi_dphy;
> include/linux/phy/phy-mipi-dphy.h: * struct phy_configure_opts_mipi_dphy
> - MIPI D-PHY configuration set
> include/linux/phy/phy-mipi-dphy.h:struct phy_configure_opts_mipi_dphy {
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
> include/linux/phy/phy-mipi-dphy.h:                    struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
> include/linux/phy/phy-mipi-dphy.h:                          struct
> phy_configure_opts_mipi_dphy *cfg);
> include/linux/phy/phy-mipi-dphy.h:int
> phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg);
> inspiron14p-linux:linux (arm64-laptops-v7.2-rc2-camss-v9*) $ grep cphy
> include/linux/phy* -r
> 
> Lets do _that_ work even if it takes a few cycles. Great to see qcom
> engaging with CPHY - IMO if we do it right in the qcom stack it will
> establish a good base for others to follow.
> 
> I'll go ahead and ask David nicely to rework his stuff into this new
> driver. Very nicely, we like him.
> 
> https://lore.kernel.org/all/220260718-x1e-csi2-phy-
> v10-0-5720a7888953@linaro.org
> 
> ---
> bod

Thank you for the feedback! We plan to rebase this series once David's
updated patches are ready and we will align with the new driver
direction. In the next revision, we will address the review comments
raised here, along with Loic's feedback and the concern raised by
another contributor regarding larger bandwidth handling.

