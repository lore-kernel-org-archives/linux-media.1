Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0E430CE2
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247062; cv=none; b=PBscVgpTG70sGaocG7pTIOR/cLrYBDPZ1cmGeCWsHgBB+b08vbFh4PRXqSFx7EqAXuM5IAXvnHS5ffydXt6JkxW6GQfxX2d4FeHJiSM4w5oWf5sg5+bAHmc8BN/6/g3D7F6mLkoRc9Z1ka5xi0lIlMGyiS4DmX2MQf0iUeJbCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247062; c=relaxed/simple;
	bh=6+jvZXEuix1lJ0tHBSsb1OqU92zBScukcsTmy0G1qdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWPxYL8TCkluVwHAopgjesdXCUmZJEFSEZX3zQUbT6JHK2OxBq+S/31DuvNV09upRarmz28OI3f3EFYnYJQC5f9mkzETgnNLJmwaJbV4cXJUf90S23fbqn/f1BSLoGu0IXaWvARRHgULcz1rukaWxSrpJFBng+moe3GjRcUHCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvRvEo2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Apveo94W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvRvEo2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Apveo94W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDP6jE2882152
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 13:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D1i70g7peD4baJlwMW76JABN
	V1a14EFLM3fnMUiB31c=; b=BvRvEo2anHyzwBhx2GXlHaccYxuI5ppGlfk0Zilh
	IbQrXZIzhPSWwD3aIuAVQNN8MzW5gM0pVlXsDV25wm6ExyfGbR40ggExCgdrKvAq
	4dqvQpf7zikB8jRXltY9Xht6IG+idJmrm0Tt4ND1vuUrg6CHRurNKpqaIScFCEj1
	ND2b3LLVO4QckZp7kPlyG1m2SHrKrM1CedHiwn8Gv+M6po7RPeJSn/YWhCc48M4C
	BBMDoZf1U55/DV7WXiGvb5cybYeEJ2QHF87FRdr67UXmoePzMotM9G3usgy7AyR3
	tW6uIyvYaUo5+PO9xxwu52Onp+bUsUUrmW0OLucNORjJGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuyg8hkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 13:57:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso46085221cf.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247060; x=1785851860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1i70g7peD4baJlwMW76JABNV1a14EFLM3fnMUiB31c=;
        b=Apveo94WDgReJyBUlyY0sVVKzxeIUvowA4q7uxM2ycUYx2t2yRQs2ByyVSX/z+UQ1I
         4V+7qAJru2XK/NEcgBaNuUhA9Qs49ZMZL1a3yjymi4mdAW3lxQIPwku3LAESGHhKGem+
         /+eL3ZtCXvR7gjljw2W3uvoZjsifLhGwRCMz440JvN6CDsP5nxxIOCeC37/hrgDGW/cy
         fiVR5EV2bwj+4vY4aHSwl9OHP5TbNyG9gPxPyJfzYa21ZQEHGsri8SycLQeozQZHQB2E
         yz+6YmD9BKTVlhXkzgFLBF5fSXZ4B2O4YEdoHJiPHBppSYNln8qeKoQjDDRdL8d0x2YV
         xtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247060; x=1785851860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1i70g7peD4baJlwMW76JABNV1a14EFLM3fnMUiB31c=;
        b=nMO6Ou/zcLctBwtfZ6xKnfZ5rGt4Yk3mUMDvo8EsysLx2qdiBVWKT0jJJ/lF/4r8ny
         reIVPI+WEmBV8E78ZU9rgXgafG07P5zjQ62NMwxl721TLHfPzmBVCFeaMrpW5nm/Uv5v
         B+KAmylbML5T/JbOCTcxeoEIu9ZBS6+cWjUmHXIreUlpcYGKmUX7RQ32gxd/9TnwNHK8
         ZeZHTwk8smIOr8r0YIm6BhbnUoFM5wQOGM1FAvWhMAyHwSQbn+P9CF2aPIbxcqlqbsBJ
         gU0robThqwQmy0R0jFkxU5s9dnEE4BocfCB7vHdKaijzGH4+bB7NjC88klU9FMU1XLDd
         QfJA==
X-Forwarded-Encrypted: i=1; AHgh+RrEuP77MBDahGHI2MnIEYG+jmefMdQzVQGlmveLfgeMJ1MeDNO8NPi8CR2uFP0hb6JMoCdrTV0qQbqAlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcj80hUgRnjdWZYmApVKLBwe0nY3zXyT1fupajIsfPQStYpq6n
	a2MmO/GaoIqKYljdtkoElwxqcsC4iAj1ss0C6MFNChEgR12IUlWvTtBRWFxYzRae1QRWr0Heh77
	vloSExn62LhIOOz53f9k1BHiYy40bIE1HmyB6gm21LZYa9JBa1sbs7dXUs6zsXOAtPDE1jA0oBa
	sc
X-Gm-Gg: AR+sD10z1+jEkrrgdK225fbh0/qPI894/Lp5Ihc14qC0MMcMK5SYpSIssFG9dH6gCXk
	MHCsfN9cRJW68rGgSzXxIhUb1Kqg34cozbfJvMlExf/1Kn/KqZf1fA4NAHUFhAXITLi+W2uMVZ2
	3vx/kZyOM0JWQfxScw0nZ1qGFso2AWz/xJRlgr8lN2iw4OEUfIZoB3i9NPAfxP14EKmt9mmBX2/
	09Y4tcAJAe3s9ye6EMzYyzGVwZQHL2K3CljodtPy80kQJphMBUZ/G8Bi2nx/0wswt0Nyj3xsb6Z
	jNSZaW5U4y+hUr+jqabAMO78KcrSQRQyKXLqs+Gaeug7pvd031VdiOk3KW6gDceR454wn1NgaUl
	ZQVHrjdoXqIxjxPuVUvgkENGGdFPLDRgMoOT7Wmq6pnXfZq4NvIyRGN4yA0DKLsscRkios5zS91
	TStvMdIQVi+fEvuQ==
X-Received: by 2002:ac8:7c42:0:b0:51c:7b13:6300 with SMTP id d75a77b69052e-529d719d02bmr19210041cf.86.1785247059779;
        Tue, 28 Jul 2026 06:57:39 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51c:7b13:6300 with SMTP id d75a77b69052e-529d719d02bmr19209601cf.86.1785247059259;
        Tue, 28 Jul 2026 06:57:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be083db1sm2085624e87.25.2026.07.28.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:57:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 16:57:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        abhinav.kumar@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2] media: qcom: iris: initialize OPP pointer at
 declaration
Message-ID: <otrhvavpt3gt64sac3rmbstlqnrrcbgdhc2sau5vndkpblggg6@d5p6boz3fqaq>
References: <20260608120531.83459-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608120531.83459-1-dennylin0707@gmail.com>
X-Proofpoint-GUID: dozCC5GZsQsY7VrKlTo3bLrJjE-tiyY5
X-Proofpoint-ORIG-GUID: dozCC5GZsQsY7VrKlTo3bLrJjE-tiyY5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfX7UJOZ5e7U+4u
 +ND4OkSKS0LNHkVxf5fI+NArPffPspGY5SoaJE8HV5snpVUzSuhnfuZHJHLrAOphmMyaS7FC+lK
 FY7QvBUxf5coXEBysFuEo/OSw0I1/MxqzF89p7zote6RtB99ZCNRWr1rCjFI/0S7XlwX96mRH5K
 XQjrXyh5jpLf29hlvc3reabGB6s+KVnaFwqQLyga65BSO3NslIktCRVkT5luIO62/W+HIm04d8y
 bex0Y97YaFWa886xRlHZEcz3Hjqk5tc1qUcUk+7Avps46smHKWDiylTvPtcmzthR62hwrMMYttX
 fTNJhH8saMvm2xgm2AEps5d6z93RX8q1mKnaoQyrOL9c97wH2BbBnYSi+bh1K7hWZ5iPVofqrZG
 x8y056OVHlRVeh1/Mf4V9SmiVjgn7APBRrhm3WCg14aiqPgzvoI4F2BJ61Dq/5wZh2Cj440luTZ
 5TDGBukh1EJYtYSoLDw==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a68b554 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=EeHzf0v7_b04YX6Jd2YA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNCBTYWx0ZWRfX0kjkkawXbgBF
 arvtE5AJiG4d11AUMrGl6EOVz4F+XIl01VIuGoo8gJ76JtSe7XnTArccb0cLEVGhJ2FufNakMlD
 IKD2IX7mqTXp7Xs/OtJc2Gl3l/tDvt4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280124

On Mon, Jun 08, 2026 at 12:05:31PM +0000, Hungyu Lin wrote:
> Initialize the managed OPP pointer at declaration rather than
> assigning it in a separate statement.
> 
> This avoids a checkpatch warning about a potentially uninitialized
> managed pointer.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Initialize the managed pointer directly at declaration as suggested
>   by Dmitry Baryshkov.
> 
>  drivers/media/platform/qcom/iris/iris_resources.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
