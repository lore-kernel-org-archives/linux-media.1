Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386007;
	b=4ADrTnOS7A2UajfMrKJnHSopxh/v4X3grYmn07mFcziUb9QtSS2rCvZuk2ZrjwMKCuuH
	 gpY7RWNj8V4OipFA6yiYy3wJT0V257iSd6RGW+WeuBjVyBfqMn5doqkNoU3XCg7sZP0yE
	 jfPCL6aTY2JcRZ/FtQmsprJqu/EMScScHJxlBGOCEVT3m7/fr6QcRohUI4ayEtr9sf6tF
	 SuRJYBje1+B0j9c3ltNtfro0iqp/qxmnCzubPbVMVrN/Qlj5kph4gOaWhYrTxfyfzkAv6
	 Q8ZZDCp10LFzSbwVzQgKy09hmQdlB91j9M8TooCGptH9H6x49L8tk84G8dhuy1rFBXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
	b=067RqDiPZoEJzj6VMh6tCR6HD2PoTkrBiGdtFIcQ6RFot0gYzrmqNDYPbs4zZFAFUkVz
	 m7T7+A6TXxFea8cGuljB8pGDtLgfe/8fwFffGeZlYHozoWhVSN5crP1epMeqXwaDbQIjX
	 yHci2IpeZwbItwCX48uAaMdsPU+pZzinHNNDDHQpSYQMYwwmatgeEKgI3YH2evrVd0ge1
	 H0aHt07Xlu7p3eqVuFvZosWYyoVZTxhlyC8LTQZwWQb43NJvAbgRmxeVPXJiSWBXDAk6x
	 xZdaMh1sTtoNsGgbRr1GeWigBrc41np5OLibRC/xbpRHc+m6NB7ZK63kFTdBbVg/YSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483160A2600
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6483160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Kbnj2021381
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=; b=ExzrXnKWCIJuRBYW
	adlPonufNKzumfWmayEMC2ytP0DcBjWY22YFKn4YbEymsgJmsfGf64Z/I99EVESM
	Iwwh2NEDAYO1fknxf3wpxObrSHiaPMgb0dFAejfkLOjJozEtfs0tP/Roz1hQmT+X
	KNtOXCwzMXVzmymZPX2+ldNXcDr4IbSK4YAKqiMlVRRBBPYuSJ/b9Onbg0VyWEkZ
	5noTWZOHi925H8YZ6P2Y99oaUphEDMhKHnGufPJahXIykXXB56H5oUiV1Y0Ubc8U
	BMh//eVhierB+74JJRmF2uhNuS3jwvlB+rKcX39D23/HSmhcuTBivBjo2pZVUIOu
	jAFQ1w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvc0jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so4893108eec.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 00:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386005; x=1794990805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=LumO8tFyNpgZ8WmIxaPO4OMDIu0tC/OKETcHi48LvuoTCqPGQwNB9CGq0oMq90SP+9
         k2yEcYpmBd3COz+n72MRc/puVC70IhmgIJ1AIWMYXjlcBAP7Pb6NjvgdGzbxPIPDgyqf
         bC7zsSRebGiHdxAqtRmJboMaXW5TZvCHoN19knYtib3XAElz2KGCl+bdpfNtMduf9gC7
         RRKf5sxYEq1sEiFeA9j/ZjJoSQOpmzFpnxPq2iWZPqam9HxRDNW+ak8zsRM8aTI53lV4
         48ke54AFgaa3mbljvrZDNNgaftlwmyru5jQSq2uAiCUFOFvrdY2wvJmHCM0czUmkKjYK
         rtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386005; x=1794990805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=mZW0NFeSb4jv6utl7Y4Jcz0ojt2/Ht1Ey2Upea2Sye0T+EUwd+WOxtJiBC6D4QptGI
         S4LbOzeQk1tVA3KVO84OtOO+Lzc/PWIsMV7UEsRxUgNAvqEIXLrrdyAfH3T+BWWjEqlm
         XtvVfBInhX+0mvLl9OBkPIiO1hHXSrlNZQVVVzwQlqkl2W+3Evo2CPWwqi4YCQ6xUX4r
         dl6MdTrQgovJ+WMvNK9OqCvXiAVFZyu4PZcR9okSTZgNBgzfZD0H8i+xY8+FGRbBe2Zo
         ZiM2VCrIZTIGNcjZyB9byKOc42NfvZZq9sxBfAe4wXoiezzO0vkLXSb4iIU7OCXR1ZoY
         3PyQ==
X-Forwarded-Encrypted: i=1; AL+hErFZjhl2b2mXQ9dkc3WTn3TqN2fo8MtzQ6m0zgb92dn3lmt8TIdKjDVHWlLTsf1nut/EMRKO1Wy5VGt26Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lnqeJ0lyL1YDzh9Qlflaxq7PYQL/YrBo4cyzDdLmjfqhMAICg
	4tUnZkmTF3S7HUDEYnsMF4dxSkheyCaW/cq18UhWFovkSjsWC4BiCNy8hmQBGe9/cOm1U4peQJL
	DoDhE+b3woI9gftxeE9Fg3FHBLyYFMhqOeqh0e1o2P+/KplejDLJlUqdTahOrUM4PhQ==
X-Gm-Gg: AYBFou0Ty8ai1EPCb4jUYGk51yPGSsq0iBYkjGwsiXZOqHsX9J59bD52krRqhPLlOWt
	BvTfCeMlH8rhlP8O3pEvxMFpeENgvFDW7Mq+uPdaA4Nmz2M8/6N5aDTkTurcEFvDDyBtjO1l+gK
	hNzRqmv8Od1WqoU7SyOMSf4xoXtwhy9GA1HRXdQNsLsP85M7ahm0aKGY4MUSzO6g+RnStpYFJnr
	TjKPDzDpShESoix4muUlVKf9/Bx5fQ8i6cquRtU9KMP+ZOaxdvgF8xxwIKPIqzWguGhhkaxzaON
	a6XWvCT17JxfZKNjTRQg6dNBGfoJFqGLdKywtqR7HaRjvo7O404GA8D1PsqGoOWhmn+gdXri2cO
	I6I8RTttglYbTLyOs6XYthW2NdZodELgQLcbcJKEONlppLqu8mQZn4YnyOUj2LazL6UNFC5/qdV
	qTlA==
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455988eec.5.1794386004991;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455945eec.5.1794386004375;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm26864637eec.29.2026.11.11.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:33:23 -0800 (PST)
Message-ID: <811819ae-ebff-49e2-be25-134b58711a5f@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:03:13 +0530
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
Subject: Re: [PATCH v4 02/25] accel/qda: Add initial QDA DRM accelerator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-2-88f2f24a5f0b@qti.qualcomm.com>
 <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af42856 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3RgQX8W33KRH0BhMXdoA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: xzzFV0VxTkEY6Nfod09axqVotOS31cXD
X-Proofpoint-GUID: xzzFV0VxTkEY6Nfod09axqVotOS31cXD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfXxhA2GbPXQEZ4
 J3fz0Nkh5fUD7SODf7KJsyZKvheqCpDxvBw0KlNukD4uFShZtxycMpx17uJKu3+eDGzwAKz13Xa
 e023jPHESd0cAACv+Kfg3oOmjt+evOE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfXxzan/rfMYTI/
 nroOVaOUXI9gygV0ekxB00JbbQZ4gBChgHBtM7PVr8blDWhGg9yePgW3xwbeFWmZpni5RPHyLKG
 2MzkBu/8zy08KItpwhsHcjX5/KQdDq6XY66x8T2BLjVfZmdcAOv+hXkSeDIvl67R6sSboUhR5Vk
 QZ+SFoqNLlPJrTRxCXdDs7iEPVyRZQLikyNZjP+d8rZK4rwoGjeu40EJof32+3gVOzsdh9BMqJD
 zoHjWiA3NcT7mvXrfsPFBmTqtd43jps9lAmebp+RBEZVH+k+qdscsPfw/DqqlqzWoAEU1n9lRQO
 mVl6Sn1w3z1lxfF1k3epVMRJtTgmVL66DVSTz6WRS4+uDqPS0ifhJvokyrdQAoPplrGi8vCzdbC
 UJiJw8oNG6ZMH9wpPXMu+umm3Q522EPVCyEbMX/J091VYF2pwhSgawZ4Ev/LEviW8u550kHLwsM
 RZTPLZx4QvgTBumhE9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110033

On 02-11-2026 14:12, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Both compatibles the binding defines are matched here. The glymur, hawi,
>> + * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> + * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> + * attached as match data by a later patch, once there is something that
> 
> So you add empty or non-working code. No, add these once you actually
> have complete and working table.
agreed, will add this once there is a complete table.

> 
>> + * consumes them.
>> + */
> 
> Drop comment, redundant. Referencing future patches makes no sense in
> source code, because there is no "patch" when looking at the code.
ack.

> 
>> +static const struct of_device_id qda_rpmsg_of_match[] = {
>> +	{ .compatible = "qcom,kaanapali-fastrpc" },
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{ }
> 
> 
> 
> 
> Best regards,
> Krzysztof

