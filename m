Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0093749E3
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723058; cv=none; b=MYkpzZxgDq7eyjaYFrYsWVMd8ijyASiVFPfoGL1XOT6IoNRgjBktOGlmijRdIxpejJQSOK9jd8SIjSh14AM+chx4trOIwfdZg7TJwIESwPtA98v4mPpWrDzqwmpckDk6vHJOMnTBQ7MREmBDbgqVOtM8S91D71fP+rdqgYj+ogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723058; c=relaxed/simple;
	bh=pgXseHL4P/N9X8ED+Sbc539UZ8xz5ai3F8u24033syI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3etNCo4t3JuBqi/ZmhzhR8WLF3YQYoRyN0+q23xo5sTHbT0WREyc91ihwWZVywVeeLgASrKR5k1n/W0ag3sYmFWMT/DIPjEmSPqSHOjYu3N0iYYpggof7sHNI3wSXG3R5ytH2tXkJYMPDSc1FL0eokrJc6GExCaG5whUiaK8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVEY9OI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSFbEH49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVEY9OI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSFbEH49"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xCYS141190
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RbH7wZTH7xnFksDCiSXKzskPFK0RJ+i+meU0vJp3WY=; b=CVEY9OI6MDW2LR9N
	qJckEixGB8BL9SIhmTPK7aY0E6n6ZqA94hTdogvQ8b82+QZDRuRLFs9O8lLIHzCC
	AAHU+FMvea6OXPU/0VOVUtLxmMhLtTirWGT/Qj+z6re04N4dm8Wqfs8/y0i30ao8
	uDnni7GOxND1UcojmiJC4rtQbnt6I4/pUIBFplGBG8tgpqRYWpoOoQBZINbUcrp4
	so0u8O3yzBO2XlQPC3KYu+c7pH6cGXEkNutkqTnVrqra2+7X53WYU99bKNM2tcNA
	WQlxVsWlCyr1/eV9Bq0r8vm/IqV69artCdj7/5jtLM4xQqiKoARnVbUHf++0wdWf
	a1Vy5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rva2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:24:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so128125805ad.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784723051; x=1785327851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RbH7wZTH7xnFksDCiSXKzskPFK0RJ+i+meU0vJp3WY=;
        b=DSFbEH49IvGQ3gBB+XpLgXrb0kTHu1RGMqtDl7M1Xt6OWUir2dYQZZUawSH5TNj3gI
         RpZ6wCz/bF51E59o4ecbsDjW0yD8fiRwidL1RdWbIWrPB8Wf6TSFFVigGzb6sZH4Uqfz
         HuE5D71QTNAzgYLjDR1lQ40FUGpTx9M2uViYLOAAEd08wtNuQRF50pODHJQKEzDPlbPM
         MN8hX5WFKC6mNTYbf+51lrZD2Y+Rr20bz4yONSPx0BwwyQODJGZRbRpVfiT1XBf5L1Ro
         k/oBgMPe94LibWxeES3RuhgvsJHNtU9osyQTCVLazYaSd4zsB4GchzMMd/ar9smKv2JU
         G6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723051; x=1785327851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RbH7wZTH7xnFksDCiSXKzskPFK0RJ+i+meU0vJp3WY=;
        b=i/ZcgrLn7gl+NP/8AuyFnEdsD/B1FialYwo8DvV56aoYqPWxcM6VFUYMzKeP48sopb
         k9yWgcwj0AqAfVhXD4eEMwf195eaiEq0kxKsDO6g+cP/TxHx350/BnYRz1O2VtEW8aLQ
         i1RbDktojd09wpV3XoE4yVI1OFR3TRw0FcKX2nyX3f99Yxey4Vkhd57WQSLl66QzltPc
         mHlMo5za6423ugwPHX5qrjVHf7fBumdSn7Zo/i4nYI2UHCzKfesacbjZ599eFfsrbo6V
         Qds2CA1g05Q/rIVtFQC069OyVMGppk5GszpiKNv/5AC4+kBNrrfGbq7QuCD4Ee7HoXyf
         /m4w==
X-Forwarded-Encrypted: i=1; AHgh+RpXfaULuLPW4iAKAggEWKbqkpy/a2JOYRwnb1rv3/CEf/zRJUOOVpEBOLU4/PbaEuRE88qWGEk8J472Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUlPDG7Le8EcSh3hiN01qie4TaIuWukPxnjrhFp8w2dJEiPwwK
	AerlAYlJQXnRSZYVPnGDFuvFIbYMaC7U5hIt9h8tSIci8cKBedaprInyVpLhFtJ+C9zqs97y+3C
	uxCcD7U2eeV/kMeBIQtrGyNvAkW2u5wtpBjdtc1T96RNc5RzwrXH9+Vh7M2+q+5K5Qg==
X-Gm-Gg: AR+sD10b9E+NVm1tflklpIxzcAUSqB6Lmiqv2031UCB89cim3WOtWrPAdVk/E683LwO
	Vpm7Bc9oUeoiRHdri9hbkJ4sJK38HgEoSwH6U1R5kBYIuyQkJn4gZcyTcwYRlY0DJPDzjjkWtsz
	X3jf6TewCm5IqKO5OeMQXRavqvI5lLVYZP2ShvFMHVhG/M0lQ4wIefEq250HZ/OlBTXm4FwqpoQ
	TaLbDi0IpmUqWmOg6TntVVylZQSzUDzK+6caYI1dVXHnEPmB2C3VEicTQQkbrsNpwNwh1SZ7yJW
	v01K837WwJsX/siJ8ecCcjkGzjbXBLez5A/3jWwfb7LQsopnGLf4SeGW1kd+8u25B7zVrgCGG2A
	w3GXQwlnXFEToB7/Yz91y1i4O+gXcT7RT
X-Received: by 2002:a17:902:d48a:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cf34889935mr252841065ad.15.1784723050762;
        Wed, 22 Jul 2026 05:24:10 -0700 (PDT)
X-Received: by 2002:a17:902:d48a:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cf34889935mr252840675ad.15.1784723050307;
        Wed, 22 Jul 2026 05:24:10 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm8794496eec.28.2026.07.22.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:24:08 -0700 (PDT)
Message-ID: <3c48c1fc-94a2-7180-0922-aff5a1a5ddb4@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:54:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/3] media: iris: add LTR and hierarchical coding
 support for ar50lt
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <moj26vrjujn6ci74yrthdjyfdabg4tn67n7hczkeqvjhknm4ai@ilxz3c4jvcfe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfX/RqopBTU0qAZ
 5njGtu/LTPujET6m4jUzikYa2kCmZirqhN+P05bju1Q4LZBGZFDIN0LEcYR2AoznFUvQYtUCLHd
 hmNi9bkNJoWnwRX7ZRlaJHQludoi4WVhUD6aBcXbVioSBuhwgxpx4t/9U4yCYRWLIRlKH1Rri8G
 rrjRd3mo9xQk8b+jmJdl9DAJQomMlIQXQkOPV7wiDYdE1Ee7QdS3kkDSSr6CrqvtvTFymqtWGMk
 W+m6e3nxEC0CFcda4qx22Kq0uPy+Q/kwzhnDQXkJTGScbQEIJsw8ONN7Nz9MjJGZiQ4c7iRQrap
 A8OIYdysYElykAN+uYaHbyK4jhZJPxDMeEhbRPFsp+EaduHElbZ+csxnb702Hru6nuYbgiYcCkF
 MemgqwFHL6YR85L2yoW4Lsc1DdSuzpORSyu8nZiR9f2mnBzFRAFqjuqLfJ/jee0ud1fj1Lvx4nU
 u4YH9Hq/cFdefCg6uPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyMCBTYWx0ZWRfX+xS4EZZdqRRY
 Qj6o8BmZRjeyISjRucvIBVd8ZmnXZOk2AhFDwya9gHApitTxoHrN+F7+fCd4gA5krr3g2quHuuW
 TAD1YbvlIu3m+xQ0m+BO0VbFcHwkiTo=
X-Proofpoint-GUID: rooFXQdXYGPTiAiFQvNWZ49SoEBD08qg
X-Proofpoint-ORIG-GUID: rooFXQdXYGPTiAiFQvNWZ49SoEBD08qg
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60b66b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=VgYAnUeYBmn4XOIh2sEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220120


On 7/22/2026 2:45 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 07:06:22AM +0530, Vishnu Reddy wrote:
>> This series adds support for Long-Term Reference (LTR), hierarchical
>> coding and request key frame controls for the AR50LT encoder by enabling
>> the required firmware capabilities in the iris driver.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Added request key frame support
>> - Link to v1: https://patch.msgid.link/20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com
> This should be coming as a review feedback rather than a separate
> series. I'll incorporate those changes into the AR50LT series (together
> with the similar changes to Gen1 firmware).

That works for me as well.

Regards,
Vishnu Reddy.

>> To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> To: Abhinav Kumar <abhinav.kumar@linux.dev>
>> To: Bryan O'Donoghue <bod@kernel.org>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>> ---
>> Gourav Kumar (2):
>>       media: iris: add Long-Term Reference control support for ar50lt encoder
>>       media: iris: add hierarchical coding support for ar50lt encoder
>>
>> Vishnu Reddy (1):
>>       media: qcom: iris: add request key frame support for ar50lt encoder
>>
>>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 222 +++++++++++++++++++++++
>>  1 file changed, 222 insertions(+)
>> ---
>> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
>> change-id: 20260710-shikra_ltr_support-27bd9a496950
>> prerequisite-message-id: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
>> prerequisite-patch-id: 8b5a1be5778fb4c7feb069452ecb60e8b8dfc3f8
>> prerequisite-patch-id: e669517302297a7b315c9aa4f4189e4928091e0c
>> prerequisite-patch-id: 922bc325dbd9a499a3a209d2f8dbbce6a4166e60
>> prerequisite-patch-id: a5a49cda4e21d835558fa84f2f6bd25b8f7e72b4
>> prerequisite-patch-id: e62e8285bcbddade64c026379f23a8c5ae70fe52
>> prerequisite-patch-id: cac29b25348e2e791638a0286283109f2546f9a7
>> prerequisite-patch-id: 4dfaff2f9644d7a168b1b35fe947660b8f464af6
>> prerequisite-patch-id: a26fa49eefecf2b5ba6cf964be9327eb5ba5929a
>> prerequisite-patch-id: d97c79463fe1487fa7bc9eebd4cfb4610713f44a
>> prerequisite-patch-id: 76eafea8230160a3b5e6503c68a5c9c3c2d1497e
>> prerequisite-patch-id: ea9cd9a8e6561321cd9cf338a76da1382ff47e13
>> prerequisite-patch-id: 26e9083b709cc8f2f1184edf6b39fb89f365a9f1
>> prerequisite-patch-id: ce4576bd3d20880939a97a1cda9bb8678808ea65
>> prerequisite-patch-id: 8c94bec467b385c373bd98eb9ee5a5805fc4e6a6
>> prerequisite-patch-id: 6e258cd475b77927d6476704cbf91bf48a63aa0d
>> prerequisite-patch-id: 54c8855d0721ba8667d095e6ad6556c2021f89e9
>> prerequisite-patch-id: f5479d2ca6b850c0c750944a8e0b05a7df2cc5a8
>> prerequisite-patch-id: 96dfec1c2df69f748c1a4bd741628e946cb7bec1
>> prerequisite-message-id: <a2c02dce-b097-4f52-80d4-d63006ebd8c5@kernel.org>
>> prerequisite-patch-id: aae7aad665adb93ab0106c28420e34587ee82aba
>> prerequisite-patch-id: a2b7908b27a6308f9919c986f8bde5b902e5d6da
>>
>> Best regards,
>> --  
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
