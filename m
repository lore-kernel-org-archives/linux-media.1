Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705357;
	b=FPDaOSj5/uYzqjo5wmsqFPMh6Ji8VAMB1AcjVVvHw5PJNDaWt99E5OPf1L9+X4cCnIW5
	 UzMFf0Yha/Sgo+HVN5NURPiqY3HRTUivfEwhUDuRzIcpw0l/ysrZo7TEe8gKocy95L1Ok
	 4+4qFmH/V/dKsB9PJaZVQ4tj9oWdeo7e8+YWIZC/gYZ5A6IRKt60NpaJ547c/Qbg9AUhS
	 D2vetdD/f0B1rBiMOxLXUpt4MHj898HXNY8ixo/j7ND/Yz52RNvwA1j6X+s+FpfoDD4IM
	 sZBB9hpP+Wpz1jmOKDMzw6YWHxJkGVF08nzNnKNzVKC8G9SmhEETBnDH4Vdg4v7HCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
	b=Bv8hkN1D2qpDRc8uAfhOQ9Er9n/vM5Bhw2LJAkZGW9/qT+RvFCynJQiQPryqB2g51jOH
	 1q7+YUd8fRy78DJy2bsCzQObdCK2+NYnK4jpvR5oHcOt/2i6Ly27dMVHYoo+tGnFvxO6S
	 GNaHNsim3e+5nvaHEtvNAGWjgpAU8ZOPNl+umAGsf+oxGjsE/WNEgZEqEW56EHDX3DCzr
	 TCw2sRVXeD9zTqAv5pnF4MBINJ8b76xNxNpHJm3A7/NKME9pqblK0llk4blwZeSbW6MLS
	 LGSFdveJGyiIVgfYQ43Cq3vBxqD99ZjNAISi5Rcasj0hGb5lI4pNHiwx1PAm//KElDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Sew2dQp/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V2/vigSG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A5606B112
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 11:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3A5606B112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sew2dQp/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2/vigSG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAVjd2201894
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=; b=Sew2dQp/0Bsn3yVV
	VvPKV9eau7fOM4MH+Eff2mYfZkjEH35+7hM84zTqLXYqG0hMMP1jtouqm27C+cyJ
	U52q5l/SUEx3rmAT5dM+m2zmbzCxIudXMFjVnn4UbSB7Bg1qfc1+GAsCPv23kbFN
	s/ocAIN0MNrsoqgCbzDq+d/v+Yb8ZMfefE55ggXax5oqReKqDbiGil5d3qekzbTm
	ALATqVOt3cLhNnId23gaqBMwMuoTAPX8CIeOPn2wf+uf5OGB1w7GAMtKmjhgGZFR
	f480dk5QrVaKchSi3IMWmGbgxI9ycjT8Op+ycVe86wPS1iFiiRz4bbqEgLnwF7eQ
	AsPBWQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3g5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 11:29:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so410484a91.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705355; x=1794310155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=V2/vigSGNeKvoYFLmUJX5HQi3H/u0SCXUW3AO37v6RcbYQ3VRrkHvk5iqyUbFyEyKF
         QY7mgHfKVkj0Q3lzJwniFnGuP5wBjUhe0VIIgRmo6NXiApMqyE+lRUcxEI1y1QGTgy6A
         NtV7K+zRa5QZHpzxzl1bYS3bDxm4+lno4szIrU5ZgrgDZ4a/yh08n5rIAkAnFnm75QJf
         T/0o4iLJQ79/lhW1HhIcy8Ciu95jrmMnrfoNOhLOMWaZ2ruIpDvlWhSJigBysWZDJhaD
         +NJOJxOm0HGeBSIiz4iDT8dz3ICiRX6A4BEi1IYF/1pvxLmYJHF6Fg+KSBYcCjiTJR/B
         Y4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705355; x=1794310155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnCTWc79Z1mZ8LqblAJEf4ii8AcIYeMJM3mOmd7YS6g=;
        b=bYZqd4+TuzP7HAsPtbCM9phE0Lav1zgSJAS126dmaIuBZkq332uAvGMEuPGHJ6HxzM
         Q0XP3THcAgs8PVLiaDU4Cvujw53J5ggzea6qPLhNCe3D6EcmsILwDAFb297+9SybVljx
         UkAtxCGs2oUOrKWSC6A8u4wEIShajBKZd4vhfEwhtsas2GczSLqAMeAtSd9X7JyteJa9
         GPOUD/NtxAO4eQaB7Xp35Zb2yOcoiB5tmukiLI6q+7UiF72aK/IeLaHT5tsahokYvze9
         LcKx1K2UprO+sVK02yE41IzLYs4cynFFc1BtiI797f1IyzqMnb8j/+BnvpRjjd3mH1U4
         v/sA==
X-Gm-Message-State: APuU4Z9RahO2na8jE0sOUBmo1SYjs+WPcCFr+/oP/q17tCx9fIlkPnah
	9cv4thudqQAM00T/maZq8acK3dJ0bjq3kYOhYn/Dyag1AT1od6H8gUpocqfklSO8K/fgNa+4oEE
	7SCnDlORvhN7jjPe26/2XNIUgMhkOvDbwUHopz0Q0OGQrLbcV3BUZvqN9UC+zYbUMpQ==
X-Gm-Gg: AYBFou2invbTLKZ8Q0ZBGsm7DsMd2vlsAlm/C0cybXrt9xBBc2RrxmbYoXWg3sdfDoi
	s9jnNP4WnWEZsAquJ4SPV3qXUPhlN3DT2BBW7xR4DzEVdJSZphSg6gtUvH8nQvZ1VVs+mKc4Uxu
	poMVbetfPv++kfcxTdbTvpugojt5eQx4kZdw1GzMr7zwqsEmLYILcuhmaYB5SUJhPyH3tNbKrEy
	IJm1FpP/0OnyNhBS5TRRbGCsTVZNaYDEvTjvR8Ff7FuvGdJXcX0RrYPZjJvHot/mM+Aap972eg8
	4b5a8+HUKpwPE+FAkA9T2pSlC7FJCHIxrZhzPJ2VooirKdM9VqjfSMfaN+0MhSH2MuOwSernZxN
	NqiWJwXhs1A556CC700gKtjanS17OYZJaZ0sFZwxvVVRy7zLLT2q79rA04E2H3ygiejWkzYtfA0
	g=
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145999a91.26.1793705354427;
        Tue, 03 Nov 2026 03:29:14 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr7145979a91.26.1793705353952;
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm10519214a91.0.2026.11.03.03.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:29:13 -0800 (PST)
Message-ID: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:59:05 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PHSGjeqOcAdSYWbkEArS4h1jbEcb08OE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX+2MmwppTWkDT
 iDZgrCBZ2ukSCJhxXLPLakMO3tHruT//xSPeJ4voK+9M3n7yYSYRCF3vAstwjTg9t3es0uVCsso
 qpx1ttsvLbbCDc/tGwJGKF1+OpS7MFM720OCxOjoLvOrQ/J9i8JPzOgfmJwr4K6XIMloDZOontL
 kXz300bGKQZxFj2cFmcY4qT/YfU0oOzXs4oAnyirT8ZNpJvQNnMY4e3IQeh+QTADhyYXF1yaiTK
 xmCngyRNrA2f+uQYOJXQc99ud5lAK/qf0guUtFPG8ayzQi3SQZYfgH4ZvaBC0E5iXUnIMXRS0WH
 5or3HYs9cq50ZaNWpcfwXbjXEjv1BamNi/qCnFUV/4GC7eI99bCWNuHCYo6OaqvyywwvusTUXY/
 bD5QhDCnKbN4DOKKjbxg53u9ZJRz5qTBQvMxlB95TbZ4ca9rb4E59b+FH5+9VlH401Ro3GHCLDy
 haOlKaaEOcgMOR80FuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX6fFD56aIzOED
 NZENhfhwIUmy78WhDvTA/zWocmHs2RXjqNoGS0YOXmEQpN7dry111j99Z0ikGFiB4jHOJDQy0tm
 bM7htm/Zq5Hs0DqUsO11jsK9vbktmgQ=
X-Proofpoint-GUID: PHSGjeqOcAdSYWbkEArS4h1jbEcb08OE
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9c58b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sEFLFU3R8KEXLjjolHsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045



On 02-11-2026 21:17, Loic Poulain wrote:
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Add the Offline Processing Engine (OPE) device tree node for Shikra.
> The node describes the six register regions (cdm, top, qos, pipeline,
> bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> and OPP table.
> 
> OPE is a memory-to-memory block with no board-level dependencies, so
> the node is left enabled for all Shikra boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

