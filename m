Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B14FDE64
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537827; cv=none; b=V91Tn618GCuILggjKbe8YQguz7L0MhShDFmeRyLDy3IxTCG6paO+Oi6xRYg6M7OGED8VS16EPVlUcBbABjtBpLzBn044YOOWbeXlDKuy9RIU7+VPzyJuaDCKkEr4kxrSDMi+PoJqvNoeUBCAxPH3TY7lH1Tt321lCKi927hShqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537827; c=relaxed/simple;
	bh=6EMuGemNxkodLoVrJas21TkUtmgw/Ztd+5lOhHoZN80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRLOEf+9DIEoA5aSw2oCngsCkDvTANU9g+HDjA8JckA2fOEjXbn44K2FTmKPYsKiyfhUz3m5/C+aIN2Gm8Azz3Bh2hzzbvjbLU4dRN+bWqSTjM6oud463A+O8s1pHEuOQFB44CZVp+0GmGQsaerYJyy8K9xIrzebkvRlOBEezxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGIVfWl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APR767on; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGIVfWl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APR767on"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgtFK3121398
	for <linux-media@vger.kernel.org>; Fri, 4 Sep 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=; b=gGIVfWl+IVBNqJxk
	KVKIXihnxH4Q6/zL/90Oy45L5JSb04b1GSjLmB1bE+vtZBwapNTWWJV6PEt6N0uU
	8dKz2ADKywrN6I/8IDAvi0jtZ6iXvL0a897tBN2+IEfSnrbI/8d1Erzjjt+hnu/V
	AWrBFdmvxunF+3xsqUhgkdWTRK6qdF2kjxYkfDko0KvWd8r+lNiuDnauIUnbWpOV
	EUU4RVZ8l5FEfqyegCmIUtu0rgEXnwlAv/em1uc+6meMhXKRwPTfk2zqtFJpLjvt
	FN4Cubbm/opSqg4YFHUOwr2RLiIwOMzeltyJWltXUmbXugC9iA9z5qO3jYls3aNu
	bQQB6g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fjs1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 16:03:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f36427abfdso1820736a34.3
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788537824; x=1789142624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=APR767onCHd8gedYA/rgitlsHwyGBVYD/q/HPnvE6U3SApeCDH1eicp6aZuMPs4Yz0
         bPrCYes+EJBY16YUDHOGXlxOJg/Pe/G2GYSXI4bQHVbPpdKaEoaIIKU77yi5YigTViAn
         ht6ubYlGpbYtVe2mhxDOnhtvnq+CEZQSNNHIS6BjNxhMiRwiDS9g7No5SCGh8aEGGwXA
         PFja/t9yOVIoK3OH0Bbt/arT4n9q3NOqcWas3P2fGWLAUo7PTp6M+WKdXs50UL/dZWy0
         6ztgwXhdfpO9GE3kU8kkmqoeyxPo9p03DCl2rP+zMVw6dbvOgjEXHsVK6Eez6KziduRk
         uV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537824; x=1789142624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=Dp7cYxSXloQQzL8X3nOoDiugu0YVFPo5Hqtcgm8HwCi7t0apHxSpPtWGhwmV8dvD1b
         WjCkNp8gO1bfaS+BHWL02d1OKwmHDFNynxmF28KuAUDFScmQFt+eVogt9GsPtXRM+ofE
         YdJnZyu6c9IQxKAS5iP5UCuHZ1NhbYQ2dCcRp/GfB4m03rs+Iy/p8gZz4jN7JA0cnKVH
         6G0k4HSeTnln5rZv09AD9tEHDSVOU+m07rc6w0QQm7FnTxb+MGqloKQo8icyZv7Loaud
         YVxQqZwo+yxtA1TMlxuT2mNvMRf7a7n3xThDMySpgzyoPDkEUsjVwHlNAj1YmNTmlmSW
         2QJA==
X-Forwarded-Encrypted: i=1; AKwUvBzHcOemOeD/P+lC9tsmgpSCeuSTNWrzv/e7RvdNFJNo0FEJnBmqQOQs6bX9j4OUohvD5oU679c5Ala9dw==@vger.kernel.org
X-Gm-Message-State: AFuF++ndbUi/n0XSRZliBJruTDjYR+dhY571McnSeSSsNMo6AKuwv0y1
	OY1t82KPNsZCuTs0nCLOhdcXDSui6oP+QX2mF/BI5E87dXXz5hGNpUTjZUSGYuW6KYNIO3uwDhq
	YKQQ08OfuGiM5tBcFXfogyJhL+M8+xBaEc/k3pf1N7veRvo9Neo7CYkvTXRXCRkq6eA==
X-Gm-Gg: AYBFou19NUr67IOE7vwMIxNGnhvwR47NBVMvNyM+GjyqljSfcIozGrioMLsDWZnwuXJ
	vWvRJjxppM2zlLSwLFFlTlI9C0w8m0cjjMKxwBKodwWRRShsrWAe5UgH99Cot7iniMXERISTtcJ
	rGqt3zbtdtFbTNovxyST1RVLvdzQvPr5SItyooGOU8ZbJ8oG68cSKQLxQcSIPG4Cu4nuzf/O07d
	EPnGcfe4lr4r/Nij+kCiF2N9mdCFBItiJ+mIXYG+OMHEgluNkWkMbZzV55/K/vWNutt/S2QLAEQ
	sxLTRDx7j8RraVLCMOAa/qzApMypZgkU1SEj2aMHML+PRPGYAzLND5J0cHF+WCdan/9kLyQlG+Z
	mNiR+/Q15RMyEDrzWlinGP8yVLi5I
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5568053a34.0.1788537824558;
        Fri, 04 Sep 2026 09:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5567922a34.0.1788537823727;
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f53sm3195659a34.6.2026.09.04.09.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Message-ID: <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:33:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9aebe1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sbdT_ZAiYm_QAtLiiUQA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: xjy_zTV68el-lmyqPqs3MH5U1OCL0pr4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXx+TRiEVPlfBB
 rMjtDnE7Lx+3GBsRA+QdhXkV5Y0OdqgE6nTQeUPlSBB6A+U6Cg4dZyj1MmKvezcTW/s8Zo7inSA
 0NXwSdDrAmYeKaRtp4M7OddjbQjYWqQ=
X-Proofpoint-GUID: xjy_zTV68el-lmyqPqs3MH5U1OCL0pr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX7i+pZhwZChws
 0CrT4FcHx42qVbQekBFXlzfaRM8RAWprrE6qm8CZKtgq7c6EZfhitWGEGBKxUXULphKxq/bOU9G
 Nlc/cIOUI9tGUXlFZWI/AJPZDashQo5uqXcGFFQiaEI2L7chUm9khiXKkDsoSKnfgIXJuMFPzOE
 kQT7m4EUjWt3WO8WGSpCWzU0pTuEc4Bz8M9jVvmgSTctdGmyEMtKeeusCd+3ZrYg0erXryFT53o
 69KjzCQ65YeKJDvrIBuznCLFUYGQMxk1DCWmlufzf+4m/mmz6cnGzYGkhIRsRW+qbPPkdWc/0Ca
 xGHA1SnQaXspR7hJ8dyHImIvdLNqQ6BJWzTInBcrx51dHW3iA+qNyaWTS6OiBDA+2zqFgFeVoPh
 d/ydj9TbK0VZ2eRgQ8+ipOYx4Pv5+SDkPEDzliKLQCxzsxp5M9/sT47j3g2ho0mIHcDyVAJmjNi
 5a2G1HAYPaUqbS5VOgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040146



On 04-09-2026 16:26, Bryan O'Donoghue wrote:
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
Hi Bryan,

camss_csiphy4_inep has data-lanes = <0 1 2 3> and csiphy4_in_ep on the
same physical link has data-lanes = <1 2 3 4>.

Shouldn't both endpoints have the same lane numbering?

---
Regards,
Nihal Kumar Gupta
