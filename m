Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072424FDE4A
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540623; cv=none; b=BJzCnTVH9xTCHRZ8vMQr1ZmLlppM8tq94UqlDMZ/kxeEx6U3UCcvnl+56/LKzBIsu2TtJs+B5a/uzYruqY6oU+nzB5N+B8Jnu1t+zzHDRpkF2i+/NqcpQcYYJZ5g3Ir6SoXutiWqXJFfbVdHDFGnxnIAL8Pja5x3mlgr6oDFCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540623; c=relaxed/simple;
	bh=lDNbqTejEMmezXfm8vR/BB1uVzmfG1dNrk2FkS74AYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7ENorAF09DVFPHUTCBeiXMFcpQjQNKnTvreZhH9sSsdsRMqCs31ZOmi4TF1B5nvEhwijDwr8lOhXJEt3kkxGDSkZ4jpZXdiBHKEOqPOTo7q96wmwSYYZfTYHt19jNFv7kGuCgSowLF0mgCh6PY0m66Ft/aRIDyL3myNj4rPEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7PkSOiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdSwcUKM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7PkSOiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdSwcUKM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dh5WX3890979
	for <linux-media@vger.kernel.org>; Fri, 4 Sep 2026 16:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=; b=f7PkSOiGoJngWWSH
	MU70sT3sp7iL1QCAf/2GrjDIDEoTpONPgiEGtELvSttrMC9hmInx4aZwV8UySpJq
	ptxHZHgkiRyl2UsGl3HgRr5phOKuNvhA9vrRq/vVgHnNmopy7A5X61jaXw3N9KHC
	OKOkM2S4XZA6E7hg4B4+RKqnvb71/97mgGUn/cKi8172EY9d09Fozx6ibQGEu+ys
	xuaAT/t/sYAAI7rO+mSs39zxbRDmGPH0dmFM3Ez8iGMnstJPrvMUdxC5SNJc9AYf
	cp37sLsvSUrCxAOizIlKudHB+v5H+1BRjmaYIPhi1iBCN9r9cAphNGlnD0NaARAY
	uMNU5A==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp783pg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 16:50:20 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ee1e335245so1735849a34.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788540620; x=1789145420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=;
        b=KdSwcUKMqM4D1bSyl8WNhGulm5yYJqVRjFziKkt0ahqhbUPnOl5YupNO0ZAKkI1Lxs
         xySvNbavGSEbCIdWBmKihtRRdwnPhLP7vn+7RdiVOM69BsXt9dnBQVcFGwiqchxTL30K
         sNqxCfWHmrbhbCHn2dQr5GOdmawSP7a5aW3J5fuDPhRilCHeDTX5SXUG78aGE5J5OitP
         iUmQtXXIxFPxA2dxtpJnj3R5ZB8bueG2kKkoskqVcbQXKdOMkRUpmf9i5JWC+oxk4Ety
         SptNcsHQfyjH50HtnI/ytsL7SjTv2J6MYN/jIjB4X5Hz8Y5ArY8xDf2a3ad3SpMdvoVR
         X65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540620; x=1789145420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWKJCDngvZH2rmdr953e/PNuUcc8GQpzwTa+yRtv1Xc=;
        b=BS8VBMFQLkDrGF/jiSup6JcyPyWjEdK8AFF3BIjQju+lHW2NHBZJO8nCbhuoZChcn8
         OHBb+I17No7abLG++EA7z5Y5zJgjnShdKMW419+IRftH1NgWaVAqIfO78oqVsx0jwpxy
         dMk4RFEefd+btZdRbtuxZc1XtIYv6On7PNavMq5SoMXGZ/5xVTKXVtoit3jtPIxzCkx6
         k7Bmi34pRoGr+exxKcKsZK+z+7opeonJzcNCPBARkWd8xdW+kUXQuFj2gxpBztz6I27R
         LhBiX64KzG/+IcD4QrXunIiBI0A16mLRQVdMAUScyjkcTxuOCLFwnA87VXoTtKplCI96
         i2ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU1dAIOt2LRJP3xSqx5nIVHb/Dy+Nz8Sk+WtV0ZL3Y4d3mdAurG3kcvVHO7dOatN0U5kDHFrNilyKCqg==@vger.kernel.org
X-Gm-Message-State: AFuF++njUGDhVzQwZDIJwVpuuCgrgUsXj+2YTWR6wY+UChdvH+BH/qYu
	gkS2vOblzZCdZyKOWgxkvqwNTbA+l4VmZrVbM4/RxO0PAdFjL9hA66Ln6q0RsTYQbfpwYZSTZ85
	NhNgPucn04dafYx2BeUUe4pE2vJPq54lY+ppBd9E9lmTW8M3rreISV1o6Ul1gqx3cxA==
X-Gm-Gg: AYBFou3y15MNY7DqnR5cAi4mQqjz/cElfA8HeGBYRAoysEmTb621VKjTf/tDvp9ScWm
	HSQrHjrh12U8wglRgbSfS1xFQdH1L8Xk7th9ckelBX+b87fFqc663JMa1ZLafkDPNuDlGQCZzmF
	XtVVmMrQYuNiz9ap8RuA+7Z+YEkQn3m6hRONz0dvyokcXU+iL6lV64bg+njBlbXEvnwpbzlaxAx
	JmsvopaxbbtlwoCMzcVt3IjXnilnknBkB/2ZgqAZhBR3UoF39b4YATdW8SKEIexEpcbvKeNQABA
	NRXaCZhVyWpJsEl90eOfkgzj0gVwl3wS+BWEMWC3NDntFTXxFahjvBK3wlXHEzP+GtNLhhzHNCN
	j1TwU2dbwDzAbBMxQa6jB7eOV5Gli
X-Received: by 2002:a05:6820:1997:b0:6a3:7ad3:e728 with SMTP id 006d021491bc7-6b6fe2aefbbmr5824212eaf.28.1788540620098;
        Fri, 04 Sep 2026 09:50:20 -0700 (PDT)
X-Received: by 2002:a05:6820:1997:b0:6a3:7ad3:e728 with SMTP id 006d021491bc7-6b6fe2aefbbmr5824170eaf.28.1788540619582;
        Fri, 04 Sep 2026 09:50:19 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm7908181eec.13.2026.09.04.09.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:50:19 -0700 (PDT)
Message-ID: <59c19f76-a500-48a2-b26f-2790acf90324@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 22:20:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
 <h9nOR7GlvxjT997LaUTvLw-sxfP1Z2atHnkiAqEDoeKmSVDDqnM5xr0A_6qE5Y2pzemrKuMc7KNPLyPF3KSk9Q==@protonmail.internalid>
 <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
 <92afc051-3960-43c7-9104-159640a363cd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <92afc051-3960-43c7-9104-159640a363cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1MiBTYWx0ZWRfX7Zq9OBvRCb6c
 P7Zz8OWEAacuEDscJ0ZEuzHShwAE/d7S6MKz+pRtwskBXCZBIn37cu2oFOVOTr5Z3QI0rwHNCnk
 +WgW6hA5AcWXBKUhZZ70gXW2RYdEgZ4=
X-Proofpoint-ORIG-GUID: b9Ha5y3v3mCJaDH3kY2ll4q29oIk1s76
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9af6cc cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=actCtQdN87A_g-25alAA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: b9Ha5y3v3mCJaDH3kY2ll4q29oIk1s76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1MiBTYWx0ZWRfX26NJhj5WDuqV
 CA/uWpeixEnuEkXwVDAr2ZKZ8qkNqSWfHSGO9zgu5lS8Ph6UOF/KgmXXXgyUKBr7iXqcufGoPRE
 Xw5z/vgtlKkmtDONDWmIXBAW5ZWtgwMTwtWdTDTW9gZv9i7267IowddEV1oRAgwb0T8qBZ5WI5Z
 ruYzSUXygxcBFpeubDrcbk+DivFWd94qz7mhCS+EtRIxiOnb3KPW4HD/JYdYKF+CFBlOSlTcqtn
 EWC5WIWITOU5oj2wQeptn+0pG+QaGVY6GNxRGKxiUly8qzZjuVt4oz9FUPt3SU/YqcDDoDn74kY
 iGg9aoSzvHGaa4q0w6b8YOpxFmKNTdiqy1U93mbbO+45QEssbiDD8xQAMwXOFKi6xCsWOCP/F4j
 sWakzHReKVkvM9uRPgogFHsDveE8uMzBz0M1caFEW4eYtVcsbvTouvD2DcA3Q1BioL3KQRc3bJE
 BUJhrfUti7L4dxu6jdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040152



On 04-09-2026 21:43, Bryan O'Donoghue wrote:
> Sigh, I can write a patch to count the number of lanes instead of what the code currently does.
> 
> That way the old method and a new method based on +1 will not collide.

Thanks for the explanation.

The driver patch to count the number of lanes would be appreciated.
That will align <0 1 2 3> to <1 2 3 4> data-lanes and keep both ends consistent.

---
Regards,
Nihal Kumar Gupta

