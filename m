Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910165;
	b=Nu3e21tKCRQqGFiOBs4GmJnKYrLDruGX0t6ZjpyGCKK1lwWHaei2tVCB9gJdAnipOkPv
	 jwGTsp1cSpHSbiA1zafl9kFeoN7ovKmQmqWtSeCESoPJUWVk1TJiIDiT9HudYRjAu4c5L
	 0/WeRlau1hh/TYBWxLoefjjgEcn4HZUPyecK563n9ntXwDYf/ueGkJF2+iEO4MbfutTmA
	 WrwGt2LW8FN2hFrAS1cPptQkFTuN6RefIPlvT5b+RDR2sW7Ff19nBA+gU7a0beJsWbzif
	 WvuuUe3eebAiPBAYOSi4GcFqYGl9g19oaN8kxCmbZ4uCsDl74/XyFw7sSzQqNRFF8zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
	b=5LIVjOIXm2rbRNbCQ7Gl36NJ3Btm/nmVX7qH6dOQ9yZGSw37n9TFpOpJzEe2MDb+y1bP
	 F21pBaBIy3mx/oQoN2289vjJLheapjwYVQ63e3eMnqAtxaNcCpmCb1Sp8e1pz3c6NJb/O
	 6ELl3nxjCcXAFuFg6P7nII8+5QI94X5hOhR9TP0dS5FgsLRm//NIbc9TXFlFW2a6pGkpg
	 TIhCxpQaOXVBSUgj9ZJB4CiavVIatwnPhoJWuLXusRoQechAENDtcWqtZaKvnoWIwV6Lj
	 wW7zqFpxDgLyE7/0vETv9+XMhAYYCyV+TAX8XR+lWa0RgZ18jvGOK5a88XXJEexxtww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B5606A329
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2B5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8i4rJ2935297
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jca06DZ/VwnBNDjjcC1Z70V7
	zzYoec5uq00WOVrwmWM=; b=f5w4MkuNnugKNHkMWKAn1+WUTP/VE0UUFOuyO2ZK
	G4UXNVP9mlvSmxtkuSycu0Eiqd5Hqw0wnfrUH6ygf6v58c0FXKW855rQ1urEUO7R
	oYJrytQIxM+EFW0AKawUKZh7LFMUwWKcDcOrSKzyFyidE2Fz+OxZ74ORdayhwYtG
	CApB5d0Cm4hvqBumIWW08n56ogrgWeBffsVyXVUmCRp05gpezXVr5o9kYvvMzi9u
	rRCTxCFPdrAGgf8vi1x9q8jyxiTyK5OKmkdJRfLsSBV0RrqglPX6dSxzZEgMjRQ8
	9oL9Hu8A62gy/lsWuORbhUWIBkjFNEa6Pctzp5GJ68wfag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0aj5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:09:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d32f54d21so47888141cf.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910163; x=1795514963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=e27TCJNIBkeVRCwZp1sSuHWMIQ1VDHJAa7Efi+S1y+Ql6f1z6SLk1I7BZQFNfJMhMa
         Gc6abmBTEaudbzlFliJBgeWEIsNQo2EtLKA/eZIf7m/NvXTZeqRRuYte7qmImHBcjq3m
         7mGCtW8Y/xQbw+0hXqFRDC2bHxEnxulYZDbEtBIwyTVXPsuOqmcp2xU+qOquDXYqntEZ
         GXvQ+D3Ys86YfOBTQbdgFYk19vWKPpu9a8MKAoZURMu0K0XJAaIk3bU2T/uo5cFiBiqt
         n5ZZkaOhRFveFNhFNwJRV/hMXIGllhHSdSaXONKYJi7istLo+035GP5Mp0o5tyDPVOPA
         0b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910163; x=1795514963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=2uczEbyHIvSw82dXYiAHCKyEpnapjGhs7J9iqSoYosS3o6L94g+ZesE6vSSLIDBjuE
         c1z8yUn5/GqBziPYNgnMoh9DUGSReURaQhOUvZalNAcTsRpUBzqZaSMqOPe3+Gp0+Kpw
         jJPPYC5VnE3J7K2/ZmrHgT6kcQ2QLTCVfWzN+oMXOrpe+vLDoy9IufB1MNMwKFB7e4n1
         Z3OZiocCwwZhGihzR0Dar7+f5+rOzpyGmuJVwVv48BgHQkJ1jKf9nE+S5Rdr1vQaHVr5
         DevTAXOJeNRUFNusQPkNgjVoF0wcOnBqiVIINKJxyka/EXxYVYgYJRjDovT3Jhl0mUbG
         K1/w==
X-Forwarded-Encrypted: i=1; AL+hErFofeVa/IfV3WAvWrvP8VHtSy+b4PvPfcs0KuZ0rb3/xLCdHRizIGA6/GW3MVO/TowJAS02KbVPM1WaTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YTDmEi5qIxhyE96Itm8fjGQ5IgCtYsLBVDsfngXM2YJy9Hjc4
	Wog2QhscT/d9DRcq7XiHTIU9H+06IKk+OCKMJF7y4wiwFneGQINI2s9nareBXnB9DSqElIBKX72
	hJNARQzLbq8KCwSyeu88YIOd3lmUepir+V02/4LuygOnf29bBK7t2/6+WiaL0ZMiTNA==
X-Gm-Gg: AYBFou3iqrWtEwhBvwiXFyQzYMhv1Z12ln0hw8IWbqSeVEFWyU7vgDmRF8ljegUSJtm
	3cRmowkcbYC4XRJMSy6kcJeiG+iJ8dAh4u7XeZSISiz3DHWWRnumXvNYyUmu/LQOk2PcwBFdAsC
	Kl6DtpIOBV7B5rNToBN33Ur6XO9V7Lb27FwzaXZLSGLcSLaS0ZM8vHufAB2R73/5dKyGc4Mh2s8
	qFvze2zHSvKuez4FZ0q95t1ot/zeh/SPmpG81fwBR3SSJo18IP12aN9V1QGGmHNY589brbo1fOQ
	ZuZsqi8YEf3xPlW1XMCVsoM8MgQd1OXw+0twzdlzFgPaV6kOfcILc4YltqjPtUGpSH+y2t1ceOT
	swx2YVAQxDDxCu8vwKGeqlbARWISjZ4NaOKmfpssr+BiIFvbVhZphOCvGYhjfzm0E
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081413585a.43.1794910163117;
        Tue, 17 Nov 2026 02:09:23 -0800 (PST)
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081410185a.43.1794910162514;
        Tue, 17 Nov 2026 02:09:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm27416482f8f.28.2026.11.17.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:09:21 -0800 (PST)
Date: Tue, 17 Nov 2026 12:09:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
Message-ID: <nhbxbsvgegih2x5sbyl4p3iczjdhv4oenq56e5gmr5klplq263@5v5agcijseya>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX536TltMy6aaM
 D+kmck/17Hnl7XZIQTOj9XQ9fbdRT+22zGZdpozxFLRvUnXz0ZxrGxStnIc2Od8MH1+BhuJpbJQ
 4mVK6pCOZrmBv0+GjCiVP3atZO3F0EI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX0/luXb9CEgYc
 nSFygCyH/wxqe5G4ivWk9yJaKz2mEFTUuQ70fMz/X/GKri1sZhGWO7v121HFPJyW0YWhFses8fC
 XGfIFChiLikLzzQCpNu1MiaxzBTo3k3p7RR8dHotsu0cBMj1KX0XRFN9RXVHUFPTDXt0IHcHyF2
 RiSZFEvZelyt/tIONqYmxLw2/2jFe3GJduEdEVc/oOa78W3NUoXejVDZrOSVBFl1BS0YGJ0FF5s
 CXkafCSX5YOR50cfxHXNy1FMwEivdHUU9vfN5H2l8f0DrXEVf/Hdag03vfk2mE91cP7raUwjEm7
 H5kalnnnKrKKg1sKRDIXRFG3PsbIgb8eFhSqQiNJ613oEBrgRtZRm3hSRsd7/Albw+28AdN0ANu
 wZZSWkA3goQ+yRBHWiftUxXTkT+ErOmCi7j5qVCr/dsUk+2A88iprmXqNhkh/8jcQmOi8+REosm
 FviYG2+IRFcgDUqCBTQ==
X-Proofpoint-GUID: clcLlYKSR0rR2KoyTxJYB4kt59dqk3y7
X-Proofpoint-ORIG-GUID: clcLlYKSR0rR2KoyTxJYB4kt59dqk3y7
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc27d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mbcfl85LdsPLy9AfTWQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170040

On 26-11-17 14:34:32, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
