Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601938;
	b=dO3MZzF+EBV6zJ83GIpynvdtfyM9ip7sawXdzHSe4YgxVu4sqoEGgBPgsOCEUSwbr5jf
	 vLmnhTQfbLweeyA33DgYdw979uqapx62lX0Y6IGghPgKinsQYsEeUv01fMREn7i3fEijf
	 L1JA+cgAUfTGt2L/JB3AFravaBmEyrN22pjg4oud0fUMNJr3k4/uY9OgQ4zjoha3fulk1
	 jEORrvV7zOt98bg7Y/9yJ5V5oK2s+v99/KVJ1gIEJSH5YAiSMRlqanH26HxalzLdMKDrW
	 Z38z67rrtGju9naQ7ZHe1nGCuX6HA4r08MGOseU1LoZ+S8qYloCpyHp2qBSLzsW4BpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
	b=36OEEbeB2PziZAT43xU76HjUaKibEhF2tAFj11J47lSrNHAw/Lb3WCp1QeCX/qK1bXNA
	 m+hOMQqENoKVwyBfvJhb5LB4tXGzPQ71ipflp9EMjYNiO+aKishsrUUk5gV17o2GrlQ9P
	 WME+jgbr8SzwoYhq0zC2E/tgPcZUIZejtN6J31RgP2h0WrjI+GJXv3PSLipNIE2wuwtJ5
	 nyH/eUZE77KZaxrlTPSyrgwQnAq9iPNWN/Cddy14Rv09inmO+8GjjNbCgjDfYr0Z+TrSL
	 00jmnStRT3dbsv8MjB/WCv40FT0tJLbvCMiXAUxWvpuAALSVBkT+ooLlKq2q3WqxRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAD606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAdT115110
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=; b=UlzkiCmyHTJB/y37
	5duvhkt2WYUVV2iEzzGE59afXH0OzbrZNvqIJo5FDb+GbFGiDqMJ1JmiTNA2kIaI
	QKcSqSrEd03iugMw2D7CrdsIMFq6/bk306S6KExjZ/VpVZ9gBzqo7fYtPLnOCEd9
	/ZowfVrwVU2EjJi62/g5Az+vb9MwKAmSvG3gzHPAK9SmbUtIVd98/CzGz5bikF8Q
	XfKzG13XWsBRZyA0DFfhh9IAnp9K/abcVmNO37NycEmZ5nvuWwasb6E3BpWUCS0C
	Iz3BC7my1zQ72peifXykvUoZdkiy1ShCVt0FmXPRCeIP6JwhKvqD4TPQXQ/yTM+p
	K2OYRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcakh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c4997063aso16463731cf.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601936; x=1796206736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=YWsGyCBfUQFi2YvI4tdS8b+hf7hYCTuc55Lpb6Xrx/AS9s2Eo/Np0nACBoJfYU3JGV
         RcsjtTOWIYAuv8d8JSzOrECzguumws8mkynAMlj3NGlGL4ioo3pullhRiFwUGL7yUg1C
         /tdU//QB31lrrndiXElc2pwjYpgjH5YaJSmpZZ7avAL85otAklPwKfNHwHM1KxAFO+TA
         F2MJ2QVVdM8G46EF41FwmErK3UUNiAR/OA4Ts2DMjERqyuapPPA9abkTPddeQVt9120T
         ImeXArbAHwLXDpKlSmcLhyx6yaJ9XQIUnT/NVT+K2J3gVUVcrX03NHOQNX602Iyn/CtU
         5JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601936; x=1796206736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=s6EVZTqV3Pb57r8cpN/MNzDAeF6xARSSKIfY6ewA348+mMJZAZkfAs4AVU4nqcWODd
         qg9AWZycOh74jpg2gjju6dNfkLo8pI9fx3xii6SVHwOruTCfw0OQx6nFA9XN4QmOEbgU
         srk32yWD7BKNmjmXzNhXuysGEazlp9XlxM7Dq19DoeA++1mTZ8WnzQfo2N1G7XkaYPRQ
         dSIOrlngEJjKKiUu6KaD7qroTTpv2IWhCH+FmR0mtUSywFXej815n+qbzassoOv45IQM
         8jio18k7lwfIloZDdlrE/5qPSpEDcRkjtnWo2VUefQA2EhmFVLbFwBiHbyV/p2b38bAs
         jkbQ==
X-Gm-Message-State: APuU4Z/L9orEBy0ngToxr8QGavFx2sHJVvh/lwBvR5urDAbPzZOF1Xt4
	1QcPv6NZtbJJ3VTiDDOkDfXIjImQgmJPLFHkyyCD+KhTAK+0ZYFjATnOa6PveiFv4tP5SbZB8jv
	go9Uu5LiYqwdI+mxHiCU/8ulV2jAvZUH1ArsxW+H5wPiuP/W4Q7rr6Ad4wJuYcfy1Jw==
X-Gm-Gg: AZFdTZfAqevTrW/2SQ1reqH8LpTud3tL7qVgZMFdu6ekuloWN89GcZP2gNiD22v0mNx
	pC5Ccp/XT0TH/q0yhxNwnJxrCeevdNR+GA3VrTr3SFjT6R/zr/xsRrNahuNIw1Mny/JQN8nPURx
	3LBfqPbHS+u7NhWhDvLGabl9kZB6FNMyX8RmhTPLsLCUA02b68t8BTTBoxFBWktG4VdxZG9MNBv
	jq51LJCXw2tLzzAPLNIZrom+1pLkgka93BlC5vu1Aw/ZI03CvdnuAHXMiueXaYulMUP1xHZr3cR
	w7KT10k+hXM8fTOnR6E1ZXYPaWuJNBmEFWYG2CWTjbMIjgKNWb0yjPSxUTVfXFsI5fXySgBK3Ex
	4jbs09a3E6JA0oWfDR4wLL/TxSc4nesDcKja8bZ3QnI+V9AdTePE2aA9V7jxQpSwt2HVxULM=
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300294231cf.5.1795601936042;
        Wed, 25 Nov 2026 02:18:56 -0800 (PST)
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300293971cf.5.1795601935658;
        Wed, 25 Nov 2026 02:18:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68284sm629439566b.18.2026.11.25.02.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:18:54 -0800 (PST)
Message-ID: <0a0544f0-9999-4c35-b370-0ab291e3cb62@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:18:51 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6bBPLzblrAiS
 Lxe5dcr+SmV1zfUY/S7FkqJo+kpmaguU7dcZHgLe9WzDbU9U6ZxwVL7+TkpZnd6EL7p42A6YXTe
 sTvKzsJlYyQtAGyD3ToHfNFCJy1/CuKtmq4MK9tlXqByH2mtt19JWiOxBQET4Bq3sFVKMS2LRWA
 YOW37KNHAxyATgXheuRp977mtCCchFOoEMTxIqgGX66yuWSEw+eElAooDisQ9PpMbm1cIbMfc0S
 nxUdmYfv4CeYIEPy0pTwdFUhZL3a4l4deUwhfwcMzr+u7DJjHn3dUf9VNP1LTsguNH/Lfmu4i9y
 D3DbyTBzoe3peAseAIGr33PMSZ08zQ3Ee4+iruN3mbRBEKfQvT3CPc1W9FJamjIyscnJvsURjLn
 JYO+LXTA2kmY+t7Z7kzIhHLF+EgYTlFpNhHK9mNwdXQqwZXNALEFTyE4he2CxFG5jfq18nBfpT+
 ODxNH8ypF8thjOHYQ9Q==
X-Proofpoint-GUID: D0bimvqeGqf7QTZMUxPrCmP3HccTXbj7
X-Proofpoint-ORIG-GUID: D0bimvqeGqf7QTZMUxPrCmP3HccTXbj7
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06b611 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pyCJf-qXJP2HTA3QtQoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX211+HByQMYmw
 RtOFpFI8yOOinyo9nW8BRmLbMGOklCF8xlGkx3jpc+01o7jJUDPQcLReXO4L6EEKP+p4GwXsfbv
 Q0cRKL3ECjI+GFR6uBQResWMe5BcPkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/19/26 12:45 PM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>   qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you want to go hypermodern, you can use
PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND (or another combo of
these, defined in pm_runtime.h)

Konrad
