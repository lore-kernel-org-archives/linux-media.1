Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810192;
	b=x1v0qK2exJnuHCP21DAyLFsdQ8FSn0sOH9Auiv7Yc5WZGUt7DZQxUW98Bp4dNzRUsw5H
	 npSkOgKDMu4H8o22i8ujxjB+AsuFOZS3FdDd7vkFVAko+ZcrDuQl0LuOpcCmLZb/Rgzfw
	 rEo/Rdv7YH3HA8QvrRmqD6Gge5+qjlfObYsCV9rl/RGyaiyn5cjb7YcMiHTpNfLGwHe7X
	 mtwNds4emNe0hVjaakUR0Q3rDLJTgV7GI2r3GGfKQ/8IelzsLC6Z89dSwFlrGYKsIC53K
	 WCtq5QH9OL8BsB8Q6p8+4YdLw/8+BTycttN4E2YDxTfHFDqw9qL69qOmSWyf45607Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
	b=hIQzwwHInAJnA5lAFiMDiDAgGVYSaYcPdL8I/IO6QgckOol4JzQ3PQ+z8/OQC+DIOJdQ
	 YebqAZfOZ8F6x9bl/X3g0ZEfLoD3Xt+T4d33VxT6Td1oLykqvMlVExDeacsG0UTVEi+I8
	 Rw5Kji5sW+O1Ud/Nb7/Qn9FxLJmXEkTJ+AgAf+IOmUGZWBjYpsCm6Yod+6yBHm9WTr6z0
	 ZfJtd4+AYs3YeQU8MHUDI4i76Nf30Cb9IbRo8wELAsYcoX3rdOVk7JZeOSzuyiJlhX0Rn
	 KljkEDxE3kYCk8PrzQ4NmR3M0ZSvf8KyrbxkvTzk2YiCHo3Wj1mekJRwgzhmAlUpmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaFouKCE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz7ArjA3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB66B606D829
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB66B606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaFouKCE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pz7ArjA3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4GUYkh763876
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=; b=UaFouKCEuHtwzAXj
	sN0G1e/I+rzJKlQkK6bE/o4YDrLnHB0rxFW/PzMlQjFYECBAArIQgMtOJH15suU0
	3QUgHfusOb2vXi1XnfCijlUMMOEdbiZTWdiXmTR8swCJnbiC+o/HP9C7J/coW1Cb
	/sJMK9UPBqbJhvslygFMUPMkeJolISD1b3XJZoYIH59Q6p1aTrT4joN+YJ3Z1RP/
	jiS+3RlU9aPudJOYFVeRnZstsdlFxqtcs3yaZnSoYMjZLUpzjfMUicII57Z1sxuA
	b2fZ1gMkcj7unw2TzpGPAECp3122JBrzTMN+lHrgN1oe6nhdGBYtmhpFwgvNgA+k
	/fhHaQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sr177-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:36:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so182573985a.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810190; x=1794414990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=Pz7ArjA3+ku+KFqOONdjbwKwrnTrwikUgV0xepJwPpan+Am+L+eulxgwPLgwA/uhRN
         JdZJopETIu/RtcQ2KSqd4ySBUmi//Zm+t0ZTrIiR3uiWv6ExK2g6rLmo9ul8o9WKZzjD
         jF50L+tdQUwTb6dJJfhPnDQRNKYMhMXNSvqif5KQyp1JiCzEzUqHWRVvmQOLfkvkaKw8
         oTyn5jg+mP3W/AXRL4HZ6Q5n3FxOU9Z/4CmtMUsDRtXTWCgdN219FTg09EWs1PxYoy/8
         YjRYtNUgGztQMqvpaTj94fCmmnElRhMtffsmFbqwfgFE8OAT9ijFF9Sl7w4I+CLCX9qn
         x/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810190; x=1794414990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=LD+ob5wqJTStwyfeOJuoZqBrktuzRxQKmmwa1NnVkPrAHO/W/rDbRcZw+BH1+s0Lw7
         GF77Srgnm0X0qu9xsNry4coegLnh6nGHmnQ/f2XL3lhBks9gbsjJU2xMdncIvshS/a6l
         QrvKrj3K2gD8bqhjqTW1URd0wuyVnos4FHdHICRPYknqpEAfyS2c9RSHm3XLK+dZBhT+
         b5SuwMW+AzupBlZ0ekjikIUVIKcdpzueB+Nrpw++VPkkjCOEajx8u6sv4paWL6CBUMP4
         wzfqpdNw5AScr6zJ/Bt96Yvj+9lotRUO58FPYWonKR1C+uF/9OkL1hTS3d/TxFiUnju9
         gFsA==
X-Forwarded-Encrypted: i=1; AKwUvBzThTb/3fs1YZOtGyNO3aurko9isSxgBmr13Ki4px3gSswqkgYDlRqUs7k/AUzBNIkJAnKnyjB+7atqqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8//F5UWckh0j8n894BCMjeYXW0zvNbHBSktx7OF+2niCQ9N1O1
	ZoRRS0Hdw7NpolktXHOTwu+U8HWm5GwxQNAu79kCxF96bzEeH5UAr3s3wPIbEjOacw2PF43SWqi
	ZFOZzoDADOaq9EtEdjCKNJGNdF3GE08OCi86RV3D6AyUUY3VuDOoK3wGtuw8F4Lngzw==
X-Gm-Gg: AYBFou346yEINtlK374fAj7bP2RtQDazU+6kfnrIcvXvEkl4TPS+tevJC63jyw0+/qs
	7osPbo9OASNkpviSW28CMD/Id8SBl3pbS9k3HZQzKdA0+9URGQacL5C22IWM6so8mBJXj8dWd+R
	ONpwgFX4K2YjxScReS2YT5X+bdsyqhvUGVrlEhuo6YyxYAlFfQ+rL0Hns/IT7fiTq44DFNfy2Cg
	ApjA8CAtZpSIZfOc4llocxWXJXNmDPl1ZialAefDwWAcA7TXw4nu9+v4C5SdJKYBroBXz0fioZv
	skYLyDhJGdYwAFtBSuWPftHOIxCvpzypCzaO/PdboobxwwlwwTAPJoVJ5SBTAK0Ja2bb+DrYRUS
	AEcp1Ht8uQCMxRyjZsfipwO4jhPAGssjgVSGYEdAdrdbZh7A1E+8rE2mT+ozd8NvVMC93J1bncZ
	ByDw3ZrBbeHJFVlE+PMSddkmcqkrzvMSGMn8ViuqNEr35dWB0+Z9S8RKBvSpuv0Q==
X-Received: by 2002:a05:620a:640d:b0:93e:9934:d179 with SMTP id af79cd13be357-944216da4abmr2556843385a.56.1793810189893;
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:640d:b0:93e:9934:d179 with SMTP id af79cd13be357-944216da4abmr2556836785a.56.1793810189373;
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:05 +0200
Subject: [PATCH 1/7] drm/msm/dpu: fix the comment on the RGB UBWC plane
 count
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ubwc-format-docs-v1-1-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CAHkr5CD33DFJQjC5hRRncFTgq+EH4OMdHJOIvKkuI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq6178730VYiuN89SBhOeHfmoweO7VJXOnWg74p
 yHNRo6XObWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute/AAKCRCLPIo+Aiko
 1XJBB/9i9TOmM0jSVpjdOHJFEnirGeiyzwiBomZwJrKi5YlcfKcYF3qP2f7QgUMTyErS3BYXwxo
 4vLyVIIk+pmjBQGTjAB7yK+kNna/NaW7I/Jxww3cN/T6+y+7ZyP+HJjHXZqX1OtrPo4q8pYeTNj
 rLkKI8yhrGp/ZRnV+fIn+FIeS/3H5LrT1JU6taU+YqWiRpUeB+1g5T6XsJnJJpyjlhxIC/v74qc
 OEOPJZ/gwbanUJc1Hn+wMObYEVTflKWAArFq79lsBIhGCnNrMtFCcRoShoMzPuxZMx8uakoQWeq
 RmC1Vis+2s2sGzbGTjKfisl0MqmwsaSk4n2HSKVVQ4fRgVSI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kbgFN_-Yc4ApTYMErWFK21_-320oZcJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXz3G2wmBEaF5+
 jQ7LB/Ht5Ybi1WSbHHm540ONr40BQ2uNv4dSZN/rHKLl8mro+r7JCk3lBdYHX9K6NOsTMAImDEN
 AU6rfeo6Mii3fSyIM4Q7yTHlMG2S9CaRuz1zIC/onUiceNPVK5HVCYHdt86Eh+SKXaHQkQ17z8n
 qSlcwopCsLLC229ILG5XAwQ+4FYOc5d8f6OT22ILxPw4XOy1wQ69DK4R54s6FYJFYfwJaFAh3ge
 qLlzihOg+szAAobsgYMmZzchxBWRttSMHHyyPViQAw80/NIaM5HUKa4XODg8hXFY2DLDMgfMoqK
 ibu75hjEwh1w1y/3NYJd88xkd8uB4K61U75Hth+suLj5cGCnUgigRPpLyRy5khV5h5C/8y9FVzy
 R4XpAfJ0vKdOOmY7xpN985tEsCeEqNDuWWvSzap996eBAZPt4ovRd5CdmDCqCGODwAXygh4nGSP
 IyCBblZky0+mQolM8qg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aeb5f0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=53nbmNL_gIBj0mvaGlgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: kbgFN_-Yc4ApTYMErWFK21_-320oZcJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX3fLtQR73jINx
 Uwj6G27wNdWoNVokjqYedEC6rq7W/vnp6qDV/n8VkJFqbu/tlyP7O2K3Ceqd9IIV5GotIjSgPkL
 ezO5oecCc7n8PK2l3dbBFCOG72AcVVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

The comment above the num_planes adjustment for RGB UBWC formats says
that the uAPI leaves plane[1] empty, but the uAPI has nothing to do with
it: an RGB UBWC framebuffer has a single plane, with the metadata in
front of the data. The empty slot is in the DPU layout, which follows
the SSPP SRC0-3 address registers. The RGB metadata is fetched through
SRC2 and SRC1 is not used, so num_planes has to cover slot 2. Say so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 590922c4f69b..a8e9a69834af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -126,7 +126,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
 		layout->num_planes += 1;
 
 		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);

-- 
2.47.3

