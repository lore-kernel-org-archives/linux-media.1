Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A92206A7
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790053; cv=none; b=APlLVqDJZyj668NoCXeNB5zfk7h6PBnXOrPREBmLnuics4ibyoVvfks0if3DWXwxC828hDEpdhP6N0FJElmA9nlFEbgynw4x+hm4iIKRPORVAq5m21r7smTL87om/C6fJHVrEr9xsa+DPC8xtQS5REDcnX8VHiFQA3zXz2ESMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790053; c=relaxed/simple;
	bh=aBDsjWojCpOjckpQIFcWTitHMvL3vFkN2gnGSLVuPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbbryzMGfcSkNuVY53oTFM2VQjGdCNN0PsMrdzxtC7nrTA840cJGelpSTf80JL6p2O9pqyymTkyPFuRxlGNS7oyoe+HoJh/A6cy9Twp+LGqYpZ0c6eSkgLugdhT6F2JobYQUEDeE0qqWlN7ZKlBMcGDEXO+yIcBODomH06mwUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkAhdFum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEtp/fDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkAhdFum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEtp/fDv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6AcL13411411
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=; b=NkAhdFumt3b6eBQm
	rItMWiVySlQ0Sd0K4Rkc4Kqdbvt2yqgZp8yUsqUw165b8+8PHBYgLNyQX2tHJsmF
	u34Z6kVKkFvilzwtqnaYVwgxG74aEx9Rhxs2oRLUoP7kU+FUujRrTfXvpjrrZtlk
	/VCtLB7o7ORd/YuEDjiCm5nKdfP85NkLVtD1zc7E1FODw8vV0W/RoXJ+Mb5curoF
	ej4dutPsgbBfSNq22ou6CzDf0S3p9dPDmV/8eC7Msy1R0oAMk/LBRIdIiTLvUzaN
	SBqelh9zpaguAE+ftTZnTL2JSlCkav2w8JSRdD3xko1TG/r6XodFBs3jvdqsAgPa
	acQG8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b51gch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 07:00:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf27789c79so4850345ad.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784790049; x=1785394849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=;
        b=SEtp/fDvBp1aQGQ0ZmV7xGqz8O+6AN8qe8oAcOnavBKl4E8hM5d9J0RJuEgWxr2SKC
         HX7+9YUivehPbtGd3hwpVdUCF4ASkjZJz5iiC+6cC95vkSt92ypfKQND97z86m9nO0oP
         vaTuosyYBU/mo+8kmx6eTMQGcsqmH5MXE8o3MwJ0ACgB1O1fOLpVJmxLeedQbvgXba8z
         2U64TYuWy/QtqUwwz6KKRBWQmMERGGAFOVQ2TP4hKhWeUBMR3JvWurcMQd9ZkQkUKZhk
         SMUSCB8EDgu/beOCha+SbAA4gGDJT+AoVyOui7Rf7OdDnpZGT+ZRbc3SFvFrvUK65hHw
         C3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784790049; x=1785394849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J+PD3+eCAhgf+ZAWx2EpNotq5X1MOFJb/Wo64exUAo=;
        b=FdfJUNjjBNgfvXfq/NQS+A+0JE4F41Oi53H1uu4WNZXyaCQVNgsoaCejHuCSV5nXtI
         cdGm4KplITbUW1F4mjnd4PZfR27wcTTY1SWxkktexJEhiPd1m0myZvFm+i4PwXnvP4Xo
         nu5pyqPBQ1fX9z2ucq/ArixqMD41ibTgB+j6KmoHXSzn5UJZmlyBBjSlnHK+Zq79HqkE
         1Oxw4OIcSlTQOytDdTw6oHoQupNHAXkLoUx5VxnYZFkMQFfV5LlFB55doJjKNTB/wW+6
         3tZ+lAQQZj3r9aU06QBrW4AZ2TxxsQUJQWxrPoHYAGlWAlFGK/IbY+x/1RCK8FJS7yaE
         zhfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUnFqNNnee7BB0w2eN/eWR6SFlkBhQvZQmsJlRKBbm/3L7WVfAH90fZuRbyikqKt+FDL/V39pI9juVlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywptu/ZHr1+F74JNO6iyun5DjWH+9EWQ8zrmiFJzFl11qR8vYws
	C4XPcgEyrCbGzFP6WLMN1zKgKF9XKQ2uNxIkAdDlD5AvGafnC4OA+ohm80Hw1HX1gTmaFPx1D6t
	6cmdTE0rt25DBVzXM+T5NiFFEeMG3jDxMAcIwDuXtMx46SyZMIZMVZ/y/VG1c0aTaig==
X-Gm-Gg: AR+sD10vETWJbI+mAG4LY7JuN/4RtrYq8QoMnpo4HiNiId6x72CwLCPkPgboM7fp9zW
	/oEXr47MF4R8g7n8dfy/SvPgdHC1Zb+qFMl/58YPLvWBelBQQpF75PvxFYFOu68kPlLclFCquZR
	8zEziuliXMeyuHgFotg9sOtWdcaMNkKtir86qqk+6Bl5wqKoTxvayFMYYxJJvaTaHM8NCxhp4BA
	OGxHs1pZsby8EfVmrJ1pYKQZZuQg93oaPBgwQdOb0ULI7hIKRGL2N4PkfYFU0ARHN7/uBN+Enzh
	6JhNpucGXaHYNAyxPovU4KEcVDcRe1Ev9m+g7eJ5LyDOPdhsix4JC4As2KqXiIIR2MxEh+TjnCL
	DE/AE5qLJ/osIPLxHzGiRa2WOyT1+BwbO
X-Received: by 2002:a17:903:1a4c:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cfa709813amr24046135ad.47.1784790048830;
        Thu, 23 Jul 2026 00:00:48 -0700 (PDT)
X-Received: by 2002:a17:903:1a4c:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cfa709813amr24045545ad.47.1784790048237;
        Thu, 23 Jul 2026 00:00:48 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6781dsm17746597eec.9.2026.07.23.00.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:00:47 -0700 (PDT)
Message-ID: <3f46274a-d2ad-4eee-b0bb-109013bd6b2b@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:30:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: qcom: iris: fix missing hfi_id in gen1
 GOP_SIZE cap
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
 <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-1-5fd6bd549ead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX5VfjqDb7quLs
 AoyRUGmGroeNUDmaUOUUkZyUDP6Rdf5WXIrrL4jeINbzM0LgAAZQ5m9AJuBRu4c6J9fyLvnU89A
 idvxSJc8xoI2TFbwQQ5cxXCHVMCVy5aWD30UTvGvJA9UytnE5H1C5+i0Q90DEuy4GdUhlcKWZfd
 KYFbnqWxY/2U3XiqmSk0m4cuE8JnRHQ+oheVcDovFbwXZSxkyPytTJ40Q1d6QQDe1QrvMP9y4Dd
 LO6Ky17JxLo1+fRxf7xCNYbdXs8DpY0x09YixFwnKu5lda2EaGSa7uwT+i3OnCJsGwBp+3+p7np
 j//PxHvkF9E26nRutJ0aYIA2RaLK75kXN9EVfOJ/nISNKIPc7J/TmLtGO7sRbQGa4q2KIJ8mFKb
 cMIBnLOxIWZB4nZVg/xL13MOY8QdjHshTYIDformSupXOOVAi8gd8eh9D4RE54k+b/tAyyYqoGl
 Ytj6QYVCQcv0yQczOXg==
X-Proofpoint-GUID: vCI_lFHMA2xLAjOHNbSXfdNrMpl4u5VX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2OSBTYWx0ZWRfX9Xs67kv53ya2
 BGS8ym9NtwYFsS4b81xbC1H4nH+pQormlZb9ICKjYe85L+eiJAwiYM3W366WikzQvzoU85fV9bF
 qroQHN4fixbXzmzAJ4wrY2HRufBnj1k=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61bc21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VE7FxYgvgxv7Rbt1ey8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vCI_lFHMA2xLAjOHNbSXfdNrMpl4u5VX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230069


On 7/23/2026 8:25 AM, Wangao Wang wrote:
> Add hfi_id to gen1 encoder GOP_SIZE cap and replace the set function,
> remove the redundant INTRA_PERIOD cap.
> 
> Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
>   3 files changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

