Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743242;
	b=3aTY/LtjVGDBOcYWiExO3iCC59WdityFHGhPjVH8RwlGFXnK8fLmtgWiKyDDyXPd12B7
	 F9+/ABud86grAwwMaf0BRiqNL/W2kc1/5LoBI/khi0tve/9wbDYsqPe+7zd1ZkXW6eksh
	 8udIEA9M0njLoxB5BzNsYzW36bT8WKW+jMrx16PhjmRTwJGxuH8YOAk/9RmtyuSfag0Ka
	 iqfVgCEIe55F8T1XEOHjDBMr7SGh0T4aNFeza+/KNSVmwrbkb3VM3MmAPo2keCKSzY7wi
	 jf4qfyjAtqt0zSaQVtmBJHvNt25sLDMJmbPc/fTSwzoA6oquQTVe1YAR9SZZg8ll3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
	b=bdKcTwwguHBNbhlWcIzgt0o5HEsjCoo4rrXa2v/sYcEiQjCCydDHCPewFt2EKB+kV1Jo
	 LXfOkpYgxgldKsVi6c+9w4BA8Qvu3NRjdh2Gm503RS95QRbrL8ovo7xD4gxfduQX7RPCm
	 BWk1CcBHa8wLj1d+gfHiA99McP48Jg0BztfRiEX7dr39IFogSowQYldY5bj24UNZ+RmYM
	 U8M/+ZLrewywAQTg5RN6niFZyU648UYMsdUDlLHvNOVjUSEH7M1KA6VIE6cxXG6j+oyzi
	 pQEbeN5ermaTa8rQrhALmgvjYouqRMtmYfuJSrrhMcqj+M/967B0sKNwFCDOJdWRv9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qt0+oJvD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893B606A330
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0893B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJQsA8Fs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qt0+oJvD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F88q1200806
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=; b=kJQsA8FsdDYDXY6i
	a7Kj2LAxWDzNHdXqTYI8OUen0oHwtkYY49xBoELPc7nsS3cmskLKwlLSQuMI1Sfz
	PQ8/BdIr+lSMLozM6PymdpD5dU3HjuHwh4a5XIRnCtneyZgq9dsjQ5LKU9PZL3gG
	lefv5o5fY+/kjDHBCB2iMrXOQpZpJRVbfwokoURV/idtOFD0KAO6VLk0sZsUCrsU
	5tneIsou6i0pqjtKPcEW8Ajev5nljBoxbIg9OCcyzjB1wSvh7gkwUVCBr5gQ8H54
	yDjCWahkVkHcW4MKPCMPHpVtBndx3L+ZDbwKERK5HP+7uOTs/CY8sT858z7Pr4Ip
	NTGnzg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2mxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:14:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so762594a91.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743241; x=1793348041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=Qt0+oJvDTiRmzm2I/rl1sQ750xxYqm6qEnyE9ZWvSO+1pzCs9Dl1DKha/Ace9RXITR
         BTrKjDNNcrp/4t7YhqSI8rI89Ryi2jRr7H6KkokTEpiWjSvFw2LfpwMOxho+NDiD4LH0
         8Cf9aNoeLxquRPl5BCjF/FHl+UwT/6ucwFCtUl/VoBTIYUg8OxD8BKw528/JN3jOWMVa
         YSeflCYrwYxd56NfMlytoFS7q4pcv8NPsTLxNovKKO7ii/7nyYtg0YsmWb5BLey/cX2v
         AlrPgj/IYJQ0EBlcYMQ3RJ6kKhJ7+EalHcHv1oESQSVqFptaaCVLBn9z4i7UNvJ1K//w
         W5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743241; x=1793348041;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tqv4KAoTYY3S/U2JwEiFFAex7twOglJ8WJnUqUg1DcM=;
        b=LRSuR9GRYYHVS+acxjceMytKtwgScBKUSDg6yx9LD5htHU5c8kBFchhep8UJSecvs2
         GaySPX8Nvd+aJ1UTQ0O/HzWeQ0ocwBan1Kgj43UNGNjgWsQ8/dBEKRIjA/BzPpIUa4W5
         rXkgFBV0aAat9s4zkxZxvT9OvWYOpK3rKmG3E3/1N+vpY0+H6HrX2303Pnpw4snwMXrv
         T7GvXTMmEM7a9Z3ruWoM8mWHy4ZCvaGk310wfnYXAFRxyio6N9+44o5xlXEk0QX0p55U
         2y+ZAVdo08TpYO0u6L/zGc6OgDDjmPhhMQk6uIHtCFSXTCSYaSSBU9XZyT1sFPQ9XJOP
         uzTg==
X-Forwarded-Encrypted: i=1; AKwUvBz/+CWbByjTeUuWm/uAFOdUnF864BwM0byt++cCYC4ESL1VAQPTLa1lQBXOKEFQT1yTuM5cdgZGZikSPQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5Ep5aH77P1327zadsWVBc30jUYBFu5r0iEySN0J+kuJ+A4cjT
	4s5cQh+3APmDCcUVUaD2vxaFx4pyjcUep5r3ezOL+CN0U5BKFoWJJ/etrYUTAx+ntWWN4W77Nn3
	NYwD50D8Om2Q2b1uSBC0p4MlqEaujvq5b72omV0ZdIiz/+/EWHzvzS02iRQxItTB4bQ==
X-Gm-Gg: AYBFou3nAwTCDlRkt1/BoH3rBGDlMnIb2BlRcTk5mbwQrHo/wN1MFgiQZswueBU7Flj
	leIlPIFmekUuE4vXGIcF3bHf0GcisPt0kZXsC9la/WOC7dpQkGPEi1hCi067yQiDBPtKeecM6Vn
	p2ZKpPVES2s0mHEpKXnyqf9Y3qG61cCpuH2qsByn6MBBO9oY2J11UKkpw3IoRUoHjIkJfiRnImH
	ZbCjicL8orgGqGPPLUUgc5XJMx/cr2dw/PmyBl+Hk/cuZIUJNuTtK6msnbCqoCllMxT1ORqD1Mv
	NxEkCHw/Za6Cyktfw7Q7+Op5S4TlflpWAWdzB4VLSms3TA4GcwwTWuDWYb+JG6lcIGuqKrOKql0
	1KSucRzqZdG0eioR8koI7jCVEXr5pFARJTg==
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940552a91.20.1792743240424;
        Fri, 23 Oct 2026 01:14:00 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3adce616026mr940524a91.20.1792743239783;
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm7758959a91.17.2026.10.23.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:13:59 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <4c4e48a7-5ece-4fca-9387-a50c29bbcc83@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:43:49 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Language: en-US
In-Reply-To: <b2cf0c52-4c31-4b17-b341-029b82ddbd7f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXw75/ParR6HEd
 abSUmrzn8STA3mByi1V26O8qtRB5iqzoAohvcGdLNa5ApXHI/kOdOZgU3alEK5IjhEhGxfTZNp0
 6lXYQ88vQvD9/q4Vg/QfYPASVTriSGSr+Sk7H2MlDSMxI4Nn7LDPcTfH1klaFtWuhWpiXXsSDw0
 eXLaSEMjjS8N1uvKKYRCJCfDxRlVTV/VpWJYkFa9PuYc1/LkRDAbRobOl+9iAGe9OYxTkWXHc3l
 2UPn9oSZAppyIGcD1XE+WVZxAxmWlSZFYrXpsZrYcrM+TbaOFr5MwZgueDLDF4jnfyoJbwRrEEc
 Jtzg0KZdWwF/32oDZZZ1LA/l3Bc1wYJYnQ8pR8h9Z8U+sUkvGBI0eUXEvViLLK1Vv1HnKtmftkG
 EeiofAvezFK83oHuTWouvwX/eex3ckGA4DF25SMUGTPqkt0CrdtO70RedBkReiuUJPat7vzaaYk
 0gYEZLr5VNxc7zRH7Ew==
X-Proofpoint-GUID: C7rT9FzOTr5gwtyqi9yhxmY_lzCC5yA8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX24TauiL7ah5s
 WvS1YhbVkdU+k78qH7PeiWhG1rkTOHi67rGTgkoc9MgeFIYTaBTCuzVZr11mO5ndYlJNUNG5/wr
 r5TdMvzIcKgXZPycI2BM9ID7p3f7Sho=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb1749 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_vtLzGX-cFUddgSYHekA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: C7rT9FzOTr5gwtyqi9yhxmY_lzCC5yA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>
> ...
>
>> +
>> +		remote_np = of_graph_get_remote_port_parent(ep_np);
>> +		of_node_put(ep_np);
>> +		if (!remote_np)
>> +			continue;
>> +
>> +		if (!of_device_is_available(remote_np)) {
>> +			of_node_put(remote_np);
>> +			continue;
>> +		}
>> +
>> +		if (of_node_name_prefix(remote_np, "dsi")) {
> Where did you document the ABI?
>

Will update in the bindings in v2.


Thanks

Jayant


>> +			if (dsi_idx >= ARRAY_SIZE(dpu_kms->dsi_bridge)) {
>> +				dev_err(dev->dev, "too many DSI outputs\n");
>> +				ret = -E2BIG;
>> +				goto out;
>> +			}
> Best regards,
> Krzysztof
