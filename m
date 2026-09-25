Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7943750D6
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340859; cv=none; b=e4sssD0rM4LzE6gBLxXBt5K/B64pCQHS4RJJTZiO7PPnyu/EJso5No7AEKF+Ddk45cFgaMVG3mfgDTjDEFIxSf5n51LwlBLLZZc/cbRRSeBm/y2Q3092TDzR0xG4nnI3yp10hizx23WCSLUv04iPzbrC+QZSh/mf/yEL1PryxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340859; c=relaxed/simple;
	bh=CdPpVt3jhTVkM0bzeDaDuajKfQ5z2AW/BLT4e8Y0CzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6ctf841Y70Acj8l9oZVds/OsZoLwt/4ztqajgFGyhyzCX72ZokvxzxVTH9plzCPbqOjZA3aB2l/nHnPDwyqv5loSbrdB4T8KyKK6yS9G/qWn25GC1TYakyRgUo5jAYWUgm4Dejj4dev4CF+TpIVdo46/0TdzH0XEKSBQFqxYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izmCRHTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifg64bMv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izmCRHTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifg64bMv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PCDTkK3532505
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=; b=izmCRHTGtblcKxjS
	md6gN1qvEAI1vayaSIvug+//PSzlC6FCs++LfhC51DU/9qRYIwBTRqPRNhsUVt8I
	6sBmjLnkhsYCyWVVChyYnsnglyg+HunoOhly/o2bPYUdqLe3a3O7Yq3L4ySYCVDE
	FoNDy1g3x8f7TdOohqDI7EmgEIHcaojbXpSzKF4JcD1Luh91fAtwa2Ic+W2cI084
	SFXIFL4Ljd6AnK5H68dpekoXwiqfeZfSiOrANqYSaF/H33JfygeoyoPRguLekPNJ
	E/roQ/IgWTGAr6yStIh1FeD8FlJcNeNhirIIxxGvtsBANjrLTZZGYUCqROFavXrt
	gw358g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kb7ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:54:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so995607a91.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340857; x=1790945657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=ifg64bMvbp0qA++xtfBkNRTNBSrpMrPue4o7TvKqq1OkTaCvyAYvwgxJQbl8Wdvp4i
         hoHwTeHF6LgCJ11/L92IiARRQFp0EWgsErd6CuG3pXPsnpSEksT+zVwLO+PbqK9Nmssd
         nxcHiHRXCMbzqVaQXtcLvbn1uX9I3Hd9RtlxvN+YG8NQD6Aq11ziqX0iVnkQyEw2atH+
         xOt3hZm+06dWS2ah1cwflLUf+D9VDqOKeNpSJWX5adHxfK5yThbYOMsDZD2P7uzhizk7
         V5OK0mAkVytWhMOowalGcibfRxJy6nisEY5UpK3Dk9NGPIMvV2rM2qq9im8kAlVLn9Kp
         1tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340857; x=1790945657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tS7aD0v0oP7zIS58pNV4/khTyKAVVNAy4M4J2kIEBbo=;
        b=zhYuM5SUV2e5+TS7OMG4QZzcn67y80rouXNjbAQj8dfxPAZBQRfx59F9HwCGfSKV0o
         L5p7A5RZ4xgRJGHYSrjeoq3mpbvwclp1avt6yoDtEg5vkA4EhOaY8SktldPK3Wh9UnE2
         e3el/45z32XFpGWtI6U/RoiZsjQJWyg05YmME1BiM8prfabYfkhlZw1tWLrujbknaduE
         ljNUN8uJhC5te301/ANJk1lIxMhzKiR29Q0/Gz2QPquRd5KCjelXHNmi9VL6LBUabyTm
         JttGPmmWyQszMGgZg7ZLvuzNe22uR+4a95U/wZ1DtPOo76fGIXIoVxyhJa/GLjDP+a2S
         K+aA==
X-Gm-Message-State: AFuF++mv1R9XQdvR6Q8sxn8IEvOwf1bGqfBUq3KT5+lZUsHfAmApW0mu
	kdvE0wNed+w82/0t4gfLfDa1iUN/MHIrvY3oI9HVgOJMzm4miyVBR7U1KZzZuBnh89qcg7Goaw+
	Bv1v0syv0NuAdIZjnhaoilUOr7m/6XCsBnW98T5B8tDmjILEF0xMuffJVMgl4i57p4A==
X-Gm-Gg: AYBFou1wgwEyTevxWJck0z4ScEeeSahsWhckiqMMjh7eFYYhiTjvBlyTohGSs0utj4p
	BXCDjzhVvh8uxJDrsUN6EC2ksQbUXRPow/l3MoLHfP4vlzmUvIG5ptaxp3mrLYhtu90JNH0Zljk
	oYcbo0nB6IV2+bX3tFNr7KtNwd1ySQ7w+RWchXlSSaGq9Bj8bVsJzjZCuIDPTpOw6dsTYgPs8ZX
	h1Cb6sufs4OTB4rkML9XrSarlay+5RL1pgc050wwVbUmn2zbIBYlcNhxneGHqHP3vSTROXBMPtX
	LeMnQur8APSHjWevLr1/9L2mBnTXyfu7DLd40ZenCKLWj8xTzbW+8nEqJfyHfuDVn5YJaBAGdJE
	B2p0FSRXT9HkpFHpXIxV7OSMKwn6ysCEvYA==
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199225a91.59.1790340856493;
        Fri, 25 Sep 2026 05:54:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3a098aaba1dmr5199199a91.59.1790340855905;
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm839778a91.16.2026.09.25.05.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:54:15 -0700 (PDT)
Message-ID: <14797f32-9355-4b81-b805-af4d8d8ef5f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 18:24:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
 <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab66ef9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iB3hNsdZaZMRGRx/E791SA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZVrMA9eccY_vmvRiiCEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: KH6bb2YSKDItK1b45cz6QOGB0jVbkJ4t
X-Proofpoint-ORIG-GUID: KH6bb2YSKDItK1b45cz6QOGB0jVbkJ4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX26StegndyppB
 y+ATfcrXjEdyOy5DiVjmtPbnUm8OwuZAKfs8LGy1YpQs7cxN/1DU2KgCFvGUUgVM6swVt27tq1+
 lLtrMeDRer7nNZtxMNBbUOVQJNuX3ZLUv38DDIlQYR+2w3xgf3g0etJxMDtUlrz6SYY86sHm6MA
 qM3oZnjzdvQnfuxVdZY6M3psstOy7yN4g+qpoLMQYVOqJ8IesuDIgagj6yexPSP5zQQ096SF9EW
 BdU0bh9GceVY39xQpa16h7XaihWtvPDbwwaMN1DSi5nQGwQRZBXYyMOSzLyqkQpvlE7rFMDwWnW
 ml1zuWihAb2Mc0NKuFjc7VvOZzCcDJa7t2wu2yFgJrUu4Wa6M+3pNxqo+ysz/FyH1SnG1rf3yCI
 1HOvtDve6rHc6bun3O/hb/r+SN8DOsm+BxdJ6/j9qUdsHaU0sLehi7vTBLOG0duB92MP5q8szYA
 bikDnyr1RD/T9TeLH6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX4WYoCGbl43BX
 RKaH1xfhu3O5h1HvthgDvSmDUqrU8zH9nBrmiCvtxtehs5xqVLIEMAGzuAzhfXcCpdVDv/1wbRC
 PdcAmnxMR/JXggGTOXev1Xo5mmh85Lo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250051



On 9/24/2026 6:06 PM, Bryan O'Donoghue wrote:
> On 31/07/2026 00:48, Dmitry Baryshkov wrote:
>> +
>> +/*
>> + * Detect the firmware generation and publish the descriptor. Run 
>> only after
>> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI 
>> generation
>> + * only for a firmware image that has actually been loaded.
>> + *
>> + * The generation is detected from the loaded image (@data / @size 
>> point at the
>> + * reserved memory region populated by qcom_mdt_load()) rather than 
>> from the
>> + * request_firmware() blob: for a split .mdt the latter holds only 
>> the ELF
>> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data 
>> segments.
>> + *
>> + * The descriptor and firmware data are published exactly once, 
>> before any
>> + * session exists, so the lockless readers in the ioctl paths never 
>> observe a
>> + * reassignment. Later bring-ups reuse the already published descriptor.
>> + */
>> +static void iris_detect_firmware(struct iris_core *core, const char 
>> *fw_name,
>> +                 const u8 *data, size_t size,
>> +                 const struct iris_firmware_desc *desc)
>> +{
>> +    if (core->iris_firmware_desc)
>> +        return;
>> +
>> +    /*
>> +     * With a DT firmware-name override on a dual-generation platform 
>> the
>> +     * image on disk decides the generation, so inspect it and switch 
>> to the
>> +     * Gen1 descriptor when a Gen1 image was loaded.
>> +     */
>> +    if (desc == core->iris_platform_data->firmware_desc_gen2 &&
>> +        core->iris_platform_data->firmware_desc_gen1 &&
>> +        of_property_present(dev_of_node(core->dev), "firmware-name") &&
>> +        !iris_detect_gen2_from_fwdata(data, size)) {
>> +        dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
>> +        desc = core->iris_platform_data->firmware_desc_gen1;
>> +    }
>> +
>> +    /* Publish iris_firmware_data first, then iris_firmware_desc (the 
>> guard). */
>> +    core->iris_firmware_data = desc->firmware_data;
>> +    core->iris_firmware_desc = desc;
>> +}
>> +
> 
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:161:12: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    161 |         if (desc == core->iris_platform_data- 
>  >firmware_desc_gen2 &&
>        |            ^
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> In function ‘iris_detect_firmware’,
>      inlined from ‘iris_load_fw_to_memory’ at drivers/media/platform/ 
> qcom/iris/iris_firmware.c:216:3:
> drivers/media/platform/qcom/iris/iris_firmware.c:170:40: warning: ‘desc’ 
> may be used uninitialized [-Wmaybe-uninitialized]
>    170 |         core->iris_firmware_data = desc->firmware_data;
>        |                                    ~~~~^~~~~~~~~~~~~~~
> drivers/media/platform/qcom/iris/iris_firmware.c: In function 
> ‘iris_load_fw_to_memory’:
> drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
> was declared here
>    176 |         const struct iris_firmware_desc *desc;
>        |                                          ^~~~
> . "$TS_DIR"/lib/common-end.sh
> #!/bin/sh
> # Copyright 2024 Google LLC
> 
> Proposed fix
> 
> ╰─$ git diff
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/ 
> media/platform/qcom/iris/iris_firmware.c
> index dfc4c184646c6..39558a300d38c 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -153,6 +153,9 @@ static void iris_detect_firmware(struct iris_core 
> *core, const char *fw_name,
>         if (core->iris_firmware_desc)
>                 return;
> 
> +      if (!desc)
> +              return;
> +

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

