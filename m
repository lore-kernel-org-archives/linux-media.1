Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313933C198
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 03:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170807; cv=none; b=MIcxENmxLKXyl/OyUx/b24/772TSSlKjEzyQuYJoZtCXC5nuNydR8fCuaa5tnq3nyC8j6n33OzCh5ZhoA5aEsTkybhZJaYaO1DGyikyy8+MJ0M137WBeEZUZoXGBTIe/B+BxWbfaOMYzUYYyn6c/0qghoJwYuO7m/W9UTF4L+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170807; c=relaxed/simple;
	bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se8UE6Pha6m6wBOseaalVTJK55mA2ZTU02Yh91iaoZ4mwYlvStJ06BGM+IJsFM2oIZxSv8hLkBrRhNabz5lM+6RprTAPrXbytu9l8PG0G/78XiUEQFiaHo52xnx1mil5iQea3KtFXLHG3b1eAgy3V2tyvgm0Mpw3znP93Jd5vec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+s2EVqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0rx0EWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+s2EVqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0rx0EWQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XnoH1226902
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 03:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=; b=a+s2EVqLXf9v6Fdn
	9NQE/H5sHVS3yfE5C7hFH5wdv+geYr5SerZ9X8sy2qefOLLsJpezdCkXtdwt7dIy
	oyoj3TWGTcPlBgC6w0sfm1uVz3YhECQFPCVuBDxGq6EEqxWemnuZxAUB438YDMmW
	aoRGQJFqjnhjL3ekE2H6JHioTahXEFBTeG52Dld19of6DZtyE/39uZSKLP5xOmac
	OoSJDcncz6Ur6GzcnyjesZhWBz9xjpAQ2HSdh09aVqIEbpaEMbM/bl8RfdFwo5JY
	vN9OChJjomPWSjL2+4RWsIAfp4O6e/whRhCPV3oxi1L2ttb99foapYmjzUW3nJE0
	JMtuBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1hqdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 03:00:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8952346bb9so5198129a12.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784170804; x=1784775604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=M0rx0EWQOpTxguDb3LvZjSqfbwSRN+zjeUhwPWdmwTeMvjB0yXFffOmOzpSwV2RBgd
         mnH34xlhvBbX8mHoYb7Z7U93NZbhGEDiogZ0i1Ci/wOvyzM+qJvbg8Hw0EF09Guz1XGy
         bmfsp4kIlAGeZsKCS/e5pz9SFC/uoOa/x232n+LMY5HOT7qrt4TguBBuUqR0XIhBpN7v
         Oqo6d1WhaXKlgFXOKcdpK8YGD5vA5khPjMyObAvVvxjx6DDCrBPOie2+kRIufu5XL0xW
         np1WCv7MltKpuhuBDw437A535hoqo/+5HRCaFO/ROWbQzKr5MJlfycm8w/Ij6gLt57zj
         vMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784170804; x=1784775604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=dsox2lAZ6h+RSBXlKMJCBQXK0hFM2evGSltFriMPUwnDph7KWyJLD6Zwb6I1JGJ3Ie
         7oS3V3MkAe+PP00XsqcSCJXAxA4ITiinL7qY2PR1DOb7naANhuqpSK+92FFTPRhS9kdv
         Emid1vw68s7vEsytFu/cpDqp0us+eiTIU0G9FKFP7jOECuGDb7pgOdOq43+GweKQpkJt
         7HufRw3CPGkSHgSqY/qUNfQX/PWHo8BktJer0qEBn3vtS/KzoOnPx4Pu9d4SL7EUKPRF
         SyNjbSiWbAtfGcCABB0wDlmKDuue2u7QqrkPzxpcGULZyXQCZYWFXxqH9Ozem4zc6eVM
         +sVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8nFIkFW3cd7IzmUIgET+CP2lot9aUg2jAUXCYGiRn+M4WRXcueqi+aOTN0lKHq8B8tF7f5TeTg/pEXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbidbQo7szZlUes7aRH4lJ8MVP6ZQNIm2ASYRbjMt3Rggqxxe
	uZKCyrtbh78VDXmIqIJ0av6EK3Ia6cef3ujhJ1Zfd5LSvLvU1GhTgkEqbUPQsHb5oHJzZ953cSd
	HKpHzdJ9LLJHP7OGWOe2RxJUpMNrv8FZSOVClXn3YmZKetEVleA7cbaqWLNOZbsPlKw==
X-Gm-Gg: AfdE7ckAUCmJZTT3sXtXfI8BkUwNVVNjzYLPrhfJbWqgKXHoctpp4yZSS7UeiUyjOSc
	XjL4qXwZKuHjZ5zgDfq1dhMrPMRCaVR6+T1eK1osG9oL4SQE54YNUhHu4vra3psjdSQC8+zGLTY
	14nbf/1mUyXZl/FJEjZyE4hXud9o6qU5BKkJNHsj5HmFioZt1ChLXL+tiRUoriIBx1QuosUP02S
	om2wizHsw4CBxl/eMMY8tWgTGk9JXA4EzHD6LFkISxsCyTjzqhCy8tamaIDskj/WjR81g7wFluR
	qtEZxMTHQvjaEp3/WV+OdejmrhZDKehbqkcQ6yL5KkYzGDdEzSW5r7Yembt45eMlNdoY0jQsQmB
	cJyKxb1Lqy4beAHoxhq0emGVgiQ8/D9kT
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496356637.76.1784170803882;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496321637.76.1784170803467;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm5611519c88.14.2026.07.15.19.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:00:02 -0700 (PDT)
Message-ID: <205236d6-6d0f-b88d-99fd-b03decba6fa6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:29:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <5bXXsqVEXaFsaBMxPP6AkG6XZFXCBP5B8YfjHjhTXuqrGd-XmP2eWPhNhH3LWxKQ_PWHTbdgIRh9AvROtnEHog==@protonmail.internalid>
 <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
 <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfXxi6Xc8IVpR0n
 beUxhvO4OeCPB7O+2ezO2GLzd5nvHSsE+LO7I+z02qe1MbAwgm9xv7+pCkK2B/mNwBX94Wy3c5s
 bENK7wzwfhx9F2ykB7BYYtUGimcWfXf5m2a5XUvCrvGIgN59KnEdnrPyPOqcxixNYQcEU+fn9nM
 /orTTtltGT+TSQOxnSsPPwFroYHUiLrgwbHexgacBv58vNiPjI+KZGu9ipK/cAq28eCaalY4aFz
 Ybqx2jir3W2NAGMphnvCHxZ2EWjX67LCaP9fK2BdzHyQgJY4Y2EJyIdIlYM+EVhJA5Bby9HDB4U
 36OX0k3Z0KKwJHrS1M5TlDr+KiUgVALOqciJBeGxB3M3BRc6pWZI2DzdnxUvlRZjTPHBnXAGzU+
 lhZywC8Jb0MXtrKAzNxozIzwDrcKuiESSoBelInizYs5zaHk4YxJDBlmoe8pUGWFJjO1/kNmtj6
 hG8ER1IuCTpSKXsP7pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfX8EHi53IsfiPA
 zM5aggNNrLbce56Y1Yfv53uon9QC4VcJ3lKoj06/28WVIPdH1zfiljJXReJnDfwTiU24zMFxp6+
 PWev8zGZ/a/1MsB12zn2M8LluXz2MNA=
X-Proofpoint-GUID: y6ryyRum0bq_29fUUgO7j5Pa2xWYhykW
X-Proofpoint-ORIG-GUID: y6ryyRum0bq_29fUUgO7j5Pa2xWYhykW
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a584934 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=wOmbOZ9kRXkywvreR9UA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160028


On 7/15/2026 8:57 PM, Bryan O'Donoghue wrote:
> On 15/07/2026 15:10, Vishnu Reddy wrote:
>> Add platform hooks to create and destroy those
>> subdevices, and wire them up for the affected platforms.
>
> All platforms are affected no ?
>

Agreed, it's applicable to all platforms. Will update commit description.

Thanks,
Vishnu Reddy.

> ---
> bod
