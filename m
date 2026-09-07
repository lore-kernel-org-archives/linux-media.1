Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4954192FC
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766930; cv=none; b=EM02BhAT8ZNfKhbcES4Vz/wbpY4lGIUZc4iBUpBGiCWoLSdeTK2M4t2FOvB148t5dwbRMss2C52sXqIOHAfrs3VfFcEpnxEsh7lErGNd3fKHFaUYJ5N8jKdFFIxIf4InKD98Zo/5LBYHm/EG5nPSf8srHTA9LRD4u54CGczL4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766930; c=relaxed/simple;
	bh=NN9BVKvXAv4dz1TXazQODq38tvHPJK0LZJ4wY9jR320=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olpL1Ath6pEIVb0jYEwZuk4yItIPhwUBwyJKRPg0OsskyQPMnClDzFOyTYHTllW4vyGW+HGhBh9MjS7ZngsDwh2FhgueZh2kZHtW0lIK5Yfmx48IZk7ot01wsTv7wgVf6yijle+ysRPShyYi5XcwZsSV96ko4+RQwQTQRU6qH5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGqvbNxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9j/m2TJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGqvbNxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9j/m2TJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777WGp3269659
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 07:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=; b=mGqvbNxu3XVIm+ju
	ZvWYo9o/QLbl7wOQ4TeVKhBhGHEgAjREC3zz4d8/6aP70WwlPMGC4IVNX1yxmXy4
	PWF/UuhSJldSkPtd/YmEpieT9f/LL096gXYIjPLVxXXgE5ffVXXp+fh7f26HwpCy
	pxDAXhFeox1C6FgpS94WC15zc2irgQ+AO1cioGCQoudpwVBTtrJ1pU1ALakhjqUJ
	l1w9zAUKXFaOe0C0o/33xhTBKNcbw+j20MRzhhyvrwGuu5I+7GW4yzLXGsiqUdNJ
	fhlPO4RV3Z4QVkWV0uooore9uyUmZDwRNIbClkztwNI1HhN35B4Quu5m4beIJSP+
	S0HB/w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhns91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 07:42:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a28482e4so16023585a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766927; x=1789371727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=Z9j/m2TJ8m2qkWSzUzLZAy0PEio73KFXiGZnkSFrvrG13iZZFXK/RWWFlWSuguSlBe
         b1XlPeAwsxLGUZXhA/z7prJi6Ce0+LeRX2Gvw6eOe/NuTEcn3gA3NaszH9RiQC4TG5Uf
         igCIHqA3tZhKgM0kzJ2jxxurJBQWEmLQbSmqdtgEYIiRCBcR1k12WvnXHZbJ2MRFpzlW
         Vc1K8HwopnZUHi6d052adsCglkMdXjM52AoHU0KWDK1b6C9miaj2OMeb55JAGETcYGoT
         7X6ehUG0f7DaJQruuuD8oB1FKf1LH/Fpqm7A1zt/onwJmivqozyKfK2YUTRyKojoCSGp
         mCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766927; x=1789371727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njlZCbPIISB3WKsBk7Jb6TXF4jvL8mDDC++k+1h911Y=;
        b=S3RJs3kiS/pelKO8FFTH2f6YoKAKxWKpcY45mhtl7CTGCAcUG/n7un8+KiGbk/NsqQ
         Wjs3Wi/r/xhmqC4gdogSIPs4lR9wQ4GSKbJm+PwmPQ4gUb870HPZJ03/s6aeR+WV3kVE
         0axDb8SHiTXsqYTzgyuoTtt2rKcpIYNLZ2oUuDSP564s6Wmy3ar+DX/dkKkHsW5r9c5f
         wIeKyO/mDNRU4rQ7p/gURkNIW1FGbUZb+BiN6QooiAzunaTmj4x5tP+TuiRp10bSBHbH
         geZ8evseDvBgX1UsazQkkrKGabsH0XMj88Cv8wWtY8+g3vsMjkXe3olqYdxZ4oceaHrb
         5Z5g==
X-Forwarded-Encrypted: i=1; AKwUvBx5fCvqsjh0LXBNW5ulAZpOc8sr/P4R0GOCXMCFdhgSF4LffiI3dkfnI27Qc3S6XH1LVkwABInztfs0nA==@vger.kernel.org
X-Gm-Message-State: AFuF++kILpvEDxeQ4mQXa/l6LtaVRAqQwsdaxDrjMlz3FtMmLEmeCRJA
	QvOrZyowE/Sf+PM8zHaOrnBECc9s7sa6A1zgCl5+TBwSn+Y6fsqptXMYwyElhCWu0gUL22hNDMN
	rNJixalPf/GexJinVxlWzNQkstXzcZrPzgYgmfiML0G5Suiigrd1ozFokGytrLd1Arw==
X-Gm-Gg: AYBFou3A1VvnZXbBIq5OQ0FFgTrm3U9iJU7hf7yXcqMLPxTyRMGRV0sHAgdxEq/maHH
	Xa4mK4s87pz09jORXwBXHAR9i9hyzyFoNEmQlHGeqCvKeBFUDLwYS07nX8nttCyfEW+bJ98nYIc
	0BABoaSiyGBrn34QuemYR+yqpoEVbpoLB8DI7e8iQc4E2j22E2jxXE52SYXSQ6X33azPpukXC2M
	PkNgLu9DsJi6x9a3FfL1P25xnOQIIyBvfu0mwiZOFYhhLRuy5nRe/azUXbVVZQqHMLo8qgsKM9Z
	GUqF6sTcO6A6B9+Hb3vGpocUkRZzvpv15oWk45knDf3Rjwy3JxmQoFEma0BaI6IzMPbOg4j3eVe
	/JwszUDPYHRAm3Yr3B+wH8g==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727371385a.6.1788766926661;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr1727366785a.6.1788766926220;
        Mon, 07 Sep 2026 00:42:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm266442166b.18.2026.09.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:42:05 -0700 (PDT)
Message-ID: <648cd3a6-653c-45f3-98c1-8608f599f941@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: fix repeated words in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
 <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904120601.18363-3-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5s3-6xGAwmYEORBadIUM4sSt8qnP7PUb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfXxJjzVEMDI0p7
 uQC52FJsUX9xry8oZdnSGp0akjY9HbafMSpuZEUPzqasQ+qWtvqBJCM6lsevA2S6WcnujQnBAoZ
 FpkBtkjVYjfRXQT9rlTPammFRJF9bYstzTvZcwNq+jV7x+OBJ82+MDZF0Qt0rEpKMQRj7gbQSHG
 0ooQylnfOyIQKXgXyTNA3kKMhSG+k1MGryasdHV/P62ZbyYVl2TcrjF82C8XsHx8OVf4VGuSDkp
 rCahLnfB5bYjL+sPAkHaWvYqmm0NiN4pl3GL1WH0wCmsIMyIZyafG2SHnd4K66TINi0CsrsQhiN
 NpeQa9KlidbkLk/5/gYiGjQ229sXqklz16pWBxWZigFFtF2fGjkUf70oJlK5TirWi2CeX3+5Hpw
 FshKRnCAt9Ej39Ws84YIFKkDrdUY7Z2WcuspNMkxKaQ5vo/uOyuJih9lEsLoCwXFYW25JAPaoCg
 2Ix1sAwJED6tr5Ccl7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfXx7uO6G6vQj+M
 AK2A1JZMbi4bbKX18tUv45TA6SQb0NP6SNMV/0fy7zkxtznnPjUFE4Pix6vOahmtroOeT2tf+0Z
 JJeKpah8Tpv3Ym/AaoeBM0d4RAMhtoY=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e6acf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E85TfxCPf-EkNVdhPEkA:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5s3-6xGAwmYEORBadIUM4sSt8qnP7PUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070082

On 9/4/26 2:05 PM, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.  Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
