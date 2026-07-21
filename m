Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28936A34C
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632474; cv=none; b=IxvHIwMcqkGSRPFin70WWlcOCvFTcbDliA60Q4sri+lvCjWSIqddjfmK+yWZ0BNlrNxrT8hwZuejyg2VjfD57r7JKDDzuTLfJj07Zz/lrZJozgFXT7yJnWGTNkotQr0vhjPe56XZ1tsbRxp0s6zaBHSq5W8PIgPViaCoEBcGK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632474; c=relaxed/simple;
	bh=Sjhz4+Z5wlPNPtdAWpOb6ogBJ+fNKXzZBMheYmIfWAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6KdKu9TFO/zSCm3PY1+pFB0+9VQ76CIF3p5w69yqfVI5feJ5ptGgzq/UUCQ4UjMqDvLycEleyiCE9ZOduWUxEfhQ75s+BhvmQG2G9h6CYSmuALIlqAV3by1PWjb5mZF+fF7aQSlA+e729Qqr0uGWs2k+KZBOnlYUWCWn/K5TBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjoXDHsn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlW+DpBD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjoXDHsn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlW+DpBD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQqvS1611720
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 11:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	juXvGPBEtTNCrctgBZHdzuu83ESRVZ5kMVmMjdVQ0Ic=; b=DjoXDHsnxgwPtDbH
	K8W6PS+B2/KLM+8S/BGdVJY6QUnxrxGPLjQQMXGKhlCHwrOkLT4TJB9keXB716ZX
	w9fSFMT0hrT5BxrL+7RLQgOXN+z0iatuE19xW4N514RkCsIJmb16pGWKo6hssSuv
	GHv+1o+n01oAJTRFjLvcpn7EPJnJyF25MEvrUJYbUvUo1ZgAbx5ChnPnuql1Icyo
	LGL/rgMUQ3rau8FvT/XaNcud85NWe9jr2sWuUNW0eBrtuzOGJxgcNJKjHSurlbPv
	icnDwl1tiYEOefq+7hXab7/GtJfG2jyMgQ3THn4fot//QjUfswM3vRLwRRk1pN74
	Z1tcrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3g8de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 11:14:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7f385887bso274029665ad.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632471; x=1785237271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juXvGPBEtTNCrctgBZHdzuu83ESRVZ5kMVmMjdVQ0Ic=;
        b=YlW+DpBDj2O+1UAZ753uHgvGFXsW/m9rjmbfbuqEG99zOh4h2elzmRtDFQJAnUSWqc
         mGCMnaOluASWgiBtMunFpKuQQJFkiUO2RBQ40efgF02HIbaELMgG9QpDKSpV6vHGns/4
         2FAl83j4j5SXE4YU7bLUDf3ZtZ2u84vIpSfx1uW1oppjz3lUelUiIaRnHObdVzgfnsAM
         OoY5pt3HGzpOABeFPhth0VP3ZtIaKXxEZhQuIqFF2ONfUbgYnZr+fw+Cy8kNGGmxyR7U
         LI64R/dWe4VLRK48dB4S0L/p3gIsVnuR7tiNLUZ7Oo7NeTCMOh9pPZ3WT0HiCpmeKCOU
         FZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632471; x=1785237271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juXvGPBEtTNCrctgBZHdzuu83ESRVZ5kMVmMjdVQ0Ic=;
        b=fVmquZHoSpdbbmkebadTzQKnL12jVqP/3Muhd974lMi28W+d+wWu2ON5E+QwpvWTib
         PDTbTf/d0mjmDisCJjMYM+OJCwXhc/spZ/RdmpyInfSbIc+mmqbXEYcLeZ12wBz7qozT
         803Qc6vTzK75vLj/gwTwh/c4Y1UCMloEIdAS9DPxF4mzLiALU8r7TXSqyNA7kVmwRO/p
         86s1ktij/PUVMvsrviuaZUi8hbAWAaM5RI9h9nn/Is+2m7Oqv85S731GxKDGmO6xPZrO
         GTDeEkr5IRUv/i30JTQLU5mFxtJIg+dwd8cs+AcZ4pAY0wzM17ASK5fMCf8i4Ays4nAV
         yUGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEw3onaLXYCxgJO1Z7GLbIdBC8BlIPtA39vqcaLE96tVLaEDOBvjF2G6O+XB2mdgoWkb/GOCxt5K7vqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbqwoUpW8WAnCv5hdjcRzGbp1sXsNQixA0kqL6/hHQCQ3HUKzP
	+wpKw6v+q89HsF4Q/fp/F5ElpbADJcw656VnCfRj2nPZg3WxKmE5+0jW+FGEOXUr41Cdn7DHdOg
	q1UYSDjKBSab2KGZxlfFjBS+Kb4mAm8MKnwOdD72TntRq5YPjOPzZyypr5Ixgd9Kkl9EK/oCrfw
	==
X-Gm-Gg: AR+sD12A9jKkcu/T42YsVj1c7kYAva0Zr1OajRCYghDYoFOBHVHT8u281IZZB/by/Oy
	6tyr0KrG2vZlzf4YbrzPXdEoJaODQzJDun7XA0kxoYlNFNGurHkz/eOv3yf/wsW85R/ms9EV4QD
	CPB+EJX62yj1i2F7RlE1F9ou1MchNh2+y/xLW20d2UqJekoJShxxW6Wd7WKz0fwUwi5NQm+ftrF
	k8AqUk2eUr7vzi4iLp3fD4/0RrzV2BZ9oz6zDP+fMaw2q30o3azx1BQDZdiX46Dv8yAvf5k5p7l
	xSgxYRwObEmF1t6dN4yVKAmNVVru0VEtXXh3KQ9KpWghGHTMC1nlZwvHWjkAiDmLjCmhaFSRiXN
	UbqxokGvLvWkviSlwbbH+5UlPv8hUvts3Yg==
X-Received: by 2002:a17:903:15c3:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2cf34832649mr202547885ad.6.1784632471406;
        Tue, 21 Jul 2026 04:14:31 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2cf34832649mr202547685ad.6.1784632470872;
        Tue, 21 Jul 2026 04:14:30 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm47189246eec.3.2026.07.21.04.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:14:30 -0700 (PDT)
Message-ID: <b6c397ca-86f7-4fee-98cd-dafb5158c013@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard-resets_SoC_on_S?=
 =?UTF-8?Q?M7325_=28sc7280-compatible=29_=E2=80=94_extensive_analysis=2C_nee?=
 =?UTF-8?Q?d_wrapper/GDSC_insight?=
To: Kirill Ermolitskiy <00vopoj00@gmail.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org>
 <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
 <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org>
 <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
 <CADRRrN25w3Tgnnoi7FD3U69gVyf9COO_m+k9rdX9GOcb6asm6g@mail.gmail.com>
 <zfcbexld5clt6rrvlhfgtjztxus26vwsbceslye4gsb2gopdvz@f67onnyhpskr>
 <KfMRWO9F2LRou7cILG4EpEiPGm6HffchpxVwhuytmRA7a1-nRz5t_ju9AHD9c7X154S9pZIcxpacRlyoQ3RYcQ==@protonmail.internalid>
 <CADRRrN164E5vszWvV4Yfrwcmw=+miVYzikgWXY6gkrtqCeb8Sg@mail.gmail.com>
 <db859606-22e0-4556-82d9-21c6a21b376e@kernel.org>
 <CADRRrN2C3TX9axrYs+eWyUYtDTZ-R-7ajqgwAatyUp0oevjMSA@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CADRRrN2C3TX9axrYs+eWyUYtDTZ-R-7ajqgwAatyUp0oevjMSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX7kVhGeokjy3q
 FdfIoVU0EHkw/EnoKbdXYRW4UQ5wEWPFsdwo7RJ7sua2e3D6v6qwJEnyjyTi7668qob67WM+PVR
 uoFJ2+6jCfzteYqapsUESFsAMZW3JXaXxybDQSOPEW8vGCMjLdoGBwZzJcDSHrMXilVcCgbWis3
 5fijGJOTqWNGvuyxpbjKOOroXWtCbAy0+bUdVaeQ+adE5sCsjb4uCZTYeyTugFB72fMUar5jbu2
 1NQp+cB/eapaUHV2yC+74ivN3HSK6D7ueIhLc3QifjSGWvHibwRQ5CDI7hs70AWIwmjV0QgJFKc
 gkq6LfmMjxHaPQgJ6sFgM2YTGjoVHn6NbxjhJGI7en4dGwoYezPZ0T39Zj/CF6eSKH5vlgOVhK4
 L7Cifxw7gPY4KwiTrgPGw8xncWarOeH7npDaSMqUuVJxM+8W9NrXjAnXn/drzrSLqQcxmuduRMI
 nYPqgsynDz8r7pZQCXg==
X-Proofpoint-ORIG-GUID: fKlaz-ajAbslHT9uVl7nNLei02_XjOXU
X-Proofpoint-GUID: fKlaz-ajAbslHT9uVl7nNLei02_XjOXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX+5vpCaC0XuEW
 ciHilc3Zbm3F3uKXuFjOj7uF8AG+eMxsxQXg1alkZ9GxKTV5jIKpjPSDerrSMFAtmmqj4TInLNV
 kEDxps/Bwlsb9vNdEB1XvP30CItRLf0=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f5498 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9AdMxfjQAAAA:20 a=VwQbUJbxAAAA:8 a=neQ2ab0uOFyb7MXiRS0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118

Hello,

On 7/21/2026 2:07 PM, Kirill Ermolitskiy wrote:
> Both follow-up experiments done:
> 
> (a) Pinned allocations into a narrow window right above 600MB
> ([0x25800000, 0x30000000)) — identical reset at first encode frame.
> Together with the earlier runs that's three tested positions across the
> legal window (bottom, just under 0xe0000000, just under 4GiB), all
> fatal, so there's no address fulcrum to be found here.
> 
> (b) Mapped the downstream "secure" SIDs (0x2181/0x4, 0x2183/0x0,
> 0x2184/0x20) into the non-secure context via the iommus property. The
> system boots fine and decode works with those SMRs in place — encode
> still resets identically.
> 
> So the fatal access doesn't appear to be SMMU-translated DMA at all:
> neither buffer placement nor stream mapping changes anything. That
> leaves firmware-side access to a TZ-protected resource during encode
> execution — consistent with Dmitry's QCM2290 parallel. Vikash, Dikshita:
> does the vpu20 firmware lineage require TZ-side secure context/CB setup
> for encode on this family, and is there an interface HLOS is expected to
> call that mainline doesn't?
> 

Could you please try one experiment to write this register 
unconditionally i.e remove the IF(..) condition ?

https://github.com/torvalds/linux/blob/b95f03f04d475aa6719d15a636ddf32222d55657/drivers/media/platform/qcom/venus/firmware.c#L205

Regards,
Vikash

> ---
> Del'aRun
> 
> 
> вт, 21 июл. 2026 г. в 03:23, Bryan O'Donoghue <bod@kernel.org>:
> 
>>
>> On 21/07/2026 00:03, Kirill Ermolitskiy wrote:
>>> non_secure_cb: iommus = <&apps_smmu 0x2180 0x0020>;
>>> secure_bitstream_cb: iommus = <&apps_smmu 0x2181 0x0004>; (secure)
>>> secure_pixel_cb: iommus = <&apps_smmu 0x2183 0x0000>; (secure)
>>> secure_non_pixel_cb: iommus = <&apps_smmu 0x2184 0x0020>; (secure)
>>>
>>> Mainline programs only the non-secure one (0x2180/0x20, which matches
>>> what's in kodiak.dtsi). The three secure banks are TZ-managed downstream
>>> and mainline never asks TZ to set them up — there's simply no call for
>>> it. If the encode engine emits transactions on those secure SIDs
>>> regardless of session type (in line with the SID-selection-by-IOVA-window
>>> behavior Vikash described for iris), an unconfigured secure SID on this
>>> vendor TZ would explain the silent PSHOLD precisely — and why decode,
>>> which stays on the non-secure SID, works fine.
>>
>> As I understand the defintion of the IOVA bug, when the IOVA is below a
>> 600MB threshold the unexpected SID is generated by the firmware.
>>
>> It sounds like 600MB isn't the right address fulcrum on this platform.
>>
>> ---
>> bod

