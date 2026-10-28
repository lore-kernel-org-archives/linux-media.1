Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220357;
	b=GjcZdgUe+h2dSzCxvauGO8eOiV6suK7xphLPcPlNMkvK4BeyeBjO4laqDG5wVnbbGLUM
	 qAgD3iTQK16H/+0AEEIq2hcl0ZSyxosMLje9TJKPVp7Mtvil3dWzrESt1tagb94pZ3fOn
	 JlclBV79otgImkK9/w0Sc8AvzNNBCdazO86moKf92nbv3qXopXJnbOx5p3GdIL/ttN3Bn
	 +Ci/wTMg7wv8E2Bzr0wwsnP4YVyCCDnVONKu3V4ig45DlYWlNS0z8Hb5CsELlAjE+rv99
	 eO9VPCASEVtR2sLRH+cT5w5bgQtOzV/IUX33xrCsvR40vAc2lcH5uFsJGuxUlQmcGKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
	b=UVToedk5PgvTgMvOH8MqN4oK9Nr972BJtBX+oB4sZUsF8vYw24JuiuoZWqIMr74yfur4
	 tiy83Z6MYYLGbBNE5vsYaNb1yX40BhrFLHmQk9lXb2cEWLiUUqfU++h8XsrByO+dHhqmr
	 kI9kknoqA+8ZetHw2EkiQK0e3MroN+uDDkWJhOxAiNpbCLl+albeVqGDLO/o2Tt2+B7h5
	 lfaz4peb1qnGTjJBKxeNSRyMiAPLfB0dmfjhdJfwbsZrX/o38tOU4kdk8brdyo/3N85wL
	 fwLGDXWihK6dW1ZIKUsatP8ONGz+4UdWZXYcZj6z0Q8Qhb1vRBGanY+TJkWkslf3YYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MLBUDz7/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22D606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B22D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLBUDz7/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPV142995524
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=; b=Cx5URFdN2cNg87ly
	4km/gBAr1vP3quNlgWTQUPHqp2DGyuTrdh0UZgUkt5DIzUaMfRxl6IhNHdmXgJz2
	/ONVKUl2soONKkTL5RHtlwVtqpyqgjfTITcZz3wJPLUS5/PpGUq7nq4+TrKg0p9q
	gawfFjdx5BXN69YzmZC+vKWk+tu4ip2Th7eE61AM1yWZj6XBZLaEUsTwIdSuwATU
	2C4pbO4wkG4ngEpdKdYo93Mtf87/H6L63Mcvvj+Tj+qFHxByQV5an0NMn+73J2t5
	yfqimq4AqZ8KpgdZijXWcUEzy3zqZNwaHOR88K9oyaYm9zG93wxH4JAUnNQmfsQF
	f+SPYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneurrmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:45:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso3514637eec.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793220356; x=1793825156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=MLBUDz7/Pmfc+g+B8cJgfY8zWPI+XTENqaffLdASkjakYxFd1inwaCa11NsKdOk8YW
         1ATH13bu0D1o9/Sd9TzD3kZBqHKqjOufTDovfppAnid0ujMMTR9EIHOKZUz7C3EIb/bE
         bMHe6oO5eefsG/oP7JCgoTJGQ5GSbKTtAJpEnhS+9Ykc9YLLCpVJoU+CGr3Obu0Upvjy
         0xD1vuZC7vPjYfdi1SrGEZ5nwmyJLPLEGOzsEv2Xj/kJ5AZsFA0yZHuP8T6niHgUBBMn
         2/Qm3H/gP9jbDKU3Vh8rxO+7Jt3QepMVFBR4un4fLRaF3BCEtnaVHr8CtlFY3r4gnKiw
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220356; x=1793825156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=0/aoLt1FdJ5hvz4dNVU5ryaeNtXUvzFOVpZ95zu6CkMrvCX72YiCthNUgya7USu7Dw
         8wF9otEVZ1j8IIJkwrTJeVQMdOdrmnrZUpSmjEqPEuMIgkwxKnxRMNyXhs7I42DLkTHp
         ACkj1VzEPE3Fiy+Jaa63ytBfs/DexrUTAjp9cV4Pr+aX0L13OpnCTQCfSNKVkTmFmN3s
         NPQUCPyOus9w8Pdg7ihjoiunDXI0CNprrQRRkaHmNHPi8U5qbp6vWBBqNIhlR0QVc4dE
         Pl3l48Rsh8YFiNRwjXHTqhGkECM2Fs6Bmsim28LS7RrxkBxS3NoLARPpWj/FPWUQnhPA
         XIUw==
X-Forwarded-Encrypted: i=1; AKwUvBzF+JJ1YKUfj/b4gfWMamM6w2gVnjcrzPGr1lpSlSBUYmm6lP6j+Z07o+3Q1h/oHiHc8JRY7Erc74RVSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ7ZDvbMed2yRtgpwxaR+rUhenuj/U7pGT6TqXgfM6m6/ME1Ip
	vRU05gXZrM7o080TbjLoIUA66ShCxcXhP2zdOG0jVUUt7oB78rBR1BjQY64rKbjCh8uWmV/cBIc
	1cvZgv/I3HXZR47prUUvxFCy9E9J4/ARZv0MmB40yJylYGBeC1Ci+z2O0pFz0+xCO9A==
X-Gm-Gg: AYBFou1kI1V2G4LesOyyWaFYpu4cidBKq9SGQwikbkj8QWnC1oHd+wjYovhD/QCSgiy
	Njw9m4AWgSq4mGZSjznGgFkBPvi69/ah3zFUqyrayZuXk/iiDrRedTfNJLqKlW+ZerHcFgcRxj2
	pUKUo4whNXHUazuwEDv53k1Gsqs3EPe4q2TETJDLyw3afH7k38ffEILzRC3wAQ5/PnzSaa8kaMv
	0Vlf3Um4BMb7sVEyAHawfTBcWFtp8bpp13rYuCX9IaqEQc0eytUs2FR37aHXJFIqaDPg5ZRcqNS
	IUz2GCgb7t+GtQD+RGB67CIrFw4ie7DOB9AoNATKv3E8jbLJfJn+0CCUVNko/L8KbrhcnPCBzmE
	jIOsZM29Sj6crF6ozJ5EOU1U5pu7xwT0+NzyZPaWBcVHSpVRJuVSBruqo0oDautVMMd6DIaZdxG
	HIMp7lUw58jUrcyKOs5oLYjU+s9n8Qvbk=
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970909c88.23.1793220355798;
        Wed, 28 Oct 2026 13:45:55 -0700 (PDT)
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970883c88.23.1793220354960;
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm10326914c88.18.2026.10.28.13.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Message-ID: <1cb79561-39bd-481c-88d5-a05135f5dee7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:45:53 -0700
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
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZW6-XDf5dgEFD66QI7ZA8WIK_alWTQD2RWolsXjlSql7pO5IUj9PM1T95LMfBd2Y3zKxRhDXXde1R4asZWzgKw==@protonmail.internalid>
 <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
 <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX5VSFtnLU3/9g
 7H0i4f8B2Edk+MdLSCXoHGncOGxvMznK6193xIt7Ds61OmYLwxh+N/MoTo8GB1Yh72zM0bktw5P
 Jl7l7K4JxXV95EBnRmsvL6ZBjI/Pos7+goqSwazylX5P4yJ1LxOQF6ShJbZtAMj+UOHs0YV0xFW
 KKwHuf0pIzRY1qo6EDUfcPQ19RM0sKv6medaGts8NXXGUq1v/DmpktFzCFYSrx2IhF4BCkHMaV/
 G3HMvbfg2S+dlKqb++JRITkVwRZDzam98QUOfzBobRNJzpLtl20J15JvJL0suRMLp7h2knbO3Qt
 nBQUS6iZZR4PlrTlRQV14/CjiabBJYuc3VYBsIafbTTjldwNnj25QWQ3JkAIRTKn1yU4Fgygb/X
 q4U1ghLXxCtheTMt26vVHR6NcYvsHslYXdnXDXvGKylMHMyxZGViN5XD61xG0c5KnV5+sD8q6IX
 mHel4a9gVkHtmiVnM7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX1p3FBC3KVkbf
 kUk53ZYnvmHFWAYm290Pfwba/9D0WS4ytbWzsWX+uWwSrjE6y2zX8SSXcGra9lb0rbKHRRZlFPq
 QGHIG5jqHHwc5QMbtbCdBUOMmnysyB0=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae25f04 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=GEq5pLaLegoqB_85s88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 5BisbZhh_nvejXE3zgbgaUtLxDEggcRT
X-Proofpoint-ORIG-GUID: 5BisbZhh_nvejXE3zgbgaUtLxDEggcRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082

Good catch, yes. I'd dropped the NULL-list check for the
multi-genpd case too, when it should only have been loosened for the
single-genpd case this patch actually touches. Applied.

Regards,
Anusha

On 10/28/2026 2:58 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 05:20, Anusha Arun Nandi wrote:
>> -    if (ret < 0 || csi2phy->pd_list == NULL) {
>> -        if (ret == 0)
>> -            ret = -ENODEV;
>> +    if (ret < 0)
>>           return dev_err_probe(dev, ret, "Failed to attach power-
>> domain list\n");
>> -    }
> 
> Shouldn't this be
> 
> if (ret < 0 || ( csi2phy->soc_cfg->num_genpds > 1 && csi2phy->pd_list ==
> NULL) {
> 
> i.e. you are dropping the NULL check for the case of multiple power-
> domains.
> 
> ---
> bod

