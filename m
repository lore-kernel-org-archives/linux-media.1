Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529262;
	b=UnzQZHJW7ySl6o1Xz8Jo3KhaZKolB0jq5UlAka66zlm27uM9H5Vi5c5KcGK/0YEO3Flj
	 sPxpxmfSFnk5DL7uo6ialAxSB1o4RdtpBaRLFft1QTz8Gpy7gWcD31MboRtdDJfHdWUAh
	 4GzZIlFC3cMy2KClWPEMVaaGNo2WVUUm5xx9T3nFRMerDsrVP4Io90L3WPc3PXRylvVR+
	 dz36slrLsk33LJ9ctsmoY2bpwmqAakAi+PJEc8SmZp261sY3lPC88lTJhI9uDBifAMSNp
	 /yZZ+rBTkuJXNbp3Xaaj/A6vTMnYkzrq6Sbho5nSISBbxlk0gIoz47cZJ2PpaIFy19Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
	b=hWER1nzqZlhy7BRlX6lhntTXoGP2w4YO207P3RIKJlHllBnfgTIMDC9xkI9hgp/4envZ
	 Tm7vhaSlNaW8PkrtOHXy6Agghxjs4d4IpcxouIiO4bq0DXDYUgQ8EqXkLP+bYVfElSpad
	 gSCTECM9hUQFRcCUDG6t+fnpBhrbXGx5jJCiQx7uVr073aIQ68oAGUWUwBjFaCddXx4Si
	 IhfAbEjBE+6fG2UFwXswc0SKSh3nI8m/reNJe1x9fp/TY3GFl2Cc6pYcEclahb0vx8m9r
	 KwnOr5VgOwtwi6ORYwulAHli9TQp8sxhg0tnL0tnYHzBx9t+hEtSLyr/kUDSdOALyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N2wtZu/T";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL7l2b7s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6C606A31A
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N2wtZu/T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL7l2b7s
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7RZt3461057
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=; b=N2wtZu/Ti1khupw8
	0AJI52C3hmauPvt7qec/n/1uMqUSp/eK2IUYDOtx/p7GThbUsfN2kwGe0h+T2PlU
	xJGx9gbBZUnhbm+4cbQ2HTbg7Qdher3/0SwEN8131ZieBa7EFtH1PiG4oM1TIBQO
	JFVc9pOtecXWv9XPMJ0PfkG7ufFB3Ye94+F+khl2P79YmRz5q8AOtQH1Mme+P3vS
	eztoj60h6h7fK2vjj+5KQS652WBpAsVT6yccmORBg2F5IlchFRnCZVzTBIObx8vR
	g6rKdkZM8rR3BLpQA0zWICRErErTsR9cZj9coaYfDqopUHQYBZiZyQJow+K4zTgo
	zL8+JQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4rh9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 20:47:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso53067c88.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529261; x=1793134061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=RL7l2b7saX57bo2Vv/+yI4hXI/xTdi01GmC5iUBi7MC2j+3SuHW7GYUc1KmiInFq27
         gmUGMTiy3d7hZmUHzBEoleF8YFO3NEkOttokciexo6ka+4I8FYD1ioe0DQrocacO6CVN
         2/zHu8MXxFY3ILzInQ0uDtz6aZ86QHpeZYZRJN0bpCihJjedk/uGxYaSH8cGMagbpgqK
         tp8h4mdXGrg7DG64DRisZdMHOERfT7pzh3oi9/9v/1jUVhNWMG5Ym/aRHLggus+WN2A0
         58Ql3BoRXGmXek0SWeGThhyGUAYNL7i5FoON2s2pKAoJI5uDs6hkxUXWGQDYxme01/69
         1Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529261; x=1793134061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94yToyo0mcTm8BGuVoERGHQo0UgcFuSToj2y29Zt1HU=;
        b=XIi539c9m9FuQx/aptQIaR0HH8Al3gCyYpvLvAmeCkIrF8Ko3bEa8ncSmnu/RtkWV6
         mg7ABhvOPqThxyZ5MVuUULhcxyHgp8zVjy6mfXdpR9B4neGgf40ZgI7xsedR5/gTlvCp
         ZRZ7/gCwnOe6PQqXEToBwEjBGk2vcx8oTFXftFOo2XYzoJOGuRrgVNE1ocVJQbgORctO
         5FovKQydiGlDEoM2aavzJz89hkOHFIhkP2iR2i4G3SMidLbnDxVUG4FCJu1HD4mo6Xi2
         aLSXEsAL7EZWjP6hCf14Yc1WQifaU8KXWexREC9XPA8tdoWOAtAzTRUSngL0wnC1eebZ
         fuwg==
X-Forwarded-Encrypted: i=1; AKwUvBx+Ib49iIkZSJhVu3+eSN60vYyOMcLPmPFobfuYVDKC+8KI9RbUtidWSaHBbhjWTq8n8AXz6qluj7fl3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLelXnedKOReFMZ2wzKXXSnCHk07HhegzznMFV7xbNcf19bIrON
	rDl7O5XoWRaxS4RyHILXWE3wlkmgA1rL5Q/F3j/tp8SQ9wE8QFe2oFmVHaVnQfw8i3CXmxxjVnz
	K4rSIeRmKzJqUtDGWt8kWrw3kpMh1qgVvvfVr1wnJO03jjB/jTAwQivjbOwKEFOFFtQ==
X-Gm-Gg: AYBFou2wERixu0XQn1dfjZ0o2DlWJS/G033zkhzB42czP6LG8rOfLfSJpOWOCxO/9Fb
	yKB3jt1dWvI6KWmvqHQYr688hORv2hC0eJsQ+HnZ977xoKLA5yVlA8TrEPy1daFlX2XdEW68NHZ
	jRPkj0mmBrqay5rFOs842QcbQjF06Z8TjJfbI1IL1EfrIWdZa3lrSMZmEH+fH2vtafoyDEVM//K
	O9TiysbZaErJHlpbWtKELLG0s80I1n+Fu9FHOJFVAek+nU6XhAy1j6vkr2z7441s19Z8mOQlc8J
	6G1oCJE1tN0XCav7udTgr18F1zsz45JQgnfCjZezF1eQm28TAa1MNBeAg3J3dfDmD5C4jHKaZ09
	uO+i7IdRgh6u18UZ5AnWq5sBe6cDAisnWZdb/MXLJPgwhqsCIFC6RRe+O6A==
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991480c88.26.1792529260966;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
X-Received: by 2002:a05:7022:302:b0:157:cbf6:89c4 with SMTP id a92af1059eb24-18514350f17mr24991437c88.26.1792529260407;
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm880701c88.23.2026.10.20.13.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:47:40 -0700 (PDT)
Message-ID: <624e580e-3d14-4b3e-bd63-9137a63abfa0@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:47:39 -0700
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <qLjQvei0fouaxpwPTn80Nhf-aITowIXFteQ3i4M6uq3PVYim2WLaeukVq1MgNcwOeagmzK7HP1tzQbTTlhNXOA==@protonmail.internalid>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <bf402074-d666-4988-8426-d8faa9625551@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ECktl4nsd5JpHAXA8PLdgS7CBs1qC9pP
X-Proofpoint-GUID: ECktl4nsd5JpHAXA8PLdgS7CBs1qC9pP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXxOmuBh38y3yS
 8Prj5ag9OI/ekHGT/JL1U/dw0QSQin/oRg84ycZafvRasqqSD0m3JgWijnWBeJo6acgmIS0Hegh
 e6RkmJZ1/ING5dRFzXcdW3WkJABb36g=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7d36d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=z39C_I-LsHAogVuORkQA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX6Qwsp+tJlg9y
 WsX9CQ3k3rRAIYsxcWWf/LeKE2CPcW9IeNzzlS/a7ZO9+LCZ9jnYMxzEj7xeddyoNSv5peAV3Bg
 4KXdDJLh6NJwH0lzn4zEAlFCud1Ey85vtk0DRQsCJ/doobWQVf5w6Ubn9Md9RWjjNLYlUFk23+h
 0gcriW5wcpAhk8TpEoftlEsKo2gI1mThyYoOp8yG8ePNzH423xs6ymtPw8sNXD2NaNQ7GgFFlkz
 bU/D7xk0j4sW66Ev7xndg03+U0OYbR4ZXSkEg+6U7iBKuNK9tqX/tyrnMnNmkj3bw32t7tBSyzw
 RsKl2Z6F/KLoozeRoSKMPUy+CfaLAIVaf6NIunCQ+/fU3r1/ATz1KFchjPeyz7VmYMeIsX/QQ9D
 fwtn7ZvdSt4VKqUoMCK8z+xt572NJ+g1NgM7Q/YozndLqoKP3IJK/u6OecO/a0nkHFzBgYNeWFD
 miWxL2KZ7/ctkM/6KAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

Hi Bryan,

I agree with you. We don't really need a separate file for this. I
was just following with the series pattern that you posted.
Can I tweak the name of the yaml file, which would be more generic and
can be used as a single point of reference?

Best Regards,
Anusha

On 10/19/2026 1:29 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> Add a device-tree binding for the Qualcomm SA8775P MIPI CSI2
>> PHY, modelled as a standalone generic-PHY provider like the existing
>> qcom,x1e80100-csi2-phy, so CAMSS can consume the CSIPHY through the
>> common PHY framework instead of driving it in-line.
> 
> Do you really need a whole new separate file for this though ?
> 
> ---
> bod

