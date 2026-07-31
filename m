Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A23F926D
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498091; cv=none; b=Zy3xSRZcAGIAgB6IuFjiqVGud+H70c91hqMYhSjG1Ue/CKFFocIzHp1M3VX+1mbjKhl6ihOK01J8N5cN7El35rx+bAOD193GC0ir558z0dxXgsQ+wkTtyhUT0awqCndv/4J6zpF3Pgd+NG5QyzP1EOMIRRNBXTjcJ5fmeAso440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498091; c=relaxed/simple;
	bh=t/AEkos+c9EqibZwHZd/yyWTAgGTemJDxjqXLp+xsmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Je99nHUFULL5nIV4vB0G1wAfZUZwVgXcVVzGvyZJ6Tn6lnWpNQkU4GdXlWubplaQAn4nNCMBvQwy0PhIFIHKaKVIL9oPiLGFzKueOKlaAMoTKWw/jEln3BedDj5Hc3tPqAjpA+jG9wWJ0lkRSjg708vD7XjLEAyJ8ayokSMsxF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Al84V0sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpWYcnEF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Al84V0sM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpWYcnEF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBNZ703854102
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=; b=Al84V0sMZ4qO9Xcz
	kqiAIhFYS6nv7gG3KvhImTx3pF3oHTdPA1hKlUJ1xrUxDfpknYpqnxJIYyVFP5V8
	u19DoBaSFw7EfnxVF/KjqqmLL932ios+D4DUjUoIf8sLFsHJQnOgGb7JpxsvPhQH
	5J2fy7xaOq3Es7UyUMa7CghqH4RXHtdHZln9JihyqiBjPqYTOqyiB0IZNCZ+cIIV
	cYwWgLMk3sz6SfndWZUowlopuralexPxByzvKQ/0SmNM0b/KxJp0acQSV9QR8/qI
	mrTKatOtTWKRTPi7/oXyn12m0akwmmoms1ABtO5OSXEvutCpqssx92cGAqCVhaVB
	0JSZ+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsk68bnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:41:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1698761cf.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498085; x=1786102885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=;
        b=JpWYcnEFzyGB2FSz8T7orV3+WkVRMyfE1YFbVVSg21bMGyWGTky29qD4jJfK2yIsIu
         /Ntdqzt/F+fHlR8vrYiYGK28ODag7a93dzXQ7kvflCqu73OGtzMPilUoEDpsNURzPs6k
         fnK5BRCuf5WbEIL8nk4p8eCdAWw5R5PP01GnTDVsiFH1Cxv4tTZmQxSp+b0MLDtEqszY
         z8qsLKVQ4YTiYXnDzI7JhFCWvHrhgZZQsEWPnhJJB8sG/Mj8gfcQ2s5cglcQGSg8SIHS
         xpqCGMo11lEMKP15zQEvIT1uIyRqZ87LIOnHCLdNKT0E2FhVIa2qjmzIzmGCgMh0CFgX
         42/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498085; x=1786102885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Su0oDlMbfDedbPdZAAnG9t8RidvVr7z4UsL5r+t2C4A=;
        b=G1JRN94xDrrXGOcwANvvz7hMtJLVb7L+mtzbGkVdO1LssSSsYeBpCJpIj0Mlkv+8N/
         4Tv/TmizkrBoZUD5Vqveekp4mfH9TBdK8xcP6xZhN+NwswZt5v7RqtZ7nAmAeRi9qbqN
         azKEH/xk4JWk4vw/LHQr9AN2S4DigsOoUQmw+hE1VVKz+GG3wrQ/GL+w6Q5D4rkklqY2
         7TaCrF8Dv900iMF4iiWdiYHn0ccC2sk+/r3fjUoj2nciQ1ipePRsT5f/aqnIsqFg8+Yv
         JntZx/WZlaCFXwAO0xO9hn3A0rnVnrTqEu6IwzCQhKD+CNjxt+4bJpwe7vKMA09QxF0K
         t9sw==
X-Gm-Message-State: AOJu0Yyen7eDb7HIoSQKWzVEWKnX8tStR3EPdUyjnTj85Xg0k0gQzN7D
	wWMfw+YoHe5Dl9FpL/eCkJIbOMXTT1JR6IdmFCLQM+2MWf7Ry6fvRDoC5hf+/aRXW3CSTO8rHH8
	Deyrd27oYxzqDFzR0J1fv5mm7yDXakJD01qstu+AKIRrHtl8T7lyndbQmIdD5YNcQkw==
X-Gm-Gg: AR+sD10x3vg1Ln2gGaJbY/BnH0lZjVd64pjJSRQTqb9iOw8GAUfVELGyCG6XWwh3j5l
	lYJ1jC0RZlHPPFzyGe+etIi7i6ThjrmFowaD5zkFB+keVSe7S60pjGWC8w96tGRmIZSH5X7DOp7
	bkSCnV3LlzR1jLPoG2s4deBkPS04rCOhR+KiO28xG8WfcUovCcXCbg3Kp2GnwpCXwnx7g9x3XoN
	9YwJQbMhY95k/ENSAtNQCAtXKahp0fCK5/Z5SwKrgxYV9QFVHChYH/4T+uurH0wkkZ8s/NSAjk6
	cwLIfuyf2dm0zsSf28yImzXQXhHqP9HTnEvsvXmJaebB9iqBg7PEfbe2CFT+mXXleRZzcOb7m6e
	f99/fUv5Nbsz672A0BilSJ1xR
X-Received: by 2002:ac8:7d83:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-52b4aebcae7mr19725401cf.1.1785498085507;
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-52b4aebcae7mr19724941cf.1.1785498085053;
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4453823sm129487066b.40.2026.07.31.04.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:41:24 -0700 (PDT)
Message-ID: <8d0c418d-849f-440a-aa56-110e8b7dfc07@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:41:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: iris: reject open() when the session limit
 is reached
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ojYnf-Afef4gDLSdJ8oC2Ln-XEkSLsWl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX3BTH8ok3lDoK
 5b+MQRohgEmrxT0l6NEOAwA1Rfziuf6Z1G0j2B7XCTClsIF+qUcJLRZGHX2e6A04Gts2+g9SfK6
 +dUqmocMx4jcwn7gCfs+6rrET95o1RI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX4ZzDfOAnfOut
 2m4ikqW6CxQy0pM9T6bS7atK/mZPWiAkwhdQNVLanB0CjtgBrJTwU4uRONqCG1eTFDii1wYoR07
 J2lwTDHofmU1IZwPFcUTFD80Xn8hJcivrzB+1wmxhXSvrXTYukOkbb3HhozB1sMZn0glISiZhEI
 zDy/LJbaXoG99/cZMJbH/BqnpGG8Tp038np1KapHBB1Cggs1Leqf76Fq+h0PpwdM2BoDK0Pq+KW
 VzX3yFEPO854a3LU/JlAYLeHHJD2kb3a0C58N+LVTjbVPyjvgfd+upPMHX6sqD6PCNBiGwuk6P1
 lWff19H2dsyz/Oj1V/O+4dIBvUoXDkKmD5l2YYSmuPBk1CFI9I8gvMXwb3XVUPxNmgWDAlaQu48
 fUSqSGOL6gV1KpWXsTTIsRUZXgnO3A5Ht8SXoNMRmOgQiqqLyvJKsdtb7OpHT0fJRPEQm9jhO2+
 7y8RVQjhmx8YB3Vct7g==
X-Authority-Analysis: v=2.4 cv=RLGD2Yi+ c=1 sm=1 tr=0 ts=6a6c89e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_us7XynFyZs99I6bamQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ojYnf-Afef4gDLSdJ8oC2Ln-XEkSLsWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310088

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_add_session() silently skips adding the instance to core->instances
> once max_session_count is reached, but returns void, so iris_open()
> continues as if it succeeded and hands a file descriptor back to
> userspace. As the instance is not on core->instances, firmware responses
> for it are dropped and every subsequent ioctl times out.
> 
> Make iris_add_session() return an error when the limit is reached and
> fail iris_open() accordingly, freeing the partially initialised instance.
> 
> Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
