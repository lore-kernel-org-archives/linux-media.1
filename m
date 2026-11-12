Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476890;
	b=VG440cnnGYPFN8imvua3gauo89DySWjJtwP+yo7Gmji7meXgOYgu/fZL3QH2dW8vxzJs
	 np0CtCWAeRqwZg2m8XF6rKs0HBkSz82sBAnu+e4JGMSw9/qT4crrEiuwQT48b2D5k7rjj
	 wBZfSahUJ4JMUYs7T6iIFdkFoXoapDvh/B05kaMR2JdC02Pl+t+oMuRCE4apVk1yeUPM1
	 UaWDneC+1lFSLJ/9Q4iMHnffpfg9LTP/y57xZGNk1oqzqUC0NxDaQLg770fLaNhqR6px5
	 vaaz4BX/WHbmaRxIT9Quh5iUa4LnP9oa+6nnC1pPSvwVndZEVF3GdNTsrBed2FMvoWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
	b=ooXWOJpHN+JJaqKzy66bii7fM8r4erN3+YFp2Kb6b8q2CVoNPTeXYnlVnuqIOwbFirod
	 7xh62A2VQbaeVLPM4eAH7QpolIfGiK25I+/aXuIXWO8vUn3NqYi1qlTPalwiIJgCUffdf
	 QHlIsji01vTgF7ODqOGznEAUh7jlLfdYDHmm2HbEi3vmnsAk+L/trSHR4nO4x67NSGTj1
	 dOgG7Iit6dcWmOSB5Trr6peOG573qV+Lemc4FhfgyDug1+zygBt6aqgOoNui1gBS1xSAW
	 BWK8ITrs4BEztGH/lbVlo7rA449IzZ60xLrXiyFqG8OCC5TmebmWyVlUO6P2JQ1dFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA1606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DA1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lEYzziPz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMUX5PHi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9HS7Y4092370
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=; b=lEYzziPz3E3wXE1N
	/r8Q21KLI0GSOoZbw37IOQi+XRe64yyHxO4KJMKXyD6wHBr3+uN2A2DqG1aZFVCb
	td0orAtjRp1dC4j/KyPqG5d96q5y7vKMm2BKTOKsdt1dlyUwp24z+1cEnebHmiba
	lsmQibx194c8rA9m2TXh3aOD9i7AI6KxyLK00WTHqjhvlhD4uAN/bB+W+ouD9DVf
	YFu1UNcSm+Up02WumBc+r6ikblrY5kMlzpu37riEDvTPfzmaBSpLyb+pCef3TTpE
	LJnjDCjjnF+Cz0U9C2aBPvT6jwMkRiiKlKn3l4dQXbHdnu8pkdbQTpnhKR5UBEBO
	sdPQmg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j8cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 09:48:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so3021124a91.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 01:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476889; x=1795081689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=SMUX5PHiPlllflKY7kQ+2P9BqTBM8JJeGTnpynpIy/4plAaNsF9TwoyqL+XvBHRNj+
         28svPS5oCN0pYbZA7x5hSysZQMu+UYrqCrNUicl/buFa1Z7UJXCoBF5sOU6RSLWxI9L9
         wSeyFn0+ZOXTsQ+mjijgiyzR1WJWms0FgCpxIuMmQqVK2rnDepNvdRziSsSjiw34+Y+Z
         bitq/ytWh3roml150G/yxbKueOVgPUT4rDxYc6yPqhrIHs5qxBGtuDBZdHb51PW9CUf1
         vrZrVpviKZ1hCLEHQG8orisSNVPsP55dNBv6Idx+DNUXaNHPPiMo57t8aUG/Sa/kbmKj
         G+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476889; x=1795081689;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rQ0S0zFJsG83541wAchvZ00WuoVJfA2hSRmQg4ozNH0=;
        b=sqkvgc5PGqTa/5ORw+hKPaSjzvMOUO2CGGZIn38XlGEXosuvmrW5/6VIyofoVuPuJu
         Ap/TnmSRsaUakor/ocqP5YUn7UT0BS4VCnFW5jDnzHdSqCOA2RVyK1Om/YuyUPzI3YsA
         jcicQ8H0sveUHWmfevjfLw8Aj4QF6mu7Cnlq+o1Z7yInOYRA2Dm5jWyQ/XPwJgJngstX
         vsI3eLXIcVMjGqMRA85bVqUp3gzRTgGkRj8Gp2pjtqpZULojFwtDC6BbMB25gNkDJnJR
         28v+Tls6COHqXWj2JymbZjDSwKfzmCgTrcAspseqmniyqOnY5+rJ0jwLEGVi/nPf7AO0
         Gutg==
X-Forwarded-Encrypted: i=1; AL+hErHVn+IfTs5nkFObSsTiy3O0rBhVRxumzfn2AwmXmqT9iZS6baaTR9PvzjmDl3qLGB9kr/UJKsyJnoTiuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OOlZX/uZgd10f5OgaWu1ZI30wdP6Mmg5aphDvayYD41ukTmyM
	8o5hdxVFDFCM6j91UcVuACsptKLJYGofrSvKE5iXTxUBgRoadwfaK9z3wPW74i4vmIHX6AUVnOY
	05Sr8Hbi/UoyvpS3I8u12On5QC/ZzXFO00qH0Cf7QvEwpeqsoj7PclnR/d0sH3fbRgw==
X-Gm-Gg: AYBFou1hliWa/K3kgLMxFE4nm8QBJiSZYvAWKOMDcggrKX5I+ySRvF2H6wPl21XP4SL
	ZeRf1qamnXFkZxFWU7eYI/YwMvb8YKexc+DBu0Qf9Kef+CZTXDQN6b1MKxL+4Mg0FD0zzDYRSMX
	Ll+CYWlNjCydhVo5AJZ9PEH+rgJuGprB3M0MKYSY0N5NTcY9A2VHotkCNeE0yA4C+k6l0UFogoj
	OHJEyqgY3Busj/lbh6bTxhdB3VVIJg7hddXxyNHY2pLAxArb4C2fS4MXRwu44dJQ13ONZBK2OTw
	rvGvwxoO2Dbswh8QjC8GEtmbueGcE3VXPBfF63lUyS8tjKKf+WJ41eBiMh/LYX1QDI6qFo51T9n
	pWkd7V+AzTCaEFNVp3usdteVJaccP8PrhJ7K41TQFoXm+/YjFuFXWqEN5jmZstKlp9tRwt9Q01x
	m5SkAYchs=
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003648a91.12.1794476888827;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
X-Received: by 2002:a17:90b:5247:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b182e9457fmr5003594a91.12.1794476888303;
        Thu, 12 Nov 2026 01:48:08 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm3913394a91.10.2026.11.12.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:48:07 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2932200c-d930-4d5f-a308-0bde202af349@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:17:55 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
 <0bf2075b-e507-4b81-a563-f7b4e7e2cbc1@oss.qualcomm.com>
 <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Language: en-US
In-Reply-To: <34hgm3yw4z4kbulvgpg7c2iunyui5ljn2l6fqq47prc7s6hycn@c2rnwvhcn5x6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX9DiL39pjevjJ
 eKu06UKsDmHafU3P9LrMCFg7mmTSwRV0Nge23QWrj0NCe8YMAWkFogKApgpcICXstuDk9q0sPl9
 QpuZPd971B87XG8UolzHzrxTnZffesI=
X-Proofpoint-GUID: vuOoqdjRC1GlylvK8yFneYZjCFyvvC2z
X-Proofpoint-ORIG-GUID: vuOoqdjRC1GlylvK8yFneYZjCFyvvC2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX9OqWsIkodjiN
 rG2+aMbUFBiTm8fZB5rhqqUUIRHinmbwVWmA97lULRbsRVPjY3nPCmrGWq3OYNFt1d0VNcOav4z
 XsDxZCwOa6vy8FOy7qEoy8mN0ZVuLqoHMQyB26MagluI72OcmSRqFIuLpOtCprEo+BEuQriUSLI
 QDPAk3hx/H79hiScT76eLDe0Sv9LrXqWfecUNxM6iLyQqAvB32NSnj97KlsXliRu147ZL605VES
 0xJ2hVI0qvy2MDzKy3f5oPe92mr0Tz7KkY3CNxu/SoN43/Zhnl5BG3ntyCteNBNm5/LXl8Jqjmu
 B83ZV9phMRV52CKmfmnSpDqxwHDY3QWGybIAzEs8NJk6haFTCT6HIRfEBSJOpaLHRmTreNhw5zT
 +jhF/lpajxhSBbRRqexLtJ4uq9dDoE5p9GSGRyVV0pGzPYpZI+67YP1YfoUzpQmdPkhP8VRfcza
 OizovXGTnbzzQJPzoAw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af58b59 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8VBehk7qD7xQtsfHT0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120038


On 11-11-2026 19:43, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 12:38:54PM +0530, Jayant Shekhar wrote:
>> On 26-10-2026 15:27, Dmitry Baryshkov wrote:
>>> On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
>>>> DCP platforms place the display pipeline under firmware control, so Linux
>>>> cannot discover display resources through direct register access. The DRM
>>>> driver therefore needs device-tree descriptions of the Qualcomm transport
>>>> wrapper, display topology, IOMMU contexts, and panel connections.
>>>>
>>>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>>>> subsystem. Document the IPCC power-notify resources, transport and
>>>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>>>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>>>> after the IPCC power-notify sequence has completed.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>>>    .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>>>    .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>>>    3 files changed, 334 insertions(+)
>>>>
>
>
>>>> +
>>>> +patternProperties:
>>>> +  "^dsi@[0-9a-f]+$":
>>>> +    $ref: qcom,dcp-dsi.yaml#
>>> When adding DP support, would you add more devices at the same level? If
>>> so, we risk getting a warning about multiple devices using the same
>>> address.
>>>
>> Is it good to model each firmware INTF as a single interface@N node carrying
>> the INTF reg, with the protocol-specific DSI or DP description nested
>> beneath it?
>> The driver can then obtain the INTF index from the common parent, avoiding
>> duplicate addresses across protocol types.
> Yes, it might be good, but it's not what is happening here. You are
> adding dsi@0, although, I guess, INTF is 1.
>

I raised that approach before v3, but the patch still uses dsi@0 
directly. I’ll update it to use a common interface@N node keyed by the 
INTF index, with the protocol-specific DSI/DP description nested beneath it.


