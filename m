Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485227;
	b=t3effYwsKKda9jm8TS9e8K3/7V5CdIa6fE6QAFl3+G9KMWtjF960dHgY4yRJEa6jE/vV
	 QPDt45DmqK3fLVJjEJeKkfu7D4dK2AtN5z0mnKniFGfJj960nh8Y0E2akpR5SnLDcEWjG
	 mk98W8ADhI1AlD1ttXmPOEn/AIDpGbkrhlEqFAJc9fiiTe3ZUMUE/GTGiPGdVn9dzusNA
	 EaNEnW8Wu0j9D0dMSLLgEpNdfRShfUG7W7uI0uFCUubSzukawMBDrHHP7aSntaXydzmfS
	 M26BxXbdwFSo++yUeTlACaRgCq2RHucWmoISzl/I3OZASa6SBAagY3LenXvCwsuKQnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
	b=mg6QVHBvb3TT7u6dETyvKH0enafobJ4rej2bD7ff9xFTl79BkYl5ON1+tEc/gpcyGH/f
	 PLKrs4SBaNJ+k+Lw0yJ9QUMzaSWri+ZFexAgRKjJ+Slw/0dUAVVrEYHfglLxu92GFrvM5
	 tjPFgqo3KV5341qD/PY0EiUCFgMKxxfNMxwkDze9YbYNG4tgvhF2Zb0WVBuzzqSwdxqBv
	 sxORH7vfROD2c/94iyU+jLwx4hc40A1POzhBgfnurHFTYtp2LHCY2eOjuUgj41faBjnU9
	 jX0ak54TC5c7Vq/jFeZPqGphdQTqyjKoEVE2DwpzZMB9540N4JpKb2GHu+xXI2eEhTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vf5/NbzF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCB606A320
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FCB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vf5/NbzF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K83u6D1630176
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=; b=Vf5/NbzFckgIDw9m
	VsqvR3HDMlTjgkw7l0VUPY9u4e5S13jBuNjqRxzdCzhAtqSC9gKLyhfGqx633Yur
	BS9opZcTtSpFIHiw7Dn2mcALKsdmfc4MXGqYNpio+zTi5v3dicw5UvE2Un2SlQtP
	gSgsItsKlqACFEPDFt5m5j898YxsY5jOWqkWYyKD9jMC08AvLiLXbLqAM/dkLXj7
	+vx1twhvhv28KrB/Yzbu1Ly29bB2Dud2PWUDx/qa3J9sUzcoli1yo3KQCt8lRcAg
	1K2AjWLG/mariazX6pOvjA9nh5IqnT3sr0KrveXsU/3vw14MXxEPut5DRciObH6m
	bif9Rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phny3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 08:33:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso96252885a.3
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485225; x=1793090025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=SMIXbAdLQScYaVkg5e34wX7g4KRK4iDjnBcbbYWc1ZKO4iHM2Qw2v9YQ0mXPcCdEgT
         PpMpyaB79k9RYSxrBN8rYTWqJ4p9W2pgGffRH8ipGp3G6uY3omdeMgx8wQMHN/vhHoJz
         cKrZIGeEckfPZaA+FWvdydLQRNJSpfT/0W+W94hGtQvMWRH5sY2X+MeKw9LhNca44RXI
         aW9ZJ2jLzZnVW2sUceUXu04TkRPMEK3/CyaC3vjNPexNx4sbuotRzPSczlGB1lxtxFNw
         Yu2EPZdSREWSOwZpqBmFhw171sVEncivWQpcbz4/8eIG4AKzQ5JO31RsSt1mOqtuFDkn
         NeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485225; x=1793090025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=1H8y/xC9Nb8KIu1tMQyxusv2r4uU4vbYRrE0HEur5unixT5pCKT9Ijwf37eNxIbbhq
         U5pMfkBM12iyQXCmOYmDAtPpzTUafL1Sf0xCq7xGBKR+KRZcEG3n1NzoYBBgv7ZoW+UL
         WC+/ndQ+qDxCecyRgzIF7HJtLO9anWN+iQ11zOMmn6qs2LZJtvlu1kWQDGOSSXwe0onY
         +fWgxnaXH8mMbWg9vpb6HbIxzMXoXSgAQg6Q66WfHNirutnJShjhzUEEaf6voehtI420
         V350UDyZDqhkkD3zCkKaH0hjzzk+Apy07lJeSaEAZAYXB34vCtP0lObwfh71tlvKpr1M
         cRWA==
X-Forwarded-Encrypted: i=1; AKwUvByIT05c+bl12ULOj//sEZvW77zNoyh+mm2hazyrGlgt2dwlXiL4FQkqn5MFTmks2HoyvFqbXTo1bGdPJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIr9BTZFxPGFWkaCy1JziAhrl/GUKM8ptentgIOLKJWbN8m3kvb
	ampAc5ckNfHmJRP2BwC7AFis4S5rzSox8y5OPC1Ng/ZWx4pA+ugqoauhM7/dcfgmYT5pWBKc2rv
	gNeF1qY2tZomibvy7EtqI10Cxzr4zUlm+oolpOHaZ3llKCD6PNKqsXiC9/Top9wz7CQ==
X-Gm-Gg: AYBFou0d2o3U0QHYtzS2B3LUX9+Q18e2WVImF6rOyT//tGeVpU639bX7EvpsCoJm+LM
	mFrwXZho7mKg7bxm1eu5FnH7TGMYv7hvS8oRTolaTi8duRZuysZH1xbuhzy/N6oY+VhwvFV7Pqf
	AuC+fOkpSy2L91LWf0uLWkW60ctsGXL/569CJKrvc5JQ78cE3QgS2Nkwgl6rCdY+1EP/BA5Y6Zn
	OTtsYe40UvviXEhX/CNDGhBPx/UueuJsw1qJ8CIDsAFvCeh5BGyU5EwO5VNBoEWk7kW3elHpnGA
	kgtwH3IICeagZkXsi1bzUHtIRbUqWbJJfyOW+pZMf01QX6YLsW0Wv3TWpQJ11o978+aHrS7reqx
	T2AvkGdrE5HvWX2NVZyAIfw==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876101685a.2.1792485225580;
        Tue, 20 Oct 2026 01:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876094585a.2.1792485224147;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf123sm456787166b.14.2026.10.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <da0ec4b6-db66-4419-adc2-9600d8cc5793@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:33:39 +0200
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
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7276a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RaLkOdssimeRB-vWfmoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: i_joX5plfkyMg_hF7k8JbkIb5ms4aJXG
X-Proofpoint-GUID: i_joX5plfkyMg_hF7k8JbkIb5ms4aJXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXxHyvXjNJ+vDB
 gQf7W8ZZW5wr6Npny9qPGoviZu1Yov6/b2oG4YGlxbWTcOYY+YfB/iMxgLCfDtn+F0Y1c0GaeQI
 T0/65Oi/kA4RnHZbowOTRc1rDn5MBQUkOiuXwNQf1hGdsQVWjRU1Y5RsYuyIaihA7N/vNdFtqNv
 j3UCaJLu89RSiz5+snWgnYpcgdPITXqSXPp5qGBP9E9TbtcZIBFKwSTqrdEtLkPYZ5BXzywizob
 tsVxekz7m8pfVmDEEeZCDrmnBaOc36VfBfongrQKgFeGoCsmB/Rds2uQdZoTy2k2J+N341Z4qDH
 oy3SYN9toX7NvDenE7d+L4tFG8lYLo+Bk/fhbP+UBXoiHZSAJGzMlQbYUAUXlDGiYNOsSJMpfcw
 eyIZUwBY/UI5KVyTbhZ4zRnxmqClFBLV3xLFUNgNeKSuNDbX75FcWvSP8v6y7Muz8/ielyDYmWE
 YdIw1GISrFxe1KcQvZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXzv/VjY6zsnE2
 EYfEPJSBmy7692lfkcsau2IOdVOdpp70MvRacrEMOe7cK+65bTDdlsMvtR+o8l6I8HJ+0VmFNT2
 DsVhe9TJenliwXbf8zzggbsWFZjYslw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
