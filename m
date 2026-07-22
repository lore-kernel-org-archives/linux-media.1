Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756D35E1B5
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680938; cv=none; b=T6ZcFLpB0wfGXUKoFshlkxfe2fA6SJI2AplwOrBSwoI5ZLSjHsUOHy5VV8qSpMeS+hZF7wKYv3LXz7iqk4xWGGIVWDB3w23sR9pOaioXqyfyb69wo3mOIPcJOe9nTDFwyCtuexaL+YhQLrUGvkkDEwSRSoh4cA0VvHWw+30SVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680938; c=relaxed/simple;
	bh=fN9ona/wSMTxiWxLf21KESYvFeIGY1maRPkNdu/RO28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7y0PsvekxyhiwTL4YbA5rYb4M7VYbF/VKZO49GGx24o+J5kNd/6zI966OVtNw9yJ9Ca4EyPpyPOuqvJJb80b8iQrRXtzCyW9SHPhZsdP7EE0Wtb+7ZnLx0BXifBn26W9LfodkG2gVFMI8PVH55pB0LqhqoeZbPCK3YeNIpR61o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJulP1qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahH8sKn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJulP1qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahH8sKn3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZJLD2934462
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=; b=RJulP1qvqOa7fGi4
	z/FrRdBYtlpqFD1n4dHQKenTsF6cwv0WpDvskb8KKNL6jfXr9HZ7SudodOENRUvA
	JgiqfR0BR0wmDcj4F4CLvh8I/YalmR1yxwAyg994YjW1i9uqBqm+4kqSa/F3fczn
	BNYRh9j9HJgFnqYyPLwXP3jM3HdNhxt8QhZFGF45icL9KuTeRqyrG2GxBFttz+Or
	BA/2zLDO5iOQ0vZOeWNapeoJqwDtQffAhgPLZdmywJKXqxRxjjQnfkSPNyLBKMTt
	28hbNamn+EofgKcsVD+obqgO2+AdEYvHhQGGsPqOpO+E/6uyyJx7fqO+uH2We+9T
	OZn77Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeavq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 00:42:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so117913591cf.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680935; x=1785285735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=;
        b=ahH8sKn3Ba08fkl/vWBJloDD3bfeSO2aHoz8VUmgIC8QtI+WynLg8hG8ZhEVROC9Hr
         w7ByYS6FHlAtIU/QJcUPF9zDWbn3hDg1twAyo2fyosrOKWAQCTwuKu2STwc1UtfodCEJ
         +uT5VJvaTr64RQME5xUJMO2d8RORAezlwARJt1sQdiCULyQiAWm7t0/KqnR6Pw+nLjRV
         t6M3fy6fq9qwDaFWJbmvH87yBm9ASr2IeONqvxs4SDQ7bb0rbI5phyC+O5HaVvQ4R9Wu
         owQc5/g4YFH8wLYCLUeHlLW64AMgsnSB7ioK6J7WnVAVwPUFdxsj11N9huhMjLIL1nd/
         cSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680935; x=1785285735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nrfNeWHBi17EZfKI4U5mPbx4WL5IKPebc8hx9iiGVZs=;
        b=GGorGgbA2PcCIvgObXdOVFrtBz4q0V2Me7Tx4QEQDK4wdfaQgJ2n9R2o0ROr90bhYp
         gQGbQnL317vaN3cZr7Fw/sWVN3wZs1eEKaQLBxqvcAx+0e03AUnlcE3cvc+XmceODLqT
         HI8KcUC9cBLaX9dCSS7eioPDAtVr8WJe4lZR0wM1cqPeZQJbb/Bwtf9Jdv2T6j2W3tiD
         WpW634rPeW6xjguIT2MzYuNddDy1z2cBWEgiFoHjEgw4gMAyZuDPtQ5ivWwNJlEw2D9W
         rdLu3GcCw5mXW6PB7ogNCNhRd4lWpbuWNrOrB9bLzUqu0P8UmoUpNBafn/o/TEVa/FJX
         vgww==
X-Forwarded-Encrypted: i=1; AHgh+RoO3+URz80HLnd+JPyTDVbkHqKOAGsVXbenI1l3dtp1r7asmD64Dyi3YIoywzyIeBMX7Uq1AeE8ekG/Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmiLjdh1wXhwnlyoDdcypClx9SzIHkYJcf99gC2bwcmnlm3os0
	yz3GSWl3vFSGQR5MWeQx1E+CditYGgRjgUvN/GS9sJTDbc8HFSVyIi6qv6xMX5R/rp6jrai3Fik
	CMSuthPqWYqH37U1vDl5vTFMYe3X0cM5/FM49UfucWE+ZDfW4DBzA25JotYaqJ8o1oQ==
X-Gm-Gg: AR+sD11CaTojX3TtHjSjV9PbEw+qz12HGauqzzPcrLXuTM0PYGmudeOKmvKapD7M/6F
	hebG8fJEk1G9o/Hnsx74GPJYBmjBrAKBJXh9ZssPwtGoqBrb/FD/tZkImEN2EIMGARKCGsmlqL3
	bZcFy6QOliyIK0JG5CQmt3DRr7xI+OCVAbKAsetCof5iO5jP2D5KljIM5QN1jBJXm4rtQlnBqPR
	9zIY6RS8UXx1+XeUx17HKWLQsmlbtcMt2tgIRN+YCBcFULcI0Th3/NHiNmZULBPQqdf2y7++j1L
	cedqIhdEmhY57WBa4ufYs2vreDvnqjdZWgZUyocBtxj/KJUESRwhhK7O63u592fys/0Si9h/T0s
	5yZCtZfDgRDkok9HMvM4LvqE+HzxSNfkrtlVJqyRk2x8nRkWFqrWuQ/zOrqRn+N21H9rqqc0LpE
	xQxsvyLtj95/gCcQ==
X-Received: by 2002:a05:622a:1a85:b0:517:146d:2db5 with SMTP id d75a77b69052e-5213c10a295mr191824731cf.2.1784680934926;
        Tue, 21 Jul 2026 17:42:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:517:146d:2db5 with SMTP id d75a77b69052e-5213c10a295mr191824381cf.2.1784680934378;
        Tue, 21 Jul 2026 17:42:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d303d4sm183985e87.48.2026.07.21.17.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:42:11 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:42:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Message-ID: <bmwchmknzje3qobgu6raomw427pavv5j46vg6vtp5ns24cekij@2vvwn53nykzw>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0Ijz45BIAS2IXlBnbH9it_g4UI5-bwGi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX5sqLpJT6qAv9
 AG2+yNiAEFD+tyv9GL+Aq+ciW72ZTEEHoUd2nTZoA8wr+eNzHzDtVap2nRRLffq/ARxRDP8IiZt
 AhWe6QAudbYGbzrmcmC9kWghk8eGFIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX1kiZV/CVU5KD
 wK4NKh8QymfilUyToFuy34jrwxea5IZgjltHI8vFPsJBHZvqU+qoUgcYo95gBbV8R6xO/Olt6oS
 Fivu3yBXDqdfsoEzVSBVm0KfQHw+DYst1xUtr2QzeeFM+OGbpUlBDh/3iPlIKjehUpBGmWfQyay
 +kRzrvqiC00kK66qRYXW2qKHVow1dekm3SlVKU1lOziK04X86lgUDkqZKsk7vg3oVcgm7F6FfdA
 iIj1+4N2spIxKHHphVmFW/o/Z+XY9jjddenujJyt2DtZh9hsVFiL9jRgdV1iqLNpFU5I1yTRHE/
 t/EWlAjn6KmlUNpRoo0GFvN1qp+pKcaYXe0v+zxRGIxK+PU6wggV4cZdyUmjd6svqTH7NMVWSAZ
 L0cKIrBK4kucqzGn+cypqreauDNI1+Vi0b31x3ABo57Ds2vGCA/04ywFZ5zLYUW1lHAoWm+KZvO
 a47PkRf+EJUbf8TbQxg==
X-Proofpoint-GUID: 0Ijz45BIAS2IXlBnbH9it_g4UI5-bwGi
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a6011e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=8eBIOSJlEs-N-0KpAZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:36AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
> equality comparison. Since sub_state is a bitmask, this allows STOP to
> pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
> intended drain semantics. Fix this by using a proper bitmask test.
> 
> Fixes: d09100763bed ("media: iris: add support for drain sequence")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
