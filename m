Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5EF2DCBEC
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836486; cv=none; b=KrGY+HPHrPtXxcOBUujpgB+LDB6cmyBAv9Sj1GUgJEj2u0dxfq69ZtFnTmAojvW0eacGddXPaw/L7xD5Il+wYV86Uxn+47UGgGcfLnmEMwjR7IVEjK0aYqscUrqAkJWbCgwc0VX+QoMIGlcOF0mervqO1VQpDsTtuegOLAYIIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836486; c=relaxed/simple;
	bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7i4GllzDsFc0jN6YEQ85z0qLL6ftLI8qGu7h5PftwsNFfkLY6t5OhfGHs34ikHhSonv3PTUSVhAFFZvevWvu7tBGsxyvt8EBdgOHpkRU1Dj76Gdzw2E1vLBxv4wCbDiHGe0jc1c3j6aPiVNryIc4W51+yZF3BQZfdeqTbLd21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1EWFl7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXQyoA4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1EWFl7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXQyoA4n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGJvuA4037741
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 16:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=; b=E1EWFl7Q6/J2VyWq
	DV7F1RuXslQyuP4A1UIyYVpQNh9R+kSVKDustTRYbeWCAcdz+K9P14RIvyqUbkVZ
	ObrAS/PEWVs2kVZ13x6bJ3Ce+q1d6mleR34YUgdRQ016lR+Rwep9UzQ2BAmLOsDD
	yYtnFaa24c4z2iM0+vu28m6QPB/IfmzMn/pfPT/Oup3y4LKkZ9kLPvyckn3SJDvB
	5TfdktayQyjFJ/JsyJr2bFdpg8iI7BYVLTsUxZjO//O9QmbeBUgu0RHcyqaXN+ve
	oSjqlRsL9pzAfFfC3quP1ZrTbUiYfLnSWOf6GIxfk2ZRPAH2rdLHqHbp1AOJL/Yv
	x0GQ8w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfsc5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 16:48:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so1766317a12.1
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789836483; x=1790441283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=BXQyoA4n7hZn+Ack72QoXEcB50EkG0KeXsDww5HwjtLLeEMoubMN/oQtvT9dZPzF24
         aK9yZs2+0GfhHSVNIV87fv/g0EDCo4CMZifVya5kZepBGZJUfbirWwgPGzjesLwlXdcK
         Os8ywcV1u5bM/qfkZlLX9E9JM+4o+1QH8dMV/OiK1bQaguOWOWmMDheSn3T2KSi2K9eG
         AgFMoAiGpi0km6ws0c18B3YtnUMZIKUNwkhb/QhjWz5XY89KT6RUel0DsUat5keIvGiI
         SItUxg22g2SzV8zFEEngpn9mr8G5T4ce5lp1PLQHdpVMcRaJhf718w7XGhPVRqUpJIIr
         SoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836483; x=1790441283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=rKgis6H9IzkZPQrOkodtOEgwtQQCypCdWqEISyJMxjTf7joATV8LM+O74bz3day0Vf
         k2IRtiF/M+UwOnefY+qHSM4to6pQcvq/48gi9BoACCPZ4rKpHKkTPUG20olV1nG41Yvy
         tKkyVv7aLpIYk9Jm7I2Hog+wCM3YeMYmJKfyMwqPP+/7DJYQg6NwoNvU6gsnYZL9u/Uy
         vTUEScNRoJaHNtmtS4OLfChhysVwcK53Czc3JdlRjagNQ6/IB7ut41HRvLZbUoCoLxW0
         VYfnFWAmv7P6qo3jRH8d3HJmIxEwdLgd2kY2dXBEvtuc8U89nuKrUFKX3id+1xUt5weU
         FQJA==
X-Forwarded-Encrypted: i=1; AKwUvBy3PPOwq5H8E8LgE6vOe6qLuNUKQ6ryGBzTSqrvlnHWWHbyj0J/MbWcOfWC/RcpHCMcBnIWxOQCPuJ/Kg==@vger.kernel.org
X-Gm-Message-State: AFuF++nVjWM8KGJ/lXYUxC39aLWM76+CfBBfYoTp5zbFWB6iyFmerkUt
	jrqgbeCCmwbpLNsMLLr3efv7aqD8WOHN/NB8n//I1w+FrF4OyswZ+J9LoDW74925kzwWic/BKGG
	eIxry3n2TW32fzifZJ4DWqflzMwHxtZyo7kyoXw7OzVSRTrbMb19UO7mOk7oghclUUQ==
X-Gm-Gg: AYBFou0omVnJN5pUn8r/lM+EekW3fMMfttjgAGHxzG59o0Oyg8dXm/VrKjlG5bYv9AZ
	Mb86/uC02sDw58rAZ/RInH1Db5j/dOCQjG+yNrn1ZX3vP+AeWhBOcybcX1NxVPQ1ksYmQQMFtkR
	ffRgY5Xx7oKByqu3jr+SM+Il9EDGVEoVV+OS/2yJaNZdYEA0IM4ahj1eda6++ZD9WetTX8Gpk9u
	6+yWcHeJu2HAed8ZINGSKHsTMgGuQAP36zoTXBJ+ZtGs+QS3h4Gsmud3dnWMhqCMn8dwGVm7/+3
	fN57vazCqCBRNt/uDVCTXgk/ZvN0R61/ebEn9u7YYOX9BaWZ8p+tks/LJcsPI/zNPF+pwV1dsaq
	cLLSXHeEKzxxbPhhpSE1wJ+QHeHOufy8=
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475637637.23.1789836483420;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475613637.23.1789836483017;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf843sm11231739c88.8.2026.09.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 09:48:02 -0700 (PDT)
Message-ID: <2ef85ab0-0efd-4a4c-bca2-370bedb36f8c@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
 <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfX6j5nhn50+70D
 sb163Iy0Pf69D8RO5PuWxYVqofxiDla7iE7CWwZqaEmzzirQott2AMn2CaPNfm/ybzI7yCEwcQL
 wsULYTFz+0R6RfGrqQ4AhC5iZQrPYYptLVPHNcznerxxFNrjlpylA9E+IH5bNWI0AlqgMEJcnwp
 kkbCg/D/9jf/gSIOQ+blSTALQfjyOiRzDoOyv95XLKtV+Q8ltRlxt2TsO7eIUZYLJD1LHnFpB03
 zOpgs+dMdLrTdzhGq6r/oW3HZI8QNadZ9TgPBKAwQ1ISupwgbdkx0FxWFqHf3wvIDQxiobnzbra
 QSIrwgSPIFxJXJORZNQLyL0sEp9qnpng/gWvK+WbmF0RHotQrmaob4Jkd9Cchs5fG7+z2ZDu9iE
 Oc0JnmEn1z5NswOK2a/2xdQyVKy2gt72njt3Nee0Kc4/vWKhIiuOHCrRFaPYQKzAmJC5gDF0gmA
 +/JCLQ6VTFf/zwL1iNQ==
X-Proofpoint-GUID: TOtbemAqjyXUv6Ob_gCpK9Rw-pryPhqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfX10gr0+qinG6s
 65aZrCSiniNGEbQ08cHTirt0jgCP3FmcBnkpV86wJXEwa7aXGsJO70vynxw73VxKb5M1uqF0tEn
 05IIeGNwg4yd65QFEvhP6vCoxmGa1hk=
X-Proofpoint-ORIG-GUID: TOtbemAqjyXUv6Ob_gCpK9Rw-pryPhqb
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaebcc4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=AGB_TLOESQuI93QLNYYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190244



On 17-09-2026 15:30, Krzysztof Kozlowski wrote:
>> Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
>> driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).
> Unfortunately same comment as usually... Samsung Agatti? How anyone
> outside Qualcomm can figure that out?

Ack, will address in next ver.

---
Regards,
Nihal Kumar Gupta
