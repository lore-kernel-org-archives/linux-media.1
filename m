Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5094FD260
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055899; cv=none; b=m0U3oBS7qUUIx8QS/kXaHSBxuDY7n1EJ735/dD3w2ngFlnH/+TqUDBMtYmVTnro89jKtloV6KfUCifHRKzYTJJxNNFWIstxbgsn6NxLGcK/HjkzXkp6soz+x6SAcilG6ZdvOcDSuqL/zmhJUsG/2Eo2Aj+PMTqlzVt4yXKacevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055899; c=relaxed/simple;
	bh=Sd+z1p1eIGcL66guWgmMJjfXMJAZHEQ/jZYzkERfiZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DskeIp2gNdkyG8bToSpPKy+JJXWMZFjbIQRlpoRmX1NBohho6uPGxQVUQumCk/DH5M5eW6DnQB12KDX0wso4OXTmZ5nxVkDK/NeV7iFzUH43mpNlzfHpXZSwQGMR761E8BlqBUiEWs73VfMYNzghwb20JOs7u+7Tw2IC9HUFurc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAAXBKHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JrYhib+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAAXBKHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JrYhib+T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F65W5t644567
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=; b=eAAXBKHGbHsEaIZ0
	ZYI32s/6R8DbStEZubiumXpOoNN6VzmLcS7DaL/64Z3Btg78CeprorwEnpK7WxZM
	IQrib2HXAKR0LJDEZXBL6crrIDXBBOHP3tC1qAXuCWZmvDjcd6+zjNj+ZFiD90iw
	wG3onEF+4YJ/cFgqmwHfp8j/ShxRSy7qWMkvySwwn6dEnlE2qI+GGNQsoP58Sxp5
	mVlZFG1y2/G/GWYP+olvAfREGrChMORKBMbxzjZsyYyiylovNfQG7tNBsafTqEuN
	pcaKekGfR/E5gM4KH/3nIx2kigRTMTuRwkqLZ9tYW8H6mKywj7kjDbXlKTxy/ACB
	mRfIqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya7uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:18:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so71202875ad.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055897; x=1792660697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=JrYhib+TBSx/0wLXF/o50AnQIxvmrtdzgmPfCY6qH4VJKPqHGSsHX4QMDUXqqOJpIn
         jVQW/fNfiA7PDJFxlBpTmxHKbaYhOfGA0k+tyA95mB5w/ltFSNn1yXMeKHAMOqyWbTtk
         UsHf7IWFGeaUrCLngDWcemQ8FZo4fwzc4yq5Vfz2TzDIVy2hV+TcGM+bSKolCpV5w1s9
         ngDm3VMh+Z29e8c6WaCttg3lUyBEiq3R7ewoL+JzcdhJFLJr9L3KAXq9QVCUQ19tBgcW
         +eoDHKs2EVqLw5tmWRyz1mwzQHSlcmtUYUKKDSN8EsATvlw14VEBx+ot7IOcDQLTfpr9
         K0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055897; x=1792660697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQNAFHYagSHz+rON+0t59WKDmTFmhkM+eBVdpwypPDA=;
        b=QCJz067Tk3nO+7srYWobzzrc+4fBgNFY04fvZlRBAQzQszAW0xppMXK0E6sGD54T7Y
         i50wI7+YVE6e59OmZKL0YVca5a1a+htkplA1OEewvS4v8FzmA5c1TdMn5lu0nmWpurON
         qKAEN1N2+Jmf3jysxufWVUNPMhVlRupzUpdc8pBvnmRval3nCLyloofSNe/E9s01YiB9
         G2625L62OJBJ9Y2Q1vz1QDTNPkc47img6rE/oUKqJYMhuHGfS/GJPktX2a1PDT7U5rmo
         p4IWJmSlZIHkq7629qy97ouYbYI7A+sjTrMZA6vam3H9pMamp23lurc9fDTrUN4ZUsWX
         gTGA==
X-Forwarded-Encrypted: i=1; AKwUvBySgqK0Z/9tLThUesNSo3QcEaazhOcsliJ903R3Q3dpJRKnULyc+5WvwkvyEej9ekQO+ona7A+4V5CByw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOFNNSMJiIWeFbB+gHK/GL9ZaOfjSG3lwGUBsoAf9SpVDMX+bz
	vQ7C7ZjjirxO23n5o8ZjpIagiiexhKF86QPcWQoOUpIS6O01212Wr4G0uF+dMAoxov5a8pw3D3A
	J8NpbjDQSUCV1J+GYDhX7lYsfadBEbisZnpAnhxBGM0myLT0BIS4mJ8XUwBv0EwoIBg==
X-Gm-Gg: AYBFou0irc713tc3tSC+xyFAzyU0uCMtoH+uqvjvzdvyGMTVGvRFU/jkHGrhWHsPIn2
	8Nt2cku+gnhNVMXEFkbCBEyuURgKRaI8bbQZEKhRupo45gTikSAE34I90SoG5vHVBPJTohVPgw0
	DfttPfh80lnQhdkDdxnKDFBl5MkmwFXz9te83YkTLsNEQSILj0PhKoznhwFQjLh2T5nH/r2u5/U
	DksIEcrapaItaeBtz4YMsZZZDFS8Kmvl+zKzU18XhWbcyG/ywostqymBtFzgxNAvw0Akd+fB3WJ
	77im8DriWFDlEySSVerRmUcneT45qkpLf9eslogLiXu8cCXGLVTjdTRv9xuyzUqP+r0BDz+4f5C
	WUTy27N+YQwKsbkwFpRmlTMOdKO2YFw==
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24795965ad.50.1792055896408;
        Thu, 15 Oct 2026 02:18:16 -0700 (PDT)
X-Received: by 2002:a17:903:2302:b0:2e9:5507:b52e with SMTP id d9443c01a7336-2e95507b93bmr24795605ad.50.1792055895911;
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Received: from [10.206.102.180] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm79142365ad.43.2026.10.15.02.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:18:15 -0700 (PDT)
Message-ID: <2744aff8-9b33-4244-86ac-6fa70c052dd2@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:48:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
 <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
 <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <arTMpTiQVOdtG6G0@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qROM-j9SqwRFS-63ky10uk1GsJM3mJXr
X-Proofpoint-ORIG-GUID: qROM-j9SqwRFS-63ky10uk1GsJM3mJXr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX68FIgUghpgi3
 PCIRWHCtfsSStwy0toB8yk9Bt8sEMvWMF2DCR2vTRaIm8LSKfcqiwMaoanPRrJqMT0cZSEr4ZNX
 L6A6gnVZ+Tcp5De9PB4N6/5TBhxk6XA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad09a59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=N5pWYOkdc-_Srk-SZrQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX3Gp8H9fown2r
 +C2KGshAOk8EnQlrnAqcBKgt4/MPwU8Dtg/pCQQC9R7JPcazD7ohThNDZwCaj0BoSKGIAQ0I42F
 sItzfT8pMrBANCrovnWWC8VK8DOauV7Q3+YVGDX8XTNvvWvD/43PLUYO+QlMQ4uULELVJU0FfOG
 6tvp/AM41f7QC6YwdCTJRHnuwUhGPeqrnvm5krRsZ1heyPpNuZlSFMzW+PshDROw67K1koYvsdx
 5YqPcX0ItFFsZyNbQniYKwW7VZI8DxtWY8jNPB8thW4jAkC47/g1s8y39XUs7LSp57+Wp4y1I4C
 ylVUGWNcPfUWfNfJwZFDMhTL2v8Fhqa3jPg0oTtXKDWam78cG2rIrvAq00l2WUOdrxw2ZpmRyhC
 Rm47FOnvBqrebK0QrcGqr3MJRcsA923D+/lsUyJqqe0RoJ5nm9lzC58YHEmjkm/ghX2eVY29u0b
 B/mjDQTkDEq8JA3AZOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036



On 9/24/2026 12:39 PM, Shawn Guo wrote:
> On Thu, Sep 24, 2026 at 11:52:52AM +0530, Vishnu Reddy wrote:
>>
>> On 9/23/2026 7:17 PM, Shawn Guo wrote:
>>> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>>>> The nord platform integrates the Qualcomm iris video codec hardware,
>>>> which is compatible with the glymur based iris implementation.
>>>>
>>>> This series reuses the glymur DT schema to accommodate nord iris
>>>> support and adds the required iris device tree node to the relevant
>>>> nord device tree.
>>> [...]
>>>
>>>> Vishnu Reddy (4):
>>>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>>> The binding should go through media subsystem. That said, this series
>>> should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
>>> patches.
>>
>> Are you recommending splitting this into two separate series, one containing
>> the codec binding patch and another containing the three DTS patches?
>>
>> I can certainly do that, but could you elaborate on the reason for preferring
>> that approach? I'm trying to understand whether this is due to the expected
>> routing through different trees/maintainers or if there is another consideration.
> 
> The routing is one reason. The other one is that the split will make it
> easier for us to build Qualcomm Linux topic branches by pulling patch
> series from list using b4.
> 
This series adds complete Iris support for Nord and contains only the
binding change and the three related DTS patches.

Previous QCOM VPU enablement series have kept these changes together,
and I don’t see technical benefit to splitting this one.If separate
maintainer-tree routing is preferred, we can split the series accordingly.

Gourav Kumar

> Shawn

