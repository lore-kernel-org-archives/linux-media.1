Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E33B2D1D
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389704; cv=none; b=jmn3D12f4/tS2M3GJYQjGLiJAWA4vZHcWTc4Q2luG+4y2tWtxpfMNZJ9kfhg6UvjEbTTt6pcs4A9z57hya3iGs0bOXRJG38VKN01BqpidtfsJDAXYiHf3WGftDDX6zpm5HXZUvPuYZhhKC28hICY/j4chkcsr3r/3b7YlONOj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389704; c=relaxed/simple;
	bh=Ms4Nfskcnhq/wm03qAo2m5NydjTBb5cn4qE/+3+mS3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXZHNwmuiwCD5sIC0YI2akzMK2AFJtaSh+I8fcrskdSM4cJcejTSuGWCg44raEOHxvWXeULdpg42HXLdjl6JUn0Xx7wA2VVwwUcdkhgKGqsPGzI0ZGPqxMVDebBmfB3X3V85qICpmsjIF2VFpLJdoODsMFf7HJ6ht/NWuFmzJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzizE/rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkyB35T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzizE/rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkyB35T6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U5RcPC012158
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=; b=hzizE/rh/XEp9dlS
	Azy0hiB6Zwl0iRJeAjCz8wPoNhni9YxFyn1n1baTZ9dydxl9easl9g3uEw4asx0/
	nYbG1ryH0NL4egFs64R7Y97IfFs4HkJTJsgAwi0Ol4zZGG8jhvSdIaauRM14ztbR
	knqqmX9I7pjFvZ6LWIl7B4bNzVwDmXXqs2F5Sq4MtV49/oFj5+qmCAr/EoU2jSRU
	WVVozHDopj4fes116hliJIXxsUUtIG43ISqsAq6kTGv7yr2fvOL/Xia0xDxihHYI
	SGBBw7biqX3FU5G6Xu6hx/O5z5PtYiWDjHs18yCoV2TxEAI/lgp/aV0CIY4t/vo/
	N8LdeQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0g0g0tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 05:35:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so2655081b3a.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785389700; x=1785994500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=DkyB35T6K70ChGbLkZuI9kLCgnbn8i44VaLhL4lGPvqxaQNTdDow02H5U38PdaaA2+
         zFntSszbEhuTQZ3B8WFIV6ECF1h6UBHEisUxrUUa70Rth5djOKmQ+aKQLWngBCl4WqnC
         74AfptiZZmmK3KKiV7RQHi+obwSAurXqkCFfNtXkePdKKsbHXn2zpdG+NuXuMI1YS1eD
         mjRNh/hgak14poKiID1X3toSNyJAOYXdULZX4TTCNFBujQT4iJsa8H/nL9fo5k1o64PW
         sIMqVRV0TVfhI8pbQq2tX+fGux1RtX6yT95S2v4cAmPyH7BGJwwz8DsOtqsOtq+DW1GG
         neow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389700; x=1785994500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=BK1gyrG4PeLTGbv2DbrrBHjZZAScqHrorKArcI22odq8sn4irrj6gVUO2P2FbFzvT9
         2MwVF/uicxYlIGTsoG7LeQWM0F6n8KAoK31FrLY9rfW4F6O+34Am7LOJJqVfalPS/cC9
         M15AtjmUjU+oIkizizXY0R9snmTJWGfTapY88LPzTgqCq0YqWTmlpULqsn6De3efybdn
         i45DNE2H+YAT8WcU/UxEJ5OB8TLUT0+yGKOYmJqgNpODlx627S1wYLX1aCOd0kA6IakX
         1jDZlLri2nmQb7Jxw2WDFnUBaeKkCV3s8Wx0aQl8/kiLFllFrE3Eo5F+xqWI7e8dc7Zp
         260g==
X-Forwarded-Encrypted: i=1; AHgh+RogwdTKk5y1j3O1LnKecxdumRXfUuWp6+LjCcqz2z3cs6s2XADAtK7FRm8SO6x5jfaTXvmWpdLfApjspg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9EfPxcIFHZyQ5iHm4zo/JZlEEEp+OAmfuFPGQAVNGGnQx516C
	5l7ke0wCav1RI8eMW4W/Fi/FWz+7wXRP+7hC0ZlSq3hJi9r3gyLnyI1M1fPYmF6Zlw2HZDYCbh8
	hZQCD6fN4g3AWOFQj8W+U0mwnEUFZmPu72UZ/FzTL0kNZyS4mRcEn0Zl0lQBLzYXIG0A0gxbe3A
	==
X-Gm-Gg: AR+sD11yf+ILGEw19NC1K/8JsGDWJzZvwzzfn/5D+cOMMMyTeVfTKSIEz6cQLihZWxU
	5zhxoSzZPxjGyRu8nUFzVmzYinPRM0nBgbNlx2+bkwSPa52YZC7hgxPABy4Qtonl5S8+YjWl2uD
	CivHPonNJuV3BwOz9dLXSlelX6iMc1R53oblqiFcJ22jd5k4JklOMCiMo/TVlW+4zn7ZivlmzLb
	NbJvxaZtixQAR1k60aV6p86BZqi3FL+IbXi5k8vy0m11gwlo7Dly+PDif4haKZMa72Oz5t6QzPU
	0U+h7tzu2dBu6nIaqZvsTclYIRXs2IAJdpoFGYeh7B7f5mgGQF5wkSn0Mw2Jnw9SsLNABb5n0PD
	Nndd66vXaCxeB/hA1cqQDUXvQYKtQ/A==
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338803b3a.35.1785389699850;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338773b3a.35.1785389699398;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm2342241b3a.31.2026.07.29.22.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:34:58 -0700 (PDT)
Message-ID: <02b51d6d-0b65-4723-b1b5-307726c76fa7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:04:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
 <qTmyhh5ukxu4BQAZXvNyyUvZxucwjv6bNoe2v30cfjsdhuzg3ud5DZzGmSBlYICc_POjXS2sSvhbRop0i67mxg==@protonmail.internalid>
 <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
 <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfXyjAbBrzgI1er
 xgz3p0bWGfk4Q/ZYIBws1CQ5X4gJ0rgttIqF+qHGXDsiYNIEYPD1JtUMyGBfNUK7ta5SKZej29Z
 2nf3UFAgcK3HhGPD5raLIbZAhgqPIF1FbANcioyIyjuL1O0B3AByvj4YldCHGb/x8TUae03H++b
 4U2lz9X0kZJChK1rvaVM+taydRYdVK1bFU93h/1WOHFugpiGDmFAzXiz9Zx5oAna89PW4TJ0grw
 J56JLsyYIELu0yvY2fbD3UIjzkTMd2+i2QXX3d10o7vaMJrXLLq7IlTMOT6ZaozWEsGiRZs1KtI
 ECwD7FkpyqTCga0tonbfcVyylg+rYLb8mEHvdsxD7fYB8NXyEw/B4pxN4xPHLaNNdB7TytTczj5
 Tyyu1G4fA31VPTFSpn6w3g4C6eexvnNv/64o5bYZheKPspVNpbzVQ5Ne7MJY0ylADnmCo85OjDA
 ZB0GsbvH9lNQJNXb88g==
X-Proofpoint-GUID: Cap3fWBnZ8Qm4TFizatJPVrUSk4g4OSG
X-Proofpoint-ORIG-GUID: Cap3fWBnZ8Qm4TFizatJPVrUSk4g4OSG
X-Authority-Analysis: v=2.4 cv=Z4Xc2nRA c=1 sm=1 tr=0 ts=6a6ae284 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=U0KInS6uA2ESEJLtUTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfXxB6fMt7rzKVQ
 sb2/gESY1IfieccXze6KHBK/YdbleV5w0ivOf9UHcJEWG3Jrj3JFszy6MoRkTY18tENssRl8Q8i
 xT03/xDZ26/9KToRzCGILGewY6ledR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300036



On 30-07-2026 02:01, Bryan O'Donoghue wrote:
> So I don't think this model is in-keep with established DT practices - if a driver needs to parse a property it needs to have that property in the device node it handles.
> 
> So with data-lanes per existing camss bindings in the IFE/CSID node everything though should work as-is for you.
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/arm64-laptops-v7.2-rc2-camss-v11?ref_type=heads
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/blob/arm64-laptops-v7.2-rc2-camss-v11/arch/arm64/boot/dts/qcom/x1-crd.dtsi?ref_type=heads#L947
> 
> &camss {
>     status = "okay";
Thanks for the quick response, Bryan.

Confirmed working.
Root cause: I had data-lanes only in csiphy4_in_ep, not in camss_csiphy4_inep.
CAMSS parses its own endpoint — with no data-lanes, lanes_used=0, vep.bus_type
stayed UNKNOWN, bus_type check hard-failed with -EINVAL. That's what led to my patch.

Dropping it; fwnode_device_is_available() fix going via your patch as Co-developed-by.

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur-CRD and Monaco EVK

---
Regards,
Nihal Kumar Gupta
