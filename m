Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D383E0C70
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498058; cv=none; b=DundbqZSLrRUseBJm825+eh7eteS/zRLbN+aKdHSaTjm0AqcabEr+P/fVg132lXtYlZE0pnXF9DZQZ8S29AggVxUH25nsgQLkwOcOoseAYHx78/d7P+OiDJSuOQmJUULYTFpNF19QRBe/2QubrHkDZR6AmyOu98Xt8WfrUiElKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498058; c=relaxed/simple;
	bh=5yUznAelfeq0vWs9CLhFYrQ/dKHAJEYsEMNEVqvx1y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJ0gbMiQd0szqb6qcVm019TlUqCk3XhyoCjUO5DjNK3cTl0Xuf+aM9d/Q9EQOQomU5ULfmX5neocfO9PaJuVKQrN1UbAnbAN3X6LQ+2oo/l9rfj0g5vQ6ONy8dDgouYBkemswRJWFTC4WmwRgdhWJg8IPSU3xuSh5AGzm2yqaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2/QgbVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZc8O2FQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2/QgbVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZc8O2FQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBNDqb3858676
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=; b=D2/QgbVc1RVpLrOv
	teDMoIixayPd5zdIQ7GSZmc4xWdrDeI1ulvmznu2Ln2D2lGVQgkUiOB7CyW/Xa0W
	cImuA3ictvd+3+eH0paO8mmP0QiXcA0K/xQ3HFvFFyBB+9KqxYOyYEdVm2cGTrDH
	wkQg9Chc6O1rNLLZgfdw57Fy8LsrSewWVDdtfTr/eIURoVD8PSn+NLrtU/UlObI1
	dm6DNhobYNZC5b2DQp3pnp+pgUr9d4Z9iZbvp0ra5g/3sTS9YwStFHcEKDA4WjmK
	jblxDVE4LUgioNJUZN40ElDAA4Kg0F6E0Pt5W67Ds+RTBmlgu8i4kOKvoKfGqzcT
	44RzCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtms83kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:40:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so1481091cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498055; x=1786102855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=;
        b=DZc8O2FQep+AUtFcTd4IcmnOuHs3KsHAP5qbZM023kHwONqFdgm9DlR8YU0A8Xw42M
         XrmkFNkHbbpgcNn12tI7sFsZRgRJygK6Vu8krX6n/DNsuqmISCTN34DbDNNAv6OcfWX8
         8U7I9KVFqewAC8RcvC+WTyhKhcvCH/6AyRLea2KN06kKKJRJZaxlX418oMOwRmrH7xrt
         DMEssvhuObS2ZJHV/mWdn1bTtcQ+Xfh89OZEi6iDpz3sG3gtX0uzNlTzVPuIt7TuaOpL
         LYLbeRL2fBw2dOpBOZDHJw52mrkgcJAV38ETeLD0K+SdP0HSZmFLMdBXv/rYu9cTVmca
         ypPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498055; x=1786102855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=;
        b=OT35HlOD3cGEXxpy1RX4av9dZybmybE+AHiIFtJyWou7FTn677ZDtsHyWeS2slPgqX
         YJ8AuTYuln2SDVfQduXKGS0jBBYuEaEu1JKbNEeM5r7EljdnsIL52GP49UDu2Enmq9BS
         K44IpG8qgV0OgERNpqAyVOrinwwTcVscVEQav1OPNb9rGvVssw47toCYqEogTrIVQfWm
         84VG4N7J3gs61iUQywWnSeC08KXVOBsNsFUu1eyVxJ5B6tbTowt+l0bknGbZmIyRh9Za
         rglW0aetiHPXS5ENev6P3tT6PV6MHRfcNkM0BsqX7upwYfiSzwt/bqYjgG0Mxf9IjmyT
         XglQ==
X-Gm-Message-State: AOJu0YxsezOfhupRUhhxuu6gRabIxzKUDyDoG4fET4tsEdeXI8AtWK2C
	+4Im8qY6uLY7MFAH4m/Qz11j0mmpQtam2pXW9PpfuLt/DUQQlS3zh8yR+LqSmWUYQoffeRWsSNy
	5UXrwmjP5AViJQciogDWZxxU+4SxCUTFkcYqL3T8Z2TtPZTXtnT6ecM1RSkUEHbi3bg==
X-Gm-Gg: AR+sD121bRP0aA1fU3BYp+Ys63GPZkioIgm+8S+inYQTbwVRWB9qUcVajqs8i5twoaR
	yh3ekv44jagN1jpxzEXMsKqBvnfOUSOLjY/HH7hi5ij9/nR/71kS2OaAPy3yhVmeywRbchuQvgL
	kN4UtebePxnWPFiYb+pjZtqOOdvEKyzH1lq6g5AKWz19y9Ol+MDdDiN87FFmnmDTDVCRLA7P/SX
	7mjOdshiOQhxR+B3w5vDZajHaMt77XZ+GtDFIXoNo9nKENsl41K8rugF/uzfhUliiRqN4SXchoV
	XXhik6neVjxx17VBBOu90LPPlxHGlWZJ7/1y/mA7WCQH7AwbPafbU7B/T4w9YFtts9MQNTmNRZL
	N41bPMHkslQfoouRZq8MvRVNQ
X-Received: by 2002:a05:622a:578e:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b4aee606cmr23337271cf.2.1785498055659;
        Fri, 31 Jul 2026 04:40:55 -0700 (PDT)
X-Received: by 2002:a05:622a:578e:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b4aee606cmr23336971cf.2.1785498055318;
        Fri, 31 Jul 2026 04:40:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9ff0sm105675666b.42.2026.07.31.04.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:40:54 -0700 (PDT)
Message-ID: <0767fcef-7f54-4035-9e19-421d6c8d5cb7@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: iris: take core lock when scanning the
 instance list
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
 <20260731-iris-fixes-v2-2-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-2-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JU90xGR9IDsgmfhnjOuNt6B8kfVrndr9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX7X7gyeKGbKTk
 /a8imq0Vabh8eI51w6dLGg60+VJDCnjIcZRqY2ZWnp2GRmROv9yJX8Tuh5cH2cNGL0tIs4ef+3J
 onnw9/XCqdTz7phz3Fq3YIVtJG/nCLLHmSyrhnY8ouzONY3obCN0M8rkAXXOey3R7OF3eNhimwC
 Ps6t3ZMo7GRmu2+WEMT9Q6tKj8zZ2Ny6ZDXZhFEjPr4F9Id/lYPF693txUxsRk9yqqHNTND1LKC
 Lnfr8Tl7pmUriuDuTv74P9vB+ycKAHEPy9DsOMhyCOdGvzqnOsS0yUrRit1Lg/B7V2Y8NXzbIak
 hIhmUgzqu9mlTax+N4HbaWS7XEzDJ6pZHpBsVVKwApFmqxkg6jkjoeiYquyXYQUiM/EdAg7O3wV
 fYDK1WJmNsjVesV+l8X4HELLt+VAXJlxOU1owFvSf2n0HJRDWPf3TYnVLweNQ0maez7+MwNChx8
 Lz7F3oP/h1MuXLORRQw==
X-Authority-Analysis: v=2.4 cv=SuigLvO0 c=1 sm=1 tr=0 ts=6a6c89c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cRjjd2jNw_HWXnLK9NUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: JU90xGR9IDsgmfhnjOuNt6B8kfVrndr9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfX5JxNjKyi1MRU
 aM/eksGTSCIC7T3ofjbJOHqSTGPxmfsJ+fM73kZmdF6iH9jvcNUhc20Pjn3efRJ33TpCgQlkg5+
 d3n/U1n+ohl9BkLhEMKeGA1eLYmFs54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310088

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_check_session_supported() walks core->instances to confirm the
> current instance is registered, but does so without holding core->lock.
> A concurrent iris_close() takes core->lock and removes a (possibly
> different) instance from the list via list_del_init() before freeing it,
> so the lockless traversal can follow a freed pointer and dereference it,
> resulting in a use-after-free.
> 
> Hold core->lock across the list traversal, matching the other iterators
> over core->instances such as iris_check_core_mbpf(). The lock is dropped
> before iris_check_core_mbpf() is called so the nesting is unchanged.
> 
> Fixes: bdbe1cac0c10 ("media: iris: add check whether the video session is supported or not")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

we also have:

iris_check_core_load()
iris_get_required_freq()
iris_vpu36_get_required_freq()
iris_vpu36_check_core_load()

that traverse the lsit and actually end up being called with
the lock, but only implicitly - perhaps a lockdep hint could
be useful there?

Konrad
