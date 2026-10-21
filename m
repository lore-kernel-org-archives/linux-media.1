Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572370;
	b=zo0ztCnbfmztTnthJUosHY6TtmU6gsGjGVt7LB22rInF6R1UkiX0YSL7/zVdAhGjBkzU
	 NxcxCh49rLDpb81EoWOpPW/6N7tOX2KyqkVaFrIJ75AKqyfB9DbYiIihmFcRuUsPMuflV
	 dDSvABZc8qgCzZ3blqTrHyOnbVfK52IBfH4+GRAL4MEBglKNXaG45tUHI8RgNZ+cJ5knk
	 kqfcXxehJBA0gJVlsLFj4d1QNr9eWzkCAUbGJbQt2/x8Nv9uyLkaSK8iIvoCRgh4hBpOx
	 nl8VioEwKtKTbiLpZMgCnL+rffIX8/l4zDGPq9GrIRW/82LzAEO6mzIUNd0jSZUmKQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
	b=3OYaaO5gGxOhzw5UHthT0NBTrHVLTj29NPqGOMHKY55i1ps3X8OpSur7P4chTOLaL/UF
	 osk+9Ra4pPu+quv2dbEETjIO/4qyDXqU1eDy6fFrFBOJp/wY94IVQX1IHARxJVhjv0ZPj
	 ezBhb5YKZdae8lPzfNthsmxbMD9oGnlabd84b/ucF0OX9CHMtCw08tgGZZujuvjUD1dU5
	 +a0qHH5WhDD4Yh9y+PXuyUPg2sTI9Mxs9d0wwLxXNijc44U8UVsDwnslOe+a+axJOGD+i
	 eRTPvU9I+agBDp6b0BPmv3u/EV8Tj2d+jfBOmfblzAl+Ef2W65pYXYAmKTEU3NsOj5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwC5m0sx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b2/yFMOZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9C6606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9C6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwC5m0sx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b2/yFMOZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Xbmv632327
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=; b=UwC5m0sxAo9CranQ
	I2wU+VQqqlLBpXX/XorF7YaZxJhNq7sUCkB6IfeCqY03U38I6Ef0cVK+uqRM1xch
	w2Vud5soXpT3FMmGLaY7sSMFoSgE4/Qpzure2JdmOyUJrnqz3qRYit2HILj56kb6
	AC/Szb3w3pnZegQYU8U14VCsPWFWOtUEuJO37i3c+20pZqONT7EXW5AQg5LcclX2
	GnrvAhn4vs/brcWWechVCSZGKF0Q2c6Kn8dVlq/Hb2InR/htWIT/oa8H1D8BnndP
	wziW71SPMwPvgOp6Xg+P3b+kLyWQEL9qgw31ow5uvye5iihyITY/RK3N0SON2X6E
	WEna2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk0tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:46:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-366c279b454so984440eec.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572367; x=1793177167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
        b=b2/yFMOZF3a+SqbA8hDogL2wsLKTVf1MFY22Jxla/NZ4vGpRytENTscOAWR//IpIW5
         TvbHWnDdxRN1gMgPW00m/Og/Sq9meD3OOONX1UG0/2XXjZVgN79xQUOw2HmSBkIMsIeD
         60c+xQuFhrfowDOox/XMghnLx3xfcRzkdZSvhV8E3quAXltn6FwG9OPBH63x8KigDxpw
         R1vEdwnWMfpwO9jp9VXRB1Z4jT9MOi/h5+dSSOoqA+ytWJPoBDT8hlpsNq/z9QyFRl2l
         cCnM4d7ngNOEx+DnlSdDfokUkPXgTnqWBvgPraltwOnm4Kym7MgXRFYjW7RWEFb7OvMv
         9YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572367; x=1793177167;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T34/HlSHyjCRDqfk2vimEJ3Pwwh0TycFh3fKBLlyT8Q=;
        b=NRXVVEr4CDEnbMo1eQlDFS6kkWvaco2q9bJJJkMfPEZKUEo0yAlb25X6N1IlGgYgxQ
         Bd0LYhaUuFTzgFtt4zLWN4tangrUc8tOWRhcdanKfgu/sWeoohMNkaNn1w4/26kKp4gL
         DaHuXvr27k4c0u+KfNSbmKlS+uLbN/y8gJJSXcr/QCNrYWq4ij5C90DTR+YRczDDoKGL
         WQpB2XD4xUsoHJjGNIzR86foJJtkhDwwCFv9Tc2+7ZChCYR64u7ga5EKSR2K3AF0qobR
         Mot/xIHgVpC1trJ8EnhJFAk2ngI/p7T+XrNrRNtiHr1KkZVuEa0i7rrzybZNkjIdWJTL
         DDVg==
X-Forwarded-Encrypted: i=1; AKwUvBzmf7L2dfKalYusDTpbVE2//I1FTWmP0+F+7Ob9btBZ3VXyLNYSu1f+9vsrCDtiIXrZ53LM7D2+EY9CSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAMSnh78YAYCaHhbuBCdQ6MtSGjDGGwGNj9A4nfGCu7Y+Y4c+N
	M89+E60cPcUzPO56DfoEznoMk8cSOfRtohmA3v0x9WVyqKyIKFgDzehR8CPfubC1fWM5751ulfX
	1GMXGYF0PaVI2bfkq9obuaa9iYfPaFCpAFl7DzEKVjAQaPAscBks3gwCtgEpXeW5Pdg==
X-Gm-Gg: AYBFou3FSnuICMqC8l83XoLPGb9RQBaF7s4HmUWu1VpOuM4okHaON1XqsIIFXbu7/bJ
	V4snv65MhA+YPlwiJiDbbd/HDophNnNzi429+Xekte3+YIfJNC4md7n9fPBIBJp4MAUVO2SFDfn
	Vs5qQvSeNOOUiGLyY02Q6iIlJpYwcOVLc/KScNWWcWdiRGhAsGWSE1fyPR86/OKtO4rnNA4B0dN
	Pru9m5+yRRkLpYQSGQiXwtUllYMSdhRur55LeFGL8I4EErhjy4KvSOGJh64TGaBv9KSJjHLYKqp
	JKXc7bLOC1vBrSSKZr9X9LUUg8WtBDo0WgqRXFGlrksi1QBKuQaxII3fOdClUj4L85eISoQDFCa
	BuS3ymELQ6WrQd/EltxbEYfOrawnknej0nw==
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr1916573c88.31.1792572366993;
        Wed, 21 Oct 2026 01:46:06 -0700 (PDT)
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr1916523c88.31.1792572366229;
        Wed, 21 Oct 2026 01:46:06 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm4271323c88.13.2026.10.21.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:46:05 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <ea81fcc1-c7e4-4b80-b65e-f483487bd1a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:15:53 +0530
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
Subject: Re: [PATCH 01/13] dt-bindings: display: msm: Add Qualcomm DCP
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-1-48aad0fe4f72@oss.qualcomm.com>
 <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
Content-Language: en-US
In-Reply-To: <hprf3vrsveovq3hwcgjrfj6uhmlxlq5u5bx4lkbswgxe476qwz@pacalsdgrjx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXzAMYsjM6RDQr
 7aAOJ0O7+A7mr28T5HHUGPtf7zDQ1EJlB4Rzts7KZ25qkpWknp8+LHi3h0bN6KMMsMEU5in1Bt6
 oq66OB5ngEkJ2N/mEB4zz0+NztWELoSR6cB8nL6sBGg/6BH7eKf+5DkJyzdMgrJYRETL6zbBjx2
 uePHK1n6SnYtqBXSTflzOL4zjY5/Woi7C2hxZhOJEEnxffoz/wDCZTNJwElBK15QkfoIoOU3e6h
 BGstEJvwmnhoy4dQWNO0qFGid0k9oR2iGsjz33rJtMjlqE29UVew7S4UdOVKAVwV/FsS4Sd1/PZ
 Bi54hT+vOj8eNf4yLCcjRlkjGxRinGsgYoht3eEAJ1Nbtg/Ump/G3ZUmw4a4njnuorkv0ykY7ay
 odHpUvEVfKCaeedHXEBmogAzNgZfP1AHoL3sDpDy/lG0INDN02ToPgcSNcNuYnDtxFPS4aj9RTN
 vYIDORiwnEr9PKGK52A==
X-Proofpoint-GUID: DIS8RO9QQSx-BFObQmHU7I91cHuoRX-B
X-Proofpoint-ORIG-GUID: DIS8RO9QQSx-BFObQmHU7I91cHuoRX-B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX/kcMsDy/r+3b
 Yax7BIAh5KxNgAE5MKRzAijqsFD/yRYxG2kOW52WowjPqzjCGw2JfUfyVoddUIL+3q88PheHC76
 9UZmpWa1OCsNfi6wOW8NQ6Qal3qIKOY=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87bd0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GUqRGlKH2whgtnOLMxAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034


On 15-10-2026 17:47, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 01:08:21PM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the firmware transport,
>> display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP VirtIO display function, including the
>> INTF graph and DSI host outputs. Document the framebuffer IOMMU context,
>> IPCC power-notify mailbox and interrupts, firmware display topology, and
>> firmware-visible IOVA window supplied by the parent VirtIO-MMIO transport.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  75 +++++++++++++
>>   .../bindings/display/msm/qcom,dcp-virtio.yaml      | 113 +++++++++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 119 +++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> new file mode 100644
>> index 000000000000..f7178c66c09e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
>> @@ -0,0 +1,75 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP DSI host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
>> +  qcom,dcp.yaml). DCP is a firmware protocol shared across multiple
>> +  Qualcomm SoCs, not specific to any one of them; Hawi is its first
>> +  platform. The DSI host and its connection to a panel are described
>> +  using the standard DSI controller and OF graph properties.
>> +
>> +allOf:
>> +  - $ref: /schemas/display/dsi-controller.yaml#
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: Index of this DSI host among its siblings.
>> +
>> +  status: true
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
>> +      port@0: Input from the DCP virtio device's DPU INTF output port.
>> +      port@1: Output to the attached panel.
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
> Why do we need OF graph here? Would it be enough to link one of the
> ports of the root node with the panel's input?
>
>> +
>> +required:
>> +  - reg
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    dcp-subsystem {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dsi@0 {
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    dcp_dsi0_in: endpoint {
>> +                        remote-endpoint = <&dcp_intf1_out>;
>> +                    };
>> +                };
>> +
>> +            };
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>> new file mode 100644
>> index 000000000000..018694310dfb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-virtio.yaml
>> @@ -0,0 +1,113 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-virtio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DCP VirtIO host
>> +
>> +maintainers:
>> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm's DCP VirtIO host provides the generic VirtIO-MMIO transport and
>> +  the host-side IPCC channel used to wake the DCP firmware.
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: qcom,dcp-virtio
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  iommu-ranges:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  interrupts-extended:
>> +    minItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: virtio
>> +      - const: dcp_power_notify_irq
>> +
>> +  dma-coherent: true
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +
>> +  mbox-names:
>> +    const: dcp-power-tx
>> +
>> +  dcp-subsystem:
>> +    $ref: qcom,dcp.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts-extended
>> +  - interrupt-names
>> +  - iommus
>> +  - dcp-subsystem
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +
>> +    virtio@9be8000 {
>> +        compatible = "qcom,dcp-virtio", "virtio,mmio";
> Is it really compatible with virtio,mmio? Can it be handled completely
> by virtio,mmio?


There are two possible approaches:

Option 1 — Use the standard VirtIO-MMIO parent (preferred)

Keep the parent as:

compatible = "virtio,mmio";
reg = <...>;
interrupts = <...>;
iommus = <...>;
iommu-ranges = <...>;
dma-coherent;

The generic virtio/mmio.yaml binding would be extended only to document 
the generic iommu-ranges property.

The DCP-specific resources would be placed on the virtio,deviceXX child:

dcp-subsystem {
     compatible = "virtio,deviceXX";
     iommus = <...>;
     interrupts-extended = <&ipcc ...>;
     mboxes = <&ipcc ...>;
     mbox-names = "dcp-power-tx";
};

The parent uses the standard VirtIO-MMIO interrupts property. The child 
has one DCP-specific interrupt, so interrupt-names is unnecessary and 
the driver uses interrupt index 0.

Option 2 — Add a Qualcomm-specific VirtIO-MMIO parent binding

Keep a Qualcomm-specific compatible such as:

compatible = "qcom,dcp-virtio", "virtio,mmio";

and extend the parent binding to describe iommu-ranges, the additional 
IPCC interrupt, mailbox, and related DCP resources.

However, this approach duplicates the generic VirtIO-MMIO binding and is 
only justified if the transport requires Qualcomm-specific handling. 
Since the DCP transport is handled completely by the standard 
VirtIO-MMIO driver.

Which one do you prefer?

I will be addressing other comments in v2.


Thanks

Jayant


>> +        reg = <0x09be8000 0x1000>;
>> +        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
>> +                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "virtio", "dcp_power_notify_irq";
> Why do you need names? Can they be dropped in favour of using indices?
>
>> +        iommus = <&apps_smmu 0x15a3 0x0>;
>> +        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
>> +        dma-coherent;
>> +        mboxes = <&ipcc 13 5>;
>> +        mbox-names = "dcp-power-tx";
>> +
>> +        dcp-subsystem {
>> +            compatible = "virtio,device34";
>> +            iommus = <&apps_smmu 0x400 0x2>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    dcp_intf1_out: endpoint {
>> +                        remote-endpoint = <&dcp_dsi0_in>;
> Can this point directly to the panel_in? What's the point of describing
> internal paths in the DT?
>
>> +                    };
>> +                };
>> +            };
>> +
>> +            dsi@0 {
>> +                reg = <0>;
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        dcp_dsi0_in: endpoint {
>> +                            remote-endpoint = <&dcp_intf1_out>;
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
