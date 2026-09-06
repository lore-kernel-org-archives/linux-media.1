Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E736605E
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709887; cv=none; b=QGh+N/KvmJtlOXYfeExD9bqFN82DNoBFiAqxnk2KNbg8puw7SJHqf1PSObGabU0AHV8m/6p8AR0Kpnsz0fm/Ag9B5WLnKKVHRcXQYWCb4eS3PWg5G3j2kmLuhSLyHN0kznMbQ7RnoU2TnXYsnJcgT+1qPNBKm3cag/xb1tPFgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709887; c=relaxed/simple;
	bh=aBvKHXJMUyfS8/ReEsoPVCIlZRhVrQR480IPSglyxog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPPJKYDQxtt+u7ZJDhohMuBSO6Ugp1ynoSvo/xG96fuIYCMOhvw91HXOmPmtLyVRNTPtJA39n59kr3dQir75AVS4hi9hfsC9KQ7QHpEiG//QkB2WfsxSmeXu17aI0cP3LN02ZtUfgmz0q6dKr/xckg/BuRXZl0Fwsas0PLu97zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLmEQD6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaPB7chR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLmEQD6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaPB7chR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EXA7S1837320
	for <linux-media@vger.kernel.org>; Sun, 6 Sep 2026 15:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=; b=DLmEQD6Ii5g5CD3L
	FCtBjZ9lXnkhOq/YfgNIJf6rThoNoOq8496Ys2s/zcgDEbMM+yVBpkOke5DwMaCH
	RR07zWJd+EyUU5vW1b5yApfl3AuTr1B5Ylbj+jauQmBJMoe2vSLPf//JK1lQ2sLW
	58HyWmyfFkhKNxrRqafZZyW1GNgXU6HAkMU2NqezcGJEoYvrWwPs3k/ui7PoRLaE
	a9hGvrtLnLYVDnuMpNbgXDj5G0JWHWxkDVK48OTKhOOXYotCFKMNvoEkS8PMrfVA
	8u5+iu7zJjM1BzHCCuLc6J7i0wT4VIUSp+hXF1FFSBdLldtRWupyBVrYultfYd+H
	eyrtMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany3n86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 15:51:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so4276004a91.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709884; x=1789314684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=iaPB7chRrUwVqrsYjyBlwkVRs6HJUO7X9qXMcSumcJ21v2FlE2dm5RabE5wjoWpQ5q
         9fAYNi5bF+D++zq1EJcmoZD7DSHQyTKFOD+1g58CidbtBVStZPdODY4q+myMmD+WmpJH
         26YpgRH8c4aoByizxviOh7rwSUHFCr10KkD2dRM9vnbT/GD4/pEWWIXyEz2JFR7lZ8ZJ
         uoNdc/7ltOmVhEvO/OS0IEaqMmMmy6LTthH0a8/Tln7cDJlqDpF/gRKInGPECL8nRv3g
         sgtrs6hLUC5ZD/Yr+eujXR71iEPvaqPYK6LtESybQooQ//toGOYVN1Wi7+7kb/h9Ctr7
         0I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709884; x=1789314684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCNnlg4GyeLNFBgZB9Ozm8QTq3ZkWVLYSJhs0FHtgyo=;
        b=ctKjlfUtaQxT2Std6j7x+YjobTl8DJhQU5DApGjIoTcNevU0FSC7rSuznhiyeGx7BA
         YE669jOZgWY/PkpeQzb5nnivbgT9GqAqVMU2NVy/dodEf2T/XxfhYSODtKgR/sdVtnEn
         P7WcvO4AsIUbnVimrZEoBOArIPZgasm7Dfqks4FWzm+eqZppVRw3rUj60hqxiI7Jej2Z
         u0s0ubmA7pFVdedrqZQDdsmnL6zCA32Ci31Qccpw53LB3nkyXaOB1d1McA4D+v5LlpY3
         BQSXChqflLhkI08JEynpUifxtyvB+EK3ZsKPJJWmWAy2vdDcQpVsgIdzpmkSQtGoTG04
         F04A==
X-Forwarded-Encrypted: i=1; AKwUvByVtEUKT3CRRn7qXJIarrifj8aMPyEtedKhziLP9Xh5gSFhKXuSGacKv6tUXGl4HNXjiDTsJZHe4/sDyw==@vger.kernel.org
X-Gm-Message-State: AFuF++lzdeqai2XS8t9TRoixTstS1GF3sX+qMS14P1OnTNy0oUZ0HDQp
	bvBqY2m2RuM0DNeAY0zfBm3EV0fXVIoxyNjF0qbsj9pBaem7qhR1lyoiJU4yhh2EF4/DVhBstNJ
	IW2+jiyN/B3thH2rQKgyzyXDmY4aB3NlyPdPvnVM/6n77m9EQwQ5ndG+J6CvBOEXEVw==
X-Gm-Gg: AYBFou1/WzUqGAyN/AWhJfPVQVu9EsDCBoYYvPvAWfY/vov2mmuVE0Hz9wHRxh4lln8
	R34JmPMoxDZOA/RkqDGx9L2v+FEg46uauAeMUZf5QBQGeOM0/jg2PHUd+ztZcLZgQf5ij/oqA6d
	LQSX4DYXiayg1yYSfrvXGE6lFJbwHMm9bW5lNBoFRGp3dEsKsxCEuIJGamnVaVOV5CcFp3aeqM/
	GQ2Rw6RSGI+Omx8r6kFeNqiP8QJpureLMX4oaqNPnqcZIsyQzKNGjJFMwk0Yblcy7in1AFqMfog
	6YEudWZeOJWWnk0JaPFuVyMVsHTCOG0qREQXIA/als2EyXj+v8kltXU05d+97mfW+XJTeoqm1uZ
	5LOuA+yryZQZNIRPP6+Xg5d5NGbbO
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27450022a91.3.1788709884238;
        Sun, 06 Sep 2026 08:51:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr27449993a91.3.1788709883853;
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm19755723c88.11.2026.09.06.08.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:51:23 -0700 (PDT)
Message-ID: <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9d8bfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0VQvOID68a5ICqMF5fEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0IA1kBbUwgRIAvfcZPLwkep-ejmPePvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfXypjO5MmBmx51
 eg/3tNQvmJSpfH5fuP2LxTwB4XnX/d0u6KdrS/TAziZ53NaE16tOgwXt57afyWFEwY5UoGqvcpd
 Cf8x2s2kLKL5XqOBHZ+N/rQmzAQsfPJ7v6WjdTrc7fDTyv55G8QLjEFNqcoeZxIrsSO2qcsaVAT
 sZm4d/qUjYq7RC2rWCT4P2u4nLx9ourCpzMoep0X4MEfGKLFcjn66oIfBVrT9kYuDLdnL4ovMHU
 p2XkF3jurxVHhCxJPdQ2iGedN0X3Clrq53ei3dF2/ka2GbT+XpykI1bQFpGVa49jcOobXlKlU1n
 V897/2vyF0HUdSJbIbdyon3yL0PhN0OC+2iWHPtIJkGECitDZAiI6/XzBLQdTDfvBhzIJ6LJFTp
 nmFNL+24HUchyH1o4Lj8Q5/tqasQIL6X6xyKHrX+OUbZpPLWvKs4EcGo54N2Lpj1Wd+w5o80Fu9
 z5Hscg8ywu9NEz83U8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX+h3mMnX6bRB+
 WgruBrMjUWK6bh9BOj4H6scAzGT8blsswBytzXO2EcQUpH9R75ZDpomrrdi0NCFAiuPO9z690+r
 pZT9dymaNJmCXU0poGt1z0Hx3dliiGw=
X-Proofpoint-GUID: 0IA1kBbUwgRIAvfcZPLwkep-ejmPePvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060176



On 04-09-2026 02:14, Bryan O'Donoghue wrote:
> I've retained the callback indirections give us scope to add in another type of
> future PHY including potentially adding in the 2PH later on.
> 
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For the series:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
